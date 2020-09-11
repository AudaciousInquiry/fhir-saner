
Instance: MeasureDefinitionSource
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the requirements for the Measure Definition Source."
* insert SanerDefinitionContent
* name = "MeasureDefinitionSource"
* title = "Measure Definition Source."
* date = "2020-09-10T18:17:35.860932-04:00"
* kind = #requirements
* description = "Defines the requirements for the Measure Definition Source."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[serverSlice].mode = #server

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

* rest[serverSlice].resource[LibrarySlice].type = #Library

* rest[serverSlice].resource[LibrarySlice].interaction[0].code = #read
* rest[serverSlice].resource[LibrarySlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LibrarySlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[LibrarySlice].interaction[1].code = #search-type
* rest[serverSlice].resource[LibrarySlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LibrarySlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[LibrarySlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[LibrarySlice].searchParam[0].type = #token
* rest[serverSlice].resource[LibrarySlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LibrarySlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[LibrarySlice].searchInclude[0] = "*"
* rest[serverSlice].resource[LibrarySlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LibrarySlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[LibrarySlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[LibrarySlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[LibrarySlice].extension[0].extension[0].valueString = "_id"
