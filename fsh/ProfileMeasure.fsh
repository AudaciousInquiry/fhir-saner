Extension: DefinitionExpection
Id: definition-expectation
Description: "Enables definitions to identify components that are required, recommended or optional"
* insert SanerStructureDefinitionContent
* ^context[0].type = #element
* ^context[0].expression = "Measure.group"
* ^context[0].type = #element
* ^context[0].expression = "Measure.group.population"
* ^context[0].type = #element
* ^context[0].expression = "Measure.group.stratifier"
* ^context[0].type = #element

* value[x] only code
* valueCode 1..1
* valueCode from http://hl7.org/fhir/ValueSet/conformance-expectation
* valueCode ^short = "SHALL | SHOULD | MAY | SHOULD-NOT"
* valueCode ^comment = "Defines the level of expectation associated with a resource using this definition."


Extension: MeasureGroupAttributes
Title: "Attributes describing a group of measures"
Description: "Attributes describing the group of measures"
* insert SanerStructureDefinitionContent
* extension contains
    scoring 0..1 and
    compositeScoring 0..1 and
    type 0..1 and
    riskAdjustment 0..1 and
    rateAggregation 0..1 and
    improvementNotation 0..1 and
    subject 1..1
* extension[scoring] ^short = "Like Measure.scoring, but applies to group"
* extension[scoring].value[x] only CodeableConcept
* extension[scoring].valueCodeableConcept from http://hl7.org/fhir/ValueSet/measure-scoring (extensible)

* extension[compositeScoring] ^short = "Like Measure.compositeScoring, but applies to group"
* extension[compositeScoring].value[x] only CodeableConcept
* extension[compositeScoring].valueCodeableConcept from http://hl7.org/fhir/ValueSet/composite-measure-scoring (extensible)

* extension[type] ^short = "Like Measure.type, but applies to group"
* extension[type].value[x] only CodeableConcept
* extension[type].valueCodeableConcept from http://hl7.org/fhir/ValueSet/measure-type

* extension[riskAdjustment] ^short = "Like Measure.riskAdjustment, but applies to group"
* extension[riskAdjustment].value[x] only string

* extension[rateAggregation] ^short = "Like Measure.rateAggregation, but applies to group"
* extension[rateAggregation].value[x] only string

* extension[improvementNotation] ^short = "Like Measure.improvementNotation, but applies to group"
* extension[improvementNotation].value[x] only CodeableConcept
* extension[improvementNotation].valueCodeableConcept from http://hl7.org/fhir/ValueSet/measure-improvement-notation (extensible)

* extension[subject] ^short = "Like Measure.subject, but applies to group"
* extension[subject].value[x] only MeasuredItemDescription
* extension[subject].valueCodeableConcept from http://hl7.org/fhir/ValueSet/resource-types (extensible)

Profile: MeasureCriteria
Parent: Expression
Description: "Constraints on documentation for the evaluation of a Measure"
* insert SanerStructureDefinitionContent

* name 1..1
* name ^short = "name should align with code."

* description 1..1
* description ^short = "Describe what the criterion does to a human (non-engineer)"

* language 1..1
* language ^short = "Provide the language for the criterion"

* expression 1..1
* expression ^short = "A measure must describe how to automate the computation in an expression that can be evaluated in the specified language"


Extension: MeasurePopulationAlternateCriteria
Title: "Alternate criteria for performing a measure"
Description: "Provides Alternate criteria for performing a measure, (e.g., CQL, Drools, et cetera)"
* insert SanerStructureDefinitionContent
* value[x] only Expression
* valueExpression only MeasureCriteria
* valueExpression 1..1
* valueExpression ^short = "Instructions for how to automatically count this population"

Profile:        MeasuredItemDescription
Parent:         CodeableConcept
Title:          "Saner Measured Item Description"
Description:    "A CodeableConcept describing the item to be counted in terms of the type of FHIR Resource to count, and subtype of item identified by that resource"
* insert SanerStructureDefinitionContent

* coding ^slicing.discriminator.type = #pattern
* coding ^slicing.discriminator.path = "system"
* coding ^slicing.rules = #open
* coding ^slicing.description = "Slice based on the component.code pattern"

* coding 1..*
* coding contains ResourceType 1..1 and Snomed 1..1 and Other 0..*

* coding[ResourceType] from http://hl7.org/fhir/ValueSet/resource-types (required)
* coding[ResourceType] ^short = "Describe the FHIR resource type that should be counted for the measure"
* coding[Snomed].system = "http://snomed.info/sct"
* coding[Snomed].system ^short = "Further clarify the type of resource using SNOMED"
* text 1..1
* text ^short = "Supply human readable text describing what is enumerated/counted for the measure"

