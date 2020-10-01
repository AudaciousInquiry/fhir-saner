The [Public Health Measure Library](StructureDefinition-PublicHealthMeasureLibrary.html) profile provides access to the resources needed to execute a defined [Public Health Measure](StructureDefinition-PublicHealthMeasure.html).
Each conforming measure must reference at least one, and may reference multiple conforming Library resources.  These libraries provide access to the [Terminology](http://www.hl7.org/fhir/ConceptMap.html),
resources essential for computing the measure.


#### Software Component Name
Computer friendly names enable developers to create software tools that facilitate measure implementation and automation.  This profile
recommends transforming the title into a name by removing spaces and special characters (any character other than A-Z, a-z and 0-9),
using PascalCase to seperate boundaries between words. This allows the name to be used in most computing languages and as
the `id` for the resource in systems where user defined identifiers are supported for id values.

1. `Library.name` **shall** be present.
2. `Library.name` **should** match the pattern `[A-Z][A-Za-z0-9]+`.
3. `Library.id` **should** be equal to `Library.name`.

#### Canonical URL
The canonical URL is a unique identifier which represents the Library within Measure resources. Tooling for FHIR
(e.g., the FHIR IG Publisher, SUSHI, Simplifier) follows a protocol for automatically constructing these URLs. This guide makes several
recommendations for URLs used by a publisher.  The example below is used to illustrate the recommendations

     https:\//example.com/saner/covid19ValueSets/Library/MyLibraryName

1. All Library URLs for libraries published by the same organization **should** have the same base URL. The Base URL part **should** be memorable.
   In the example above, `https:\//example.com/saner` is the base URL.
2. The base URL **should** be less than 40 characters in length.
3. The penultimate path part of the URL may be used to categorize libraries in some way, e.g., by topic (e.g., valuesets, functions). In the example above, `covid19ValueSets` is the category.
4. The last path part in the URL **should** be Library. Following this recomendation simplifies the use of FHIR IG Development tools to
   generate Measure resources.  In the example above, the last path part is `Library`.
5. The computable name given in the Library **should** be the last part of the URL. Again, this simplifies measure development using existing
   FHIR IG Development tools. In the example above, `MyLibraryName` is the name of the library.
6. The URL **should** resolve to an HTML page that describes the measure, or provides access to it as a FHIR Resource and ideally, would
   return HTML, XML or JSON representations based on the requested mime type.

#### Versioning
Library resources can change over time. This guide requires that the Library version information recorded be performed as follows:

1. A library **shall** do one of the following:
   * be recorded in the form defined by [Semantic Versioning](https://semver.org/), e.g.: version 1.2.3 is the third patch to the second minor
     update of the first major release, or
   * be recorded by date using ISO 8601 format with hyphens and no time component, e.g.: 2020-07-25 for the measure released on July 25, 2020.
2. If versions can be updated more frequently than by day, a publisher **shall** use semantic versioning.

The use of semantic versioning is preferred because this is the form required in FHIR implementation guides, and it enables support for versioning
of libaries using FHIR Implementation Guide tools. This is also the format for versioning that has been the most widely adopted by the IT industry.

#### Status of a Library
This profile requires that the publication status of a library be reported (this is a general requirement of all Library resources), and
furthermore, that it's experimental status **shall** also be reported.

The usage of status values is described below:
draft
: The library is presently under development. Libraries presently under development **shall** also be recorded as being experimental.

active
: The library is ready for, or being used, either in pilots or production. The experimental status for the measure **shall** be used to distinguish between
libraries that are being piloted (`experimental=true`) or in production (`experimental=false`).

retired
: The library **should** no longer be used in production. Libraries which are retired before ever becoming active in production **shall** have experimental=true,
while those which have been available for production use **shall** have `experimental=false`.

Libraries which have been used in the past **should** remain available for access for use when data has been used in production to enable systems to
interpret historical data recorded using the measure.


### Library Publication
A library is published by some appropriate authority, for example a governmental agency focused on public health or emergency response,
or an organization working with such a governmental agency. Libraries for situational awareness are not expected to endure a ballot process,
but will instead be created by authorities using a well established governance process. The reason for this is that as the emergent situation
progresses, new libraries will be needed as the situation changes, or existing libraries may need to be updated to address issues found
during use.

Libraries are published by organizations rather than individuals.  This profile requires that the organization be identified in
`Library.publisher`, and furthermore, that there is at least one organizational e-mail address which can be used to contact
that publisher about the Library in `Library.contact`

