Instance: ComputableCDCPatientImpactAndHospitalCapacity
InstanceOf: PublicHealthMeasure
Title: "Computable CDC Patient Impact and Hospital Capacity"
Description: "This measure demonstrates automated reporting on bed availability and use at a facility location based on CDC/NHSN reporting requirements."
Usage: #example
* insert SanerDefinitionContent
 * useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
 * useContext.valueCodeableConcept = http://snomed.info/sct#840539006 "COVID-19"
 * definition = """Ventilator
: Any device used to support, assist or control respiration (inclusive of the weaning period) through the application of positive
pressure to the airway when delivered via an artificial airway, specifically an oral/nasal endotracheal or tracheostomy tube.
Note: Ventilation and lung expansion devices that deliver positive pressure to the airway (for example: CPAP, BiPAP, bi-level, IPPB and
PEEP) via non-invasive means (for example: nasal prongs, nasal mask, full face mask, total mask, etc.) are not considered ventilators
unless positive pressure is delivered via an artificial airway (oral/nasal endotracheal or tracheostomy tube).

Beds
: Baby beds in mom's room count as 1 bed, even if there are multiple baby beds
Follow-up in progress if staffed is less than licensed.
Total includes all beds, even if with surge beds it exceeds licensed beds.

ICU beds
: Include NICU (from CDC Webinar 31-Mar-2020) (outstanding question on burn unit)
"""
 * author.name = "Centers for Disease Control/National Healthcare Safety Network (CDC/NHSN)"  // Fully spelled out name (Acronym)
 * author.telecom.system = #email
 * author.telecom.value = "mailto:nhsn@cdc.gov"  // adding the url schema so that tooling won't be annoyed.
 * insert DailyReporting
 * name = "ComputableCDCPatientImpactAndHospitalCapacity"
 * url = "http://hl7.org/fhir/us/saner/Measure/ComputableCDCPatientImpactAndHospitalCapacity"
 * title = "Patient Impact and Hospital Capacity"  // Official name of measure being represented as given by the author
 * insert NHSNArtifacts
 * library = Canonical(ComputableNHSNMeasureLibrary)

