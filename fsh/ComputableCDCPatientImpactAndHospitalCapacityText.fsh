RuleSet: ComputableCDCPatientImpactAndHospitalCapacityText
* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
   <h3>Patient Impact and Hospital Capacity</h3>
   <p>The url for this measure is <code>http://hl7.org/fhir/saner/Measure/ComputableCDCPatientImpactAndHospitalCapacity</code>.
   </p>
   <p>This measure demonstrates automated reporting on bed availability and use at a facility
      location based on CDC/NHSN reporting requirements. It is used to illustrate automation
      of measure reporting using the SANER Implementation guide.
   </p>
   <dl>
      <dt>Frequency</dt>
      <dd>This measure is expected to be reported every 1 day.</dd>
      <dt>Publisher</dt>
      <dd>HL7 International</dd>
      <dt>Contacts</dt>
      <dd>HL7 Public Health Workgroup (http://hl7.org/Special/committees/pher/index.cfm)</dd>
      <dd>Keith W. Boone (mailto:kboone@ainq.com)</dd>
      <dt>Status</dt>
      <dd>draft</dd>
   </dl>
   <h4>Definitions</h4><dl><dt>Ventilator</dt> <dd>Any device used to support, assist or control respiration
   (inclusive of the weaning period) through the application of positive pressure to
   the airway when delivered via an artificial airway, specifically an oral/nasal endotracheal
   or tracheostomy tube. Note: Ventilation and lung expansion devices that deliver positive
   pressure to the airway (for example: CPAP, BiPAP, bi-level, IPPB and PEEP) via non-invasive
   means (for example: nasal prongs, nasal mask, full face mask, total mask, etc.) are
   not considered ventilators unless positive pressure is delivered via an artificial
   airway (oral/nasal endotracheal or tracheostomy tube). </dd> <dt>Beds</dt> <dd>Baby
   beds in mom's room count as 1 bed, even if there are multiple baby beds Follow-up
   in progress if staffed is less than licensed. Total includes all beds, even if with
   surge beds it exceeds licensed beds. </dd> <dt>ICU beds</dt> <dd>Include NICU</dd>
   </dl>
   <h4>Group: Hospital COVID-19 Patient Encounters Reporting</h4>
   <p></p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#Encounters Encounters</li>
         </ul>
      </dd>
   </dl>
   <dl>
      <dt>subject</dt>
      <dd>Patient in room</dd>
      <dt>scoring</dt>
      <dd>queue-length</dd>
      <dt>type</dt>
      <dd>structure</dd>
      <dt>improvementNotation</dt>
      <dd>decrease</dd>
   </dl>
   <h5>Population: Patients with suspected or confirmed COVID-19 in any location.</h5>
   <p>Active encounters where the encounter diagnosis is suspected or confirmed COVID-19,
      or a Condition of suspected or confirmed COVID-19 was created during that encounter.
      This includes the patients with laboratory-confirmed  or clinically diagnosed COVID-19.
      <dl><dt>Confirmed</dt> <dd>A patient with a laboratory confirmed COVID-19 diagnosis</dd>
      <dt>Suspected</dt> <dd>A patient without a laboratory confirmed COVID-19 diagnosis
      who, in accordance with CDC’s Interim Public Health Guidance for Evaluating Persons
      Under Investigation (PUIs), has signs and symptoms compatible with COVID-19 (most
      patients with confirmed COVID-19 have developed fever and/or symptoms of acute respiratory
      illness, such as cough, shortness of breath or myalgia/fatigue).</dd> </dl>
   </p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19Pats All COVID-19 Confirmed or Suspected Patients</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#initial-population </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumC19Pats</h5>
   <p>This expression finds encounters that were active or finished in the reporting period,
      and their referenced Patient, Condition and Observation resources. It filters these
      based on cases where Encounter reports a reason or condition in the SuspectedOrDiagnosedCOVID19
      value set, or where a positive lab test from the Covid19Labs valueset, or where the
      patient has any such associated Condition or Observation resources in the prior two
      weeks.
   </p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre> ( %Base + 'Encounter?' +     '_include=Encounter:subject&amp;_include=Encounter:Condition&amp;' +     '_include=Encounter:reasonReference' +     '&amp;status=in-progress,finished' +     '&amp;date=ge' + %ReportingPeriod.start.toString() +     '&amp;date=lt' + %ReportingPeriod.end.toString()  ).resolve().select(entry.resource).  where(    iif(myMemberOf((Encounter.reasonCode | Condition.code), %SuspectedOrConfirmedCOVID19Diagnoses.url) |        Observation.where((myMemberOf(code, %Covid19Labs.url) and myMemberOf(value, %PositiveResults.url))      ),      true,      iif(        Patient.distinct().where(          %Base + 'Observation?_count=1' +          '&amp;status=registered,preliminary,final,amended,corrected' +          '&amp;patient=' + $this.id +          '&amp;date=gt' + (dateSubtract(%ReportingPeriod.start, 14 'days')).toString() +          '&amp;code:in=' + %Covid19Labs.url +          '&amp;value-concept:in=' + %PositiveResults.url        ).resolve().select(entry.resource as Observation).exists(), true,        Patient.distinct().where(          %Base + 'Condition?_count=1'+          '&amp;status:not=refuted&amp;status:not=entered-in-error' +          '&amp;patient=' + $this.id +          '&amp;verificationStatus:not=refuted,entered-in-error' +          '&amp;date=gt' + (dateSubtract(%ReportingPeriod.start, 14 'days')).toString() +          '&amp;code:in=' + SuspectedOrConfirmedCOVID19Diagnoses.url        ).resolve().select(entry.resource as Condition).exists()      )   ) ) .distinct() .aggregate(   iif($total.subject contains $this.subject,       $total, $total | $this   ) )</pre><h5>Stratifier: By Location and Ventilator Status</h5>
   <p>Stratifies the population by Location (inpatient vs ED/Overflow/Other) and Ventilator
      Status (Ventilated vs Not Ventilated)
   </p>
   <h5>Expression</h5>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>iif(%NumVentUse.id contains Encounter.subject,     iif(myMemberOf(Encounter.location.location.resolve().type, %InpatientLocations.url), 'InpVentilated', 'OFVentilated'),     iif(myMemberOf(Encounter.location.location.resolve().type, %InpatientLocations.url), 'InpNotVentilated', 'OFNotVentilated') )</pre><h4>Group: Hospital Onset COVID-19 Patient Encounters Reporting</h4>
   <p></p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#AcquiredCovid Acquired COVID-19 in Hospital</li>
         </ul>
      </dd>
   </dl>
   <dl>
      <dt>subject</dt>
      <dd>Hospital Acquired COVID-19</dd>
      <dt>scoring</dt>
      <dd>event-growth</dd>
      <dt>type</dt>
      <dd>outcome</dd>
      <dt>improvementNotation</dt>
      <dd>decrease</dd>
   </dl>
   <h5>Population: Patients with suspected or confirmed COVID-19 in an inpatient location</h5>
   <p>Patients with suspected or confirmed COVID-19 in an inpatient location</p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19HospPats Hospitalized COVID-19 Patients</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#initial-population </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumC19HospPats</h5>
   <p>Uses the value of NumC19Pat as the initial population</p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>%NumC19Pats.entry.resource.location.location.resolve().where(myMemberOf(type, %InpatientLocations.url))</pre><h5>Population: Hospital Onset COVID-19 Patients</h5>
   <p>Hospital Onset COVID-19 Patients</p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19HOPats Hospital Onset COVID-19 Patients</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#numerator </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumC19HOPats</h5>
   <p>Filters the initial population by ruling out those patients whose first suspected
      or confirmed diagnosis or lab result appears less than 14 days from admission.
   </p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Encounter.where(   iif(dateAdd(period.start,14 'days') &gt; today(),     false,     iif( (%Base + 'Condition?_count=1'+        '&amp;status:not=refuted&amp;status:not=entered-in-error' +        '&amp;patient=' + $this.subject +        '&amp;verificationStatus:not=refuted,entered-in-error' +        '&amp;date=gt' + (dateAdd($this.period.start,14 'days')).toString() +        '&amp;date=le' + (dateSubtract($this.period.start,14 'days')).toString() +        '&amp;code:in=' + %SuspectedOrConfirmedCOVID19Diagnoses.url       ).resolve().select(entry.resource as Condition).exists(),       false,       (%Base + 'Observation?_count=1' +        '&amp;status=registered,preliminary,final,amended,corrected' +        '&amp;patient=' + $this.subject +        '&amp;date=gt' + (dateSubtract($this.period.start, 14 'days')).toString() +        '&amp;date=le' + (dateAdd($this.period.start,14 'days')).toString() +        '&amp;code:in=' + %Covid19Labs.url +        '&amp;value-concept:in=' + %PositiveResults.url       ).resolve().select(entry.resource as Observation)      .empty()     )   ) ).select(patient).resolve().trace('patients', id)</pre><h5>Population: Cumulative Hospital Onset COVID-19 Patients</h5>
   <p>Cumulative Hospital Onset COVID-19 Patients</p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#cumC19HOPats Cumulative Hospital Onset COVID-19 Patients</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#denominator </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: CumC19HOPats</h5>
   <p>omputes the cumulative total from the prior measure report and the number of new infections
      detected in the current reporting period.
   </p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>iif(%PriorReport.empty(), 0, %PriorReport.group[1].population[2].count + %NumC19HOPats.total)</pre><h5>Stratifier: By Age Group</h5>
   <p>Stratifies the population by Age Group</p>
   <h5>Expression</h5>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Patient.select(   iif(dateAdd(birthDate, 20 'years') &lt; today(), 'P0Y--P20Y',     iif(dateAdd(birthDate, 30 'years') &lt; today(), 'P20Y--P30Y',       iif(dateAdd(birthDate, 40 'years') &lt; today(), 'P30Y--P40Y',         iif(dateAdd(birthDate, 50 'years') &lt; today(), 'P40Y--P50Y',           iif(dateAdd(birthDate, 60 'years') &lt; today(), 'P50Y--P60Y',             iif(dateAdd(birthDate, 70 'years') &lt; today(), 'P60Y--P70Y',               iif(dateAdd(birthDate, 80 'years') &lt; today(), 'P70Y--P80Y', 'P80Y-P9999Y')             )           )         )       )     )   ) )</pre><h5>Stratifier: By Gender</h5>
   <p>Stratifies the population by Gender</p>
   <h5>Expression</h5>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Patient.gender</pre><h5>Stratifier: By Ethnicity</h5>
   <p>Stratifies the population by Ethnicity</p>
   <h5>Expression</h5>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Patient.extension('http://hl7.org/fhir/us/core/StructureDefinition/us-ethnicity-category').extension('ombCategory').valueCoding.code</pre><h5>Stratifier: By Race</h5>
   <p>Stratifies the population by Race</p>
   <h5>Expression</h5>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Patient .extension('http://hl7.org/fhir/us/core/StructureDefinition/us-core-race') .extension('ombCategory') .select(   iif(valueCoding.count() &gt; 1,      'Mixed',      iif(valueCoding.system = 'http://terminology.hl7.org/CodeSystem/v3-NullFlavor',          'Unknown',          valueCoding.code      )   ) )</pre><h4>Group: COVID-19 Patient Death Reporting</h4>
   <p></p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#CovidDeaths COVID-19 Deaths</li>
         </ul>
      </dd>
   </dl>
   <dl>
      <dt>subject</dt>
      <dd>Patients with conformed or suspected COVID-19 who have died</dd>
      <dt>scoring</dt>
      <dd>event-growth</dd>
      <dt>type</dt>
      <dd>outcome</dd>
      <dt>improvementNotation</dt>
      <dd>decrease</dd>
   </dl>
   <h5>Population: Patients with suspected or confirmed COVID-19 in any location.</h5>
   <p>Patients with suspected or confirmed COVID-19 in any location.</p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19Pats All COVID-19 Confirmed or Suspected Patients</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#initial-population </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression</h5>
   <p>COVID-19 Patients in an inpatient setting</p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>%NumC19Pats.entry.resource</pre><h5>Population: Patients with suspected or confirmed COVID-19 who died in the hospital, ED, or any
      overflow location
   </h5>
   <p>Patients with suspected or confirmed COVID-19 who died in the hospital, ED, or any
      overflow location
   </p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19Died COVID-19 Patient Deaths</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#numerator </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumC19Died</h5>
   <p>Filters the initial population by selecting those who have died.</p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Encounter.where(   iif(     hospitalization.where(       myMemberOf(dispositionCode, %PatientExpired)     ),     true,     subject.resolve().where(deceasedBoolean = true | deceasedDateTime.exists())   ) ).select(subject).resolve()</pre><h5>Population: Cumulative total of Patients with suspected or confirmed COVID-19 who died in the
      hospital, ED, or any overflow location
   </h5>
   <p>Cumulative total of Patients with suspected or confirmed COVID-19 who died in the
      hospital, ED, or any overflow location
   </p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#cumC19Died Cumulative COVID-19 Patient Deaths</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#denominator </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: CumC19Died</h5>
   <p>Computes the cumulative total from the prior measure report and the number of new
      deaths in the current reporting period.
   </p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>iif(%PriorReport.empty(), 0, %PriorReport.group[2].population[2].count + %NumC29Died.count())</pre><h5>Stratifier: By Age Group</h5>
   <p>Stratifies the population by Age Group</p>
   <h5>Expression</h5>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Patient.select(   iif(dateAdd(birthDate, 20 'years') &lt; today(), 'P0Y--P20Y',     iif(dateAdd(birthDate, 30 'years') &lt; today(), 'P20Y--P30Y',       iif(dateAdd(birthDate, 40 'years') &lt; today(), 'P30Y--P40Y',         iif(dateAdd(birthDate, 50 'years') &lt; today(), 'P40Y--P50Y',           iif(dateAdd(birthDate, 60 'years') &lt; today(), 'P50Y--P60Y',             iif(dateAdd(birthDate, 70 'years') &lt; today(), 'P60Y--P70Y',               iif(dateAdd(birthDate, 80 'years') &lt; today(), 'P70Y--P80Y', 'P80Y-P9999Y')             )           )         )       )     )   ) )</pre><h5>Stratifier: By Gender</h5>
   <p>Stratifies the population by Gender</p>
   <h5>Expression</h5>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Patient.gender</pre><h5>Stratifier: By Ethnicity</h5>
   <p>Stratifies the population by Ethnicity</p>
   <h5>Expression</h5>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Patient.extension('http://hl7.org/fhir/us/core/StructureDefinition/us-ethnicity-category').extension('ombCategory').valueCoding.code</pre><h5>Stratifier: By Race</h5>
   <p>Stratifies the population by Race</p>
   <h5>Expression</h5>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Patient .extension('http://hl7.org/fhir/us/core/StructureDefinition/us-core-race') .extension('ombCategory') .select(   iif(valueCoding.code contains '1992-5', 'A', ' ') +   iif(valueCoding.code contains '2054-5', 'B', ' ') +   iif(valueCoding.code contains '2076-8', 'H', ' ') +   iif(valueCoding.code contains '2028-9', 'S', ' ') +   iif(valueCoding.code contains '2106-3', 'W', ' ') )</pre><h4>Group: Ventilator Reporting</h4>
   <p></p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#Ventilators Ventilators</li>
         </ul>
      </dd>
   </dl>
   <dl>
      <dt>subject</dt>
      <dd>Ventilator capacity</dd>
      <dt>scoring</dt>
      <dd>capacity</dd>
      <dt>type</dt>
      <dd>structure</dd>
      <dt>improvementNotation</dt>
      <dd>decrease</dd>
   </dl>
   <h5>Population: Total number of ventilators</h5>
   <p>Count of all ventilators that can support patient care, whether or not they are presently
      in use.
   </p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numVent Mechanical Ventilators</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#denominator </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumVent</h5>
   <p>Computes the total number of ventilators from the previously reported MeasureReport</p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>iif(trace('PriorReport exists:', %PriorReport.exists()), %PriorReport.group[3].population[0].count, 0)</pre><h5>Population: Total number of ventilators in use</h5>
   <p>Count of all ventilators in use.</p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numVentUse Mechanical Ventilators in Use</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#numerator </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumVentUse</h5>
   <p>dentifies the number of ventilators in use by counting Patient with an Observation
      or Procedure resource from an appropriate value set indicating ventilator use.
   </p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>( %Base + 'Encounter?' +   'status=in-progress,finished' +   '&amp;_include=Encounter:subject' +   '&amp;date=ge' + %ReportingPeriod.start.toString() +   '&amp;date=lt' + %ReportingPeriod.end.toString() ).resolve() .select(entry.resource as Patient) .where(   iif(     ( %Base + 'Observation?_count=1'+       '&amp;status=registered,preliminary,final,amended,corrected' +       '&amp;patient=' + $this.id +       '&amp;verificationStatus:not=refuted,entered-in-error' +       '&amp;date=gt' + %ReportingPeriod.start.toString()  +       '&amp;date=le' + %ReportingPeriod.end.toString() +       '&amp;code:in=' + %VentilatorObservations.url     ).resolve().select(entry.resource as Observation).exists(),     true,     ( %Base + 'Procedure?_count=1'+       '&amp;status=in-progress,competed' +       '&amp;patient=' + $this.id +       '&amp;date=gt' + %ReportingPeriod.start.toString()  +       '&amp;date=le' + %ReportingPeriod.end.toString()  +       '&amp;code:in=' + %VentilatorProcedures.url     ).resolve().select(entry.resource as Procedure).exists()   ) )</pre><h5>Population: Total number of ventilators not presently in use.</h5>
   <p>Count of all ventilators not presently in use.</p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numVentAvail Mechanical Ventilators Available</li>
         </ul>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasurePopulationSystem#numerator-complement </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumVentAvail</h5>
   <p>omputes the number of ventilators available by substracting the number of ventilators
      in use determined by population 1 from thee total number of ventilators given in population
      0
   </p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>%NumVent - %NumVentUse.total.toInteger()</pre><h4>Group: Bed Reporting</h4>
   <p></p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#Beds Beds</li>
         </ul>
      </dd>
   </dl>
   <dl>
      <dt>subject</dt>
      <dd>Bed capacity</dd>
      <dt>scoring</dt>
      <dd>capacity</dd>
      <dt>type</dt>
      <dd>structure</dd>
      <dt>improvementNotation</dt>
      <dd>decrease</dd>
   </dl>
   <h5>Population: Total number of beds</h5>
   <p>Total number of all Inpatient and outpatient beds, including all staffed, ICU, licensed,
      and overflow (surge) beds used for inpatients or outpatients
   </p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numTotBeds All Hospital Beds</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#denominator </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumTotBeds</h5>
   <p>Computes the total number of beds from the previously reported MeasureReport</p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>iif(%PriorReport.exists(),%PriorReport.group[3].population[0].count,0)</pre><h5>Population: Total number of beds in use</h5>
   <p>Total number of all Inpatient and outpatient beds that are occupied</p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numTotBedsOcc Hospital Beds Occupied</li>
         </ul>
         <ul>
            <li>http://terminology.hl7.org/CodeSystem/measure-population#numerator </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumTotBedsOcc</h5>
   <p>Identifies the number of beds in use by counting the most recent Encounter for each
      patient where the encounter was in-progress or finished within the period.
   </p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>( %Base + 'Encounter?' +   'status=in-progress' +   '&amp;date=ge' + %ReportingPeriod.start.toString() +   '&amp;date=lt' + %ReportingPeriod.end.toString() ).resolve().select(entry.resource as Encounter) .aggregate(    iif($total.select(location[0]).location contains $this.location.location.first(),        $total,        $total | $this    ) )</pre><h5>Population: Total number of hospital beds available</h5>
   <p>Total number of all hospital inpatient and outpatient beds that are available</p>
   <dl>
      <dt>Codes</dt>
      <dd>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numTotBedsAvail Hospital Beds Available</li>
         </ul>
         <ul>
            <li>http://hl7.org/fhir/saner/CodeSystem/MeasurePopulationSystem#numerator-complement </li>
         </ul>
      </dd>
   </dl>
   <h5>Expression: NumTotBedsAvail</h5>
   <p>omputes the number of beds  available by substracting the number of beds in use determined
      by population 1 from the total number of beds given in population 0
   </p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>%NumTotBeds - %NumTotBedsOcc.count()</pre><h5>Stratifier: By Type of Location</h5>
   <p>Inpatient Non-ICU, Inpatient ICU, Other</p>
   <h5>Expression</h5>
   <p>Determines the location of the encounter based on the membership of location.type
      in the InpatientLocations and ICULocations ValueSet resources. When location.type
      is assigned to any other value, it is reported to be Other
   </p>
   <dl>
      <dt>Language</dt>
      <dd>text/fhirpath</dd>
   </dl><pre>Encounter.location.location.resolve() .iif(myMemberOf(type, %InpatientLocations.url),     iif (myMemberOf(type, %ICULocations.url),         'Inpatient ICU',         'Inpatient Non-ICU'     ),     'Other' )</pre><h5>References</h5>


   <ul>
      <li><a href="" title="CDC/NHSN COVID-19 Patient Impact &amp; Hospital Capacity Module Home Page">NHSN COVID-19 Reporting</a></li>
      <li><a href="" title="Importing COVID-19 Patient Module Denominator data for Patient Safety Component">How to import COVID-19 Summary Data</a></li>
      <li><a href="" title="Instructions for Completion of the COVID-19 Patient Impact and Hospital Capacity Module Form (CDC 57.130)">Table of Instructions</a></li>
      <li><a href="" title="CDC/NHSN COVID-19 Reporting CSV File Template">CSV File Template</a></li>
   </ul>
</div>"""
