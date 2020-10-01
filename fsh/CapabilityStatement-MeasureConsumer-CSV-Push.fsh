
Instance: MeasureConsumer-CSV-Push
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the additional requirements for the Measure Consumer implementing the CSV Option and the Push Option."
* insert SanerDefinitionContent
* name = "MeasureConsumer_CSV_Push"
* title = "Measure Consumer implementing the CSV Option and the Push Option."
* date = "2020-10-01T02:36:53.144341-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Consumer implementing the CSV Option and the Push Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[serverSlice].mode = #server

* rest[serverSlice].resource[MeasureSlice].type = #Measure
* rest[serverSlice].resource[MeasureSlice].supportedProfile[0] = "http://hl7.org/fhir/saner/StructureDefinition/PublicHealthMeasure"

* rest[serverSlice].resource[MeasureSlice].operation[0].name = "report-csv"
* rest[serverSlice].resource[MeasureSlice].operation[0].definition = "http://hl7.org/fhir/saner/OperationDefinition/Measure-report-csv"
* rest[serverSlice].resource[MeasureSlice].operation[0].documentation = "Create or update a MeasureReport from CSV Format"
