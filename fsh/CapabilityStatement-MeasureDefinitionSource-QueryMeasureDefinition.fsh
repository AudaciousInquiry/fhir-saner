
Instance: MeasureDefinitionSource-QueryMeasureDefinition
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the requirements for the Measure Definition Source implementing the Query Measure Definition transaction."
* insert SanerDefinitionContent
* name = "MeasureDefinitionSource_QueryMeasureDefinition"
* title = "Measure Definition Source implementing the Query Measure Definition transaction."
* date = "2020-10-01T02:36:53.144341-04:00"
* kind = #requirements
* description = "Defines the requirements for the Measure Definition Source implementing the Query Measure Definition transaction."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[serverSlice].mode = #server

* rest[serverSlice].resource[MeasureSlice].type = #Measure
* rest[serverSlice].resource[MeasureSlice].supportedProfile[0] = "http://hl7.org/fhir/saner/StructureDefinition/PublicHealthMeasure"

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

* rest[serverSlice].resource[MeasureSlice].searchParam[1].name = "url"
* rest[serverSlice].resource[MeasureSlice].searchParam[1].type = #uri
* rest[serverSlice].resource[MeasureSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureSlice].searchParam[2].name = "_text"
* rest[serverSlice].resource[MeasureSlice].searchParam[2].type = #string
* rest[serverSlice].resource[MeasureSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[2].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchParam[3].name = "_content"
* rest[serverSlice].resource[MeasureSlice].searchParam[3].type = #string
* rest[serverSlice].resource[MeasureSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[3].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchParam[4].name = "definition-text"
* rest[serverSlice].resource[MeasureSlice].searchParam[4].type = #string
* rest[serverSlice].resource[MeasureSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[4].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchParam[5].name = "code"
* rest[serverSlice].resource[MeasureSlice].searchParam[5].type = #token
* rest[serverSlice].resource[MeasureSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[5].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchParam[6].name = "code:in"
* rest[serverSlice].resource[MeasureSlice].searchParam[6].type = #token
* rest[serverSlice].resource[MeasureSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchParam[6].extension.valueCode = #SHOULD

* rest[serverSlice].resource[MeasureSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[MeasureSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[MeasureSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[MeasureSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[MeasureSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[1].extension[0].valueString = "url"

* rest[serverSlice].resource[MeasureSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[0].valueString = "_text"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[1].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[1].valueString = "_content"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[2].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[2].valueString = "definition-text"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[3].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[3].valueString = "code"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[4].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[2].extension[4].valueString = "code:in"

* rest[serverSlice].resource[MeasureSlice].extension[3].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[0].valueString = "_content"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[1].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[1].valueString = "definition-text"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[2].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[2].valueString = "code"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[3].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[3].extension[3].valueString = "code:in"

* rest[serverSlice].resource[MeasureSlice].extension[4].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[0].valueString = "definition-text"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[1].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[1].valueString = "code"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[2].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[4].extension[2].valueString = "code:in"

* rest[serverSlice].resource[MeasureSlice].extension[5].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[5].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[5].extension[0].valueString = "code"
* rest[serverSlice].resource[MeasureSlice].extension[5].extension[1].url = "optional"
* rest[serverSlice].resource[MeasureSlice].extension[5].extension[1].valueString = "code:in"

* rest[serverSlice].resource[MeasureSlice].extension[6].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[MeasureSlice].extension[6].extension[0].url = "required"
* rest[serverSlice].resource[MeasureSlice].extension[6].extension[0].valueString = "code:in"

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

* rest[serverSlice].resource[LibrarySlice].searchParam[1].name = "url"
* rest[serverSlice].resource[LibrarySlice].searchParam[1].type = #uri
* rest[serverSlice].resource[LibrarySlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LibrarySlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[LibrarySlice].searchInclude[0] = "*"
* rest[serverSlice].resource[LibrarySlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[LibrarySlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[LibrarySlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[LibrarySlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[LibrarySlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[LibrarySlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[LibrarySlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[LibrarySlice].extension[1].extension[0].valueString = "url"

* rest[serverSlice].resource[ValueSetSlice].type = #ValueSet

* rest[serverSlice].resource[ValueSetSlice].interaction[0].code = #read
* rest[serverSlice].resource[ValueSetSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ValueSetSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[ValueSetSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[ValueSetSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ValueSetSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[ValueSetSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[ValueSetSlice].searchParam[0].type = #token
* rest[serverSlice].resource[ValueSetSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ValueSetSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[ValueSetSlice].searchParam[1].name = "url"
* rest[serverSlice].resource[ValueSetSlice].searchParam[1].type = #uri
* rest[serverSlice].resource[ValueSetSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ValueSetSlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[ValueSetSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[ValueSetSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ValueSetSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[ValueSetSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[ValueSetSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[ValueSetSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[ValueSetSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[ValueSetSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[ValueSetSlice].extension[1].extension[0].valueString = "url"

* rest[serverSlice].resource[CodeSystemSlice].type = #CodeSystem

* rest[serverSlice].resource[CodeSystemSlice].interaction[0].code = #read
* rest[serverSlice].resource[CodeSystemSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[CodeSystemSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[CodeSystemSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[CodeSystemSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[CodeSystemSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[CodeSystemSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[CodeSystemSlice].searchParam[0].type = #token
* rest[serverSlice].resource[CodeSystemSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[CodeSystemSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[CodeSystemSlice].searchParam[1].name = "url"
* rest[serverSlice].resource[CodeSystemSlice].searchParam[1].type = #uri
* rest[serverSlice].resource[CodeSystemSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[CodeSystemSlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[CodeSystemSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[CodeSystemSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[CodeSystemSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[CodeSystemSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[CodeSystemSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[CodeSystemSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[CodeSystemSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[CodeSystemSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[CodeSystemSlice].extension[1].extension[0].valueString = "url"

* rest[serverSlice].resource[ConceptMapSlice].type = #ConceptMap

* rest[serverSlice].resource[ConceptMapSlice].interaction[0].code = #read
* rest[serverSlice].resource[ConceptMapSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ConceptMapSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[ConceptMapSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[ConceptMapSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ConceptMapSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[ConceptMapSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[ConceptMapSlice].searchParam[0].type = #token
* rest[serverSlice].resource[ConceptMapSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ConceptMapSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[ConceptMapSlice].searchParam[1].name = "url"
* rest[serverSlice].resource[ConceptMapSlice].searchParam[1].type = #uri
* rest[serverSlice].resource[ConceptMapSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ConceptMapSlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[ConceptMapSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[ConceptMapSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[ConceptMapSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[ConceptMapSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[ConceptMapSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[ConceptMapSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[ConceptMapSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[ConceptMapSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[ConceptMapSlice].extension[1].extension[0].valueString = "url"