Profile:        PublicHealthMeasure
Parent:         Measure
Title:          "Saner Public Health Measure"
Description:    """Profile Saner Public Health Measure
The Public Health Measure Profile ensures that Measures are very well defined as an aid to automation
of measures.  These are developed by The Saner Project team to ensure that the measure is well understood
and computation of it can be automated from systems that have the measure data.
"""
* insert SanerStructureDefinitionContent

* name 1..1
* name ^short = "Each measure must have a name."
* name ^comment = "The name should be in PascalCase, and should represent the Author's title of the Measure.  Identify the Author to clarify"
* url 1..1
* url ^short = "Each measure must have a url."
* url ^comment = "The url for measures defined in The Situation Awareness for Novel Epidemic Response IG will follow IG URL naming conventions."
* status from MeasureStatus
* status ^short = "draft | active | retired"
* status ^comment = "draft - The Measure is still in development. active - The Measure is ready for piloting or normal use.  retired - Measure has been deprecated or replaced."
* experimental 1..1
* experimental ^short = "A measure must indicate its experimental status"
* experimental ^comment = "true - development, testing or pilots, false - production use"
* version ^short = "Measure resources are versioned like IG's 0.1.0 = first development version, 0.2.0 - first published for review version, 1.0.0 first official version ..."
* version 1..1
* publisher 1..1
* publisher ^short = "The name of the organization publishing this Measure resource"
* contact 1..*
* contact ^short = "The contact information for whom to contact about this Measure resource"
* contact ^comment = "At least one contact shall be an email"
* subject[x] only CodeableConcept
* subjectCodeableConcept = http://hl7.org/fhir/resource-types#Location
* useContext 1..*
* useContext ^short = "The ISO 3166 code for use context"
* author 1..1
* author ^short = "The original author of the measure content, may be same as publisher, when otherwise, must include a relatedArtifact for the original author's publication"
* author.name 1..1
* author.name ^short = "The author must be identified by name. Can be the name of an individual or an organization."
* author.telecom 1..*
* author.telecom ^short = "There must be contact information for the author."
* author.telecom ^comment = "At least on author contact should be an email address."
* relatedArtifact 1..*
* relatedArtifact ^short = "There must be at least one artifact describing the measure in human readable form.  This does not include software generated pages from the IG-Builder."
* extension contains ReportingPeriod named measureTiming 1..1
* group.extension contains MeasureGroupAttributes named groupAtts 0..1
* group.extension[groupAtts] ^short = "Describes the attributes of one or more sections of the measure (form) being reported"

* group.extension[MeasureGroupAttributes].extension[scoring].valueCodeableConcept 1..1
* group.extension[MeasureGroupAttributes].extension[scoring].valueCodeableConcept ^comment = """continuous-variable
: Use continuous-variable when reporting a group of counts of the same type of resource, with different constraints on when to count it.
Also use continuous variable to report measures with computations over measure-observation values (e.g., average length of stay).

proportion
: Use proportion to report percentages, or ratios from the (generally) same initial population.

ratio
: Use ratio to report ratios from different initial populations.

cohort:
: Use cohort to report counts of unrelated or orthogonal categories (e.g., masks, gowns, gloves) within a group, where proportions aren't of significance.
Also use cohort to count answers to categorical questions, where each question is one cohort, and is stratified by possible answers (e.g., Yes/No, 0 days/1-3 days/4-6 days/7-9 days/more than 9 days supply).
"""
* group.extension[MeasureGroupAttributes].extension[scoring].valueCodeableConcept ^short = "Measure must have a scoring"
* group.extension[MeasureGroupAttributes].extension[scoring].valueCodeableConcept from http://hl7.org/fhir/ValueSet/measure-scoring

* group.extension[MeasureGroupAttributes].extension[type].valueCodeableConcept 1..1
* group.extension[MeasureGroupAttributes].extension[type].valueCodeableConcept from http://hl7.org/fhir/ValueSet/measure-type
* group.extension[MeasureGroupAttributes].extension[type].valueCodeableConcept ^comment = """structure
: Use when the measure is about capacity of a facility or organization to provide services, e.g., quantities of resources, staff, expendibles, et cetera.

process
: Use when the measure is about the execution of a process, things that are done, in process, et cetera.

outcome
: Use when the measure describes the outcome or result.  If by the measure you know a patient is getting better or worse, it's an outcome measure.

patient-reported-outcome
: Use when the outcome is reported by a patient or their authorized representative (usually used with "satisfaction scores", but could be used with other outcomes).

composite
: Use when two or more of the above are appropriate. Consider subdividing the group further.
"""

