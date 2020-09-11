There are four different ways to consolidate a collection of MeasureReport resources referencing a common Measure into an aggregated MeasureReport:
1. Over time, e.g., consolidating daily reports into a weekly report,
2. Over a larger geographic location, e.g., consolidating reports for all hospitals in a city or county, or
3. Consolidating data over both time and geography, e.g., consolidating all daily reports for all hospitals in a county for a week.
4. Consolidating data within a facility from multiple reporting agents.

All MeasureReport resources being consolidated must reference a common Measure in MeasureReport.measure.

The process to perform this aggregation is the same for all of the above cases, and is defined in more detail in the
[Aggregate operation](http://hl7.org/fhir/us/saner/OperationDefinition-MeasureReport-aggregate.html). That operation
can be used by an Intermediary to consolidate MeasureReport resources into an aggregated MeasureReport for further processing.

The MeasureReport resource can be used to report on situational awareness not just for individual facilities,
but also on broader definitions of a locations. Geographic regions such as cities, towns, counties, states,
provinces, territories, and other ad hoc geographic regions. They can also be used for reporting of non-geographically
identified groups (e.g., all facilities managed by the same organization).

Group reports by aggregatation region. This implementation guide does not specify how these groupings are created, but there are several mechanisms
that might be used in an implementation:

1. Aggregate within a Facility to support consolidated reporting from multiple agents (e.g., information systems) within a facility for external reporting.
2. Aggregate by geolocation - When an implementation provides geographic coordinates, aggregates can be defined by polygons defining the set of geographic regions.
3. Aggregate by address - Some geographies can be aggregated by postal address.  Postal addresses identify some geopolitical boundries, includeing
   * [Cities](http://www.hl7.org/fhir/datatypes-definitions.html#Address.city),
   * Counties or parishes (known as the [district](http://www.hl7.org/fhir/datatypes-definitions.html#Address.district) in the FHIR Address data type),
   * (States)[http://www.hl7.org/fhir/datatypes-definitions.html#Address.state],
   * (Country)[http://www.hl7.org/fhir/datatypes-definitions.html#Address.country], and
   * (Zip Code or Postal Code)[http://www.hl7.org/fhir/datatypes-definitions.html#Address.postalCode].
   * Provider or Hospital Service Areas or Referral Regions (see [Dartmouth Atlas](#dartmouth) below).
4. Aggregate by a (List)[http://hl7.org/fhir/list.html] - A list of Location resources can be created by enumerating every Location resource within the List resource.

While the most common use case is aggregation by geopolitical boundry (e.g., city, county, state), other useful geographic regions exist. Neighborhood or (in the
US, a Census Tract) can define regions that are smaller than a city or county. Smaller geographic regions can support additional analysis, e.g., in regard to
social determinants of health, or geographic regions addressing patterns of referral or service areas (e.g., hospital referral regions and service areas).

The [Aggregate](OperationDefinition-MeasureReport-aggregate.html) operation defines the algorithm for aggregating measure reports.

#### Aggregation of Population Counts
The aggregation of population.count requires special attention.

For a given facility and time period, a measures can be aggregated in different ways depending on
the [scoring of the measure](CodeSystem-PublicHealthMeasureScoring.html).
The scoring of measures implies the way that which rate aggregation can be performed:

* Capacity<br/>
  Measures **point in time** capacity or utilization
* Event Growth<br/>
  Measures **cumulative** growth by counting current and cumulative events over time
* Queue Length<br/>
  Measures the **point in time** number of activities awaiting completion
* Service Time<br/>
  Measures the **aggregate** total time to complete activities / total number of activities
* Availability
  Measures the **point in time** availability of resources

Measures aggregate values according to the [Measure Rate Aggregation Values](ValueSet-MeasureRateAggregationValues.html) value set,
which draws from Each the [Measure Rate Aggregation](CodeSystem-MeasureRateAggregation.html) coding system defined by this
implementation guide. Each of these must be aggregated differently.

* count<br/>
  A count of events that happened, or changes in status, or of things consumed over that period in time (e.g., admissions, deaths, tests performed).
  Quantity measurements, e.g., those counting events such as admissions, deaths, or test performed represent a count.  When aggregated for the same facility over
  multiple time periods, the population.count values can be summed to produce a count of events or things in the total time period.
* point-in-time<br/>
  A count of things at a point in time (e.g., active cases, beds currently occupied, ventilators in use).
  Point in time measurements (e.g., bed occupancy, ventilators in use) represent a current state. When aggregated for the same facility
  over multiple (continguous) time  periods, the most recent population.count is the "aggregated" value.
* cumulative<br/>
  A cumulative measure (e.g., tests performed).
  Cumulative measures are a combination of count and point-in-time measurements.  These represent a count of the current quantity (e.g., tests performed)
  over the total performed over "all time" (e.g., cumulative total tests performed).  When these are aggregated over multiple time periods,
  the aggregate of the cumulative total (the denominator) is the most recent value, but the aggregate of the current quantity (the numerator) is summed.

Across subjects (locations or facilities), counts are always summed. This assumes that subjects are non-overlapping (one is not trying to aggregate county data
with the data for an entire state that contains the county).

### Recommended Coding Systems and Value Sets for Location.identifer
This implementation guide requires the Location resource reference by MeasureReport.subject to have both a name and an identitifer. This raises the question of
the identifier and identifier system to use for these kinds of locations. While many locations have identifiers, some (generally larger geopolitical boundaries) are
also identified using codes from a [coding system](https://www.hl7.org/fhir/R4/codesystem.html), such as ISO 3166, or using GIS Information standards from INCITS.

When using a Coding system value in a FHIR Identifier, the value that would normally appear in Coding.code appears in Identifier.value.
The value that would normally appear in Coding.system appears in Identifier.system.

The sections below provides a partial list of identifier systems that can be used to identify locations, with a brief description of each one.  Measure
implementers will need to select the appropriate identifier systems.

#### [ISO 3166](https://www.iso.org/iso-3166-country-codes.html) The International Standard for country codes and codes for their subdivisions
The purpose of ISO 3166 is to define internationally recognized codes of letters and/or numbers that we can use when we refer to countries and their subdivisions.  Its use
is described in [Using ISO 3166 Country Codes with FHIR](https://hl7.org/fhir/iso3166.html) in the FHIR specification.

ISO 3166-1 provides codes for countries. When this code system is used for Location.identifier, the value of Location.identifier.system
must be set to urn:iso:std:iso:3166.

ISO 3166-2 provides codes for subdivisions of countries (i.e., states, provinces, territories or similar regions). When this code system is used for
Location.identifier, the value of Location.identifier.system must be set to urn:iso:std:iso:3166:-2.

##### ISO 3166-1 Value Sets
ISO 3166-1 provides three different codes for a country, a two letter code, a three letter code, and a numeric code. The two letter code for the US is 'US', the
three letter code is USA, and the numeric code is 840.  At most one of these codes **should** be used to identify locations at a country level.  The FHIR standard identifies
three different value sets for this use:

* http://hl7.org/fhir/ValueSet/iso3166-1-2 - ISO 3166 Part 1: 2 Letter Codes
* http://hl7.org/fhir/ValueSet/iso3166-1-3 - ISO 3166 Part 1: 3 Letter Codes
* http://hl7.org/fhir/ValueSet/iso3166-1-N - ISO 3166 Part 1: Numeric Codes

Most developers are familiar with the use of ISO 3166 as it is used in [RFC 5646 Tags for Identifying Languages](https://www.ietf.org/rfc/rfc5646.html) which prefers
use of the ISO 3166 Part 1: 2 letter codes.  Measures **should** use the two letter codes when using ISO-3166 Part 1.

#### [INCITS 31-2009[R2019]](https://standards.incits.org/apps/group_public/project/details.php?project_id=2398) Codes for the Identification of Counties and Equivalent Areas of the United States, Puerto Rico, and the Insular Areas
Establishes a structure for the assignment of identifying data codes to counties and county equivalents of the United States and its insular and associated areas,
for the purpose of information interchange among data processing systems.

#### [INCITS 38-2009[R2019]](https://standards.incits.org/apps/group_public/project/details.php?project_id=2399) Codes for the Identification of the States and Equivalent Areas within the United States, Puerto Rico, and the Insular Areas

This standard establishes a structure for the assignment of identifying codes to states and state equivalents of the United States and its insular areas.

#### [FIPS 5-2](https://web.archive.org/web/20090705054444/http://www.itl.nist.gov/fipspubs/fip5-2.htm) Codes for the Identification of the States, the District of Columbia and the Outlying Areas of the United States, and Associated Areas

This standard provides a set of two-digit numeric codes and a set of two-letter alphabetic codes for representing the 50 states, the District of Columbia
and the outlying areas of the United States, and associated areas. The standard covers all land areas under the sovereignty of the United States, the freely
associated states of Federated States of Micronesia and Marshall Islands, and the trust territory of Palau. This revision supersedes FIPS PUB 5-1 in its entirety.

Note: FIPS 5-2 was withdrawn as a US Information Processing standard in 2008 to be replaced by INCITS 31-2009, but was still used for the US 2010 census. Some Geographic
Information Systems used in the US still report the FIPS 5-2 code for a region.

#### [FIPS 6-4](https://web.archive.org/web/20090713035743/http://www.itl.nist.gov/fipspubs/fip6-4.htm) Counties and Equivalent Entities of the United States, Its Possessions, and Associated Areas.

This standard provides the names and codes that represent the counties and other entities treated as the equivalents of counties for legal and/or statistical
purposes in the 50 States, the District of Columbia, and the possessions (American Samoa, Guam, Northern Mariana Islands, Palau, Puerto Rico, and Virgin
Islands of the United States) and freely associated areas (Federated States of Micronesia and Marshall Islands) of the United States. Palau is the last
remaining component of the Trust Territory of the Pacific Islands (TTPI); for presentation purposes, Palau, rather than the TTPI, is treated as the
State-equivalent entity.

Note: FIPS 6-4 was withdrawn as a US Information Processing standard in 2008 to be replaced by INCITS 38-2009, but was still used for the US 2010 census. Some Geographic
Information Systems used in the US still report the FIPS 6-4 code for a region.

<span id='dartmouth'> </span>
#### [Dartmouth Atlas](https://atlasdata.dartmouth.edu/static/supp_research_data) Geographic Boundary Files
The Dartmouth Atlas defines three different kinds of Geographic regions in the US. These regions describe service areas and referral regions with common characteristics
based on geography and population, and are used for some forms of statistical health research. These identifiers are often found in data sets provided by geographic
information systems. Cross walks and geographic boundary files for each of theese areas can be found at the link above.

##### Hospital Service Area (HSA)
An HSA is a collection of ZIP codes whose residents receive most of their hospitalizations from the hospitals in that area.
The identifier system for HSA is http://terminology.hl7.org/codesystem/dartmouthatlas/HSA.

##### Hospital Referral Region (HRR)
HRRs were defined by assigning HSAs to the region where the greatest proportion of major cardiovascular procedures were performed,
with minor modifications to achieve geographic contiguity, a minimum population size of 120,000, and a high localization index.
The identifier system for HRR is http://terminology.hl7.org/codesystem/dartmouthatlas/HRR

##### Primary Care Service Area (PCSA)
A PCSA is the smallest geographic area (identified by ZIP code) that can be considered a discrete service area for primary care.
The identifier system for PCSA is http://terminology.hl7.org/codesystem/dartmouthatlas/PCSA

#### Postal Codes
National codes used with postal systems also define geographic areas. These code systems are generally managed by national postal services.
A list of known values to use for the postal code system is provided below:

* United States [http://terminology.hl7.org/CodeSystem/USZIPCODES](https://terminology.hl7.org/1.0.0/CodeSystem-USZIPCODES.html)
* Germany [https://demis.rki.de/fhir/CodeSystem/postalCode](https://simplifier.net/Covid-19Labormeldung/postalCode)

### Identifier System Selection Guidance
For measure reporting used within a single country, systems **should** use nationally recognized standard coding systems for Location.identifier,
or if there is no such standard, ISO 3166. For measure reporting that supports reporting from multiple countries, systems **should** use ISO 3166.




