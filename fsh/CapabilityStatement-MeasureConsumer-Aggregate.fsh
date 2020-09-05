
Instance: MeasureConsumer-Aggregate
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the additional requirements for the Measure Consumer implementing the Aggregate Option."
* insert SanerDefinitionContent
* name = "MeasureConsumer_Aggregate"
* title = "Measure Consumer implementing the Aggregate Option."
* date = "2020-09-04T23:05:22.903075-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Consumer implementing the Aggregate Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[serverSlice].mode = #server

* rest[serverSlice].resource[MeasureReportSlice].type = #MeasureReport

* rest[serverSlice].resource[MeasureReportSlice].operation[0].name = "aggregate"
* rest[serverSlice].resource[MeasureReportSlice].operation[0].definition = "http://hl7.org/fhir/us/saner/OperationDefinition/ProduceMeasure-aggregate"
* rest[serverSlice].resource[MeasureReportSlice].operation[0].documentation = "Aggregate two or more more Messure Report resources into a single MeasureReport."
