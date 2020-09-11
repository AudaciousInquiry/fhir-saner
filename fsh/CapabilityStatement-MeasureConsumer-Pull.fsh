
Instance: MeasureConsumer-Pull
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the additional requirements for the Measure Consumer implementing the Pull Option."
* insert SanerDefinitionContent
* name = "MeasureConsumer_Pull"
* title = "Measure Consumer implementing the Pull Option."
* date = "2020-09-10T18:17:35.860932-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Consumer implementing the Pull Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[clientSlice].mode = #client

* rest[clientSlice].resource[LocationSlice].type = #Location
* rest[clientSlice].resource[LocationSlice].supportedProfile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-location"

* rest[clientSlice].resource[LocationSlice].interaction[0].code = #read
* rest[clientSlice].resource[LocationSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LocationSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[LocationSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[LocationSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LocationSlice].interaction[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[LocationSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[LocationSlice].searchParam[0].type = #token
* rest[clientSlice].resource[LocationSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LocationSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[LocationSlice].searchParam[1].name = "name"
* rest[clientSlice].resource[LocationSlice].searchParam[1].type = #string
* rest[clientSlice].resource[LocationSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LocationSlice].searchParam[1].extension.valueCode = #MAY

* rest[clientSlice].resource[LocationSlice].searchParam[2].name = "identifier"
* rest[clientSlice].resource[LocationSlice].searchParam[2].type = #token
* rest[clientSlice].resource[LocationSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LocationSlice].searchParam[2].extension.valueCode = #MAY

* rest[clientSlice].resource[LocationSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[LocationSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LocationSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[LocationSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[LocationSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[LocationSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[LocationSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[LocationSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[LocationSlice].extension[1].extension[0].valueString = "name"
* rest[clientSlice].resource[LocationSlice].extension[1].extension[1].url = "optional"
* rest[clientSlice].resource[LocationSlice].extension[1].extension[1].valueString = "identifier"

* rest[clientSlice].resource[LocationSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[LocationSlice].extension[2].extension[0].url = "required"
* rest[clientSlice].resource[LocationSlice].extension[2].extension[0].valueString = "identifier"

* rest[clientSlice].resource[MeasureReportSlice].type = #MeasureReport
* rest[clientSlice].resource[MeasureReportSlice].supportedProfile[0] = "http://hl7.org/fhir/us/saner/StructureDefinition/PublicHealthMeasureReport"

* rest[clientSlice].resource[MeasureReportSlice].interaction[0].code = #read
* rest[clientSlice].resource[MeasureReportSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureReportSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[MeasureReportSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].interaction[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureReportSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[0].type = #token
* rest[clientSlice].resource[MeasureReportSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureReportSlice].searchParam[1].name = "_lastUpdated"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[1].type = #date
* rest[clientSlice].resource[MeasureReportSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[1].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureReportSlice].searchParam[2].name = "date"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[2].type = #date
* rest[clientSlice].resource[MeasureReportSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[2].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureReportSlice].searchParam[3].name = "period"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[3].type = #date
* rest[clientSlice].resource[MeasureReportSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[3].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureReportSlice].searchParam[4].name = "measure"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[4].type = #uri
* rest[clientSlice].resource[MeasureReportSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[4].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureReportSlice].searchParam[5].name = "measure.title"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[5].type = #string
* rest[clientSlice].resource[MeasureReportSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[5].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureReportSlice].searchParam[6].name = "subject"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[6].type = #reference
* rest[clientSlice].resource[MeasureReportSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[6].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureReportSlice].searchParam[7].name = "subject:identifier"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[7].type = #token
* rest[clientSlice].resource[MeasureReportSlice].searchParam[7].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[7].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureReportSlice].searchParam[8].name = "subject:Location.near"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[8].type = #special
* rest[clientSlice].resource[MeasureReportSlice].searchParam[8].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[8].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureReportSlice].searchParam[9].name = "reporter"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[9].type = #reference
* rest[clientSlice].resource[MeasureReportSlice].searchParam[9].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[9].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureReportSlice].searchParam[10].name = "reporter:identifier"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[10].type = #token
* rest[clientSlice].resource[MeasureReportSlice].searchParam[10].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchParam[10].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureReportSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[MeasureReportSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureReportSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureReportSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureReportSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[MeasureReportSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[MeasureReportSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[0].valueString = "period"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[1].url = "required"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[1].valueString = "measure"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[2].url = "optional"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[2].valueString = "_lastUpdated"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[3].url = "optional"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[3].valueString = "date"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[4].url = "optional"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[4].valueString = "measure.title"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[5].url = "optional"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[5].valueString = "subject"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[6].url = "optional"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[6].valueString = "subject:identifier"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[7].url = "optional"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[7].valueString = "subject:Location.near"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[8].url = "optional"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[8].valueString = "reporter"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[9].url = "optional"
* rest[clientSlice].resource[MeasureReportSlice].extension[1].extension[9].valueString = "reporter:identifier"

* rest[clientSlice].resource[MeasureSlice].type = #Measure
* rest[clientSlice].resource[MeasureSlice].supportedProfile[0] = "http://hl7.org/fhir/us/saner/StructureDefinition/PublicHealthMeasure"

* rest[clientSlice].resource[MeasureSlice].interaction[0].code = #read
* rest[clientSlice].resource[MeasureSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[MeasureSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].interaction[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[MeasureSlice].searchParam[0].type = #token
* rest[clientSlice].resource[MeasureSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureSlice].searchParam[1].name = "_text"
* rest[clientSlice].resource[MeasureSlice].searchParam[1].type = #string
* rest[clientSlice].resource[MeasureSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[1].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchParam[2].name = "_content"
* rest[clientSlice].resource[MeasureSlice].searchParam[2].type = #string
* rest[clientSlice].resource[MeasureSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[2].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchParam[3].name = "definition-text"
* rest[clientSlice].resource[MeasureSlice].searchParam[3].type = #string
* rest[clientSlice].resource[MeasureSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[3].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchParam[4].name = "code"
* rest[clientSlice].resource[MeasureSlice].searchParam[4].type = #token
* rest[clientSlice].resource[MeasureSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[4].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchParam[5].name = "code:in"
* rest[clientSlice].resource[MeasureSlice].searchParam[5].type = #token
* rest[clientSlice].resource[MeasureSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[5].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[MeasureSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[MeasureSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[0].valueString = "_text"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[1].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[1].valueString = "_content"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[2].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[2].valueString = "definition-text"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[3].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[3].valueString = "code"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[4].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[4].valueString = "code:in"

* rest[clientSlice].resource[MeasureSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[0].valueString = "_content"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[1].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[1].valueString = "definition-text"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[2].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[2].valueString = "code"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[3].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[3].valueString = "code:in"

* rest[clientSlice].resource[MeasureSlice].extension[3].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[0].valueString = "definition-text"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[1].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[1].valueString = "code"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[2].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[2].valueString = "code:in"

* rest[clientSlice].resource[MeasureSlice].extension[4].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[0].valueString = "code"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[1].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[1].valueString = "code:in"

* rest[clientSlice].resource[MeasureSlice].extension[5].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[5].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[5].extension[0].valueString = "code:in"

* rest[clientSlice].resource[OrganizationSlice].type = #Organization
* rest[clientSlice].resource[OrganizationSlice].supportedProfile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization"

* rest[clientSlice].resource[OrganizationSlice].interaction[0].code = #read
* rest[clientSlice].resource[OrganizationSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[OrganizationSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[OrganizationSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[OrganizationSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[OrganizationSlice].interaction[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[OrganizationSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[OrganizationSlice].searchParam[0].type = #token
* rest[clientSlice].resource[OrganizationSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[OrganizationSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[OrganizationSlice].searchParam[1].name = "name"
* rest[clientSlice].resource[OrganizationSlice].searchParam[1].type = #string
* rest[clientSlice].resource[OrganizationSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[OrganizationSlice].searchParam[1].extension.valueCode = #MAY

* rest[clientSlice].resource[OrganizationSlice].searchParam[2].name = "identifier"
* rest[clientSlice].resource[OrganizationSlice].searchParam[2].type = #token
* rest[clientSlice].resource[OrganizationSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[OrganizationSlice].searchParam[2].extension.valueCode = #MAY

* rest[clientSlice].resource[OrganizationSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[OrganizationSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[OrganizationSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[OrganizationSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[OrganizationSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[OrganizationSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[OrganizationSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[OrganizationSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[OrganizationSlice].extension[1].extension[0].valueString = "name"
* rest[clientSlice].resource[OrganizationSlice].extension[1].extension[1].url = "optional"
* rest[clientSlice].resource[OrganizationSlice].extension[1].extension[1].valueString = "identifier"

* rest[clientSlice].resource[OrganizationSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[OrganizationSlice].extension[2].extension[0].url = "required"
* rest[clientSlice].resource[OrganizationSlice].extension[2].extension[0].valueString = "identifier"
