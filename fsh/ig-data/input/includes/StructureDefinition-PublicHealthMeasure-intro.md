This Implementation Guide defines a profile for Measure to be used for Public Health reporting for Situational Awareness, rather than Quality Reporting.
The measures using this profile are intended to support reporting about the health system capacity to provide adequate care for patients during a health system
emergency, whether it is regional, national or global.  In this, the purpose and function of situational awareness measures have a different focus and intent
than those used for quality reporting.

### Describing and Identifying a Measure
Each measure has a Title, the name by which it is commonly known by people, and by which it can be readily found in an information system.
Titles **should** not be overly long (to enable recall by people), but **should** be descriptive enough to distinguish different measures published
by the same organization.  A subtitle may be present to provide additional descriptive detail.

1. `Measure.title` **should** be less than 64 characters in length.
2. `Measure.subtitle` **may** be present.

#### Software Component Name
Computer friendly names enable developers to create software tools that facilitate measure implementation and automation.  This profile
recommends transforming the title into a name by removing spaces and special characters (any character other than A-Z, a-z and 0-9),
using PascalCase to seperate boundaries between words. This allows the name to be used in most computing languages and as
the `id` for the resource in systems where user defined identifiers are supported for id values.

1. `Measure.name` **shall** be present.
2. `Measure.name` **should** match the pattern `[A-Z][A-Za-z0-9]+`.
3. `Measure.id` **should** be equal to `Measure.name`.

#### Canonical URL
The canonical URL is a unique identifier which represents the Measure within MeasureReport resources defined by that Measure. Tooling for FHIR
(e.g., the FHIR IG Publisher, SUSHI, Simplifier) follows a protocol for automatically constructing these URLs. This guide makes several
recommendations for URLs used by a publisher.  The example below is used to illustrate the recommendations

     https:\//example.com/saner/covid19/Measure/MyMeasureName

1. All Measure URLs for measures published by the same organization **should** have the same base URL. The Base URL part **should** be memorable.
   In the example above, `https:\//example.com/saner` is the base URL.
2. The base URL **should** be less than 40 characters in length.
3. The penultimate path part of the URL may be used to categorize measures in some way, e.g., by topic (e.g., COVID-19, Hurricane) or type of
   facility (e.g., Hospital, Ambulatory, LTC) to which they apply. In the example above, `covid19` is the category.
4. The last path part in the URL **should** be Measure. Following this recomendation simplifies the use of FHIR IG Development tools to
   generate Measure resources, as this will be done automatically for measures.  In the example above, the last path part is `Measure`.
5. The computable name given in the Measure **should** be the last part of the URL. Again, this simplifies measure development using existing
   FHIR IG Development tools. In the example above, `MyMeasureName` is the name of the measure.
6. The URL **should** resolve to an HTML page that describes the measure, or provides access to it as a FHIR Resource and ideally, would
   return HTML, XML or JSON representations based on the requested mime type.

#### Versioning
Measures can change over time. This guide requires that the Measure version information recorded be performed as follows:

