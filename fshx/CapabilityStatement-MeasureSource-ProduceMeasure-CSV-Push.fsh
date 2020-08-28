
Instance: MeasureSource-ProduceMeasure-CSV-Push
InstanceOf: CapabilityStatementWithSlices
Description: "Defines the additional requirements for the Measure Source implementing the Produce Measure transaction with the CSV Option and the Push Option."
* insert SanerDefinitionContent
* name = "MeasureSource_ProduceMeasure_CSV_Push"
* title = "Measure Source implementing the Produce Measure transaction with the CSV Option and the Push Option."
* date = "2020-08-27T16:12:12.962279-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Source implementing the Produce Measure transaction with the CSV Option and the Push Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[clientSlice].mode = #client

* rest[clientSlice].resource[MeasureSlice].type = #Measure

* rest[clientSlice].resource[MeasureSlice].operation[0].name = "report-csv"
* rest[clientSlice].resource[MeasureSlice].operation[0].definition = "http://hl7.org/fhir/us/saner/OperationDefinition/ProduceMeasure-report-csv"
* rest[clientSlice].resource[MeasureSlice].operation[0].documentation = "Create or update a MeasureReport from CSV Format"
