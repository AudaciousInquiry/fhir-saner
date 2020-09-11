
Instance: MeasureSource-ProduceMeasure-Push
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the additional requirements for the Measure Source implementing the Produce Measure transaction with the Push Option."
* insert SanerDefinitionContent
* name = "MeasureSource_ProduceMeasure_Push"
* title = "Measure Source implementing the Produce Measure transaction with the Push Option."
* date = "2020-09-10T18:17:35.860932-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Source implementing the Produce Measure transaction with the Push Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[clientSlice].mode = #client

* rest[clientSlice].resource[MeasureReportSlice].type = #MeasureReport

* rest[clientSlice].resource[MeasureReportSlice].interaction[0].code = #create
* rest[clientSlice].resource[MeasureReportSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureReportSlice].interaction[1].code = #update
* rest[clientSlice].resource[MeasureReportSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].interaction[1].extension.valueCode = #SHALL
