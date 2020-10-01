
This section of the IG explains possible ways to record the expressions used to automate a Measure.  Essentially it is a phrase book
from English to the Expression elements used in the PublicHealthMeasure resource to describe the automation.  Due to different
workflows and national requirements, these phrases may require translation to different FHIR models to represent the concept
being tested.

Preferred models are marked with an asterisk.

The examples below are informative, and show how measures could be developed to support different constraints using existing
vocabularies and value sets supported by HL7 FHIR.

In the text below, examples are based on measures analyzed from the CDC Patient Impact and Hospital Capacity module used for
reporting in the first half of 2020 and shown below.

![CDC Patient Impact and Hospital Capacity module](57.130-covid19-pimhc-blank-p.png)


### Active Patient Encounters
Encounters represent interactions between a patient and a healthcare provider in inpatient, outpatient or other settings. Many measures
for situational awareness start with a patient encounter as the context for the measurement.

The HOSPITAL INPATIENT BED OCCUPANCY measure can be evaluated through encounters.
The initial set of encounters can be retrieved using the `Encounters?status=in-progress` FHIR query, or represented as
`Encounter.where(status='in-progress')` in FHIRPath.

#### Active Encounters Within a Time Frame
Both Encounter.period.start and Encounter.period.end can be tested for occurence on a specific day, or within a given date range,
allowing for tests of Admit/Discharge/Transfer/Death by date.

If looking for encounters started yesterday, and today is September 1, 2020, the appropriate FHIR query is:
`Encounter?date=sa2020-08-30T23:59:59&date=le2020-09-01`. This query will find encounters that start after the last second of August 30,
and which were present before September 1.  These encounters must have been present Yesterday, and started after the day before yesterday,
thus, must have started yesterday.  The same query expressed as a filter in FHIRPath is `Encounter.where(period.start.toDate() = @2020-08-31)`.
FHIRPath provides finer grained access than FHIR queries, enabling direct access to the start component of the encounter period.  The start
component needs to be converted to a date to ensure that precision matches for the equals operator.

The first and second examples above can be combined to ensure that the encounters in question are still in-progress, and filter out other
encounters (e.g., those created in error).  For the FHIR query, this would be `Encounters?status=in-progress&date=sa2020-08-30T23:59:59&date=le2020-09-01`.
In FHIRPath, this would be `Encounter.where(period.start.toDate() = @2020-08-31 and status = 'in-progress')`

#### Admission
An admission generally starts an encounter that lasts more than a single day, although might also be used for encounters lasting only
a single day (e.g., emergency department encounters which could last more than a day, but often are completed with a single day).

Admission
: An admission is identified from an Encounter that has not yet ended. Encounter.status **should** be "in-progress".  The date (and time) of
admission can generally be determined from Encounter.period.start. Encounter.period.end will not be present, and
Encounter.hospitalization.dispositionCode will also not be present, but the latter is not generally directly accessible
through a search.

##### Examples for Admission

<table border='1' cellspacing='0'>
  <caption>Locating Admissions via the Encounter resource</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
     <tr><td>Encounter.status</td>
         <td>Active encounters</td>
         <td>Encounter?status=in-progress</td>
         <td>Encounter.where(status='in-progress')</td>
         <td>[Encounter] E where E.status = 'in-progress'</td>
     </tr>
     <tr><td>Encounter.period.start</td>
         <td>Encounters starting on a given date or within a particular period</td>
         <td>Encounter?date=sa<i>2020-09-07</i>&date=lt<i>2020-09-09</i><br/>
             Because the date search parameter is compared to a period data type, the upper and lower
             bounds must be set in a way that ensures inclusion of the target period.  Using a high
             precision time value for the sa component is less likely to run into implementation
             errors even though sa2020-09-07 **should** be equivalent.
         </td>
         <td>Encounter.where(period.start >= @<i>2020-09-08</i> and period.start < @<i>2020-09-09</i>)<br/>
             It is generally preferable for comparisons in for a time period to use an the inclusive
             lower bound with greater than or equal to (>=) and an exclusive upper bound with
             less-than (<). This is less likely to run into implementation errors affecting date comparisions.
         </td>
         <td>parameter MeasurementPeriod default Interval[@2020-09-08, @2020-09-09)<br/>
             [Encounter] E where E.period starts during <i>MeasurementPeriod</i></td>
     </tr>
  </tbody>
