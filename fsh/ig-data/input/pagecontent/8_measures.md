According to The American Heritage® Stedman's Medical Dictionary:
<blockquote>
<dl>
<dt>
measure <i>v.</i>
</dt>
<dd>
To ascertain the dimensions, quantity, or capacity of.
</dd>
<dd>
To mark, lay out, or establish dimensions for by measuring.
</dd>
</dl>
</blockquote>

At its simplest, measurement is counting in units, and then doing some math with
the resulting count or to obtain a value that lets you do something useful.

The focus of this guide is to inform developers on how to create and use the essential FHIR
Resources necessary to support national and regional reporting efforts on COVID-19 to
public health officials in the United States.

Over the last decade, HL7 and its members have been deeply involved in the evolution
of quality measurement, from early efforts in developing the [HL7 Version 3 Health Quality Measure Format](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=97)
specification, to more recent efforts in the publication of the [HL7 FHIR Quality Measure (QM)](http://hl7.org/fhir/us/cqfmeasures/),
and the [DaVinci Data Exchange For Quality Measures (DEQM)](http://hl7.org/fhir/us/davinci-deqm/)
implementation guides. These guides provide excellent reference and background materials
for those interested in learning more about the terminology used in measurement.

This implementation guide uses the [MeasureReport](https://hl7.org/fhir/R4/MeasureReport)
resource to report measures to regional and federal agencies, including state departments
of public health, the Centers for Disease Control (CDC) and the Federal Emergency Management
Agency.  In late March of this year, the CDC [published a form](https://www.cdc.gov/nhsn/pdfs/covid19/57.130-covid19-pimhc-blank-p.pdf)
and [instructions](https://www.cdc.gov/nhsn/pdfs/covid19/57.130-toi-508.pdf) for hospital reporting of
bed and ventilator utilization, and FEMA [provided a spreadsheet](Template for Daily Hospital COVID-19 Reporting.xlsx) it expects to be
emailed on a daily basis from in-hospital laboratory testing facilities.  Examples of
these documents are provided below.

<table><caption>Samples of requested data. Show for illustration, please use
official sources for reporting.</caption>
<tbody>
<tr>
  <td><img width='80%' src='Template-for-Daily-Hospital-COVID-19-Reporting.png'/></td>
  <td><img width='80%' src='57.130-covid19-pimhc-blank-p.png'/></td>
</tr>
</tbody>
</table>

Each of the entries in these spreadsheets or forms is measure or count of groups
of things such as available beds, ventilators, tests ordered, et cetera.  The completed
spreadsheet or form is a Measure Report.  Accompanying instructions describe (to a human)
what to include in a group.  A conceptual model of these artifacts appears below.

![Conceptual Model](ConceptualModel.svg)

The HL7 FHIR standard has similarly named resources that perform the same functions.
A more detailed model about how these are related follows.
[MeasureReport](https://hl7.org/fhir/R4/MeasureReport)
[Measure](https://hl7.org/fhir/R4/Measure)
[Group](https://hl7.org/fhir/R4/Group)

![Model](Model.svg)

## Measurement Reporting Approach
The approach of The SANER IG to measure collection is to capture all measures reported to a single
agency in a single Measure, with multiple groups in the measure.  This is very much
treating MeasureReport as if it were a report card (as one might receive from a school)
reporting how a location is doing on all measured criteria, with each group within the
MeasureReport reflecting one of the "subject areas" being measured, much like a report
card reports on a student's progress in different subjects.

Unlike a report card, a Measure Report is not necessarily an evaluation of how a location
is performing its function. The number of patients in the hospital due to pandemic is
not related to how well the hospital performs, and much more due to other factors, such
as the density of the local population, or the implementation of appropriate measures to
contain the pandemic that are outside the control of the location that is being measured.
These MeasureReport resources should be viewed not as a critique of a given facility,
rather, an evaluation of the impact the pandemic is having upon a facility.

Combining reporting into a single MeasureReport would result in data loss on the Measure
Resource without the ability to express attributes of each Measured item at the group
level.  That issue is addressed by this Implementation Guide by creating an extension (see Measure
Group Attributes below) to allow topic, scoring and type to be shifted from Measure to
Measure.group. To simplify interpretation of Measure by consumers, Measures created
in this guide always include these extensions on Measure.group, even if they are not strictly
needed.  A tracker will be created (#TODO: Create Tracker) to suggest moving these classifiers
to group.

### Profiles
* [Public Health Measure](StructureDefinition-PublicHealthMeasure.html) profiles the
  Measure resource to support Public Health and Emergency Response surveillance requirements.

* [Public Health Measure Report](StructureDefinition-PublicHealthMeasureReport.html)
  profiles the MeasureReport Resource to align it with resources adopting the Public
  Health Measure profile.

### Supporting Profiles
* [Measure Criteria](StructureDefinition-MeasureCriteria.html) profiles the
  [Expression](https://www.hl7.org/fhir/R4/metadatatypes.html#Expression) data type
  to enforce requirements essential for the creation of measures supporting automatic
  evaluation and reporting.

* [Measured Item Description](StructureDefinition-MeasuredItemDescription.html) provides
  how to code what is to be counted to identify:

  1. The FHIR Resource to be used for counting.
  2. A code or ValueSet describing the subtypes of that resource to include in the count.

### Supporting Extensions
* [GeoLocation](StructureDefinition-GeoLocation.html) defines an extension that can
  be used on a Location Resource to include its geolocation data within a Reference
  to the Location. This localizes (denormalizes) the data in the MeasureReport, enabling
  more efficient geographic searching capabilities.

* [Measure Population Alternate Criteria](StructureDefinition-MeasurePopulationAlternateCriteria.html)
  defines an extension that allows alternate criteria for evaluation to be defined for
  a Measure.  In this way, multiple implementations for counting can be supported based
  on the capabilities of the system available.

* [Measure Group Attributes](StructureDefinition-MeasureGroupAttributes.html) defines
  an extension that enables interpretation the structure of a group as a collection
  of populations that evaluate to a single measured item.


### Predefined Measures
This implementation guide includes two predefined measures describing the measurements
that are required to be reported to CDC/NHSN and FEMA.

* [CDC/NHSN Patient Impact and Hospital Capacity Reporting Measures](Measure-CDCPatientImpactAndHospitalCapacity.html)
  defines a measure that is aligned with the reporting required by the
  [National Healthcare Safety Network (CDC/NHSN)](https://www.cdc.gov/nhsn/index.html) using the COVID-19 Patient Impact and
  Hospital Capacity module, and

* [FEMA Daily Hospital COVID-19 Reporting Measures](Measure-FEMADailyHospitalCOVID19Reporting.html)
  defines a measure that is aligned with the reporting required by the [Federal Emergency Management Agency (FEMA)](https://www.aha.org/advisory/2020-03-30-coronavirus-update-administration-requests-hospitals-report-daily-covid-19)
  for reporting COVID-19 test results from Hospital in-house laboratories.

Additional reporting requirements have already been established by these Federal agencies.
This implementation guide will be updated as feasible to include measures for those reports
as time allows.

### Example Data
Example data has been created for both of the measures above by using publicly available
data from [The Covid Tracking Project](https://covidtracking.com/).  Data was downloaded
in CSV format using the [States Historical Data APIs](https://covidtracking.com/api) from
that project.  The data was augmented with other information regarding number of available
acute and ICU beds and ICU utilization statistics to enable creation of a realistic examples.
**These samples are intended to be realistic, but are NOT real examples**.

Some data is simply not publicly available. Thus, these examples also demonstrate how missing
or unavailable data can be reported using the above profiles.

<table cols='2'><thead><tr><th>CDC Patient Impact and Hospital Capacity</th><th>FEMA Daily Hospital COVID19 Reporting
</th></tr></thead>
<tbody>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200404-CDCPatientImpactAndHospitalCapacity.html'>2020-04-04</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200404-FEMADailyHospitalCOVID19Reporting.html'>2020-04-04</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200405-CDCPatientImpactAndHospitalCapacity.html'>2020-04-05</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200405-FEMADailyHospitalCOVID19Reporting.html'>2020-04-05</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200406-CDCPatientImpactAndHospitalCapacity.html'>2020-04-06</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200406-FEMADailyHospitalCOVID19Reporting.html'>2020-04-06</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200407-CDCPatientImpactAndHospitalCapacity.html'>2020-04-07</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200407-FEMADailyHospitalCOVID19Reporting.html'>2020-04-07</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200408-CDCPatientImpactAndHospitalCapacity.html'>2020-04-08</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200408-FEMADailyHospitalCOVID19Reporting.html'>2020-04-08</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200409-CDCPatientImpactAndHospitalCapacity.html'>2020-04-09</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200409-FEMADailyHospitalCOVID19Reporting.html'>2020-04-09</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200410-CDCPatientImpactAndHospitalCapacity.html'>2020-04-10</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200410-FEMADailyHospitalCOVID19Reporting.html'>2020-04-10</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200411-CDCPatientImpactAndHospitalCapacity.html'>2020-04-11</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200411-FEMADailyHospitalCOVID19Reporting.html'>2020-04-11</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200412-CDCPatientImpactAndHospitalCapacity.html'>2020-04-12</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200412-FEMADailyHospitalCOVID19Reporting.html'>2020-04-12</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200413-CDCPatientImpactAndHospitalCapacity.html'>2020-04-13</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200413-FEMADailyHospitalCOVID19Reporting.html'>2020-04-13</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200414-CDCPatientImpactAndHospitalCapacity.html'>2020-04-14</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200414-FEMADailyHospitalCOVID19Reporting.html'>2020-04-14</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200415-CDCPatientImpactAndHospitalCapacity.html'>2020-04-15</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200415-FEMADailyHospitalCOVID19Reporting.html'>2020-04-15</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200416-CDCPatientImpactAndHospitalCapacity.html'>2020-04-16</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200416-FEMADailyHospitalCOVID19Reporting.html'>2020-04-16</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200417-CDCPatientImpactAndHospitalCapacity.html'>2020-04-17</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200417-FEMADailyHospitalCOVID19Reporting.html'>2020-04-17</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200418-CDCPatientImpactAndHospitalCapacity.html'>2020-04-18</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200418-FEMADailyHospitalCOVID19Reporting.html'>2020-04-18</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200419-CDCPatientImpactAndHospitalCapacity.html'>2020-04-19</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200419-FEMADailyHospitalCOVID19Reporting.html'>2020-04-19</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200420-CDCPatientImpactAndHospitalCapacity.html'>2020-04-20</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200420-FEMADailyHospitalCOVID19Reporting.html'>2020-04-20</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200421-CDCPatientImpactAndHospitalCapacity.html'>2020-04-21</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200421-FEMADailyHospitalCOVID19Reporting.html'>2020-04-21</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200422-CDCPatientImpactAndHospitalCapacity.html'>2020-04-22</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200422-FEMADailyHospitalCOVID19Reporting.html'>2020-04-22</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200423-CDCPatientImpactAndHospitalCapacity.html'>2020-04-23</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200423-FEMADailyHospitalCOVID19Reporting.html'>2020-04-23</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200424-CDCPatientImpactAndHospitalCapacity.html'>2020-04-24</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200424-FEMADailyHospitalCOVID19Reporting.html'>2020-04-24</a>

</td></tr>
<tr><td>

<a href='MeasureReport-ExampleNJ-20200425-CDCPatientImpactAndHospitalCapacity.html'>2020-04-25</a>

</td><td>

<a href='MeasureReport-ExampleNJ-20200425-FEMADailyHospitalCOVID19Reporting.html'>2020-04-25</a>

</td></tr>
</tbody></table>
