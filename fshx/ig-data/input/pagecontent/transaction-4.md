This section describes the COMPUTE-MX of this guide. This transaction is used by the Measure Source, Measure Consumer and Measure Computer actors.

### Scope

The Compute Measure transaction describes the behavior of the Measure Computer actor in periodically computing and reporting on measures.


This transaction enables automatic computing of measure reports.


### Actors Roles

![Figure 2.4-1: Compute Measure Use Case Diagram](transaction-4-uc.svg "Figure 2.4-1: Compute Measure Use Case Diagram")

**Figure 2.4-1: Compute Measure Use Case Diagram**

<table border='1' borderspacing='0'>
<caption><b>Table 2.4-1: Actor Roles</b></caption>
<thead><tr><th>Actor</th><th>Role</th></tr></thead>
<tbody><tr><td><a href="actors.html#measure-source">Measure Source</a></td>
<td></td>
</tr>
        <tr><td><a href="actors.html#measure-consumer">Measure Consumer</a></td>
<td></td>
</tr>
        <tr><td><a href="actors.html#measure-computer">Measure Computer</a></td>
<td>Computes and reports a measure.</td>
</tr>
        
</tbody>
</table>

### Referenced Standards

<table border='1' borderspacing='0'>
<caption><b>Table 3.71.3-1: Referenced Standards</b></caption>
<thead><tr><th>Standard</th><th>Name</th></tr></thead>
<tbody>
            <tr><td>FHIR-R4</td><td><a href='http://www.hl7.org/FHIR/R4'>HL7 FHIR Release 4.0</a></td></tr>
        
            <tr><td>RFC-7230</td><td><a href='https://ietf.org/rfc/rfc7230.html'>Hypertext Transfer Protocol - HTTP/1.1</a></td></tr>
        
            <tr><td>NDJSON</td><td><a href='http://ndjson.org/'>Newline Delimited JSON</a></td></tr>
        
</tbody>
</table>

### Interactions
        
![Figure 2.4-2: Compute Measure Interactions](transaction-4-seq.svg "Figure 2.4-2: Compute Measure Interactions")

**Figure 2.4-2: Compute Measure Interactions**


#### Compute Measure


The Measure Computer computes the measure report for the current reporting period.


##### Trigger Event - The current reporting period has elapsed. [TBD Define how reporting periods are specified in a measure](#todo)

##### Message Semantics

The Measure Computer prepares a Measure Report.


##### Expected Actions

#### Report Measure


The Measure Computer reports the newly computed measure for the current reporting period.


##### Trigger Event - A new MeasureReport resource is available for reporting.

##### Message Semantics

The Measure Computer reports the computed result via the grouped MeasureSource actor.


##### Expected Actions

#### Query Measure


The Measure Computer responds to a query for a Measure Report with the newly computed report for the current reporting period.


##### Trigger Event - The Measure Consumer has requested measure reports with criteria matching the newly created report.

##### Message Semantics

The Measure Computer reports the computed result via the grouped MeasureSource actor.


##### Expected Actions


### Conformance
See the following CapabilityStatement resources for conformance requirements:

        