// COVID-19 Patients
 //* with group[0].code do
 * group[0].code.coding = MeasureGroupSystem#Encounters
 * group[0].code.coding.display = "Encounters"
 * group[0].code.text = "Hospital COVID-19 Patient Encounters Reporting"
 //* with group[0].extension[groupAtts] do
 * group[0].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/PublicHealthMeasureScoring#queue-length
 * group[0].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
 * group[0].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#decrease
 //** with extension[subject] do
 * group[0].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Encounter
 * group[0].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#398284004
 * group[0].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Patient in room"
 * group[0].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Patient in room"
 * group[0].extension[groupAtts].extension[rateAggregation].valueString = "point-in-time"
 //* with group[0].population[0] do
 //** with code do
 * group[0].population[0].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numC19Pats
 * group[0].population[0].code.coding.display = "All COVID-19 Confirmed or Suspected Patients"
 * group[0].population[0].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
 * group[0].population[0].code.text = "Patients with suspected or confirmed COVID-19 in any location."
 * group[0].population[0].description = """Active encounters where the encounter diagnosis is suspected or confirmed COVID-19,
 or a Condition of suspected or confirmed COVID-19 was created during that encounter.  This includes the patients with laboratory-confirmed
 or clinically diagnosed COVID-19.

Confirmed
: A patient with a laboratory confirmed COVID-19 diagnosis

Suspected
: A patient without a laboratory confirmed COVID-19 diagnosis who, in accordance with CDC’s Interim Public Health Guidance
for Evaluating Persons Under Investigation (PUIs), has signs and symptoms compatible with COVID-19 (most patients with confirmed
COVID-19 have developed fever and/or symptoms of acute respiratory illness, such as cough, shortness of breath or myalgia/fatigue).
"""
 //** with criteria do
 * group[0].population[0].criteria.name = "NumC19Pats"  // Note: Follow PascalCase conventions for names
 * group[0].population[0].criteria.description = """Active encounters where the encounter diagnosis is suspected or confirmed COVID-19,
 or a Condition of suspected or confirmed COVID-19 was created during that encounter.  This includes the patients with laboratory-confirmed
 or clinically diagnosed COVID-19.

Confirmed
: A patient with a laboratory confirmed COVID-19 diagnosis

Suspected
: A patient without a laboratory confirmed COVID-19 diagnosis who, in accordance with CDC’s Interim Public Health Guidance
for Evaluating Persons Under Investigation (PUIs), has signs and symptoms compatible with COVID-19 (most patients with confirmed
COVID-19 have developed fever and/or symptoms of acute respiratory illness, such as cough, shortness of breath or myalgia/fatigue).
"""
 * group[0].population[0].criteria.language = #text/fhirpath
 * group[0].population[0].criteria.expression = """
     // Start with encounters that were active during the reporting period. Note, this may find the same patient twice
     // because they may have had an ED encounter followed by an inpatient encounter both within the reporting period.
     (%Base + '/Encounter?_include=Encounter:*&status=in-progress,finished'
            + '&date=ge' + %ReportingPeriod.start +
            + '&date=lt' + %ReportingPeriod.end
     ).resolve().select(resource).
     where(
       iif(
         // The reason is a positive lab test result
         Observation.where(code.memberOf(%Covid19Labs.url) and value.memberOf(%PositiveResults.url)) or

         // The reason or diagnosis associated with the encounter is COVID-19
         ( Encounter.reasonCode | Condition.code ).memberOf(%SuspectedOrDiagnosedCOVID19.url),

         iif(
           // The patient has at least one laboratory diagnostic test confirming COVID-19 in the past 14 days
           Patient.distinct().where(
             %Base + '/Observation?_count=1' +
             '&status=registered,preliminary,final,amended,corrected' +
             '&patient=' + $this.id +
             '&date=gt' + (%ReportingPeriod.start - 14 days) +
             '&code:in=' + %Covid19Labs.url +
             '&value-concept:in=' + %PositiveResults.url
           ).resolve().select(resource as Observation).exists(),

           // The patient has at least one condition with confirmed or suspected COVID-19 in the past 14 days
           Patient.distinct().where(
             %Base + '/Condition?_count=1'+
             '&status:not=refuted&status:not=entered-in-error' +
             '&patient=' + $this.id +
             '&verificationStatus:not=refuted,entered-in-error' +
             '&date=gt' + (%ReportingPeriod.start - 14 days) +
             '&code:in=' + SuspectedOrConfirmedCOVID19Diagnoses.url,
           )
         )
      ).resolve().select(resource as Condition).exists()
    )
    // Finally, resolve to the unique list of encounters (just in case)
    .distinct()
    // And remove duplicate encounters for the same patient
    // NOTE! Assumes that encounters are returned in order by most to least recent
    // This assumption holds commonly on many implementations, but may not be true
    // for all cases. In the worst case scenario where it does not, the situation
    // will be corrected in the very next reporting period, where only the most
    // recent encounter will appear.
    .aggregate(
      iif($total.subject contains $this.subject,
          {}, $total | $this
      )
    )
    """
 //* with group[0].stratifier[0] do
 * group[0].stratifier[0].code.text = "By Location and Ventilator Status"
 * group[0].stratifier[0].description = "Stratifies the population by Location (inpatient vs ED/Overflow/Other) and Ventilator Status (Ventilated vs Not Ventilated)"
 * group[0].stratifier[0].criteria.name = "LocationAndVentStatus"
 * group[0].stratifier[0].criteria.language = #text/fhirpath
 * group[0].stratifier[0].criteria.expression = """
      iif(%NumVentUse.id contains Encounter.subject,
          iif(Encounter.location.resolve().type.memberOf(%InpatientLocations.url), 'InpVentilated', 'OFVentilated')
          iif(Encounter.location.resolve().type.memberOf(%InpatientLocations.url), 'InpNotVentilated', 'OFNotVentilated')
      )
 """
