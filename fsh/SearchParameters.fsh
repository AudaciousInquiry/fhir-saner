Instance: SearchParameter-definition-text
InstanceOf: SearchParameter
Title: "Search by Text in Definitions"
 * insert SanerDefinitionContent
 * url = "http://hl7.org/fhir/us/saner/SearchParameter/SearchParameter-definition-text"
 * description = "This SearchParameter enables definition resources used in The SANER Project to be discovered from text used in the resource definition."
 * name = "definition-text"
 * code = #definition-text
 * base[0] = #Measure
 * base[1] = #Questionnaire
 * base[2] = #ValueSet
 * base[3] = #CodeSystem
 * base[4] = #ConceptMap
 * base[5] = #SearchParameter
 * base[6] = #OperationDefinition
 * base[7] = #StructureDefinition
 * base[8] = #CapabilityStatement
 * type = #string
 * expression = """
 Measure.title | Measure.subtitle | Measure.publisher | Measure.description | Measure.purpose | Measure.usage |
 Measure.riskAdjustment | Measure.rateAggregation | Measure.clinicalRecommendationStatement | Measure.definition | Measure.guideance |
 Questionnaire.title | Questionnaire.publisher | Questionnaire.description | Questionnaire.purpose |
 ValueSet.title | ValueSet.publisher | ValueSet.description | ValueSet.purpose |
 CodeSystem.title | CodeSystem.publisher | CodeSystem.description | CodeSystem.purpose |
 ConceptMap.title | ConceptMap.publisher | ConceptMap.description | ConceptMap.purpose |
 SearchParameter.title | SearchParameter.publisher | SearchParameter.description | SearchParameter.purpose |
 OperationDefinition.title | OperationDefinition.publisher | OperationDefinition.description | OperationDefinition.purpose |
 StructureDefinition.title | StructureDefinition.publisher | StructureDefinition.description | StructureDefinition.purpose |
 CapabilityStatement.title | CapabilityStatement.publisher | CapabilityStatement.description | CapabilityStatement.purpose
 """
* xpath = """
 f:Measure/f:title | f:Measure/f:subtitle | f:Measure/f:publisher | f:Measure/f:description | f:Measure/f:purpose | f:Measure/f:usage |
 f:Measure/f:riskAdjustment | f:Measure/f:rateAggregation | f:Measure/f:clinicalRecommendationStatement | f:Measure/f:definition | f:Measure/f:guideance |
 f:Questionnaire/f:title | f:Questionnaire/f:publisher | f:Questionnaire/f:description | f:Questionnaire/f:purpose |
 f:ValueSet/f:title | f:ValueSet/f:publisher | f:ValueSet/f:description | f:ValueSet/f:purpose |
 f:CodeSystem/f:title | f:CodeSystem/f:publisher | f:CodeSystem/f:description | f:CodeSystem/f:purpose |
 f:ConceptMap/f:title | f:ConceptMap/f:publisher | f:ConceptMap/f:description | f:ConceptMap/f:purpose |
 f:SearchParameter/f:title | f:SearchParameter/f:publisher | f:SearchParameter/f:description | f:SearchParameter/f:purpose |
 f:OperationDefinition/f:title | f:OperationDefinition/f:publisher | f:OperationDefinition/f:description | f:OperationDefinition/f:purpose |
 f:StructureDefinition/f:title | f:StructureDefinition/f:publisher | f:StructureDefinition/f:description | f:StructureDefinition/f:purpose |
 f:CapabilityStatement/f:title | f:CapabilityStatement/f:publisher | f:CapabilityStatement/f:description | f:CapabilityStatement/f:purpose
 """
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true
* modifier[0] = #missing
* modifier[1] = #exact
* modifier[2] = #contains

Instance: SearchParameter-code
InstanceOf: SearchParameter
Title: "Search by Code in Definitions and Instances"
 * insert SanerDefinitionContent
 * url = "http://hl7.org/fhir/us/saner/SearchParameter/SearchParameter-code"
 * description = "This SearchParameter enables resources used in The SANER Project to be discovered by codes or valueSets used in the resource including those in any extensions."
 * name = "code"
 * purpose = """
 """
 * code = #code
 * base[0] = #Measure
 * base[1] = #MeasureReport
 * base[2] = #Questionnaire
 * base[3] = #QuestionnaireResponse
 * type = #token
 * expression = """
 descendants().valueCodeableConcept | descendants().valueCoding | descendants().valueCode | code | descendants().ofType(Coding).not().code
"""

 * xpath = """
 descendant::f:valueCodeableConcept | descendant::f:valueCoding | descendant::f:valueCode | f:code | f:descendant::f:code[ends-with(local-name(..),'oding')]
"""
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true
* modifier[0] = #missing
* modifier[1] = #text
* modifier[2] = #not
* modifier[3] = #in
* modifier[4] = #not-in
* modifier[5] = #below
* modifier[6] = #above
* modifier[7] = #ofType

Instance: SearchParameter-disposition
InstanceOf: SearchParameter
Title: "Search by hospitalization.dispositionCode in Encounters"
 * insert SanerDefinitionContent
 * url = "http://hl7.org/fhir/us/saner/SearchParameter/SearchParameter-disposition"
 * description = "This SearchParameter enables query of encounters by disposition to support automation of measure computation."
 * name = "disposition"
 * purpose = """
 """
 * code = #disposition
 * base[0] = #Encounter
 * type = #token
 * expression = "hospitalization.dispositionCode"

 * xpath = "f:hospitalization/f:dispositionCode"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true
