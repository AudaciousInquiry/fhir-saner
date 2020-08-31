
Instance: MeasureSource-QueryMeasure-CSV-Pull
InstanceOf: CapabilityStatementWithSlices
Description: "Defines the additional requirements for the Measure Source implementing the Query Measure transaction with the CSV Option and the Pull Option."
* insert SanerDefinitionContent
* name = "MeasureSource_QueryMeasure_CSV_Pull"
* title = "Measure Source implementing the Query Measure transaction with the CSV Option and the Pull Option."
* date = "2020-08-31T01:16:36.012543-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Source implementing the Query Measure transaction with the CSV Option and the Pull Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[serverSlice].mode = #server

* rest[serverSlice].resource[MeasureReportSlice].type = #MeasureReport

* rest[serverSlice].resource[MeasureReportSlice].operation[0].name = "read-csv"
* rest[serverSlice].resource[MeasureReportSlice].operation[0].definition = "http://hl7.org/fhir/us/saner/OperationDefinition/QueryMeasure-read-csv"
* rest[serverSlice].resource[MeasureReportSlice].operation[0].documentation = "Read in CSV Format"

* rest[serverSlice].resource[MeasureReportSlice].operation[1].name = "search-csv"
* rest[serverSlice].resource[MeasureReportSlice].operation[1].definition = "http://hl7.org/fhir/us/saner/OperationDefinition/QueryMeasure-search-csv"
* rest[serverSlice].resource[MeasureReportSlice].operation[1].documentation = "Search in CSV Format"
