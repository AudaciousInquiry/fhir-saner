Profile:        CapabilityStatementWithSlices
Parent:         CapabilityStatement
Title:          "Capability Statements with Slices"
Description:    "A Capability Statement with slicing defined"
* insert SanerStructureDefinitionContent

* rest ^slicing.discriminator.type = #value
* rest ^slicing.discriminator.path = "mode"
* rest ^slicing.rules = #open
* rest ^slicing.description = "Slice based on the rest.mode pattern"
* rest contains clientSlice 0..1 and serverSlice 0..1
* rest[clientSlice].mode = #client (exactly)
* rest[serverSlice].mode = #server (exactly)


* rest.resource ^slicing.discriminator.type = #value
* rest.resource ^slicing.discriminator.path = "type"
* rest.resource ^slicing.rules = #open
* rest.resource ^slicing.description = "Slice based on the rest.resource.type pattern"
* rest.resource contains
    LocationSlice 0..1 and
    OrganizationSlice 0..1 and
    MeasureSlice 0..1 and
    MeasureReportSlice 0..1 and
    QuestionnaireSlice 0..1 and
    QuestionnaireResponseSlice 0..1 and
    LibrarySlice 0..* and
    ConceptMapSlice 0..* and
    ValueSetSlice 0..* and
    CodeSystemSlice 0..* and
    ParametersSlice 0..*

* rest.resource[LocationSlice].type = #Location (exactly)
* rest.resource[OrganizationSlice].type = #Organization (exactly)
* rest.resource[MeasureSlice].type = #Measure (exactly)
* rest.resource[MeasureReportSlice].type = #MeasureReport (exactly)
* rest.resource[QuestionnaireSlice].type = #Questionnaire (exactly)
* rest.resource[QuestionnaireResponseSlice].type = #QuestionnaireResponse (exactly)
* rest.resource[LibrarySlice].type = #Library (exactly)

