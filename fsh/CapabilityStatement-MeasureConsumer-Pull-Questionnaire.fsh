
Instance: MeasureConsumer-Pull-Questionnaire
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the additional requirements for the Measure Consumer implementing the Pull Option and the Questionnaire Option."
* insert SanerDefinitionContent
* name = "MeasureConsumer_Pull_Questionnaire"
* title = "Measure Consumer implementing the Pull Option and the Questionnaire Option."
* date = "2020-09-10T18:17:35.860932-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Consumer implementing the Pull Option and the Questionnaire Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[clientSlice].mode = #client

* rest[clientSlice].resource[QuestionnaireSlice].type = #Questionnaire

* rest[clientSlice].resource[QuestionnaireSlice].interaction[0].code = #read
* rest[clientSlice].resource[QuestionnaireSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[QuestionnaireSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[QuestionnaireSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireSlice].interaction[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[QuestionnaireSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[0].type = #token
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[QuestionnaireSlice].searchParam[1].name = "_text"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[1].type = #string
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[1].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireSlice].searchParam[2].name = "_content"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[2].type = #string
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[2].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireSlice].searchParam[3].name = "definition-text"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[3].type = #string
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[3].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireSlice].searchParam[4].name = "code"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[4].type = #token
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[4].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireSlice].searchParam[5].name = "code:in"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[5].type = #token
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireSlice].searchParam[5].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[QuestionnaireSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[QuestionnaireSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[0].valueString = "_text"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[1].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[1].valueString = "_content"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[2].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[2].valueString = "definition-text"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[3].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[3].valueString = "code"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[4].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[1].extension[4].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireSlice].extension[2].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireSlice].extension[2].extension[0].valueString = "_content"
* rest[clientSlice].resource[QuestionnaireSlice].extension[2].extension[1].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[2].extension[1].valueString = "definition-text"
* rest[clientSlice].resource[QuestionnaireSlice].extension[2].extension[2].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[2].extension[2].valueString = "code"
* rest[clientSlice].resource[QuestionnaireSlice].extension[2].extension[3].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[2].extension[3].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireSlice].extension[3].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireSlice].extension[3].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireSlice].extension[3].extension[0].valueString = "definition-text"
* rest[clientSlice].resource[QuestionnaireSlice].extension[3].extension[1].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[3].extension[1].valueString = "code"
* rest[clientSlice].resource[QuestionnaireSlice].extension[3].extension[2].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[3].extension[2].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireSlice].extension[4].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireSlice].extension[4].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireSlice].extension[4].extension[0].valueString = "code"
* rest[clientSlice].resource[QuestionnaireSlice].extension[4].extension[1].url = "optional"
* rest[clientSlice].resource[QuestionnaireSlice].extension[4].extension[1].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireSlice].extension[5].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireSlice].extension[5].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireSlice].extension[5].extension[0].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireResponseSlice].type = #QuestionnaireResponse

* rest[clientSlice].resource[QuestionnaireResponseSlice].interaction[0].code = #read
* rest[clientSlice].resource[QuestionnaireResponseSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[QuestionnaireResponseSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[QuestionnaireResponseSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].interaction[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[0].type = #token
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[1].name = "_text"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[1].type = #string
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[1].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[2].name = "_content"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[2].type = #string
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[2].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[3].name = "definition-text"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[3].type = #string
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[3].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[4].name = "code"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[4].type = #token
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[4].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[5].name = "code:in"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[5].type = #token
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[5].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[6].name = "_lastUpdated"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[6].type = #date
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[6].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[7].name = "authored"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[7].type = #date
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[7].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[7].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[8].name = "questionnaire"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[8].type = #uri
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[8].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[8].extension.valueCode = #SHALL

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[9].name = "questionnaire.title"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[9].type = #string
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[9].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[9].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[10].name = "subject"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[10].type = #reference
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[10].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[10].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[11].name = "subject:identifier"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[11].type = #token
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[11].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[11].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[12].name = "subject:Location.near"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[12].type = #special
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[12].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[12].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[13].name = "author"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[13].type = #reference
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[13].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[13].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[14].name = "author:identifier"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[14].type = #token
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[14].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchParam[14].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[QuestionnaireResponseSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[0].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[0].extension[0].valueString = "_id"

* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[0].valueString = "_text"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[1].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[1].valueString = "_content"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[2].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[2].valueString = "definition-text"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[3].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[3].valueString = "code"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[4].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[1].extension[4].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[2].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[2].extension[0].valueString = "_content"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[2].extension[1].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[2].extension[1].valueString = "definition-text"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[2].extension[2].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[2].extension[2].valueString = "code"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[2].extension[3].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[2].extension[3].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[3].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[3].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[3].extension[0].valueString = "definition-text"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[3].extension[1].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[3].extension[1].valueString = "code"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[3].extension[2].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[3].extension[2].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[4].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[4].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[4].extension[0].valueString = "code"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[4].extension[1].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[4].extension[1].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[5].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[5].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[5].extension[0].valueString = "code:in"

* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[0].url = "required"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[0].valueString = "questionnaire"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[1].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[1].valueString = "_lastUpdated"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[2].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[2].valueString = "authored"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[3].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[3].valueString = "questionnaire.title"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[4].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[4].valueString = "subject"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[5].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[5].valueString = "subject:identifier"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[6].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[6].valueString = "subject:Location.near"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[7].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[7].valueString = "author"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[8].url = "optional"
* rest[clientSlice].resource[QuestionnaireResponseSlice].extension[6].extension[8].valueString = "author:identifier"
