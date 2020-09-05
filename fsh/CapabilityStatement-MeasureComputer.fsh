
Instance: MeasureComputer
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the requirements for the Measure Computer."
* insert SanerDefinitionContent
* name = "MeasureComputer"
* title = "Measure Computer."
* date = "2020-09-04T23:05:22.903075-04:00"
* kind = #requirements
* description = "Defines the requirements for the Measure Computer."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[clientSlice].mode = #client

* rest[clientSlice].resource[MeasureSlice].type = #Measure

* rest[clientSlice].resource[MeasureSlice].operation[0].name = "evaluate-measure"
* rest[clientSlice].resource[MeasureSlice].operation[0].definition = "http://hl7.org/fhir/us/saner/OperationDefinition/ComputeMeasure-evaluate-measure"
* rest[clientSlice].resource[MeasureSlice].operation[0].documentation = "Evaluate the measure"

* rest[serverSlice].mode = #server

* rest[serverSlice].resource[MeasureSlice].type = #Measure

* rest[serverSlice].resource[MeasureSlice].operation[0].name = "evaluate-measure"
* rest[serverSlice].resource[MeasureSlice].operation[0].definition = "http://hl7.org/fhir/us/saner/OperationDefinition/ComputeMeasure-evaluate-measure"
* rest[serverSlice].resource[MeasureSlice].operation[0].documentation = "Evaluate the measure"