1. A measure **shall** do one of the following:
   * be recorded in the form defined by [Semantic Versioning](https://semver.org/), e.g.: version 1.2.3 is the third patch to the second minor
     update of the first major release, or
   * be recorded by date using ISO 8601 format with hyphens and no time component, e.g.: 2020-07-25 for the measure released on July 25, 2020.
2. If versions can be updated more frequently than by day, a publisher **shall** use semantic versioning.

The use of semantic versioning is preferred because this is the form required in FHIR implementation guides, and it enables support for versioning
of measures using FHIR Implementation Guide tools. This is also the format for versioning that has been the most widely adopted by the IT industry.

##### Meanings of Major, Minor and Patch with respect to Measures

Major
: A major update adds one or more required elements to the Measure that must be present in a MeasureReport to be considered valid
  by the recieving system. The definition of valid is defined by the measure developer, and need not be the same as that performed
  by FHIR validation tools. The FHIR Validator will fail a MeasureReport that does not include all the groups, populations and strata
  defined in the Measure, even though these components might otherwise be considered optional by the measure developer.

Minor
: A minor update adds one or more recommended or optional elements to the Measure.

Patch
: A patch can clarify or correct information that does not impact the interpretation of the measure.

#### Status of a Measure
This profile requires that the publication status of a measure be reported (this is a general requirement of all Measure resources), and
furthermore, that it's experimental status **shall** also be reported.

The usage of status values is described below:
draft
: The measure is presently under development. Measures presently under development **shall** also be recorded as being experimental.

active
: The measure is ready for, or being used, either in pilots or production. The experimental status for the measure **shall** be used to distinguish between
measures that are being piloted (`experimental=true`) or in production (`experimental=false`).

retired
: The measure **should** no longer be used in production. Measures which are retired before ever becoming active in production **shall** have experimental=true,
while those which have been available for production use **shall** have `experimental=false`.

Measures which have been used in the past **should** remain available for access for use when data has been used in production to enable systems to
interpret historical data recorded using the measure.

### The Subject of Measurement
In quality measurement, the subject of a measure in FHIR describes to whom or what the measure applies.  For situational awareness, this guide restricts the
subject of measurement to locations, representing a specific facility, site within a facility, or a broader geographic region (which can be defined as
a collection of facilities within that geographic region). These measures can also be used by an organization to manage sites and facilities based on
other organizing criteria, but are generally intended to support geographic rather than organizational boundaries.

1. `Measure.subjectCodeableConcept` **shall** have the value `http://hl7.org/fhir/resource-types#Location`

### Classifying Measures
Measures can be classified in different ways, e.g., by clinical venue, program, type of healthcare provider, et cetera.

In the following: **shall** indicates a [required](http://hl7.org/fhir/codesystem-binding-strength.html#binding-strength-required) binding for
the vocabulary, and **should** indicates a [preferred](http://hl7.org/fhir/codesystem-binding-strength.html#binding-strength-preferred) binding.

#### Measures Focused on a Particular Disease
1. Measures focusing on a particular disease **shall** record that focus in Measure.useContext, where:<br/>
`Measure.useContext.code = [http://terminology.hl7.org/CodeSystem/usage-context-type#focus](https://www.hl7.org/fhir/codesystem-usage-context-type.html#usage-context-type-focus)`<br/>
and<br/>
2. `Measure.useContext.valueCodableConcept` is an appropriate code from a vocabulary identifying the disease of interest.
It **should** come from SNOMED CT codes descending from
[64572001 Disease (disorder)](https://browser.ihtsdotools.org/?perspective=full&conceptId1=64572001).

#### Measures Focused on a Particular Kind of Event
1. Measures focusing on a particular kind of event (e.g., Pandemic, Hurricane, Fire, Flood) **shall** record their focus in Measure.useContext, where:<br/>
`Measure.useContext.code = `[http://snomed.info/sct#272379006 Event](https://browser.ihtsdotools.org/?perspective=full&conceptId1=272379006)<br/>
and<br/>
2. `Measure.useContext.valueCodableConcept` **should** come from SNOMED CT Codes descending from 276746005 Environmental Event
to classify the type of event. See [Event Context](ValueSet-EventContext.html) for the Value Set for this classification.

#### Measures Focused on a Particular Specialty
1. Measures focusing on a particular specialty **shall** record the specialty in Measure.useContext, where:<br/>
`Measure.useContext.code = `[http://terminology.hl7.org/CodeSystem/usage-context-type#user](https://www.hl7.org/fhir/codesystem-usage-context-type.html#usage-context-type-user)<br/>
and<br/>
2. `Measure.useContext.valueCodableConcept` **shall** be an appropriate code from a vocabulary identifying the provider specialty.
3. The value **should** come from SNOMED CT terms descending from [394658006 Clinical Specialty](https://browser.ihtsdotools.org/?perspective=full&conceptId1=394658006).

#### Measures Focused on a Clinical <span id="venue">Venue</span> (e.g., hospital, long-term care, ambulatory care)
1. Measures focused on a particular clinical venue **shall** record the type of venue in Measure.useContext, where<br/>
`Measure.useContext.code = [http://terminology.hl7.org/CodeSystem/usage-context-type#venue](https://www.hl7.org/fhir/codesystem-usage-context-type.html#usage-context-type-venue)`<br/>
and<br/>
2. `Measure.useContext.valueCodableConcept` **shall** be an appropriate code from a vocabulary identifying the venue (e.g., hospitals, pharmacies, long term care facilities).
3. These codes **should** come from:
   * http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType OR
   * Terms descending from SNOMED CT [43741000 Environment](https://browser.ihtsdotools.org/?perspective=full&conceptId1=276339004)

#### Measures from a Given Program
1. Measures developed to support a given program (e.g., the CDC National Healthcare Safety Network) **shall** identify the program in Measure.useContext, where<br/>
`Measure.useContext.code = [http://terminology.hl7.org/CodeSystem/usage-context-type#program](https://www.hl7.org/fhir/codesystem-usage-context-type.html#usage-context-type-program)`<br/>
and<br/>
2. `Measure.useContext.valueCodableConcept.text` is a string identifying the program of work (e.g., the CDC National Healthcare Safety Network).

### Measure Publication
A measure is published by some appropriate authority, for example a governmental agency focused on public health or emergency response,
or an organization working with such a governmental agency. Measures for situational awareness are not expected to endure a ballot process,
but will instead be created by authorities using a well established governance process. The reason for this is that as the emergent situation
progresses, new measures will be needed as the situation changes, or existing measures may need to be updated to address issues found during use.

Measures are published by organizations rather than individuals.  This profile requires that the organization be identified in `Measure.publisher`,
and furthermore, that there is at least one organizational e-mail address which can be used to contact that publisher about the Measure in `Measure.contact`

### <span id='national-cores'>Use of Appropriate National Models</span>
Many countries have developed national healthcare information models in various states of completion. This IG requires the use of national core standards
or guides to localize the PublicHealthMeasure to ensure a consistent data model for automation.

1. A conforming PublicHealthMeasure **shall** specify a jurisdiction to enable support for validation against national requirements.
2. A measure defined for international use **may** specify an international juristiction, or multiple jurisdictions where that is feasible.

Setting the Measure jurisdiction ensures that resources referenced by the Measure or MeasureReport conform to appropriate national standards.

### Measure Reporting Period
A measure **shall** suggest the approrpriate reporting frequency and period using the [ReportingPeriod](StructureDefinition-ReportingPeriod.html] extension.

### Stratifiers
Stratifiers partition a measure so that it counts subsets of the measure population
within the numerator or other measure population by some attribute that classifies the population.
Common stratifications often used in healthcare settings include age, sex at birth[^2] and race and ethnicity.
Constraints on the [Measure.group.stratifier](https://hl7.org/fhir/measure-definitions.html#Measure.group.stratifier)
component of a Measure and further describes the elements of that component to support strata.

[^2]: Also commonly referred to as gender, but is then confused with self-reported gender identity, so this guide uses the term sex at birth.

Each stratifier has the following features:

name
: The human readable name for the stratifier.
This can be found in `stratifier.code.coding.display`

code
: A code that uniquely identifies the stratifier (e.g., age, sex at birth, race, ethnicity).
This can be found in `stratifier.code.coding.code` and `stratifier.code.coding.system`
1. Codes used in this attribute **should** descend
from [SNOMED CT 363787002 Observable Entity](https://browser.ihtsdotools.org/?perspective=full&conceptId1=363787002)

description
: A description of the purpose of the stratifier, explaining what function it serves.
This can be found in `stratifier.code.text`

value set
: A list of values that describe the different categories into which counted elements are classified for stratification.
Individual values in this value set can be found in `stratifier.component.code` and an explaination of their function
appears in `stratifier.component.description`.
1. Codes used in this attribute **should** descend
from [SNOMED CT 404684003 Clinical Finding](https://browser.ihtsdotools.org/?perspective=full&conceptId1=404684003)