// Hospital Acquired COVID-19
 //* with group[1].code do
 * group[1].code.coding = MeasureGroupSystem#AcquiredCovid
 * group[1].code.coding.display = "Acquired COVID-19 in Hospital"
 * group[1].code.text = "Hospital Onset COVID-19 Patient Encounters Reporting"

 //* with group[1].extension[groupAtts] do
 * group[1].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/PublicHealthMeasureScoring#event-growth
 * group[1].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#outcome
 * group[1].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#decrease
 //** with extension[subject] do
 * group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Patient
 * group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = #"116154003|Patient|: 20401003|With| = (840539006|COVID-19|: 246512002|Timing| = 277056009|Hospital Acquired|)"
 * group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Patient: With = COVID-19: Timing = Hospital Acquired"
 * group[1].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Hospital Acquired COVID-19"
 * group[1].extension[groupAtts].extension[rateAggregation].valueString = "cumulative"

 //* with group[1].population[0].code do
 * group[1].population[0].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numC19HospPats
 * group[1].population[0].code.coding.display = "Hospitalized COVID-19 Patients"
 * group[1].population[0].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
 * group[1].population[0].code.text = "Patients with suspected or confirmed COVID-19 in an inpatient location"
 * group[1].population[0].description = "Patients with suspected or confirmed COVID-19 in an inpatient location"
 //* with group[1].population[1].code do
 * group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numC19HOPats
 * group[1].population[1].code.coding.display = "Hospital Onset COVID-19 Patients"
 * group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
 * group[1].population[1].code.text = "Hospital Onset COVID-19 Patients"
 * group[1].population[1].description = "Hospital Onset COVID-19 Patients"

 //* with group[1].population[2].code do
 * group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#cumC19HOPats
 * group[1].population[2].code.coding.display = "Cumulative Hospital Onset COVID-19 Patients"
 * group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
 * group[1].population[2].code.text = "Cumulative Hospital Onset COVID-19 Patients"
 * group[1].population[2].description = "Cumulative Hospital Onset COVID-19 Patients"

 //* with group[1].population[0].criteria do
 // This criteria does not have a name because it duplicates a computed criteria in another group.
 * group[1].population[0].criteria.description = "Uses the value of NumC19HospPat as the initial population"

 //* with group[1].population[1].criteria do
 * group[1].population[1].criteria.name = "NumC19HOPats"
 * group[1].population[1].criteria.description = """Filters the initial population by ruling out those patients whose first suspected or
 confirmed diagnosis or lab result appears less than 14 days from admission."""

 //* with group[1].population[2].criteria do
 * group[1].population[2].criteria.name = "CumC19HOPats"
 * group[1].population[2].criteria.description = """Computes the cumulative total from the prior measure report and the number of new
 infections detected in the current reporting period."""

 //* with group[1].population[0].criteria do
 * group[1].population[0].criteria.language = #text/fhirpath
 * group[1].population[0].criteria.expression = "%NumC19HospPats"

 //* with group[1].population[1].criteria do
 // This expression will be reused to compute the value for the CumC19HOPats
 // population so it must have a name.
 * group[1].population[1].criteria.name = "NumC19HOPats"
 * group[1].population[1].criteria.name = "NumC19HOPats"
 * group[1].population[1].criteria.language = #text/fhirpath
 * group[1].population[1].criteria.expression = """
    Encounter.where(
      iif(
        // Rule out any encounter that is less than 14 days old.
        period.start + 14 days > today(),
        // return false to rule out this encounter.
        false,
        iif(
          // Rule out patients who have a diagnosis of suspected or confirmed
          // Covid prior between period.start - 14 days and period.start + 14 days
          (%Base + '/Condition?_count=1'+
           '&status:not=refuted&status:not=entered-in-error' +
           '&patient=' + $this.subject +
           '&verificationStatus:not=refuted,entered-in-error' +
           '&date=gt' + ($this.period.start - 14 days) +
           '&date=le' + ($this.period.start + 14 days) +
           '&code:in=' + %SuspectedOrConfirmedCOVID19Diagnoses.url
          ).resolve().select(resource as Condition).exists(),
          // return false to rule out this encounter
          false,
          // Rule out remaining patients who have a positive lab result between
          // period.start - 14 days and period.start + 14 days
          (%Base + '/Observation?_count=1' +
           '&status=registered,preliminary,final,amended,corrected' +
           '&patient=' + $this.subject +
           '&date=gt' + ($this.period.start - 14 days) +
           '&date=le' + ($this.period.start + 14 days) +
           '&code:in=' + %Covid19Labs.url +
           '&value-concept:in=' + %PositiveResults.url
          ).resolve().select(resource as Observation)
          // If the query returned an observations, then empty() will return false, ruling
          // out this encounter.
          .empty()
        )
      )
    )
    // Resolve to patient to simplify stratification
    .select(patient).resolve()
 """

 //* with group[1].population[2].criteria do
 * group[1].population[2].criteria.language = #text/fhirpath
 * group[1].population[2].criteria.expression = "iif(%PriorReport.empty(),0,%PriorReport.group[1].population[2].count) + %NumC19HOPats)"

 //* with group[1].stratifier[0] do
 * group[1].stratifier[0].code.text = "By Age Group"
 * group[1].stratifier[0].description = "Stratifies the population by Age Group"
 * group[1].stratifier[0].criteria.name = "AgeGroup"
 * group[1].stratifier[0].criteria.language = #text/fhirpath
 * group[1].stratifier[0].criteria.expression = """
    Patient.select(
      iif(birthDate + 20 years < today(), 'P0Y--P20Y',
        iif(birthDate + 30 years < today(), 'P20Y--P30Y',
          iif(birthDate + 40 years < today(), 'P30Y--P40Y',
            iif(birthDate + 50 years < today(), 'P40Y--P50Y',
              iif(birthDate + 60 years < today(), 'P50Y--P60Y',
                iif(birthDate + 70 years < today(), 'P60Y--P70Y',
                  iif(birthDate + 80 years < today(), 'P70Y--P80Y', 'P80Y-P9999Y')
                )
              )
            )
          )
        )
      )
    )
 """

 //* with group[1].stratifier[1] do
 * group[1].stratifier[1].code.text = "By Gender"
 * group[1].stratifier[1].description = "Stratifies the population by Gender"
 * group[1].stratifier[1].criteria.name = "Gender"
 * group[1].stratifier[1].criteria.language = #text/fhirpath
 * group[1].stratifier[1].criteria.expression = "Patient.gender"

 //* with group[1].stratifier[2] do
 * group[1].stratifier[2].code.text = "By Ethnicity"
 * group[1].stratifier[2].description = "Stratifies the population by Ethnicity"
 * group[1].stratifier[2].criteria.name = "Ethnicity"
 * group[1].stratifier[2].criteria.language = #text/fhirpath
 * group[1].stratifier[2].criteria.expression = """
    Patient.extension('http://hl7.org/fhir/us/core/StructureDefinition/us-ethnicity-category').extension('ombCategory').valueCoding.code
    """

 //* with group[1].stratifier[3] do
 * group[1].stratifier[3].code.text = "By Race"
 * group[1].stratifier[3].description = "Stratifies the population by Race"
 * group[1].stratifier[3].criteria.name = "Race"
 * group[1].stratifier[3].criteria.language = #text/fhirpath
 * group[1].stratifier[3].criteria.expression = """
    Patient
    .extension('http://hl7.org/fhir/us/core/StructureDefinition/us-core-race')
    .extension('ombCategory')
    .select(
      iif(valueCoding.count() > 1,
         'Mixed',
         iif(valueCoding.system = 'http://terminology.hl7.org/CodeSystem/v3-NullFlavor',
             'Unknown',
             valueCoding.code
         )
    )
    """

