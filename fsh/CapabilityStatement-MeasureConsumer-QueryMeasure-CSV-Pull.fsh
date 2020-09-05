
Instance: MeasureConsumer-QueryMeasure-CSV-Pull
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the additional requirements for the Measure Consumer implementing the Query Measure transaction with the CSV Option and the Pull Option."
* insert SanerDefinitionContent
* name = "MeasureConsumer_QueryMeasure_CSV_Pull"
* title = "Measure Consumer implementing the Query Measure transaction with the CSV Option and the Pull Option."
* date = "2020-09-04T23:05:22.903075-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Consumer implementing the Query Measure transaction with the CSV Option and the Pull Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[clientSlice].mode = #client

* rest[clientSlice].resource[MeasureReportSlice].type = #MeasureReport

* rest[clientSlice].resource[MeasureReportSlice].operation[0].name = "read-csv"
* rest[clientSlice].resource[MeasureReportSlice].operation[0].definition = "http://hl7.org/fhir/us/saner/OperationDefinition/QueryMeasure-read-csv"
* rest[clientSlice].resource[MeasureReportSlice].operation[0].documentation = "Read in CSV Format"

* rest[clientSlice].resource[MeasureReportSlice].operation[1].name = "search-csv"
* rest[clientSlice].resource[MeasureReportSlice].operation[1].definition = "http://hl7.org/fhir/us/saner/OperationDefinition/QueryMeasure-search-csv"
* rest[clientSlice].resource[MeasureReportSlice].operation[1].documentation = "Search in CSV Format"
