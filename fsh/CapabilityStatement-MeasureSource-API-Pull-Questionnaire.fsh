
Instance: MeasureSource-API-Pull-Questionnaire
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: "Defines the additional requirements for the Measure Source implementing the API Option, the Pull Option, and the Questionnaire Option."
* insert SanerDefinitionContent
* name = "MeasureSource_API_Pull_Questionnaire"
* title = "Measure Source implementing the API Option, the Pull Option, and the Questionnaire Option."
* date = "2020-09-04T23:05:22.903075-04:00"
* kind = #requirements
* description = "Defines the additional requirements for the Measure Source implementing the API Option, the Pull Option, and the Questionnaire Option."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[serverSlice].mode = #server

* rest[serverSlice].resource[QuestionnaireSlice].type = #Questionnaire

* rest[serverSlice].resource[QuestionnaireSlice].interaction[0].code = #read
* rest[serverSlice].resource[QuestionnaireSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[QuestionnaireSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[0].type = #token
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireSlice].searchParam[1].name = "_text"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[1].type = #string
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[1].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireSlice].searchParam[2].name = "_content"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[2].type = #string
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[2].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireSlice].searchParam[3].name = "definition-text"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[3].type = #string
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[3].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireSlice].searchParam[4].name = "code"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[4].type = #token
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[4].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireSlice].searchParam[5].name = "code:in"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[5].type = #token
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireSlice].searchParam[5].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[QuestionnaireSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[QuestionnaireSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[0].valueString = "_text"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[1].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[1].valueString = "_content"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[2].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[2].valueString = "definition-text"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[3].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[3].valueString = "code"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[4].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[1].extension[4].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireSlice].extension[2].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireSlice].extension[2].extension[0].valueString = "_content"
* rest[serverSlice].resource[QuestionnaireSlice].extension[2].extension[1].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[2].extension[1].valueString = "definition-text"
* rest[serverSlice].resource[QuestionnaireSlice].extension[2].extension[2].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[2].extension[2].valueString = "code"
* rest[serverSlice].resource[QuestionnaireSlice].extension[2].extension[3].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[2].extension[3].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireSlice].extension[3].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireSlice].extension[3].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireSlice].extension[3].extension[0].valueString = "definition-text"
* rest[serverSlice].resource[QuestionnaireSlice].extension[3].extension[1].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[3].extension[1].valueString = "code"
* rest[serverSlice].resource[QuestionnaireSlice].extension[3].extension[2].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[3].extension[2].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireSlice].extension[4].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireSlice].extension[4].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireSlice].extension[4].extension[0].valueString = "code"
* rest[serverSlice].resource[QuestionnaireSlice].extension[4].extension[1].url = "optional"
* rest[serverSlice].resource[QuestionnaireSlice].extension[4].extension[1].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireSlice].extension[5].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireSlice].extension[5].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireSlice].extension[5].extension[0].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireResponseSlice].type = #QuestionnaireResponse

* rest[serverSlice].resource[QuestionnaireResponseSlice].interaction[0].code = #read
* rest[serverSlice].resource[QuestionnaireResponseSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[QuestionnaireResponseSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[0].type = #token
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[1].name = "_text"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[1].type = #string
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[1].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[2].name = "_content"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[2].type = #string
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[2].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[3].name = "definition-text"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[3].type = #string
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[3].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[4].name = "code"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[4].type = #token
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[4].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[5].name = "code:in"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[5].type = #token
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[5].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[6].name = "_lastUpdated"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[6].type = #date
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[6].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[7].name = "authored"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[7].type = #date
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[7].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[7].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[8].name = "questionnaire"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[8].type = #uri
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[8].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[8].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[9].name = "questionnaire.title"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[9].type = #string
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[9].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[9].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[10].name = "subject"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[10].type = #reference
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[10].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[10].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[11].name = "subject:identifier"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[11].type = #token
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[11].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[11].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[12].name = "subject:Location.near"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[12].type = #special
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[12].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[12].extension.valueCode = #SHOULD

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[13].name = "author"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[13].type = #reference
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[13].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[13].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[14].name = "author:identifier"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[14].type = #token
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[14].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchParam[14].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[QuestionnaireResponseSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[0].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[0].extension[0].valueString = "_id"

* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[0].valueString = "_text"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[1].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[1].valueString = "_content"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[2].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[2].valueString = "definition-text"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[3].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[3].valueString = "code"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[4].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[1].extension[4].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[2].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[2].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[2].extension[0].valueString = "_content"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[2].extension[1].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[2].extension[1].valueString = "definition-text"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[2].extension[2].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[2].extension[2].valueString = "code"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[2].extension[3].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[2].extension[3].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[3].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[3].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[3].extension[0].valueString = "definition-text"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[3].extension[1].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[3].extension[1].valueString = "code"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[3].extension[2].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[3].extension[2].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[4].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[4].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[4].extension[0].valueString = "code"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[4].extension[1].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[4].extension[1].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[5].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[5].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[5].extension[0].valueString = "code:in"

* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[0].url = "required"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[0].valueString = "questionnaire"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[1].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[1].valueString = "_lastUpdated"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[2].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[2].valueString = "authored"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[3].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[3].valueString = "questionnaire.title"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[4].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[4].valueString = "subject"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[5].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[5].valueString = "subject:identifier"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[6].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[6].valueString = "subject:Location.near"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[7].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[7].valueString = "author"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[8].url = "optional"
* rest[serverSlice].resource[QuestionnaireResponseSlice].extension[6].extension[8].valueString = "author:identifier"