// COVID-19 Deaths
 //* with group[2].code do
 * group[2].code.coding = MeasureGroupSystem#CovidDeaths
 * group[2].code.coding.display = "COVID-19 Deaths"
 * group[2].code.text =  "COVID-19 Patient Death Reporting"
 //* with group[2].extension[groupAtts] do
 * group[2].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/PublicHealthMeasureScoring#event-growth
 * group[2].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#outcome
 * group[2].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#decrease
 //** with extension[subject] do
 * group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Patient
 * group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = #419620001 "Death"
 * group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Patient Deaths"
 * group[2].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Patients with conformed or suspected COVID-19 who have died"
 * group[2].extension[groupAtts].extension[rateAggregation].valueString = "cumulative"

 //* with group[2].population[0].code do
 * group[2].population[0].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numC19Pats
 * group[2].population[0].code.coding.display = "All COVID-19 Confirmed or Suspected Patients"
 * group[2].population[0].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
 * group[2].population[0].code.text = "Patients with suspected or confirmed COVID-19 in any location."
 * group[2].population[0].description = "Patients with suspected or confirmed COVID-19 in any location."

 //* with group[2].population[1].code do
 * group[2].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numC19HOPats
 * group[2].population[1].code.coding.display = "Hospital Onset COVID-19 Patients"
 * group[2].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
 * group[2].population[1].code.text = "Hospital Onset COVID-19 Patients"
 * group[2].population[1].description = "Hospital Onset COVID-19 Patients"

 //* with group[2].population[2].code do
 * group[2].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#cumC19HOPats
 * group[2].population[2].code.coding.display = "Cumulative Hospital Onset COVID-19 Patients"
 * group[2].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
 * group[2].population[2].code.text = "Cumulative Hospital Onset COVID-19 Patients"
 * group[2].population[2].description = "Cumulative Hospital Onset COVID-19 Patients"

 //* with group[2].population[0].criteria do
 // This criteria does not have a name because it duplicates a previously computed criteria
 * group[2].population[0].criteria.description = """COVID-19 Patients in an inpatient setting"""

 //* with group[2].population[1].criteria do
 * group[2].population[1].criteria.name = "NumC19Died"
 * group[2].population[1].criteria.description = """Filters the initial population by selecting those who have died."""

 //* with group[2].population[2].criteria do
 * group[2].population[2].criteria.name = "CumC19Died"
 * group[2].population[2].criteria.description = """Computes the cumulative total from the prior measure report and the number of new deaths in the current reporting period."""

 //* with group[2].population[0].criteria do
 * group[2].population[0].criteria.language = #text/fhirpath
 * group[2].population[0].criteria.expression = "%NumC19HospPats"

 //* with group[2].population[1].criteria do
 // This expression will be reused to compute the value for the CumC19HOPats
 // population so it must have a name.
 * group[2].population[1].criteria.name = "NumC19Died"
 * group[2].population[1].criteria.language = #text/fhirpath
 * group[2].population[1].criteria.expression = """
    Encounter.where(
      iif(
        hospitalization.where(
          dispositionCode.memberOf(%PatientExpired)
        ),
        true,
        subject.resolve().where(deceasedBoolean = true | deceasedDateTime.exists())
      )
    )
    // Resolve to patient to simplify stratification
    .select(subject).resolve()
 """

 //* with group[2].population[2].criteria do
 * group[2].population[2].criteria.name = "CumC19Died"
 * group[2].population[2].criteria.language = #text/fhirpath
 * group[2].population[2].criteria.expression = "iif(%PriorReport.empty(),0,%PriorReport.group[2].population[2].count) + %NumC29Died)"

 //* with group[2].stratifier[0] do
 * group[2].stratifier[0].code.text = "By Age Group"
 * group[2].stratifier[0].description = "Stratifies the population by Age Group"
 * group[2].stratifier[0].criteria.name = "AgeGroup"
 * group[2].stratifier[0].criteria.language = #text/fhirpath
 * group[2].stratifier[0].criteria.expression = """
    Patient.select(
      iif(birthDate + 20 years < today(), 'P0Y--P20Y',
        iif(birthDate + 30 years < today(), 'P20Y--P30Y',
          iif(birthDate + 40 years < today(), 'P30Y--P40Y',
            iif(birthDate + 50 years < today(), 'P40Y--P50Y',
              iif(birthDate + 60 years < today(), 'P50Y--P60Y',
                iif(birthDate + 70 years < today(), 'P60Y--P70Y',
                  iif(birthDate + 80 years < today(), 'P70Y--P80Y', 'P80Y-P9999Y')
                )
              )
            )
          )
        )
      )
    )
 """

 //* with group[2].stratifier[1] do
 * group[2].stratifier[1].code.text = "By Gender"
 * group[2].stratifier[1].description = "Stratifies the population by Gender"
 * group[2].stratifier[1].criteria.name = "Gender"
 * group[2].stratifier[1].criteria.language = #text/fhirpath
 * group[2].stratifier[1].criteria.expression = "Patient.gender"

 //* with group[2].stratifier[2] do
 * group[2].stratifier[2].code.text = "By Ethnicity"
 * group[2].stratifier[2].description = "Stratifies the population by Ethnicity"
 * group[2].stratifier[2].criteria.name = "Ethnicity"
 * group[2].stratifier[2].criteria.language = #text/fhirpath
 * group[2].stratifier[2].criteria.expression = """
    Patient.extension('http://hl7.org/fhir/us/core/StructureDefinition/us-ethnicity-category').extension('ombCategory').valueCoding.code
    """

 //* with group[2].stratifier[3] do
 * group[2].stratifier[3].code.text = "By Race"
 * group[2].stratifier[3].description = "Stratifies the population by Race"
 * group[2].stratifier[3].criteria.name = "Race"
 * group[2].stratifier[3].criteria.language = #text/fhirpath
 * group[2].stratifier[3].criteria.expression = """
    Patient
    .extension('http://hl7.org/fhir/us/core/StructureDefinition/us-core-race')
    .extension('ombCategory')
    .select(
      iif(valueCoding.code contains '1992-5', 'A', ' ') +
      iif(valueCoding.code contains '2054-5', 'B', ' ') +
      iif(valueCoding.code contains '2076-8', 'H', ' ') +
      iif(valueCoding.code contains '2028-9', 'S', ' ') +
      iif(valueCoding.code contains '2106-3', 'W', ' ')
    )
    """

