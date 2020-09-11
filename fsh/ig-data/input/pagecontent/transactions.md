The transactions in this profile are summarized in the sections below.

### Query Measure

The Query Measure transaction allows a Measure Consumer to
periodically query about the availability of a resource from an Measure Source.


This transaction enables a MeasureConsumer actor to access Measure, MeasureReport, Location and Organization
resources from a MeasureSource actor.  It defines the query parameters that the actors must and **should** support for search,
and the read operations that must be supported.


For more details see the detailed [transaction description](transaction-1.html)

### Produce Measure

The Produce Measure transaction allows an Measure Source to
periodically report on availability of resources to a Measure Consumer.


This transaction defines the create and update operations that a MeasureConsumer and
MeasureSource actor must support.


For more details see the detailed [transaction description](transaction-2.html)

### Query Measure Definition

The Query Measure Definition transaction allows a Measure Definition Consumer to
            periodically query about the availability of a resource from an Measure Definition Source.


This transaction enables a MeasureDefinition Consumer actor to access Measure resources from a MeasureDefinitionSource actor.
           It defines the query parameters that the actors must and **should** support for search and read operations that must be supported.


For more details see the detailed [transaction description](transaction-3.html)

### Compute Measure

The Compute Measure transaction describes the behavior of the Measure Computer actor in periodically computing and reporting on measures.


This transaction enables automatic computing of measure reports and manual retriggering of report generation for diagnostics or error recovery.


For more details see the detailed [transaction description](transaction-4.html)

### Communicate Results

The Communicate Results transaction allows users (e.g., Public Health Officials) to view current resource availability,
or other systems to access resource availability data.


For more details see the detailed [transaction description](transaction-5.html)