* group.extension[MeasureGroupAttributes].extension[improvementNotation].valueCodeableConcept 0..1 MS
* group.extension[MeasureGroupAttributes].extension[improvementNotation].valueCodeableConcept from http://hl7.org/fhir/ValueSet/measure-improvement-notation
* group.extension[MeasureGroupAttributes].extension[improvementNotation].valueCodeableConcept ^comment = """increase
: Use when a higher score indicates more patients are having better outcomes, are being treated, or can be treated, et cetera.

decrease:
: Use when a higher score indicates more patients are having worse outcomes, are not be treated, or cannot be treated, et cetera.
"""

* group.extension[MeasureGroupAttributes].extension[subject].valueCodeableConcept ^comment = """Describe the subject being enumerated
that is associated with the measure.  The first code should identify the FHIR Resource type. The second should further describe
it using SNOMED CT. Subsequent codes may describe it using other coding systems."""

* group.extension[MeasureGroupAttributes].extension[rateAggregation].valueString from  MeasureRateAggregationValues
* group.extension[MeasureGroupAttributes].extension[rateAggregation].valueString ^short = "aggregable-by-period | point-in-time | cumulative"
* group.extension[MeasureGroupAttributes].extension[rateAggregation].valueString ^comment = """aggregable-by-period
: Use this when the value being reported can be aggregated (added to) values in other periods and retain meaning (e.g., adding admissions on day 1 and day 2 reporting period gives admissions for the combined reporting period)"

point-in-time
: Use this when the value being reported is a point-in-time (e.g. instantanious value) that cannot be meaningfully combined with a value from another reporting period

cumulative
: Use this when the value being reported is a point-in-time cumulative value over all reports"""

 * group.population.code from MeasurePopulations
 * group.population.code.coding 1..*
 * group.population.code.coding ^short = "The coding gives a 'name' for this population and must be supplied"
 * group.population.code.text ^short = "A human readable description of what this population is"
 * group.population.description 1..1
 * group.population.description ^short = "Human readable instructions for counting or measuring this population"

 * group.population.criteria 1..1
 * group.population.criteria ^short = "Instructions for how to automatically count this population"
 * group.population.criteria.name 1..1
 * group.population.criteria ^short = "name should align with code."

 * group.population.criteria.description 1..1
 * group.population.criteria.description ^short = "Describe what the criterion does to a human (non-engineer)"

 * group.population.criteria.language 1..1

 * group.population.criteria.language ^short = "Provide the language for the criterion"

 * group.population.criteria only MeasureCriteria
 * group.population.criteria.expression 1..1
 * group.population.criteria.language ^short = "Give the expression for execution"

 * group.population.extension contains MeasurePopulationAlternateCriteria named alternateCriteria 0..1
 * group.population.extension[MeasurePopulationAlternateCriteria] ^short = "Other expressions for computing the criterion"

 * group.stratifier 0..*
 * group.stratifier ^short = "A group may have none, some or many strata"
 * group.stratifier.code 1..1
 * group.stratifier.code.coding 1..*
 * group.stratifier.code.coding ^short = "Uniquely identifies the strata"
 * group.stratifier.code.coding.display 1..1
 * group.stratifier.code.coding.display ^short = "Provides a human readable name for the strata"
 * group.stratifier.description 1..1
 * group.stratifier.description ^short = "Describes the overall function of the strata."

 * group.stratifier.code.text ^short = "Describes the function of the stratifier."
 * group.stratifier.code ^short = "Describes the purpose of this stratifier"
 * group.stratifier.component 1..*
 * group.stratifier.component ^short = "A stratifier must have at least one stratum"
 * group.stratifier.component.description 1..1
 * group.stratifier.component.description ^short = "Describes the purpose of this stratum"


Profile:        PublicHealthMeasureStratifier
Parent:         Measure
Title:          "Saner Public Health Measure Stratifier"
Description:    """Profile Saner Public Health Measure Stratifier

A stratifier is effecitively a mixin that can be used with an existing measure
to add stratification detail to that measure.
"""
 * insert SanerStructureDefinitionContent
 * group.stratifier 0..*
 * group.stratifier ^short = "A group may have none, some or many strata"
 * group.stratifier.code 1..1
 * group.stratifier.code.coding 1..*
 * group.stratifier.code.coding ^short = "Uniquely identifies the strata"
 * group.stratifier.code.coding.display 1..1
 * group.stratifier.code.coding.display ^short = "Provides a human readable name for the strata"
 * group.stratifier.description 1..1
 * group.stratifier.description ^short = "Describes the overall function of the strata."

 * group.stratifier.code.text ^short = "Describes the function of the stratifier."
 * group.stratifier.code ^short = "Describes the purpose of this stratifier"
 * group.stratifier.component 1..*
 * group.stratifier.component ^short = "A stratifier must have at least one stratum"
 * group.stratifier.component.description 1..1
 * group.stratifier.component.description ^short = "Describes the purpose of this stratum"