// Ventiltors
 * group[3].code.coding = MeasureGroupSystem#Ventilators
 * group[3].code.coding.display = "Ventilators"
 * group[3].code.text = "Ventilator Reporting"
 * group[3].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/PublicHealthMeasureScoring#capacity
 * group[3].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
 * group[3].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#decrease
 * group[3].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
 * group[3].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#257463002 "Ventilator Outlet"
 * group[3].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Ventilator capacity"
 * group[3].extension[groupAtts].extension[rateAggregation].valueString = "point-in-time"

 * group[3].population[0].code.coding[0] = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numVent "Mechanical Ventilators"
 * group[3].population[0].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
 * group[3].population[0].code.text = "Total number of ventilators"
 * group[3].population[0].description = "Count of all ventilators that can support patient care, whether or not they are presently in use."

 * group[3].population[1].code.coding[0] = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numVentUse "Mechanical Ventilators in Use"
 * group[3].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
 * group[3].population[1].code.text = "Total number of ventilators in use"
 * group[3].population[1].description = "Count of all ventilators in use."

 * group[3].population[2].code.coding[0] = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numVentAvail "Mechanical Ventilators Available"
 * group[3].population[2].code.coding[1] = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#numerator-complement
 * group[3].population[2].code.text = "Total number of ventilators not presently in use."
 * group[3].population[2].description = "Count of all ventilators not presently in use."

 * group[3].population[0].criteria.name = "NumVent"
 * group[3].population[0].criteria.description = """Computes the total number of ventilators from the previously reported MeasureReport"""
 * group[3].population[0].criteria.language = #text/fhirpath
 * group[3].population[0].criteria.expression = "%PriorReport.group[3].population[0].count"

 * group[3].population[1].criteria.name = "NumVentUse"
 * group[3].population[1].criteria.description = """Identifies the number of ventilators in use by counting Patient with an Observation
 or Procedure resource from an appropriate value set indicating ventilator use."""
 * group[3].population[1].criteria.language = #text/fhirpath
 * group[3].population[1].criteria.expression = """
       // Find all active encounters
       (
         %Base + '/Encounter?' +
         // Get only those encounters which were in-progress or finished during the reporting period
         'status= in-progress,finished' +
         // Include the patient in the results
         '&_include=Encounter:subject'+
         '&date=ge' + %ReportingPeriod.start +
         '&date=lt' + %ReportingPeriod.end
       ).resolve()
       // Filter to patients
       .select(resource as Patient)
       .where(
         iif(
           ( %Base + '/Observation?_count=1'+
             '&status=registered,preliminary,final,amended,corrected' +
             '&patient=' + $this.id +
             '&verificationStatus:not=refuted,entered-in-error' +
             '&date=gt' + %ReportingPeriod.start  +
             '&date=le' + %ReportingPeriod.end  +
             '&code:in=' + %VentilatorObservations.url
           ).resolve().select(resource as Observation).exists(),
           true,
           ( %Base + '/Procedure?_count=1'+
             '&status=in-progress,competed' +
             '&patient=' + $this.id +
             '&date=gt' + %ReportingPeriod.start  +
             '&date=le' + %ReportingPeriod.end  +
             '&code:in=' + %VentilatorProcedures.url
           ).resolve().select(resource as Procedure).exists()
         )
       )
 """
 * group[3].population[2].criteria.name = "NumVentAvail"
 * group[3].population[2].criteria.description = """Computes the number of ventilators available by substracting the number of ventilators in use
 determined by population 1 from thee total number of ventilators given in population 0
 """
 * group[3].population[2].criteria.language = #text/fhirpath
 * group[3].population[2].criteria.expression = "%NumVent - %NumVentUse.count()"

