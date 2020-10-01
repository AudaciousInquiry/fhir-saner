This appendix describes a collection of FHIRPath functions that can be used to simplify the construction
of queries to a FHIR Server, making the underlying FHIRPath source code more readable and reliable.

It is provided as an informative component in this guide to make the measure walkthrough and FHIRPath
expressions more accessible to clinical analysts.  The functions described herein could be added to a FHIRPath
implementation as extension functions, and are not part of FHIRPath proper.

## Examples of FHIRPath without FluentQuery
This is best illustrated by showing the following two examples, and then expressing them using the functions
described in this section.

**Example 1: A FHIR Query expressed natively in FHIRPath**
```
( %Base + 'Encounter?' +
  '_include=Encounter:subject&_include=Encounter:condition&' +
  '_include=Encounter:reasonReference' +
  '&status=in-progress,finished' +
  '&date=ge' + %ReportingPeriod.start.toString() +
  '&date=lt' + %ReportingPeriod.end.toString()
).resolve().select(entry.resource)
```

**Example 2: Another FHIR Query expressed natively in FHIRPath**
```
Patient.distinct().where(
  %Base + 'Observation?_count=1' +
  '&status=registered,preliminary,final,amended,corrected' +
  '&patient=' + $this.id +
  '&date=gt' + (%ReportingPeriod.start - 14 'days').toString() +
  '&code:in=' + %Covid19Labs.url +
  '&value-concept:in=' + %PositiveResults.url
).resolve().select(entry.resource as Observation)
```

## Examples of FHIRPath with FluentQuery
**Example 1: A FHIR Query expressed using FluentQuery**
```
findAll('Encounter',
  including('subject','condition','reasonReference'),
  with('status').equalTo('in-progress'|'finished'),
  with('date').within(%ReportingPeriod)
).onServers(%Base)
```

**Example 2: Another FHIR Query expressed using FluentQuery**
```
Patient.distinct()
  .whereExists('Observation',
    for('patient', $this),
    with('status').equalTo(
     'registered' | 'preliminary' | 'final' | 'amended' | 'corrected'),
    with('date').greaterThan(%ReportingPeriod.start - 14 'days'),
    with('code').in(%CovidLabs),
    with('value-concept).in(%PositiveResults)
   ).onServers(%Base)
```

## FluentQuery Functions
The functions supporting FluentQuery are defineed below.

###Search Functions
#### `findAll(ResourceType [, QueryFunctionExpression]*)`
The `findAll` function constructs a relative search URL for the specified resource type, appending
the queries specified by any of the QueryFunctionExpression values separated by an `&`, and returns
this in a string.  When executed, this query will return all results including those returned via
pagination.

#### `whereExists(ResourceType [, QueryFunctionExpression]*)`
The `whereExists` function constructs a relative search URL for the specified resource type, adds
`_count=1` to it, and appends the queries specified by any of the QueryFunctionExpression values
separated by an `&`, and returns this in a string.  This query is used for existence tests.

### Query Execution Functions
#### `onServers([reliability, ] Servers*)`
The onServers function executes a search on the specified servers.  Servers is a list of fully qualified
base URLs.  findAll queries resolve the data on all servers (including all pages from each server), and
then selects entry.resource from all returned Bundle resources.  The `whereExists` query returns the first
resource found after finding at least one match on any server, returning the first matching resource
(and any included resources associated with it) .  Implementations are free to execute searches serially
or in parallel.

The optional reliability parameter indicates how to handle failures during a search, and can take the
value of 'skip', or 'fail'.  Skip means if any server fails to respond, or responds with an error code
(or exception of some sort), that the resolution should act as if a Bundle was returned with a singular
OperationOutcome resource that describes the kind of error that occurred.  This ensures that queries
succeed, but there may be missing data. If the value is fail, it indicates that if any server should
fail to respond, the expression should throw an exception.  This allows expression writers some limited
control over how to handle error conditions when a server is being queried.  Implementations should
consider retrying failed queries in either case.

