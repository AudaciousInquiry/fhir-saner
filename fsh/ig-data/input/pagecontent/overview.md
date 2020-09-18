
The Situational Awareness for Novel Epidemic Response Implementation Guide enables transmission
of high-level situational awareness information from inpatient facilities to centralized data repositories
to support the treatment of novel influenza-[This should be an en dash](#js)like illness.
    


### About This Guide
This draft implementation guide is intended to promote discussion among leaders in the health IT industry and to encourage the creation of a community interested in extremely rapid development of an interface that can support public health in this time of crisis. All content is subject to change.

### Situational Awareness for Novel Epidemic Response
Situational Awareness has been a focus in health IT circles well before the detection of potentially pandemic flu strains during the early formation of the Office of the National Coordinator (ONC) in 2005.

2006
: Bird Flu (H5N1) [Suggest using the formal name on first mention -- CDC calls it "Highly Pathogenic Asian Avian Influenza A(H5N1) Virus," but maybe just "Avian Flu" will do](#js)

2009
: Swine Flu (H1N1)

2012
: Middle East Respiratory Syndrome (MERS)

2013
: Another form of Bird Flu (H7N9)

2019
: Coronavirus Disease 2019 (COVID-19; SARS-CoV-2)

Situational Data Needs of Public Health
The key situational data needed by public health officials has remained relatively consistent. This data supports awareness of:

1.  Local, regional, and national case rates and trends [Don't number these lists unless the order is relevant/critical. Recommend <li> instead](#js)
2.  Bed availability for treatment
3.  Other resources availability for treatment
  * Staff
  * Medications
  * Immunizations
  * Medical equipment (e.g., respirators, N95 masks)
  * Supplies (e.g., cleaning supplies, facemasks)

#### Focusing the Solution Space
In evaluating solutions for the above challenges, we have established the following principles:
1.  The solution needs to focus on providing high return-on-investment (ROI).
2.  The solution should not duplicate existing efforts.
3.  The solution must work with existing health IT products currently deployed.
4.  The uplift needed to enable an existing product to support public health information requirements needs to be low enough to effectively deliver quickly.[Needs clarification. Perhaps something like this: "Changes required to adapt existing products should be relatively few to enable rapid delivery."](#js)

#### Quick Assessment
1.  Work by [Johns Hopkins University](https://coronavirus.jhu.edu/map.html) aggregates case data sets and visualizes them to address national and even regional (at the county level) trends.
2.  Significant work already exists in the area of bed availability [^1]<sup>,</sup>[^2]<sup>,</sup>[^3]<sup>,</sup>[^4], but so far it has produced little success. Existing health IT solutions have this data (not just in the EHR) [the signicance of this fact isn't clear] (#js), however, so rapid implementation of a pilot is possible if the solution can be interfaced rather than integrated.
3.  Other resource utilization data [right?](#js) is available in inventory control or central monitoring solutions, but it is not necessarily in the EHR. This [what does "This" refer to?](#js) would be a natural evolution from Bed Availability.

[^1]: [HITSP C47: Resource Utilization Message](http://www.hitsp.org/ConstructSet_Details.aspx?&PrefixAlpha=4&PrefixNumeric=47)

[^2]: [HAvBED2: Hospital Avaialable Beds for Emergencies and Disasters](https://archive.ahrq.gov/prep/havbed2/)

[^3]: [Emergency Data Exchange Language (EDXL) Hospital AVailability Exchange (HAVE) v1.0 incorporating Approved Errata](https://www.oasis-open.org/standards#edxlhave-v1.0)

[^4]: [HL7/OASIS Cross Paradigm Implementation Guide: Emergency Data Exchange Language (EDXL) Hospital AVailability Exchange (HAVE) Version 2.0 (EDXL-HAVE), Release 1](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=489)

This rapid assessment leads this guide to focus on bed and ventilator availability.

### Bed Availability
The key data for bed availability is found in bed management solutions integrated with
current inpatient EHR systems and in departmental ICU and central monitoring systems.
These solutions support management of bed assignments and provide direction to
housekeeping staff (e.g., regarding bed-turnover activities/cleaning) and to departmental systems,
which provide ICU and Nursing central monitoring capabilities. They are often separate components
or modules, standalone solutions, or third-party solutions integrated into with an
EHR System (e.g., Forward Advantage with MEDITECH).

#### Prior Solutions and Existing Standards
Prior standards developed to address these issues have been profiled through past efforts, as briefly
outlined below.

##### HAvBED and OASIS EDXL/HAVE Standards
Most notably, the OASIS Emergency Data Exchange Language (EDXL) and the OASIS Hospital Availability Exchange
were profiled by ANSI/HITSP in response to the AHIC Emergency Responder Use Case. This work was advanced by
AHRQ to develop what is now known as HAvBED, which became a federally mandated program for states
to collect and report bed availability data. The Department of Health and Human Services (HHS) suspended the HAvBED program in 2016.
Some of the challenges with HAvBED included:

* Required data entry was manual, labor-intensive, and untimely, resulting in data quality issues
* Lagging HAvBED requirements that did not keep pace as technology standards evolved
* Reluctance by some facilities and states to share bed-availability data.

##### HL7 Version 2
Other standards containing bed availability information include HL7 Version 2
(e.g., the [ADT_A20 Bed Status Update](http://www.hl7.eu/refactored/msgADT_A20.html) message) and general observations profiled by 
ANSI/HITSP to support organizational reporting of bed availability using HL7 Version 2 OBX segments]

##### HL7 Version 3
No HL7 Version 3 standards supported bed management or availability.
The HL7 Service-oriented Architecture (SOA) Workgroup collaborated with the OASIS EDXL Committee to develop a [Cross
Paradigm](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=489)
specification supporting the communication of bed availability information.


##### HL7 FHIR
In HL7 FHIR, the [Location](https://hl7.org/fhir/R4/location.html) resource (LR) can describe information about
any bed in a facility. The [Group](https://hl7.org/fhir/R4/group.html) resource (GR)
can report on specific quantities of groups of resources available that match a specific
set of characteristics. The [MeasureReport](https://hl7.org/fhir/R4/measurereport.html)
resource (MRR) can report on measures using counts and other metrics over a variety of resources.[NOTE: Device Resource and Questionnaire Response are left out of this section, but the other subsection titles below are mentioned. Recommend including them] (#js)

###### Device Resource
The Device Resource can report on medical devices, including ventilators, respirators,
personal protective equipment such as masks and viral test kits. Device Resource is not in wide use among systems reporting on device quantities or status.

###### Location Resource
Although LR supports reporting on beds, it can also describe buildings, wards, geographic areas, or any other sort of place, including "mobile" places such as a mobile clinics or
ambulances. Given these broad applications, it requires profiling to support use for bed availability.

Although many certified EHR systems support the FHIR standard and LR today, use of LR to report on beds is rare. Most systems use it to report
location data associated with the
[Common Clinical Data Set](https://www.healthit.gov/sites/default/files/commonclinicaldataset_ml_11-4-15.pdf) (now known as the US Core Data for
Interoperability or [USCDI](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi)) required by ONC 2015 Certification
regulations. These uses of Location are found in the Encounter, Procedure, and Practitioner resources to
describe the facility where an encounter occurs, the location where a procedure takes place, or
the location of a practitioner.

###### Group Resource
GR can support aggregate reporting on beds, as it permits reporting of quantities of an item without referencing an individual item, but no known sytem has deployed it this way. This resource also supports reporting on other types of resources, such as
ventilators, respirators, and N95 masks. It is only lightly deployed in eisting EHR products and is not a requirement of the 2015 Certification program.

(NOTE: GR supports reporting on any group of things definable by characteristics, though it does not specifically support groups of Location resources. It is also unable to enumerate resources, but that capability is not essential for the use cases in this implementation
guide.)

###### Measure Resource
MRR supports reporting of a variety of measures, including simple counts, with measures over different strata, though it is not readily searchable at
the stratum level.  Deployment of this resource is beginning to expand because of its use in the [DaVinci Project](https://www.hl7.org/about/davinci/).

###### Questionnaire Response
The QuestionnaireResponse resource has been profiled for use in reporting to CDC's National
Healthcare Safety Network (NHSN) in two implementation guides to report the occurrence
of healthcare-acquired infections (HAIs). These guides have seen limited implementation and
testing.

The table below shows the [FHIR Maturity Model](https://www.hl7.org/fhir/R4/versions.html#maturity) level for each of the resources described
above.

<table class='grid'><thead><tr><th>Resource</th><th>Maturity Level</th></tr></thead>
<tbody>
<tr><td><a href="http://hl7.org/fhir/device.html">Device</a></td><td>2</td></tr>
<tr><td><a href="http://hl7.org/fhir/group.html">Group</a></td><td>1</td></tr>
<tr><td><a href="http://hl7.org/fhir/location.html">Location</a></td><td>3</td></tr>
<tr><td><a href="http://hl7.org/fhir/measurereport.html">MeasureReport</a></td><td>2</td></tr>
<tr><td><a href="http://hl7.org/fhir/questionnaireresponse.html">QuestionnaireResponse</a></td><td>3</td></tr>
</tbody>
</table>

#### Terminology [Elsewhere this is called "Vocabulary." Both suit me, but users may need consistency unless these two words are being used differently. Also, I suggest cutting the preamble to this section (as shown) because it seems unnecessary](#js)
Key terminology in this guide includes the following: [Consider making the sections below into a bulleted list rather than numbered sections] (#js)

##### Location Type 
The HL7 Version 3 [Service Delivery Location Role Type](https://www.hl7.org/fhir/v3/ServiceDeliveryLocationRoleType/vs.html)
value set is the [Preferred](https://www.hl7.org/fhir/terminologies.html#preferred) classification system for `Location.type` in LR in FHIR
R4.

##### Bed Status
HL7 Version 2 Table 0116 [Bed Status Provides Vocabulary](https://www.hl7.org/fhir/v2/0116/index.html), which can describe the status
of a bed, is the [Extensible](https://www.hl7.org/fhir/terminologies.html#extensible) vocabulary
for `Location.operationalStatus` in LR in FHIR R4.

##### Codes Used to Stratify Populations [Two things here: 1) How do this and the next section amount to "terminology" -- I can see a link, but these sections don't define specific terms exactly the way the "Location" and "Bed Status" sections do. Also, could we call these "demographic" codes, or is "stratification" the accepted term?] (#js) 
Other codes are essential for stratifying populations to determine the impact of disease by age, gender, and race/ethnicity, either to determine risk factors or to identify
disparities in treatment. Existing code sets are available to support these sorts of stratification efforts.

##### New Codes
Until COVID-19/SARS-CoV-2 emerged, no codes for describing the disease or its diagnosis (and other testing), evaluation, treatment, procedures, or medications existed. Since then, organizations that manage code systems used by EHRs and other health IT systems (e.g., LOINC, SNOMED, and CMS) have produced codes and developed value
sets and guidelines for coding conditions and situations related to COVID-19.

These new codes and guidelines support the following for COVID-19:

* Laboratory testing and results
* Diagnosis
* Suspected diagnosis
* Suspected or actual exposure.




**Footnotes**
        
