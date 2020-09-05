Several studies have shown that automation and standardization for electronic reporting improves
data quality, timeliness, and the quantity of available data in public health reporting [^1][^2].
Developers of a system focusing on reporting for pandemic management in British Columbia note the challenges
of one-off reporting solutions, including operational disruptions to address changing needs[^3].

Among institutions, barriers to reporting include having available systems to report to,
and challenges in interfacing to facility Health IT infrastructure and extracting data from EHR systems[^4].

Thus, measures **should** be automatable where feasible, and integratee with existing Health IT system capabilities.
Automation of measurement is possible when:
1. There is a common information model:
   1. A commonly understood information model and terminology that enables data collection requirements to be
      specified consistently across disparate systems, or <br/>
   2. A general information model which can be eaily adapted via local translations.<br/>
2. There are common workflows that will not significantly impact the interpretation of data.  For example, the workflow
for reporting that a patient is on a ventilator could rely on orders for ventilation, or on flowsheet observations
related to ventilator reported measurements.

3. There are mechanisms to query for information from systems.

### Common Information Model
This IG requires adoption of a national model or implementation guide to ensure that there is a common model for a region.
An incomplete list of national models is provided below:

* [Australian Base](http://hl7.org.au/fhir/aubase1.1/profiles.html)
* [Belgium Core](https://ehealthplatformstandards.github.io/artifacts.html#core-profiles)
* [Canadian Core](https://build.fhir.org/ig/scratch-fhir-profiles/CA-Core/artifacts.html)
* [Denmark Core](http://build.fhir.org/ig/hl7dk/dk-core-r4/artifacts.html)
* [India National Digital Health Mission](https://simplifier.net/NDHM/~resources?fhirVersion=R4&sortBy=DisplayName)
* [Swiss Core](http://build.fhir.org/ig/hl7ch/ch-core/artifacts.html)
* [UK Core](https://simplifier.net/guide/UKCoreDevelopment/Profiles)
* [US Core](https://www.hl7.org/fhir/us/core/#us-core-profiles)

Use of these models ensures consistent use of terminology and approach for recording data within a country that
enables broad use of the same Measure across the states, provinces, territories, or other regional divisions.

#### Localizing Value Sets for Implementation
The mechanisms chosen for automation in this guide use value sets for critical vocabulary used to identify relevant
resources for computing measures.  This use of value sets enables an implementation to replace a value set defined
based on the national implementation model for a region with translations to local codes to simplify localization.

The value sets used to automate the computation of a measure must be available to systems that are computing the measure.
These **shall** be recorded in [Library.relatedArtifact](https://www.hl7.org/fhir/library-definitions.html#Library.relatedArtifact)
in at least one of the [library](https://www.hl7.org/fhir/measure-definitions.html#Measure.library)
components referenced by the Measure.

### Data Access for Computation
Data access is encouraged through one of three mechanisms, all of which rely eventually on FHIR core search capabilities.  These mechanisms
are described in order from lowest to highest implementation complexity.
1. [FHIR Search](http://hl7.org/fhir/R4/search.html) is the basic capability supporing automation. Applications can support counting by using
FHIR queries to select appropriate data elements for evaluation, and then compute measures based on the responses.  This is the most limited
and "chatty" of mechanisms supporting integration, as many servers to not provide search capabilities supporting query across resource
boundaries using different kinds of joins (e.g., chaining and _has search capabilities). Combining FHIR queries with other FHIR capabilities
such as [Bulk Data Access](https://hl7.org/fhir/uv/bulkdata/) or [R5 Subscriptions](https://build.fhir.org/subscription.html) can make this
a more efficient process, but integrating with these specifications is beyond the scope of this implementation guide.

2. [FHIRPath](http://hl7.org/fhirpath) is a standalone specification that works with hierarchical models in structured representations (e.g.,
JSON) originally designed for use with FHIR.  It is similar in form and capability to [XPath](https://www.w3.org/TR/xpath-31/), but has application
to more general models than those represented by an XML document. When [FHIRPath is used within a FHIR Server](https://www.hl7.org/fhir/fhirpath.html)
context, the language includes capabilities which support automation of queries, and resolution of resources matching the specified path.

3. [Clinical Quality Language] (https://cql.hl7.org/) is an language designed to automate the computation of measures from FHIR and other data models. It enables
localization of models to support variations in organizational workflows and data models.  Several open source implementations of CQL interpreters
are available, but this technology has not yet reached the maturity of other sorts of systems, and it is not always widely available for users
of systems supporting FHIR.

#### Measure Definition Criteria
A Measure is defined by the computable criteria contained in definitions for the Measure [population](https://www.hl7.org/fhir/measure-definitions.html#Measure.group.population.criteria),
[stratifier](https://www.hl7.org/fhir/measure-definitions.html#Measure.group.stratifier.criteria) and other criteria components within the measure.
These criteria elements are defined using the [Expression](https://www.hl7.org/fhir/metadatatypes.html#Expression) datatype.  This datatype
requires the language used for the criteria to be defined using one of the following values (cooresponding to mechanisms listed in the
list above):
1. application/x-fhir-query<br/>
   Expressions defined using FHIR Search are defined by the URLs allowed by FHIR [Search](https://www.hl7.org/fhir/search.html). The URLs provided
   in the [Expression.expression](https://www.hl7.org/fhir/metadatatypes-definitions.html#Expression.expression) field **shall** be provided as
   relative to the _base_ address of the server that would be queried, and **shall** be expressed in URL syntax according to
   [RFC 3986](https://tools.ietf.org/html/rfc3986) with appropriate %-encoding of the URL components.<br/>
   Conforming systems may, at their own discretion apply [Postel's law](https://en.wikipedia.org/wiki/Robustness_principle) in regard
   to the formatting of URLs. Such expressions **should** use search capabilities defined by national models. Extended search parameters
   are permitted, but these must be defined in a [SearchParameter](https://www.hl7.org/fhir/SearchParameter) available in one of the
   [libraries](https://www.hl7.org/fhir/measure-definitions.html#Measure.library) referenced by the measure.

2. text/fhirpath<br/>
   Expressions defined in FHIRPath **shall** conform to [FHIRPath](http://hl7.org/fhirpath) and are permitted to use the
   [FHIRPath functions and syntax elements](https://www.hl7.org/fhir/fhirpath.html) defined specifically for FHIR.

3. text/cql<br/>
   Expressions defines in CQL **shall** conform to the [Clinical Quality Language](https://cql.hl7.org/), and are permitteed to
   use CQL modules referenced by one of the [libraries](https://www.hl7.org/fhir/measure-definitions.html#Measure.library)
   referenced by the measure.

### Other Measure Definition Content
A computable public health measure may reference [ValueSet](https://www.hl7.org/fhir/ValueSet), [ConceptMap](https://www.hl7.org/fhir/), [CQL definitions](https://cql.hl7.org/), [SearchParameter](https://www.hl7.org/fhir/SearchParameter) and
other FHIR conformance resources to support automation. The [PublicHealthMeasureLibrary](StructureDefinition-PublicHealthMeasureLibrary.html) defines
the constraints relevant to referencing the FHIR resources needed to automate measure computation.

**Footnotes**

[^1]: Effler P, Ching-Lee M, Bogard A, Ieong MC, Nekomoto T, Jernigan D. Statewide system of electronic notifiable disease reporting from clinical laboratories: comparing automated reporting with conventional methods. JAMA. 1999 Nov 17;282(19):1845-50. doi: 10.1001/jama.282.19.1845. Erratum in: JAMA 2000 Jun 14;283(22):2937. PMID: 10573276. Available on the web at https://pubmed.ncbi.nlm.nih.gov/10573276/

[^2]: Overhage JM, Grannis S, McDonald CJ. A comparison of the completeness and timeliness of automated electronic laboratory reporting and spontaneous reporting of notifiable conditions. Am J Public Health. 2008 Feb;98(2):344-50. doi: 10.2105/AJPH.2006.092700. Epub 2008 Jan 2. PMID: 18172157; PMCID: PMC2376898. Available on the web at https://pubmed.ncbi.nlm.nih.gov/18172157/

[^3]: Rizi SA, Roudsari A. Development of a public health reporting data warehouse: lessons learned. Stud Health Technol Inform. 2013;192:861-5. PMID: 23920680. Available on the web at http://ebooks.iospress.nl/volumearticle/34122

[^4]: Holmgren AJ, Apathy NC, Adler-Milstein J. Barriers to Hospital Electronic Public Health Reporting and Implications for the COVID-19 Pandemic. J Am Med Inform Assoc. 2020 May 22:ocaa112. doi: 10.1093/jamia/ocaa112. Epub ahead of print. PMID: 32442266. Available on the web at https://pubmed.ncbi.nlm.nih.gov/32442266/