</table>

#### Encounters with a Disposition
The base FHIR specification does not support query by discharge disposition. Some FHIR Servers may be configurable
to support this search.  See the [disposition](SearchParameter-SearchParameter-disposition.html) search parameter for an example of a resource
that can be used to support this capability.  When present, discharge disposition codes are often populated according to
requirements established for payment (e.g.,
[US Medicare payment requirements](https://www.cms.gov/medicare/medicare-contracting/contractorlearningresources/downloads/ja0801.pdf#page=2),
rather than treatment.

\* The date of the disposition (discharge/transfer or death) may be determined from Encounter.period.end.

<table border='1' cellspacing='0'>
  <caption>Locating Discharges, Transfers and Deaths via the Encounter resource</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
     <tr><td>Encounter.status</td>
         <td>Encounters that have been completed</td>
         <td>Encounter?status=finished</td>
         <td>Encounter.where(status='finished')</td>
         <td>[Encounter] E where E.status = 'finished'</td>
     </tr>
     <tr><td>Encounter.period.end</td>
         <td>Encounters ending on a given date or within a particular period.</td>
         <td>Encounter?date=ge<i>2020-09-07T23:59:59</i>&date=eb<i>2020-09-09</i><br/>
             Because the date search parameter is compared to a period data type, the upper and lower
             bounds must be set.
         </td>
         <td>Encounter.where(period.end >= @<i>2020-09-08</i> and period.end < @<i>2020-09-09</i>)<br/>
             It is generally preferable for comparisons in for a time period to use an the inclusive
             lower bound with greater than or equal to (>=) and an exclusive upper bound with
             less-than (<). This is less likely to run into implementation errors affecting date comparisions.
         </td>
         <td>parameter MeasurementPeriod default Interval[@2020-09-08, @2020-09-09)<br/>
             [Encounter] E where E.period ends during <i>MeasurementPeriod</i></td>
     </tr>
  </tbody>
</table>

To distinguish between discharge to home vs. a transfer to another facility vs. death, the value of
\* Encounter.hospitalization.disposionCode must be examined. Usually discharge means "to home" or
other non-healthcare setting (e.g., another family member's home). These cases are shown in more detail below.

##### Discharge
A discharge is represented by an Encounter that has been completed in some way, either Encounter.status is "finished" to indicate
normal completion, or in some cases, the Encounter.status may be marked as "cancelled" for special cases.
Encounter.hospitalization.dispositionCode **should** be present, and where the the patient was discharged to.

<table border='1' cellspacing='0'>
  <caption>Locating Discharges via the Encounter resource</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
    <tr><td>Encounter.hospitalization.dispositionCode</td>
        <td>Transitions to home or similar settings</td>
        <td>Encounter?disposition=<i>http://terminology.hl7.org/CodeSystem/discharge-disposition|home,<br/>
            http://terminology.hl7.org/CodeSystem/discharge-disposition|alt-home</i>,<br/>
            http://terminology.hl7.org/CodeSystem/discharge-disposition|aadvice</i>,<br/>
            http://terminology.hl7.org/CodeSystem/discharge-disposition|oth</i><br/>
        </td>
        <td>Encounter.where(<br/>
            hospitalization.dispositionCode.where(system='http://terminology.hl7.org/CodeSystem/discharge-disposition'<br/>
               and code = ('home'|'alt-home'|'aadvice'|'oth') ) )</td>
        <td>valueset HomeEnvironment http://example.com/valueset/HomeEvironment<br/>
            [Encounter] E where E.hospitalization.dispositionCode in HomeEnvironment</td>
    </tr>
  </tbody>
</table>

##### Transfers
A transfer to another facility (inter-facility transfer) is like a discharge, except that the Encounter.hospitalization.dispositionCode **should** be
present and indicates a transfer to a different healthcare setting (e.g., rehabilitation, hospice, long-term care).

<table border='1' cellspacing='0'>
  <caption>Locating Transfers via the Encounter resource</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
    <tr><td>Encounter.hospitalization.dispositionCode</td>
        <td>Transitions to other healthcare settings other than home or death</td>
        <td>Encounter?disposition=<i>http://terminology.hl7.org/CodeSystem/discharge-disposition|other-hcf,<br/>
            http://terminology.hl7.org/CodeSystem/discharge-disposition|hosp,<br/>
            http://terminology.hl7.org/CodeSystem/discharge-disposition|long,<br/>
            http://terminology.hl7.org/CodeSystem/discharge-disposition|psy,<br/>
            http://terminology.hl7.org/CodeSystem/discharge-disposition|rehab,<br/>
            http://terminology.hl7.org/CodeSystem/discharge-disposition|snf</i>
        </td>
        <td>Encounter.where(<br/>
            hospitalization.dispositionCode.where(system='http://terminology.hl7.org/CodeSystem/discharge-disposition'<br/>
               and code = ('other-hcf'|'hosp'|'long'|'psy'|'rehab'|'snf') ) )</td>
        <td>valueset TransferEnvironment http://example.com/valueset/TransferEnvironment<br/>
            [Encounter] E where E.hospitalization.dispositionCode in TransferEnvironment</td>
    </tr>
  </tbody>
</table>

Notes
: A transfer within a facility (intra-facility transfer) can mark a change in patient class (e.g., outpatient, emergency, observation, inpatient, long-term care) and type of
service being provided, but may also simply indicate movement between locations within a facility.

: Measure developers **should** provide clarity around the distinctions between discharge and transfer.  Is discharge to home-health
a "discharge" or a "transfer"?  If "long-term care" is the same as "home" for the patient, how would different hospital workflows
vary with regard to coding these values?

##### Death
Not every discharge is a good outcome. Discharge due to death reqires special handling because of different
hospital workfows used to track the death of a patient.

1. * The discharge disposition may indicate death in the Encounter.hospitalization.dispositionCode value, or
2. The fact that a patient has died (but not when) may appear in Patient.deceasedBoolean, or
3. * The date of death may appear in Patient.deceasedDateTime, or
4. A date of death may be recorded in an Observation for the patient, or
5. The Location resource referenced by Encounter.hospitalization.destination may indicate a morgue or autopsy
   room in Location.type.

When testing for death during an encounter using date of death (numbers 3 and 4 above), take care to verify that death
occured during the encounter (i.e., date of death is >= Encounter.period.start and <= Encounter.period.end).

<table border='1' cellspacing='0'>
  <caption>Locating Deaths via the Encounter resource</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
    <tr><td>Encounter.hospitalization.dispositionCode</td>
        <td>Transitions due to Death</td>
        <td>Encounter?disposition=<i>http://terminology.hl7.org/CodeSystem/discharge-disposition|exp</i></td>
        <td>Encounter.where(<br/>
            hospitalization.dispositionCode.where(system='http://terminology.hl7.org/CodeSystem/discharge-disposition'<br/>
               and code = 'exp') ) )</td>
        <td>valueset PatientExpired http://example.com/valueset/PatientExpired<br/>
            [Encounter] E where E.hospitalization.dispositionCode in PatientExpired</td>
    </tr>
  </tbody>
</table>

<table border='1' cellspacing='0'>
  <caption>Locating Deaths via the Patient resource</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
    <tr><td>Patient.deceasedDateTime</td>
        <td>Patient date of death</td>
        <td>Patient?death-date=2020-09-09</td>
        <td>Patient.where(deceasedDateTime = @2020-09-09)</td>
        <td>[Patient] P where P.deceasedDateTime = @2020-09-09</td>
    </tr>
    <tr><td rowspan='2'>Patient.deceased[x]</td>
        <td>Patient has died</td>
        <td>Patient?deceased=true</td>
        <td>// Patient has died, or there is a date of death<br/>Patient.where(deceasedBoolean = true | deceasedDateTime.exists())</td>
        <td>[Patient] P where P.deceasedBoolean = true or P.deceasedDateTime is not null</td>
    </tr>
    <tr><td>Patient has died within this encounter</td>
        <td>// NOTE: This query uses chained search, and will NOT test that the patient died during the encounter <br/>
            // It will return both encounters and patients so that further analysis can<br/>
            // be performed by the client.  This sort of issue should be documented in<br/>
            // <a href='https://www.hl7.org/fhir/metadatatypes-definitions.html#Expression.description'>Expression.description</a> in the measure definition.<br/>
            Encounter?patient.deceased=true&_include=Encounter:subject</td>
        <td>Encounter.where(<br/>
            // Patient has died during the encounter<br/>
            (resolve(patient).deceasedDateTime >= $this.period.start and<br/>
            &#xA0;resolve(patient).deceasedDateTime <= $this.period.end) or<br/>
            // Encounter is in-progress and patient has died<br/>
            &#xA0;&#xA0;($this.status = 'in-progress' and<br/>
            &#xA0;&#xA0;// Patient has died, or there is a date of death<br/>
            &#xA0;&#xA0;&#xA0;resolve(patient).where(deceasedDateTime.exists() or deceasedBoolean = true)<br/>
            &#xA0;&#xA0;)<br/>
            )
        </td>
        <td>Context Encounter <br/>
            [Patient] P where <br/>
            P.id = E.patient and<br/>
            // Patient has died during the encounter<br/>
            &#xA0;(P.deceasedDateTime in E.period or<br/>
            // Encounter is in-progress and patient has died<br/>
            &#xA0;&#xA0;(E.status = 'in-progress' and<br/>
            &#xA0;&#xA0;&#xA0;(P.deceasedBoolean = true or P.deceasedDateTime is not null)<br/>
            &#xA0;&#xA0;)<br/>
            &#xA0;)<br/>
        </td>
    </tr>
  </tbody>
</table>

### For a type of healthcare service (e.g., ED, Observation, Acute, ICU, Outpatient)
The type of healthcare service may be determined in a couple of different ways depending on hospital workflow:

1. * It may be broadly coded in Encounter.class (e.g., ED, Observation, Acute, ICU, Outpatient), or
2. Deeply coded in Encounter.serviceClass (more detailed encoding for different kinds of services,
   from which one can infer ED, Observation, et cetera.
3. Encoded in the Location resource referenced by Encounter.location.location in Location.type, again, from
   which one can infer ED, Observation, et cetera.

Many HL7 standards use the HL7 Version 3 Service Delivery Location Role Type vocabulary to describe locations.
In the US, the [HSLOC Coding System](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.1.11.20275/expansion/Latest)
is used to record the type of healthcare service for the HL7 Healthcare Acquired Infections Implementation Guides in both
(CDA)[https://www.hl7.org/implement/standards/product_brief.cfm?product_id=20] and (FHIR)[http://hl7.org/fhir/us/hai/].
This coding system supports development of value set that can be used in the expression to identify a location
supporting a specific type of service.

This guide provides a (ConceptMap)[ConceptMap_ServiceDeliveryLocations.html) that supports mapping between these two vocabularies.

<table border='1' cellspacing='0'>
  <caption>Determining the type of service using Encounter resource</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
     <tr><td>Encounter.class</td>
         <td>Inpatient (Acute) Encounters</td>
         <td>Encounter?class=http://terminology.hl7.org/CodeSystem/v3-ActCode|ACUTE</td>
         <td>Encounter.where(status.where(system='http://terminology.hl7.org/CodeSystem/v3-ActCode' and code='ACUTE'))</td>
         <td>valueset AcuteEncounter http://example.com/valueset/AcuteEncounter
             [Encounter] E where E.class in AcuteEncounter</td>
     </tr>
     <tr><td>Encounter.serviceType</td>
         <td>Encounters providing a specific kind of service</td>
         <td>// NOTE: Requires custom search parameter for service-type
             Encounter?serviceType=http://terminology.hl7.org/CodeSystem/service-type|237</td>
         <td>Encounter.where(serviceType.where(system='http://terminology.hl7.org/CodeSystem/service-type' and code='237')
         </td>
         <td>valueset EncounterServiceType http://example.com/valueset/EncounterServiceType<br/>
             [Encounter] E where <br/>
             E.serviceType in EncounterServiceType
         </td>
     </tr>
     <tr><td>Location.type</td>
         <td>Encounters in a specific type of location</td>
         <td>// NOTE: Used chained search for Encounters in a hospital unit
             Encounter?location.type=http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType|HU</td>
         <td>Encounter.where(location.physicalType.where(system='http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType' and code='HU'))</td>
         <td>valueset LocationType http://example.com/valueset/LocationType<br/>
             context Encounter
             [Location] L where <br/>
             L.id = Encounter.location
             L.type in LocationType
         </td>
     </tr>
  </tbody>
</table>

### Temporary/Surge/Overflow
Some facilities, especially under stress will house patients in temporary locations, known as surge or overflow locations.  NHSN
defined these thus:

> Overflow locations include any physical locations created to accommodate patients including but not
> limited to 24-hour observation units, hallways, parking lots, or tents.

There is no common workflow or model used to represent this sort of situation. This IG recommends the use of
a special code within Encounter.location.physicalType to identify a location that is a temporary location.  This value should
also appear within Location.physicalType in the location resource referenced by Encounter.location.location.

### With a Given Condition or Symptom
Patient conditions or symptoms may appear in several places, with different degrees of confidence in the
patient having the condition (e.g., admission, preliminary, differential, possible, or confirmed diagnosis).

#### Admitted/Seen for:
In the context of a given encounter, the condition may appear in:

1. The Condition resource referenced by Encounter.diagnosis.condition in Condition.code.  When using this field,
consider also the value of Encounter.diagnosis.use, which encodes the provider confidence in the diagnosis, or
2. As a coded value in Encounter.reasonCode, or
3. As a reference to a Condition resource in Encounter.reasonReference, or
4. As a reference to an Observation resource in Encounter.reasonReference
5. As a problem in a Condition resource linked to the encounter, i.e., where Condition.encounter references
the Encounter of interest.
6. As a problem in a Condition resource from a prior period or encounter.
7. As an finding reported in an Observation resource linked to the encounter i.e.,
where Observation.encounter references the encounter of interest.  These observations may report subjective
or objective findings during review of systems or physical examination (e.g., shortness of breath, sense of smell,
et cetera).
8. As a finding reported in an Observation from a prior period or encounter.

NOTE: In all cases where Condition is used, consider also the values of `Condition.verificationStatus` and
`Condition.clinicalStatus` during evaluation.  The `verificationStatus` indicates whether the condition
is unconfirmed, provisional, confirmed or even refuted or entered-in-error.  Note that the last two cases the
patient does NOT have the condition.  The `clinicalStatus` may describe clinical status of the condition
of interest, using the value active, inactive or resolved.  Again, note that resolved indicates the condition
is no longer active.

The `Condition.onset[x]` and `Condition.abatement[x]` fields identity the time frame over which the condition was
active.  The `Condition.recordedDate` indicates when the provider recorded the condition in the system.

<table border='1' cellspacing='0'>
  <caption>Determining the reason for care using Encounter resources</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
     <tr><td>Encounter.reasonCode</td>
         <td>Encounter for a specific disease by code</td>
         <td>Encounter?reason-code=http://snomed.info/sct|186747009,http://snomed.info/sct|713084008,http://snomed.info/sct|840539006,http://snomed.info/sct|840544004</td>
         <td>Encounter.where(reasonCode.where(system='http://snomed.info/sct' and code=('186747009','713084008','840539006','840544004')))</td>
         <td>valueset AcuteEncounter http://example.com/valueset/AcuteEncounter
             [Encounter] E where E.class in AcuteEncounter</td>
     </tr>
     <tr><td>Encounter.reasonReference</td>
         <td>Encounters referencing a condition resource</td>
         <td>// Chained search<br/>
             Encounter.reasonReference.code=http://snomed.info/sct|186747009,<br/>
             http://snomed.info/sct|713084008,<br/>
             http://snomed.info/sct|840539006,<br/>
             http://snomed.info/sct|840544004</td>
         <td>Encounter.where(reasonReference.resolve().code.where(system='http://snomed.info/sct' and <br/>
               code=('186747009','713084008','840539006','840544004'))
         </td>
         <td>valueset COVID19Conditions http://example.com/valueset/COVID19Conditions<br/>
             [Condition] C where <br/>
             C.id = Encounter.reasonReference and<br/>
             C.code in COVID19Conditions
         </td>
     </tr>
     <tr><td>Condition.code</td>
         <td>Condition recorded for a given encounter</td>
         <td>Condition?encounter=<i>encounterId</i>&<br/>
             code=http://snomed.info/sct|186747009,http://snomed.info/sct|713084008,http://snomed.info/sct|840539006,http://snomed.info/sct|840544004
         </td>
         <td>Condition.where(system='http://snomed.info/sct' and <br/>
               code=('186747009','713084008','840539006','840544004')) and<br/>
               encounter=<i>encounterId</i>
         </td>
         <td>valueset COVID19Conditions http://example.com/valueset/COVID19Conditions<br/>
             context Encounter
             [Condition] C where <br/>
             C.encounter = Encounter.id<br/>
             C.code in COVID19Conditions
         </td>
     </tr>
  </tbody>
</table>


### Measures based on codes or results
Several different kinds of measures can be based on codes describing a diagnostic tests, a procedure, or other activity
having been performed, and in the case of diagnostic tests, combinations including both the test code and result value.

#### Test / Procedure / Immunization Performed
Electronic laboratory reporting is used to track both the kinds of tested performed as well as the results.
A commonly reported measure for COVID-19 is the number of COVID-19 diagnostic tests performed, regardless
of outcome, where the results are then stratified by outcome.  This can be counted by looking for the existence
of an Observation, Procedure

Reporting of certain kinds of observations (e.g., Fraction of Inhaled Oxygen or Positive End Expiratory Pressure) are commonly reported
for patients who are on a ventilator.  Existence of these observations indicate that a patient is on a ventilator.

<table border='1' cellspacing='0'>
  <caption>Determining the reason for care using Encounter resources</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
     <tr><td>Observation.code</td>
         <td>Diagnostic Result from a COVID-19 test</td>
         <td>Observation?code=http://loinc.org|94307-6,http://loinc.org|94308-4,http://loinc.org|94309-2,http://loinc.org|94310-0,<br/>
http://loinc.org|94314-2,http://loinc.org|94315-9,http://loinc.org|94316-7,http://loinc.org|94500-6,<br/>
http://loinc.org|94533-7,http://loinc.org|94534-5,http://loinc.org|94558-4,http://loinc.org|94559-2
        </td>
         <td>Observation.where(code.where(system = 'http://loinc.org' and <br/>
             code = ('19994-3','19995-0','19996-8','94310-0','94314-2','94315-9','94316-7','94500-6','94533-7','94534-5','94558-4','94559-2') ) )</td>
         <td>valueset SarsCoV2Labs http://example.com/valueset/SarsCoV2Labs
             [Observation] O where O.code in SarsCoV2Labs</td>
     </tr>
     <tr><td>Observation.code</td>
         <td>Patients with observations indicating that they are on a ventilator</td>
         <td>Observation?code=http://loinc.org|19835-8,http://loinc.org|19994-3,http://loinc.org|20077-4,http://loinc.org|20079-0,http://loinc.org|20103-8,<br/>
http://loinc.org|20112-9,http://loinc.org|20115-2,http://loinc.org|33438-3,http://loinc.org|57655-3,http://loinc.org|76530-5,http://loinc.org|19839-0
        </td>
         <td>Observation.where(code.where(system = 'http://loinc.org' and <br/>
             code = ('19835-8','19994-3','20077-4','20079-0','20103-8','20112-9','20115-2','33438-3','57655-3','76530-5','19839-0') ) )</td>
         <td>valueset PatientsOnVentilator http://example.com/valueset/PatientsOnVentilator
             [Observation] O where O.code in PatientsOnVentilator</td>
     </tr>
  </tbody>
</table>

The handling of Procedure or Immunization resources is similar.  For Procedure, change Observation above to Procedure.  For Immunization, change Obsevation to Immunization,
and code to vaccine-code for FHIR Query, or to vaccineCode for FHIRPath and CQL.

#### Test with a coded result or interpretation
To test for a specific coded result, add the following clauses to the above expressions:

<table border='1' cellspacing='0'>
  <caption>Determining the reason for care using Encounter resources</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
     <tr><td>Observation.valueCodeableConcept</td>
         <td>Coded Result matching a particular value</td>
         <td>&value-concept=http://snomed.info/sct|260385009
        </td>
         <td>Observation.where( ... and valueCodeableConcept.where(system='http://snomed.info/sct' and value='260385009'))</td>
         <td>valueset NegativeResults http://example.com/valueset/NegativeResults
             [Observation] O where O.valueCodeableConcept in NegativeResults </td>
     </tr>
     <tr><td>Observation.interpretation</td>
         <td>A result interpretation of a specified value</td>
         <td>// NOTE: Requires custom search parameter for interpretation
             &interpretation=http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation|NEG
        </td>
         <td>Observation.where( ... and interpretation.where(system='http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation' and value='NEG'))</td>
         <td>valueset NegativeInterpretations http://example.com/valueset/NegativeInterpretations
             [Observation] O where O.interpreation in NegativeInterpretations </td>
     </tr>
  </tbody>
</table>

#### Test Value within a Range
<table border='1' cellspacing='0'>
  <caption>Determining the reason for care using Encounter resources</caption>
  <thead><tr><th>Field</th><th>Description</th><th>FHIR Query</th><th>FHIR Path</th><th>CQL</th></tr></thead>
  <tbody>
     <tr><td>Observation.valueQuantity</td>
         <td>Quantity above/below/with a range</td>
         <td>&value-quantity=gt5.4|http://unitsofmeasure.org|mg<br/>
             &value-quantity=lt5.4|http://unitsofmeasure.org|mg<br/>
             &value-quantity=gt5.4|http://unitsofmeasure.org|mg&value-quantity=lt8.0|http://unitsofmeasure.org|mg<br/>
        </td>
         <td>Observation.where( ... and valueQuantity > 5.4 'mg')<br/>
             Observation.where( ... and valueQuantity < 5.4 'mg')<br/>
             Observation.where( ... and valueQuantity > 5.4 'mg' and valueQuantity < 8.0 'mg')<br/>
         </td>
         <td>[Observation] O where O.valueQuantity > 5.4 'mg'<br/>
             [Observation] O where O.valueQuantity < 5.4 'mg'<br/>
             [Observation] O where O.valueQuantity > 5.4 'mg' and O.valueQuantity < 8.0 'mg'<br/>
     </tr>
  </tbody>
</table>

### Handling Temporal Relationships
In the example below, NHSN defined HOSPITAL ONSET for COVID-19 as shown below:

> HOSPITAL ONSET: Patients currently hospitalized in an inpatient bed with onset of
> suspected or confirmed COVID-19 fourteen or more days after hospital admission
> due to a condition other than COVID-19

This kind of query cannot be handled directly using a FHIR Search query, as it requires computing a relationship between
to related resources.

In FHIRPath, assuming both the encounter and condition are available in the current set of results, one would write:
```
   Condition.where(resolve(encounter).period.start + 14 'days' < onsetDateTime)
```
This expression will select Condition resources for which the associated Condition.encounter.period.start date plus 14 days is less than the time of onset of the condition.

A similar expression can be written for CQL:
```
 [Condition] C where
 C.encounter = Encounter.id and
 C.code in COVID19Conditions and
 C.onset - 14 days > Encounter.period.start
```