// Beds
 * group[4].code.coding = MeasureGroupSystem#Beds
 * group[4].code.coding.display = "Beds"
 * group[4].code.text = "Bed Reporting"
 * group[4].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/PublicHealthMeasureScoring#capacity
 * group[4].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
 * group[4].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#decrease
 * group[4].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
 * group[4].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#91537007 "Hospital Bed"
 * group[4].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Bed capacity"
 * group[4].extension[groupAtts].extension[rateAggregation].valueString = "point-in-time"

 * group[4].population[0].code.coding[0] = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numTotBeds "All Hospital Beds"
 * group[4].population[0].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
 * group[4].population[0].code.text = "Total number of beds"
 * group[4].population[0].description = """
 Total number of all Inpatient and outpatient beds, including all staffed, ICU,
 licensed, and overflow (surge) beds used for inpatients or outpatients"""

 * group[4].population[1].code.coding[0] = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numTotBedsOcc "Hospital Beds Occupied"
 * group[4].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
 * group[4].population[1].code.text = "Total number of beds in use"
 * group[4].population[1].description = "Total number of all Inpatient and outpatient beds that are occupied"

 * group[4].population[2].code.coding[0] = http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues#numTotBedsAvail "Hospital Beds Available"
 * group[4].population[2].code.coding[1] = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#numerator-complement
 * group[4].population[2].code.text = "Total number of hospital beds available"
 * group[4].population[2].description = "Total number of all hospital inpatient and outpatient beds that are available"

 * group[4].population[0].criteria.name = "NumTotBeds"
 * group[4].population[0].criteria.description = """Computes the total number of beds from the previously reported MeasureReport"""
 * group[4].population[0].criteria.language = #text/fhirpath
 * group[4].population[0].criteria.expression = "%PriorReport.group[3].population[0].count"

 * group[4].population[1].criteria.name = "NumTotBedsOcc"
 * group[4].population[1].criteria.description = """
 Identifies the number of beds in use by counting the most recent Encounter for each patient where the encounter
 was in-progress or finished within the period.
   """
 * group[4].population[1].criteria.language = #text/fhirpath
 * group[4].population[1].criteria.expression = """
       // Find all active encounters
       (
         %Base + '/Encounter?' +
         // Get only those encounters which are in-progress during the reporting period
         // because if an encounter finished during the reporting period, the bed is now
         // available.
         'status=in-progress' +
         '&date=ge' + %ReportingPeriod.start +
         '&date=lt' + %ReportingPeriod.end
       ).resolve().select(resource as Encounter)
       // Select the most recent encounter for each location
       // Assumes that encounters are returned in reverse chonological order
       // and that the most recent location is reported first in the list
       // of locations.
       .aggregate(
          iif($total.select(location[0]).location contains $this.location.location.first(),
              {},
              $total | $this
          )
       )
       // NOTE: Aggregate returns a list of both Encounter and Location resources
       // representing beds in use.
       // From Encounter, one can get to both the Patient (via Encounter.subject) and
       // Location resources (via Encounter.location.location).  This enables the result
       // to be stratifed by patient demographics, or location type.
 """

 * group[4].population[2].criteria.name = "NumTotBedsAvail"
 * group[4].population[2].criteria.description = """Computes the number of beds  available by substracting the number of beds in use
 determined by population 1 from the total number of beds given in population 0
 """
 * group[4].population[2].criteria.language = #text/fhirpath
 * group[4].population[2].criteria.expression = "%NumTotBeds - %NumTotBedsOcc.count()"

 * group[4].stratifier.code.text = "By Type of Location"
 * group[4].stratifier.description = "Inpatient Non-ICU, Inpatient ICU, Other"
 * group[4].stratifier.criteria.description = """
 Determines the location of the encounter based on the membership
 of location.type in the InpatientLocations and ICULocations ValueSet resources.
 When location.type is assigned to any other value, it is reported to be Other
 """
 * group[4].stratifier.criteria.language = #text/fhirpath
 * group[4].stratifier.criteria.expression = """
    Encounter.location.location.resolve()
    .iif(type.memberOf(%InpatientLocations.url),
        iif (type.memberOf(%ICULocations.url),
            'Inpatient ICU',
            'Inpatient Non-ICU'
        ),
        'Other'
    )
"""