The following executions are equivalent:
```
onServers('http:example.com/server1','http://example.com/server2')
onServers('http:example.com/server1'|'http://example.com/server2')
```

### Query Parameter Name Functions
The query parameter name functions start the first half of a query parameter to add to the query url.  They
simply return the name as a string

#### `with(Name)`
The with function constructs the first half of a named query parameter.  It should be followed by a Query
Parameter Value Function to construct the second half (the part containing the equals sign).

#### `for(Name, Reference|Resource|Identifier)`
The for function constructs a complete query parameter that matches a resource or identifier.

If the first parameter is a reference or resource id, the query parameter is written as Name=Reference.

If the second parameter is a resource, this is converted to a reference to that resource, and treated as
above.

If the second parameter is an identifier, this is converted to a reference by identifier search, and
written as `Name:identifer=Identifier`.

#### `including(Names)`
The including function specifies what other resources should be included.  If any value in `Names` doesn't
start with a resource type, it is prepended with the `ResourceType` value(s) specified in `findAll` or
`whereExists` above.

#### `has(Name)`
The `has` function constructs the first half of a named query parameter supporting
[_has](https://www.hl7.org/fhir/search.html#has) searches.  The value will be `_has:Name`.  Chained
has are possible. It should be followed by a Query Parameter Value function to construct the second
half (the part containing the equals sign).

### Query Parameter Value Functions
Query parameter value functions produce the second half of a query parameter (the part containing the
equals sign).

A value can be a primitive, Quantity, Coding, or CodeableConcept, or Reference type.

For Quantity type, value will be expressed in number|system|code form as required by Quantity parameters.
If system and code are empty, but unit is present, a Quantity value will be expressed as `number||unit` with
no system.  If neither of system, code or unit are present, a quantity value will be expressed as number.

For Coding type, value will be expressed in system|code form as required of Token parameters.

Period parameter values work with Date, DateTime, Instant and Period data types.  A date promotes to an
appropriate Period in these cases.

#### `equalTo(Values*)`
Appends =Values[1],Values[2],...,Values[n] to the query parameter.  Note that Values can repeat, or be a
list, or both.  The following three expressions are equivalent:
```
equalTo('in-progress','finished')
equalTo('in-progress'|'finished')
equalTo('in-progress,finished')
```
#### `equalToComposite(Value1, Value2)`
Appends =Value1$Value2 to the query.

#### `notEqualTo(Values*)`
Appends =neValues[1],Values[2],...,Values[n] to the query parameter. Note that Values can repeat, or be a
list, or both. The following three expressions are equivalent:
```
notEqualTo('in-progress','finished')
notEqualTo('in-progress'|'finished')
notEqualTo('in-progress,finished')
```

#### `greaterThan(Value)`, `greaterThanOrEqualTo(Value)`, `lessThan(Value)`, `lessThanOrEqualTo(Value)`, `approximately(Value)`
Appends =prefixValue to the query parameter, where prefix is gt, ge, lt, le, or ap appropriately.  Value
must be a singular value.

#### `startsAfter(Period)`, `endsBefore(Period)`
If Period is any date type, promotes that to a Period first.
Appends `=prefixValue` to the query parameter, where prefix is sa or eb respectively, and Value is `Period.start`
or `Period.end` respectively.

#### `within(Period)`
If Period is any date type, promotes that to a Period first.
Given name is the Query Parameter name, appends `=gtPeriod.start&name=ltPeriod.end` to the query parameter.  If end is not present
(an open period at the end), then it only appends =gtPeriod.start to the query parameter (this is one of the functions that
needs access to the focus)

#### `not(token)`, `text(token)`, `above(token|uri)`, `below(token|uri)`, `in(uri)`, `notIn(uri)`
Appends `:modifier=token|uri` to the query parameter, where modifier is `not`, `text`, `above`, `below`, `in`,
or `not-in` appropriately.

