
Instance: MeasureDefinitionConsumer-QueryMeasureDefinition
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the requirements for the Measure Definition Consumer implementing the Query Measure Definition transaction."
* insert SanerDefinitionContent
* name = "MeasureDefinitionConsumer_QueryMeasureDefinition"
* title = "Measure Definition Consumer implementing the Query Measure Definition transaction."
* date = "2020-10-01T02:36:53.144341-04:00"
* kind = #requirements
* description = "Defines the requirements for the Measure Definition Consumer implementing the Query Measure Definition transaction."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[clientSlice].mode = #client

* rest[clientSlice].resource[MeasureSlice].type = #Measure
* rest[clientSlice].resource[MeasureSlice].supportedProfile[0] = "http://hl7.org/fhir/saner/StructureDefinition/PublicHealthMeasure"

* rest[clientSlice].resource[MeasureSlice].interaction[0].code = #read
* rest[clientSlice].resource[MeasureSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[MeasureSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].interaction[1].extension.valueCode = #SHOULD

* rest[clientSlice].resource[MeasureSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[MeasureSlice].searchParam[0].type = #token
* rest[clientSlice].resource[MeasureSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureSlice].searchParam[1].name = "url"
* rest[clientSlice].resource[MeasureSlice].searchParam[1].type = #uri
* rest[clientSlice].resource[MeasureSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[MeasureSlice].searchParam[2].name = "_text"
* rest[clientSlice].resource[MeasureSlice].searchParam[2].type = #string
* rest[clientSlice].resource[MeasureSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[2].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchParam[3].name = "_content"
* rest[clientSlice].resource[MeasureSlice].searchParam[3].type = #string
* rest[clientSlice].resource[MeasureSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[3].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchParam[4].name = "definition-text"
* rest[clientSlice].resource[MeasureSlice].searchParam[4].type = #string
* rest[clientSlice].resource[MeasureSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[4].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchParam[5].name = "code"
* rest[clientSlice].resource[MeasureSlice].searchParam[5].type = #token
* rest[clientSlice].resource[MeasureSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[5].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchParam[6].name = "code:in"
* rest[clientSlice].resource[MeasureSlice].searchParam[6].type = #token
* rest[clientSlice].resource[MeasureSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchParam[6].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[MeasureSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[MeasureSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[MeasureSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[MeasureSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[1].extension[0].valueString = "url"

* rest[clientSlice].resource[MeasureSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[0].valueString = "_text"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[1].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[1].valueString = "_content"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[2].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[2].valueString = "definition-text"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[3].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[3].valueString = "code"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[4].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[2].extension[4].valueString = "code:in"

* rest[clientSlice].resource[MeasureSlice].extension[3].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[0].valueString = "_content"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[1].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[1].valueString = "definition-text"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[2].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[2].valueString = "code"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[3].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[3].extension[3].valueString = "code:in"

* rest[clientSlice].resource[MeasureSlice].extension[4].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[0].valueString = "definition-text"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[1].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[1].valueString = "code"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[2].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[4].extension[2].valueString = "code:in"

* rest[clientSlice].resource[MeasureSlice].extension[5].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[5].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[5].extension[0].valueString = "code"
* rest[clientSlice].resource[MeasureSlice].extension[5].extension[1].url = "optional"
* rest[clientSlice].resource[MeasureSlice].extension[5].extension[1].valueString = "code:in"

* rest[clientSlice].resource[MeasureSlice].extension[6].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[MeasureSlice].extension[6].extension[0].url = "required"
* rest[clientSlice].resource[MeasureSlice].extension[6].extension[0].valueString = "code:in"

* rest[clientSlice].resource[LibrarySlice].type = #Library

* rest[clientSlice].resource[LibrarySlice].interaction[0].code = #read
* rest[clientSlice].resource[LibrarySlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LibrarySlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[LibrarySlice].interaction[1].code = #search-type
* rest[clientSlice].resource[LibrarySlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LibrarySlice].interaction[1].extension.valueCode = #SHOULD

* rest[clientSlice].resource[LibrarySlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[LibrarySlice].searchParam[0].type = #token
* rest[clientSlice].resource[LibrarySlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LibrarySlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[LibrarySlice].searchParam[1].name = "url"
* rest[clientSlice].resource[LibrarySlice].searchParam[1].type = #uri
* rest[clientSlice].resource[LibrarySlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LibrarySlice].searchParam[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[LibrarySlice].searchInclude[0] = "*"
* rest[clientSlice].resource[LibrarySlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[LibrarySlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[LibrarySlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[LibrarySlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[LibrarySlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[LibrarySlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[LibrarySlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[LibrarySlice].extension[1].extension[0].valueString = "url"

* rest[clientSlice].resource[ValueSetSlice].type = #ValueSet

* rest[clientSlice].resource[ValueSetSlice].interaction[0].code = #read
* rest[clientSlice].resource[ValueSetSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ValueSetSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[ValueSetSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[ValueSetSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ValueSetSlice].interaction[1].extension.valueCode = #SHOULD

* rest[clientSlice].resource[ValueSetSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[ValueSetSlice].searchParam[0].type = #token
* rest[clientSlice].resource[ValueSetSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ValueSetSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[ValueSetSlice].searchParam[1].name = "url"
* rest[clientSlice].resource[ValueSetSlice].searchParam[1].type = #uri
* rest[clientSlice].resource[ValueSetSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ValueSetSlice].searchParam[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[ValueSetSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[ValueSetSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ValueSetSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[ValueSetSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[ValueSetSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[ValueSetSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[ValueSetSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[ValueSetSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[ValueSetSlice].extension[1].extension[0].valueString = "url"

* rest[clientSlice].resource[CodeSystemSlice].type = #CodeSystem

* rest[clientSlice].resource[CodeSystemSlice].interaction[0].code = #read
* rest[clientSlice].resource[CodeSystemSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[CodeSystemSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[CodeSystemSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[CodeSystemSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[CodeSystemSlice].interaction[1].extension.valueCode = #SHOULD

* rest[clientSlice].resource[CodeSystemSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[CodeSystemSlice].searchParam[0].type = #token
* rest[clientSlice].resource[CodeSystemSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[CodeSystemSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[CodeSystemSlice].searchParam[1].name = "url"
* rest[clientSlice].resource[CodeSystemSlice].searchParam[1].type = #uri
* rest[clientSlice].resource[CodeSystemSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[CodeSystemSlice].searchParam[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[CodeSystemSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[CodeSystemSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[CodeSystemSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[CodeSystemSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[CodeSystemSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[CodeSystemSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[CodeSystemSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[CodeSystemSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[CodeSystemSlice].extension[1].extension[0].valueString = "url"

* rest[clientSlice].resource[ConceptMapSlice].type = #ConceptMap

* rest[clientSlice].resource[ConceptMapSlice].interaction[0].code = #read
* rest[clientSlice].resource[ConceptMapSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ConceptMapSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[ConceptMapSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[ConceptMapSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ConceptMapSlice].interaction[1].extension.valueCode = #SHOULD

* rest[clientSlice].resource[ConceptMapSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[ConceptMapSlice].searchParam[0].type = #token
* rest[clientSlice].resource[ConceptMapSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ConceptMapSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[ConceptMapSlice].searchParam[1].name = "url"
* rest[clientSlice].resource[ConceptMapSlice].searchParam[1].type = #uri
* rest[clientSlice].resource[ConceptMapSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ConceptMapSlice].searchParam[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[ConceptMapSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[ConceptMapSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[ConceptMapSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[ConceptMapSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[ConceptMapSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[ConceptMapSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[ConceptMapSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[ConceptMapSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[ConceptMapSlice].extension[1].extension[0].valueString = "url"
