
Instance: MeasureSource-QueryMeasure-Pull
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the additional requirements for the Measure Source implementing the Query Measure transaction with the Pull Option."
* insert SanerDefinitionContent
* name = "MeasureSource_QueryMeasure_Pull"
* title = "Measure Source implementing the Query Measure transaction with the Pull Option."
* date = "2020-09-10T18:17:35.860932-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Source implementing the Query Measure transaction with the Pull Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[serverSlice].mode = #server

* rest[serverSlice].resource[LocationSlice].type = #Location
* rest[serverSlice].resource[LocationSlice].supportedProfile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-location"

* rest[serverSlice].resource[LocationSlice].interaction[0].code = #read
* rest[serverSlice].resource[LocationSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LocationSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[LocationSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[LocationSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LocationSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[LocationSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[LocationSlice].searchParam[0].type = #token
* rest[serverSlice].resource[LocationSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LocationSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[LocationSlice].searchParam[1].name = "name"
* rest[serverSlice].resource[LocationSlice].searchParam[1].type = #string
* rest[serverSlice].resource[LocationSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LocationSlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[LocationSlice].searchParam[2].name = "identifier"
* rest[serverSlice].resource[LocationSlice].searchParam[2].type = #token
* rest[serverSlice].resource[LocationSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LocationSlice].searchParam[2].extension.valueCode = #SHALL

* rest[serverSlice].resource[LocationSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[LocationSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LocationSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[LocationSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[LocationSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[LocationSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[LocationSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[LocationSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[LocationSlice].extension[1].extension[0].valueString = "name"
* rest[serverSlice].resource[LocationSlice].extension[1].extension[1].url = "optional"
* rest[serverSlice].resource[LocationSlice].extension[1].extension[1].valueString = "identifier"

* rest[serverSlice].resource[LocationSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[LocationSlice].extension[2].extension[0].url = "required"
* rest[serverSlice].resource[LocationSlice].extension[2].extension[0].valueString = "identifier"

* rest[serverSlice].resource[MeasureReportSlice].type = #MeasureReport
* rest[serverSlice].resource[MeasureReportSlice].supportedProfile[0] = "http://hl7.org/fhir/us/saner/StructureDefinition/PublicHealthMeasureReport"

* rest[serverSlice].resource[MeasureReportSlice].interaction[0].code = #read
* rest[serverSlice].resource[MeasureReportSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[MeasureReportSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[0].type = #token
* rest[serverSlice].resource[MeasureReportSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchParam[1].name = "_lastUpdated"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[1].type = #date
* rest[serverSlice].resource[MeasureReportSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchParam[2].name = "date"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[2].type = #date
* rest[serverSlice].resource[MeasureReportSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[2].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchParam[3].name = "period"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[3].type = #date
* rest[serverSlice].resource[MeasureReportSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[3].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchParam[4].name = "measure"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[4].type = #uri
* rest[serverSlice].resource[MeasureReportSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[4].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchParam[5].name = "measure.title"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[5].type = #string
* rest[serverSlice].resource[MeasureReportSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[5].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureReportSlice].searchParam[6].name = "subject"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[6].type = #reference
* rest[serverSlice].resource[MeasureReportSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[6].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchParam[7].name = "subject:identifier"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[7].type = #token
* rest[serverSlice].resource[MeasureReportSlice].searchParam[7].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[7].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchParam[8].name = "subject:Location.near"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[8].type = #special
* rest[serverSlice].resource[MeasureReportSlice].searchParam[8].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[8].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureReportSlice].searchParam[9].name = "reporter"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[9].type = #reference
* rest[serverSlice].resource[MeasureReportSlice].searchParam[9].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[9].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchParam[10].name = "reporter:identifier"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[10].type = #token
* rest[serverSlice].resource[MeasureReportSlice].searchParam[10].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchParam[10].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[MeasureReportSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureReportSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureReportSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureReportSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[MeasureReportSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[MeasureReportSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[0].valueString = "period"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[1].url = "required"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[1].valueString = "measure"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[2].url = "optional"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[2].valueString = "_lastUpdated"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[3].url = "optional"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[3].valueString = "date"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[4].url = "optional"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[4].valueString = "measure.title"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[5].url = "optional"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[5].valueString = "subject"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[6].url = "optional"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[6].valueString = "subject:identifier"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[7].url = "optional"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[7].valueString = "subject:Location.near"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[8].url = "optional"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[8].valueString = "reporter"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[9].url = "optional"
* rest[serverSlice].resource[MeasureReportSlice].extension[1].extension[9].valueString = "reporter:identifier"

* rest[serverSlice].resource[MeasureSlice].type = #Measure
* rest[serverSlice].resource[MeasureSlice].supportedProfile[0] = "http://hl7.org/fhir/us/saner/StructureDefinition/PublicHealthMeasure"

* rest[serverSlice].resource[MeasureSlice].interaction[0].code = #read
* rest[serverSlice].resource[MeasureSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[MeasureSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[MeasureSlice].searchParam[0].type = #token
* rest[serverSlice].resource[MeasureSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureSlice].searchParam[1].name = "_text"
* rest[serverSlice].resource[MeasureSlice].searchParam[1].type = #string
* rest[serverSlice].resource[MeasureSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[1].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchParam[2].name = "_content"
* rest[serverSlice].resource[MeasureSlice].searchParam[2].type = #string
* rest[serverSlice].resource[MeasureSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[2].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchParam[3].name = "definition-text"
* rest[serverSlice].resource[MeasureSlice].searchParam[3].type = #string
* rest[serverSlice].resource[MeasureSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[3].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchParam[4].name = "code"
* rest[serverSlice].resource[MeasureSlice].searchParam[4].type = #token
* rest[serverSlice].resource[MeasureSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[4].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchParam[5].name = "code:in"
* rest[serverSlice].resource[MeasureSlice].searchParam[5].type = #token
* rest[serverSlice].resource[MeasureSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[5].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[MeasureSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[MeasureSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[0].valueString = "_text"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[1].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[1].valueString = "_content"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[2].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[2].valueString = "definition-text"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[3].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[3].valueString = "code"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[4].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[4].valueString = "code:in"

* rest[serverSlice].resource[MeasureSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[0].valueString = "_content"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[1].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[1].valueString = "definition-text"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[2].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[2].valueString = "code"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[3].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[3].valueString = "code:in"

* rest[serverSlice].resource[MeasureSlice].extension[3].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[0].valueString = "definition-text"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[1].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[1].valueString = "code"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[2].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[2].valueString = "code:in"

* rest[serverSlice].resource[MeasureSlice].extension[4].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[0].valueString = "code"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[1].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[1].valueString = "code:in"

* rest[serverSlice].resource[MeasureSlice].extension[5].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[5].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[5].extension[0].valueString = "code:in"

* rest[serverSlice].resource[OrganizationSlice].type = #Organization
* rest[serverSlice].resource[OrganizationSlice].supportedProfile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization"

* rest[serverSlice].resource[OrganizationSlice].interaction[0].code = #read
* rest[serverSlice].resource[OrganizationSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[OrganizationSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[OrganizationSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[OrganizationSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[OrganizationSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[OrganizationSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[OrganizationSlice].searchParam[0].type = #token
* rest[serverSlice].resource[OrganizationSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[OrganizationSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[OrganizationSlice].searchParam[1].name = "name"
* rest[serverSlice].resource[OrganizationSlice].searchParam[1].type = #string
* rest[serverSlice].resource[OrganizationSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[OrganizationSlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[OrganizationSlice].searchParam[2].name = "identifier"
* rest[serverSlice].resource[OrganizationSlice].searchParam[2].type = #token
* rest[serverSlice].resource[OrganizationSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[OrganizationSlice].searchParam[2].extension.valueCode = #SHALL

* rest[serverSlice].resource[OrganizationSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[OrganizationSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[OrganizationSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[OrganizationSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[OrganizationSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[OrganizationSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[OrganizationSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[OrganizationSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[OrganizationSlice].extension[1].extension[0].valueString = "name"
* rest[serverSlice].resource[OrganizationSlice].extension[1].extension[1].url = "optional"
* rest[serverSlice].resource[OrganizationSlice].extension[1].extension[1].valueString = "identifier"

* rest[serverSlice].resource[OrganizationSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[OrganizationSlice].extension[2].extension[0].url = "required"
* rest[serverSlice].resource[OrganizationSlice].extension[2].extension[0].valueString = "identifier"
