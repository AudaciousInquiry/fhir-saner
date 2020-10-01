RuleSet: NHSNArtifacts
 * relatedArtifact[0].type = http://hl7.org/fhir/ValueSet/library-type#documentation
 * relatedArtifact[0].url = "https://web.archive.org/web/20200501215043/https://www.cdc.gov/nhsn/acute-care-hospital/covid19/"
 * relatedArtifact[0].label = "NHSN COVID-19 Reporting"  // Descriptive Text to display in a Link
 * relatedArtifact[0].display = "CDC/NHSN COVID-19 Patient Impact & Hospital Capacity Module Home Page" // Title of the link target page
 * relatedArtifact[1].type = http://hl7.org/fhir/ValueSet/library-type#documentation
 * relatedArtifact[1].url = "https://web.archive.org/web/20200501215043/https://www.cdc.gov/nhsn/pdfs/covid19/import-covid19-data-508.pdf"
 * relatedArtifact[1].label = "How to import COVID-19 Summary Data"
 * relatedArtifact[1].display = "Importing COVID-19 Patient Module Denominator data for Patient Safety Component"
 * relatedArtifact[2].type = http://hl7.org/fhir/ValueSet/library-type#documentation
 * relatedArtifact[2].url = "https://web.archive.org/web/20200501215043/https://www.cdc.gov/nhsn/pdfs/covid19/57.130-toi-508.pdf"
 * relatedArtifact[2].label = "Table of Instructions"
 * relatedArtifact[2].display = "Instructions for Completion of the COVID-19 Patient Impact and Hospital Capacity Module Form (CDC 57.130)"
 * relatedArtifact[3].type = http://hl7.org/fhir/ValueSet/library-type#documentation
 * relatedArtifact[3].url = "https://web.archive.org/web/20200501215043/https://www.cdc.gov/nhsn/pdfs/covid19/covid19-test-csv-import.csv"
 * relatedArtifact[3].label = "CSV File Template"
 * relatedArtifact[3].display = "CDC/NHSN COVID-19 Reporting CSV File Template"

Instance: NHSNMeasureLibrary
InstanceOf: PublicHealthMeasureLibrary
// We aren't automating anything other than patient impact and hospital capacity, this library
// will be referenced by other NHSN inspired measures but will not be used by them.

 * insert SanerDefinitionContent
 * id = "NHSNMeasureLibrary"
 * name = "NHSNMeasureLibrary"
 * url = "http://hl7.org/fhir/saner/StructureDefinition/NHSNMeasureLibrary"
 * title = "NHSN Patient Impact and Hospital Capacity Measure Library"
 * type = http://terminology.hl7.org/CodeSystem/library-type#asset-collection
 * useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
 * useContext.valueCodeableConcept = http://snomed.info/sct#840539006 "COVID-19"
 * author.name = "HL7 Public Health Workgroup"
 * author.telecom.system = #email
 * author.telecom.value = "mailto:pher@lists.hl7.org"
 * insert NHSNArtifacts
 * content[0].id = "SARSCoV2Labs"
 * content[0].contentType = #application/fhir+xml
 * content[0].title = "C19HCC SARS coronavirus 2 Qualitative Detection Laboratory Tests"
 * content[0].url = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.109"

 * content[1].id = "COVID19DXSNOMED"
 * content[1].contentType = #application/fhir+xml
 * content[1].title = "COVID_19 SNOMED CT (Disorders)"
 * content[1].url = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1124"

 * content[2].id = "COVID19DXICD10"
 * content[2].contentType = #application/fhir+xml
 * content[2].title = "COVID_19 ICD-10 (Disorders)"
 * content[2].url = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1123"

 * content[3].id = "Remdesivir"
 * content[3].contentType = #application/fhir+xml
 * content[3].title = "Remdesivir"
 * content[3].url = Canonical(Remdesivir)

 * content[4].id = "COVID19Exposure"
 * content[4].contentType = #application/fhir+xml
 * content[4].title = "COVID_19 (COVID_19 Exposure)"
 * content[4].url = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1203"

 * content[5].id = "SuspectedCOVID19"
 * content[5].contentType = #application/fhir+xml
 * content[5].title = "C19HCC Suspected COVID19 Infection"
 * content[5].url = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.116"

 * content[6].id = "HealthcareServiceLocation"
 * content[6].contentType = #application/fhir+xml
 * content[6].title = "Healthcare Service Location"
 * content[6].url = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.13.192.16.840.1.113883.1.11.20275"

 * content[7].id = "PatientsOnVentilator"
 * content[7].contentType = #application/fhir+xml
 * content[7].title = "Patients on a Ventilator"
 * content[7].url = Canonical(PatientsOnVentilator)

/* PLACEHOLDERS for the next two

 * content[8].contentType = #application/fhir+xml
 * content[8].title = "COVID_19 (Disorders)"
 * content[8].url = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1124"

 * content[9].contentType = #application/fhir+xml
 * content[9].title = "COVID_19 (Disorders)"
 * content[9].url = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1124"
*/

// This sheet convert output to FHIR Shorthand for generating measures.
Instance: CDCPatientImpactAndHospitalCapacity
InstanceOf: PublicHealthMeasure
Title: "CDC Patient Impact and Hospital Capacity"
Description: "This measure demonstrates reporting on bed availability and use at a facility location based on CDC/NHSN reporting requirements."
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
 * name = "CDCPatientImpactAndHospitalCapacity"
 * url = "http://hl7.org/fhir/saner/Measure/CDCPatientImpactAndHospitalCapacity"
 * title = "Patient Impact and Hospital Capacity"  // Official name of measure being represented as given by the author
 * insert NHSNArtifacts
 * library = Canonical(NHSNMeasureLibrary)

 * group[0].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
 * group[0].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
 * group[0].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
 * group[0].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Location
 * group[0].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#91537007
 * group[0].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Hospital bed, device (physical object)"
 * group[0].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Hospital Beds"
 * group[0].extension[groupAtts].extension[rateAggregation].valueString = "count"

// Describe the group of populations being reported, and WHAT this group counts.
 * group[0].code.coding = MeasureGroupSystem#Beds
 * group[0].code.coding.display = "Beds"
 * group[0].code.text = "Hospital Bed Reporting"

 // Describe the initial population for this Measure Group
 * group[0].population[0].code = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numTotBeds
 * group[0].population[0].code.coding.display = "All Hospital Beds"
 * group[0].population[0].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
 * group[0].population[0].code.text = "Total number of all Inpatient and outpatient beds, including all staffed,ICU, licensed, and overflow (surge) beds used for inpatients or outpatients"
 * group[0].population[0].description = """Enter the total number of all hospital beds, including inpatient and outpatient beds. All staffed, licensed,
and overflow and surge/expansion beds used for inpatients or outpatients. This includes ICU beds."""
 * group[0].population[0].criteria.name = "numTotBeds"
 * group[0].population[0].criteria.description = "A bed in any location"
 * group[0].population[0].criteria.language = #text/fhirpath
 * group[0].population[0].criteria.expression = "Device.where(type in %ValueSet-BedDeviceTypes and location.physicalType in %ValueSet-BedLocationTypes)"

// Describe the population strata for numBeds
 * group[0].population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numbeds
 * group[0].population[1].code.coding.display = "Hospital Inpatient Beds"
// * group[0].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[0].population[1].code.text = "Inpatient beds, including all staffed, licensed, and overflow (surge) beds used for inpatients"
 * group[0].population[1].description = "Required. Enter the total number of all inpatient beds, including all staffed, licensed, and overflow and surge/expansion beds created for inpatient care. This includes intensive care unit (ICU) beds."
 * group[0].population[1].criteria.name = "numbeds"
 * group[0].population[1].criteria.description = "A Bed where the location is an inpatient location."
 * group[0].population[1].criteria.language = #text/fhirpath
 * group[0].population[1].criteria.expression = "%numTotBeds.where(location.type in %ValueSet-InpatientLocations)"

// Describe the population for numBedsOcc
 * group[0].population[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numBedsOcc
 * group[0].population[2].code.coding.display = "Hospital Inpatient Bed Occupancy"
 * group[0].population[2].code.text = "Total number of staffed inpatient beds that are occupied"
// * group[0].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[0].population[2].description = """Enter the total number of staffed inpatient beds occupied by patients at the time the data is collected, including all staffed, licensed, and overflow and surge/expansion beds created for inpatient care. This includes ICU beds.

CDC Webinar 31-Mar-2020:
Baby beds in mom's room count as 1 bed, even if there are multiple baby beds
Follow-up in progress if staffed is less than licensed.
Total includes all beds, even if with surge beds it exceeds licensed beds."""
 * group[0].population[2].criteria.name = "numBedsOcc"
 * group[0].population[2].criteria.description = "An Inpatient Bed where the Bed is occupied."
 * group[0].population[2].criteria.language = #text/fhirpath
 * group[0].population[2].criteria.expression = "%numbeds.where(location.operationalStatus = %ValueSet-OccupiedBed)"

// Describe the population for numICUBeds
 * group[0].population[3].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numICUBeds
 * group[0].population[3].code.coding.display = "ICU Beds"
 * group[0].population[3].code.text = "ICU Bed Occupancy"
// * group[0].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[0].population[3].description = """Enter the total number of staffed Intensive Care Unit (ICU) beds.

CDC Webinar 31-Mar-2020:
ICU beds include NICU
"""
 * group[0].population[3].criteria.name = "numICUBeds"
 * group[0].population[3].criteria.description = "A Bed where the location is an inpatient ICU location."
 * group[0].population[3].criteria.language = #text/fhirpath
 * group[0].population[3].criteria.expression = "%numbeds.where(location.type in %ValueSet-ICULocations)"

// Describe the population for numICUBedsOcc
 * group[0].population[4].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numICUBedsOcc
 * group[0].population[4].code.coding.display = "ICU Bed Occupancy"
// * group[0].population[4].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[0].population[4].code.text = """Total number of staffed inpatient intensive care unit (ICU) beds"""
 * group[0].population[4].description = """Enter the total number of staffed ICU beds occupied by patients at the time the data is collected.

CDC Webinar 31-Mar-2020:
ICU beds include NICU"""
 * group[0].population[4].criteria.name = "numICUBedsOcc"
 * group[0].population[4].criteria.description = "An ICU Bed that is occupied."
 * group[0].population[4].criteria.language = #text/fhirpath
 * group[0].population[4].criteria.expression = "%numICUBeds.where(location.operationalStatus = %ValueSet-OccupiedBed)"


 * group[1].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
 * group[1].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
 * group[1].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#decrease
 * group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
 * group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#706172005
 * group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Ventilator (physical object)"
 * group[1].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Ventilator"
 * group[1].extension[groupAtts].extension[rateAggregation].valueString = "count"

 * group[1].code.coding = MeasureGroupSystem#Ventilators
 * group[1].code.coding.display = "Ventilators"
 * group[1].code.text = "Hospital Ventilators Reporting"

// Describe initial population
 * group[1].population[0].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numVent
 * group[1].population[0].code.coding.display = "Mechanical Ventilators"
 * group[1].population[0].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
 * group[1].population[0].code.text = "Total number of ventilators available"
 * group[1].population[0].description = """Enter the total number of mechanical ventilators, including anesthesia machines and
portable/transport ventilators available in the facility.
Include BiPAP machines if the hospital uses BiPAP to deliver positive pressure ventilation via artificial airways."""
 * group[1].population[0].criteria.name = "numVent"
 * group[1].population[0].criteria.description = "A Device that is used for ventilation and could be used (e.g., not broken, transferred, etc)"
 * group[1].population[0].criteria.language = #text/fhirpath
 * group[1].population[0].criteria.expression = "Device.where(type in %ValueSet-VentilatorDevices and status = active)"

// Describe the population for numVentUse
 * group[1].population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numVentUse
 * group[1].population[1].code.coding.display = "Mechanical Ventilators in Use"
// * group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[1].population[1].code.text = "Total number of ventilators in use"
 * group[1].population[1].description = """Enter the total number of mechanical ventilators use at the time the data is collected, including anesthesia
machines and portable/transport ventilators. Include BiPAP machines if the hospital uses BiPAP to deliver positive pressure ventilation via artificial airways."""
 * group[1].population[1].criteria.name = "numVentUse"
 * group[1].population[1].criteria.description = "A ventilator that is attached to a patient."
 * group[1].population[1].criteria.language = #text/fhirpath
 * group[1].population[1].criteria.expression = "%numVent.where(patient!={})"

 * group[2].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
 * group[2].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
 * group[2].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#decrease
 * group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Encounter
 * group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#308335008
 * group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Patient encounter procedure (procedure)"
 * group[2].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Encounter"
 * group[2].extension[groupAtts].extension[rateAggregation].valueString = "count"

 * group[2].code.coding = MeasureGroupSystem#Encounters
 * group[2].code.coding.display = "Encounters"
 * group[2].code.text = "Hospital COVID-19 Encounters Reporting"

// Describe the criteria for numC19HospPats
 * group[2].population[0].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19HospPats
 * group[2].population[0].code.coding.display = "Hospitalized COVID-19 Patients"
// * group[2].population[0].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[2].population[0].code.text = "Patients currently hospitalized in an inpatient care location who have suspected or confirmed COVID-19"
 * group[2].population[0].description = """Enter the number of patients hospitalized in an inpatient bed at the time the data is collected
 who have suspected or confirmed COVID-19. This includes the patients with laboratory-confirmed or clinically diagnosed COVID-19.
Confirmed: A patient with a laboratory confirmed COVID-19 diagnosis
Suspected: A patient without a laboratory confirmed COVID-19 diagnosis who, in accordance with CDC’s Interim Public Health Guidance
for Evaluating Persons Under Investigation (PUIs), has signs and symptoms compatible with COVID-19 (most patients with confirmed
COVID-19 have developed fever and/or symptoms of acute respiratory illness, such as cough, shortness of breath or myalgia/fatigue)."""
 * group[2].population[0].criteria.name = "numC19HospPats"
 * group[2].population[0].criteria.description = "An COVID-19 encounter where the active location is an inpatient location"
 * group[2].population[0].criteria.language = #text/fhirpath
 * group[2].population[0].criteria.expression = "%numC19Pats.where(location.where(status='active' and type in %ValueSet-InpatientLocations))"

// Describe the criteria for numC19MechVentPats
 * group[2].population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19MechVentPats
 * group[2].population[1].code.coding.display = "Hospitalized and Ventilated COVID-19 Patients"
// * group[2].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[2].population[1].code.text = "Patients currently hospitalized in an inpatient bed who have suspected or confirmed COVID-19 and are on a mechanical ventilator"
 * group[2].population[1].description = """Enter the number of patients hospitalized in an inpatient bed who have
suspected or confirmed COVID-19 and are currently on a mechanical ventilator* at the time the data is collected . This includes the
patients with laboratory-confirmed or clinically diagnosed COVID-19."""
 * group[2].population[1].criteria.name = "numC19OFMechVentPats"
 * group[2].population[1].criteria.description = "An COVID-19 encounter in an inpatient setting on a ventilator"
 * group[2].population[1].criteria.language = #text/fhirpath
 * group[2].population[1].criteria.expression = "%numC19HospPats.intersect(%numC19VentPats)"

// Describe the criteria for numC19HOPats
 * group[2].population[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19HOPats
 * group[2].population[2].code.coding.display = "Hospital Onset COVID-19 Patients"
// * group[2].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[2].population[2].code.text = """Patients currently hospitalized in an inpatient bed with onset of suspected or
confirmed COVID-19 fourteen or more days after hospital admission due to a condition other than COVID-19"""
 * group[2].population[2].description = """Enter the number of patients hospitalized in an inpatient bed at the time the data is
collected with onset of suspected or confirmed COVID-19 fourteen or more days after hospitalization (admission date = hospital
day 1). This includes laboratory-confirmed or clinically diagnosed COVID-19 cases."""
 * group[2].population[2].criteria.name = "numC19HOPats"
 * group[2].population[2].criteria.description = "Encounters associated with suspected or confirmed COVID-19 with onset > 14 days after start"
 * group[2].population[2].criteria.language = #text/fhirpath
 * group[2].population[2].criteria.expression = """Condition.where(
   code in %ValueSet-SuspectedOrDiagnosedCOVID19
   and encounter in %numC19HospPats
   and onset + 14 days > encounter.period.start).encounter"""

// Describe the criteria for numC19OverflowPats
 * group[2].population[3].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19OverflowPats
 * group[2].population[3].code.coding.display = "ED/Overflow COVID-19 Patients"
// * group[2].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[2].population[3].code.text = "Patients with suspected or confirmed COVID-19 who are currently in the Emergency Department (ED) or any overflow location awaiting an inpatient bed"
 * group[2].population[3].description = """Enter the number of patients with suspected or confirmed COVID-19 who are in the
Emergency Department(ED) or any overflow/expansion location awaiting placement in an inpatient bed at the time the data
is collected . This includes patients with laboratory-confirmed or clinically diagnosed COVID-19. Overflow locations include any physical
locations created to accommodate patients include but not limited to 24-hour observation units, hallways, parking lots, or tents."""
 * group[2].population[3].criteria.name = "numC19OverflowPats"
 * group[2].population[3].criteria.description = "An COVID-19 encounter where the active location is an ED or Overflow location"
 * group[2].population[3].criteria.language = #text/fhirpath
 * group[2].population[3].criteria.expression = "%numC19Pats.where(location.where(status='active' and type in %ValueSet-EDorOverflowLocations))"

// Describe the criteria for numC19OFMechVentPats
 * group[2].population[4].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19OFMechVentPats
 * group[2].population[4].code.coding.display = "ED/Overflow and Ventilated COVID-19 Patients"
// * group[2].population[4].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[2].population[4].code.text = "Patients with suspected or confirmed COVID-19 who currently are in the ED or any overflow location awaiting an inpatient bed and on a mechanical ventilator"
 * group[2].population[4].description = """Enter the number of patients with suspected or confirmed COVID-19 who are in the ED or any overflow/expansion location on a
mechanical ventilator* at the time the data is collected . This includes patients with laboratory-confirmed or clinically diagnosed COVID-19."""
 * group[2].population[4].criteria.name = "numC19OFMechVentPats"
 * group[2].population[4].criteria.description = "An COVID-19 encounter where the active location is an ED or Overflow location"
 * group[2].population[4].criteria.language = #text/fhirpath
 * group[2].population[4].criteria.expression = "%numC19OverflowPats.intersect(%numC19VentPats)" * group[2].population[5].criteria.name = "numC19Died"

// Describe the criteria for numC19Died
 * group[2].population[5].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19Died
 * group[2].population[5].code.coding.display = "COVID-19 Patient Deaths"
// * group[2].population[5].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[2].population[5].code.text = "Patients with suspected or confirmed COVID-19 who died in the hospital, ED or any overflow location on the date for which you are reporting."
 * group[2].population[5].description = """Enter the number of patients with suspected or confirmed COVID-19 who died in the hospital, ED, or any overflow location. This
includes patients with laboratory-confirmed or clinically diagnosed COVID-19. Please enter the count of deaths newly occurred, at the time
the data is collected instead of the cumulated number of deaths."""
 * group[2].population[5].criteria.name = "numC19Died"
 * group[2].population[5].criteria.description = "All C19 Patients who have died in an encounter during the reporting period."
 * group[2].population[5].criteria.language = #text/fhirpath
 * group[2].population[5].criteria.expression = "%numC19Pats.hospitalization.dispostion in %ValueSet-PatientDied"


// describe the initial population
 * group[2].population[6].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19Pats
 * group[2].population[6].code.coding.display = "All COVID-19 Confirmed or Suspected Patients"
 * group[2].population[6].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
 * group[2].population[6].code.text = "Patients with suspected or confirmed COVID-19 in any location."
 * group[2].population[6].criteria.name = "numC19Pats"
 * group[2].population[6].criteria.description = """Active encounters where the encounter diagnosis is suspected or confirmed COVID-19,
 or a Condition of suspected or confirmed COVID-19 was created during that encounter."""
 * group[2].population[6].criteria.language = #text/fhirpath
 * group[2].population[6].criteria.expression = """Encounter.where(clinicalStatus = 'active' and diagnosis.condition.ofType(Condition).code in %ValueSet-SuspectedOrDiagnosedCOVID19)
 | Encounter.where(clinicalStatus = "active" and Condition.where(code in %ValueSet-SuspectedOrDiagnosedCOVID19).encounter = $this)
 """
 * group[2].population[6].description = """Enter the number of patients in any location at the time the data is collected who have suspected or confirmed
COVID-19. This includes the patients with laboratory-confirmed or clinically diagnosed COVID-19.
Confirmed: A patient with a laboratory confirmed COVID-19 diagnosis
Suspected: A patient without a laboratory confirmed COVID-19 diagnosis who, in accordance with CDC’s Interim Public Health Guidance
for Evaluating Persons Under Investigation (PUIs), has signs and symptoms compatible with COVID-19 (most patients with confirmed
COVID-19 have developed fever and/or symptoms of acute respiratory illness, such as cough, shortness of breath or myalgia/fatigue)."""

// Describe the criteria for numC19VentPats
 * group[2].population[7].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#numC19VentPats
 * group[2].population[7].code.coding.display = "Ventilated COVID-19 Patients"
// * group[2].population[7].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#measure-population
 * group[2].population[7].code.text = "Patients in any location who have suspected or confirmed COVID-19 and are currently on a ventilator."
 * group[2].population[7].criteria.name = "numC19VentPats"
 * group[2].population[7].criteria.description = "A COVID-19 encounter where the patient is ventilated"
 * group[2].population[7].criteria.language = #text/fhirpath
 * group[2].population[7].criteria.expression = "%numC19Pats.where(Device.where(type in %ValueSet-VentilatorDevices and status = active).patient = $this.patient)"
 * group[2].population[7].description = """Enter the number of patients in any location who have suspected or confirmed COVID-19 and are
currently on a mechanical ventilator* at the time the data is collected. This includes the patients with laboratory-confirmed or clinically
diagnosed COVID-19."""

Instance: CDCHealthcareSupplyPathway
Title: "CDC Healthcare Supply Pathway"
InstanceOf: http://hl7.org/fhir/saner/StructureDefinition/PublicHealthMeasure
* insert SanerDefinitionContent
* insert DailyReporting
* id = "CDCHealthcareSupplyPathway"
* meta.profile = "http://hl7.org/fhir/StructureDefinition/Measure"
* meta.profile[1] = "http://hl7.org/fhir/saner/StructureDefinition/PublicHealthMeasure"
* url = "http://hl7.org/fhir/saner/Measure/CDCHealthcareSupplyPathway"
* version = "0.1.0"
* name = "CDCHealthcareSupplyPathway"
* title = "COVID-19 Healthcare Supply Pathway"
* status = #draft
* experimental = true
* date = "2020-04-27T07:08:50-04:00"
* publisher = "HL7 International"
* contact.name = "HL7 Public Health Workgroup"
* contact.telecom.system = #url
* contact.telecom.value = "http://hl7.org/Special/committees/pher/index.cfm"
* contact[1].name = "Keith W. Boone"
* contact[1].telecom.system = #email
* contact[1].telecom.value = "mailto:kboone@ainq.com"
* description = "SANER implementation of the CDC COVID-19 Healthcare Supply Pathway"
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext.valueCodeableConcept = http://snomed.info/sct#840539006
* jurisdiction.coding = urn:iso:std:iso:3166#US
* author.name = "Centers for Disease Control/National Healthcare Safety Network (CDC/NHSN)"
* author.telecom.system = #email
* author.telecom.value = "mailto:nhsn@cdc.gov"
* relatedArtifact.type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact.label = "NHSN COVID-19 Reporting for Acute Care"
* relatedArtifact.display = "CDC/NHSN COVID-19 Acute Care Module Home Page"
* relatedArtifact.citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact.url = "https://web.archive.org/web/20200501215043/https://www.cdc.gov/nhsn/acute-care-hospital/covid19/"
* relatedArtifact[1].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[1].label = "How to import COVID-19 Summary Data"
* relatedArtifact[1].display = "Facility - How to Upload COVID-19 CSV Data Files"
* relatedArtifact[1].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[1].url = "https://web.archive.org/web/20200501215043/https://www.cdc.gov/nhsn/pdfs/covid19/import-covid19-data-508.pdf"
* relatedArtifact[2].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[2].label = "COVID-19 Module Analysis Reports"
* relatedArtifact[2].display = "NHSN COVID-19 Module Analysis Reports"
* relatedArtifact[2].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[2].url = "https://web.archive.org/web/20200501215043/https://www.cdc.gov/nhsn/pdfs/covid19/fac-analysis-qrg-508.pdf"
* relatedArtifact[3].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[3].label = "Table of Instructions"
* relatedArtifact[3].display = "Instructions for Completion of the COVID-19 Healthcare Supply Pathway (CDC 57.132)"
* relatedArtifact[3].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[3].url = "https://web.archive.org/web/20200501215043/https://www.cdc.gov/nhsn/pdfs/covid19/57.132-toi-508.pdf"
* relatedArtifact[4].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[4].label = "PDF Form"
* relatedArtifact[4].display = "Healthcare Supply Pathway Form"
* relatedArtifact[4].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[4].url = "https://web.archive.org/web/20200501215043/https://www.cdc.gov/nhsn/pdfs/covid19/57.132-covid19-sup-blank-p.pdf"
* relatedArtifact[5].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[5].label = "CSV File Template"
* relatedArtifact[5].display = "CDC/NHSN COVID-19 Acute Care Healthcare Supply Reporting CSV File Template"
* relatedArtifact[5].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[5].url = "https://www.cdc.gov/nhsn/pdfs/covid19/facility-import-supplies.csv"
* library = Canonical(NHSNMeasureLibrary)

* type.coding = http://terminology.hl7.org/CodeSystem/measure-type#composite
* group.extension[groupAtts].extension[scoring].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group.extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
* group.extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#706172005
* group.extension[groupAtts].extension[subject].valueCodeableConcept.text = "Mechanical Ventilators"
* group.extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group.extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#decrease
* group.extension[groupAtts].extension[rateAggregation].valueString = "count"
* group.extension.url = "http://hl7.org/fhir/saner/StructureDefinition/MeasureGroupAttributes"
* group.code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#Ventilators
* group.code.text = "Ventilator Supply Reporting"

* group.population[0].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#ventsupply
* group.population[0].code.text = "any supplies, including flow sensors, tubing, connectors, valves, filters, etc"
* group.population[0].description = "any supplies, including flow sensors, tubing, connectors, valves, filters, etc"
* group.population[0].criteria.description = "Ventilator supplies (any, including tubing)"
* group.population[0].criteria.name = "ventsupply"
* group.population[0].criteria.language = #"text/plain"
* group.population[0].criteria.expression = "any supplies, including flow sensors, tubing, connectors, valves, filters, etc"

* group.population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#ventreuse
* group.population[1].code.text = "any supplies, including flow sensors, tubing, connectors, valves, filters, etc"
* group.population[1].description = "any supplies, including flow sensors, tubing, connectors, valves, filters, etc"
* group.population[1].criteria.description = "Ventilator supplies (any, including tubing)"
* group.population[1].criteria.name = "ventreuse"
* group.population[1].criteria.language = #"text/plain"
* group.population[1].criteria.expression = "any supplies, including flow sensors, tubing, connectors, valves, filters, etc"

* group.population[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#ventobtain
* group.population[2].code.text = "any supplies, including flow sensors, tubing, connectors, valves, filters, etc"
* group.population[2].description = "any supplies, including flow sensors, tubing, connectors, valves, filters, etc"
* group.population[2].criteria.description = "Ventilator supplies (any, including tubing)"
* group.population[2].criteria.name = "ventobtain"
* group.population[2].criteria.language = #"text/plain"
* group.population[2].criteria.expression = "any supplies, including flow sensors, tubing, connectors, valves, filters, etc"


* group[1].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
* group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#409532003
* group[1].extension[groupAtts].extension[subject].valueCodeableConcept.text = "N95 Masks"
* group[1].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[1].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[1].extension[groupAtts].extension[rateAggregation].valueString = "count"

* group[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#N95Masks
* group[1].code.text = "N95 Mask Supply Reporting"
* group[1].population[0].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#n95masksupply
* group[1].population[0].description = "N95 masks"
* group[1].population[0].criteria.description = "N95 masks"
* group[1].population[0].criteria.name = "n95masksupply"
* group[1].population[0].criteria.language = #"text/plain"
* group[1].population[0].criteria.expression = "N95 masks"

* group[1].population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#n95maskreuse
* group[1].population[1].description = "N95 masks"
* group[1].population[1].criteria.description = "N95 masks"
* group[1].population[1].criteria.name = "n95maskreuse"
* group[1].population[1].criteria.language = #"text/plain"
* group[1].population[1].criteria.expression = "N95 masks"

* group[1].population[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#n95maskobtain
* group[1].population[2].description = "N95 masks"
* group[1].population[2].criteria.description = "N95 masks"
* group[1].population[2].criteria.name = "n95maskobtain"
* group[1].population[2].criteria.language = #"text/plain"
* group[1].population[2].criteria.expression = "N95 masks"

* group[2].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
* group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#277973009
* group[2].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Other Respirator Equipment"
* group[2].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[2].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[2].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#OtherRespirators
* group[2].code.text = "Other Respirator Supply Reporting"

* group[2].population[0].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#othrespsupply
* group[2].population[0].code.text = "Other respirators such as PAPRs or elastomerics"
* group[2].population[0].description = "Other respirators such as PAPRs or elastomerics"
* group[2].population[0].criteria.description = "Other respirators including PAPRs"
* group[2].population[0].criteria.name = "othrespsupply"
* group[2].population[0].criteria.language = #"text/plain"
* group[2].population[0].criteria.expression = "Other respirators such as PAPRs or elastomerics"

* group[2].population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#othrespreuse
* group[2].population[1].code.text = "Other respirators such as PAPRs or elastomerics"
* group[2].population[1].description = "Other respirators such as PAPRs or elastomerics"
* group[2].population[1].criteria.description = "Other respirators including PAPRs"
* group[2].population[1].criteria.name = "othrespreuse"
* group[2].population[1].criteria.language = #"text/plain"
* group[2].population[1].criteria.expression = "Other respirators such as PAPRs or elastomerics"

* group[2].population[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#othrespobtain
* group[2].population[2].code.text = "Other respirators such as PAPRs or elastomerics"
* group[2].population[2].description = "Other respirators such as PAPRs or elastomerics"
* group[2].population[2].criteria.description = "Other respirators including PAPRs"
* group[2].population[2].criteria.name = "othrespobtain"
* group[2].population[2].criteria.language = #"text/plain"
* group[2].population[2].criteria.expression = "Other respirators such as PAPRs or elastomerics"

* group[3].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[3].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
* group[3].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#409528009
* group[3].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Surgical Masks"
* group[3].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[3].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[3].extension[groupAtts].extension[rateAggregation].valueString = "count"

* group[3].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#SurgicalMasks
* group[3].code.text = "Surgical Mask Supply Reporting"

* group[3].population[0].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#surgmasksupply
* group[3].population[0].description = "Surgical masks"
* group[3].population[0].criteria.description = "Surgical masks"
* group[3].population[0].criteria.name = "surgmasksupply"
* group[3].population[0].criteria.language = #"text/plain"
* group[3].population[0].criteria.expression = "Surgical masks"

* group[3].population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#surgmaskreuse
* group[3].population[1].description = "Surgical masks"
* group[3].population[1].criteria.description = "Surgical masks"
* group[3].population[1].criteria.name = "surgmaskreuse"
* group[3].population[1].criteria.language = #"text/plain"
* group[3].population[1].criteria.expression = "Surgical masks"

* group[3].population[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#surgmaskobtain
* group[3].population[2].description = "Surgical masks"
* group[3].population[2].criteria.description = "Surgical masks"
* group[3].population[2].criteria.name = "surgmaskobtain"
* group[3].population[2].criteria.language = #"text/plain"
* group[3].population[2].criteria.expression = "Surgical masks"

* group[4].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[4].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
* group[4].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#38126007
* group[4].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Eye Protection"
* group[4].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[4].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[4].extension[groupAtts].extension[rateAggregation].valueString = "count"

* group[4].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#EyeProtection
* group[4].code.text = "Eye Protection Supply Reporting"

* group[4].population[0].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shieldsupply
* group[4].population[0].description = "Eye protection including face shields or goggles"
* group[4].population[0].criteria.description = "Eye protection including face shields or goggles"
* group[4].population[0].criteria.name = "shieldsupply"
* group[4].population[0].criteria.language = #"text/plain"
* group[4].population[0].criteria.expression = "Eye protection including face shields or goggles"

* group[4].population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shieldreuse
* group[4].population[1].description = "Eye protection including face shields or goggles"
* group[4].population[1].criteria.description = "Eye protection including face shields or goggles"
* group[4].population[1].criteria.name = "shieldreuse"
* group[4].population[1].criteria.language = #"text/plain"
* group[4].population[1].criteria.expression = "Eye protection including face shields or goggles"

* group[4].population[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shieldobtain
* group[4].population[2].description = "Eye protection including face shields or goggles"
* group[4].population[2].criteria.description = "Eye protection including face shields or goggles"
* group[4].population[2].criteria.name = "shieldobtain"
* group[4].population[2].criteria.language = #"text/plain"
* group[4].population[2].criteria.expression = "Eye protection including face shields or goggles"

* group[5].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[5].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
* group[5].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#409527004
* group[5].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Gowns"
* group[5].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[5].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[5].extension[groupAtts].extension[rateAggregation].valueString = "count"

* group[5].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#Gown
* group[5].code.text = "Gown Supply Reporting"

* group[5].population[0].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#gownsupply
* group[5].population[0].description = "Gowns (single use)"
* group[5].population[0].criteria.description = "Gowns (single use)"
* group[5].population[0].criteria.name = "gownsupply"
* group[5].population[0].criteria.language = #"text/plain"
* group[5].population[0].criteria.expression = "Gowns (single use)"

* group[5].population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#gownreuse
* group[5].population[1].description = "Gowns (single use)"
* group[5].population[1].criteria.description = "Gowns (single use)"
* group[5].population[1].criteria.name = "gownreuse"
* group[5].population[1].criteria.language = #"text/plain"
* group[5].population[1].criteria.expression = "Gowns (single use)"

* group[5].population[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#gownobtain
* group[5].population[2].description = "Gowns (single use)"
* group[5].population[2].criteria.description = "Gowns (single use)"
* group[5].population[2].criteria.name = "gownobtain"
* group[5].population[2].criteria.language = #"text/plain"
* group[5].population[2].criteria.expression = "Gowns (single use)"

* group[6].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[6].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Device
* group[6].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#52291003
* group[6].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Gloves"
* group[6].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[6].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[6].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[6].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem#Glove
* group[6].code.text = "Glove Supply Reporting"

* group[6].population[0].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#glovesupply
* group[6].population[0].description = "Gloves"
* group[6].population[0].criteria.description = "Gloves"
* group[6].population[0].criteria.name = "glovesupply"
* group[6].population[0].criteria.language = #"text/plain"
* group[6].population[0].criteria.expression = "Gloves"

* group[6].population[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#glovereuse
* group[6].population[1].description = "Gloves"
* group[6].population[1].criteria.description = "Gloves"
* group[6].population[1].criteria.name = "glovereuse"
* group[6].population[1].criteria.language = #"text/plain"
* group[6].population[1].criteria.expression = "Gloves"

* group[6].population[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#gloveobtain
* group[6].population[2].description = "Gloves"
* group[6].population[2].criteria.description = "Gloves"
* group[6].population[2].criteria.name = "gloveobtain"
* group[6].population[2].criteria.language = #"text/plain"
* group[6].population[2].criteria.expression = "Gloves"


Instance: CDCHealthcareWorkerStaffingPathway
InstanceOf: http://hl7.org/fhir/saner/StructureDefinition/PublicHealthMeasure
* insert SanerDefinitionContent
* insert DailyReporting
* id = "CDCHealthcareWorkerStaffingPathway"
* meta.profile = "http://hl7.org/fhir/StructureDefinition/Measure"
* meta.profile[1] = "http://hl7.org/fhir/saner/StructureDefinition/PublicHealthMeasure"
* url = "http://hl7.org/fhir/saner/Measure/CDCHealthcareWorkerStaffingPathway"
* version = "0.1.0"
* name = "CDCHealthcareWorkerStaffingPathway"
* title = "COVID-19 Healthcare Worker Staffing Pathway"
* status = #draft
* experimental = true
* date = "2020-04-27T07:08:50-04:00"
* publisher = "HL7 International"
* contact.name = "HL7 Patient Administration Workgroup"
* contact.telecom.system = #url
* contact.telecom.value = "http://hl7.org/Special/committees/pafm/index.cfm"
* contact[1].name = "Audacious Inquiry"
* contact[1].telecom.system = #url
* contact[1].telecom.value = "http://ainq.com"
* contact[2].name = "Keith W. Boone"
* contact[2].telecom.system = #email
* contact[2].telecom.value = "mailto:kboone@ainq.com"
* description = "SANER implementation of the CDC COVID-19 Healthcare Worker Staffing Pathway"
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext.valueCodeableConcept = http://snomed.info/sct#840539006
* jurisdiction.coding = urn:iso:std:iso:3166#US
* author.name = "Centers for Disease Control/National Healthcare Safety Network (CDC/NHSN)"
* author.telecom.system = #email
* author.telecom.value = "mailto:nhsn@cdc.gov"
* relatedArtifact.type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact.label = "NHSN COVID-19 Reporting for Acute Care"
* relatedArtifact.display = "CDC/NHSN COVID-19 Acute Care Module Home Page"
* relatedArtifact.citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact.url = "https://www.cdc.gov/nhsn/acute-care-hospital/covid19/"
* relatedArtifact[1].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[1].label = "How to import COVID-19 Summary Data"
* relatedArtifact[1].display = "Facility - How to Upload COVID-19 CSV Data Files"
* relatedArtifact[1].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[1].url = "https://www.cdc.gov/nhsn/pdfs/covid19/import-covid19-data-508.pdf"
* relatedArtifact[2].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[2].label = "COVID-19 Module Analysis Reports"
* relatedArtifact[2].display = "NHSN COVID-19 Module Analysis Reports"
* relatedArtifact[2].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[2].url = "https://www.cdc.gov/nhsn/pdfs/covid19/fac-analysis-qrg-508.pdf"
* relatedArtifact[3].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[3].label = "Table of Instructions"
* relatedArtifact[3].display = "Instructions for Completion of the COVID-19 Healthcare Worker Staffing Pathway (CDC 57.131)"
* relatedArtifact[3].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[3].url = "https://www.cdc.gov/nhsn/pdfs/covid19/57.131-toi-508.pdf"
* relatedArtifact[4].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[4].label = "PDF Form"
* relatedArtifact[4].display = "Healthcare Worker Staffing Pathway Form"
* relatedArtifact[4].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[4].url = "https://www.cdc.gov/nhsn/pdfs/covid19/57.131-covid19-hwp-blank-p.pdf"
* relatedArtifact[5].type = http://hl7.org/fhir/ValueSet/library-type#documentation
* relatedArtifact[5].label = "CSV File Template"
* relatedArtifact[5].display = "CDC/NHSN COVID-19 Acute Care Healthcare Supply Reporting CSV File Template"
* relatedArtifact[5].citation = "Centers for Disease Control and Prevention (CDC), National Healthcare Safety Network (NHSN)"
* relatedArtifact[5].url = "https://www.cdc.gov/nhsn/pdfs/covid19/facility-import-hcw.csv"
* library = Canonical(NHSNMeasureLibrary)
* type.coding = http://terminology.hl7.org/CodeSystem/measure-type#composite
* group.extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group.extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group.extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group.extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#45956004
* group.extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Sanitarian"
* group.extension[groupAtts].extension[subject].valueCodeableConcept.text = "Environmental services"
* group.extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group.extension[groupAtts].extension[rateAggregation].valueString = "count"
* group.code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shortenvsvc
* group.code.text = "Front-line persons who clean patient rooms and all areas in a healthcare facility"
* group.population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group.population.description = "YES - Front-line persons who clean patient rooms and all areas in a healthcare facility"
* group.population.criteria.description = "Environmental services"
* group.population.criteria.name = "shortenvsvcTrue"
* group.population.criteria.language = #"text/plain"
* group.population.criteria.expression = "true"
* group.population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group.population[1].description = "NO - Front-line persons who clean patient rooms and all areas in a healthcare facility"
* group.population[1].criteria.description = "Environmental services"
* group.population[1].criteria.name = "shortenvsvcFalse"
* group.population[1].criteria.language = #"text/plain"
* group.population[1].criteria.expression = "false"
* group[1].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[1].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#106293008
* group[1].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Nursing personnel"
* group[1].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Nurses"
* group[1].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[1].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[1].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shortnurse
* group[1].code.text = "Registered nurses and licensed practical nurses"
* group[1].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[1].population.description = "YES - Registered nurses and licensed practical nurses"
* group[1].population.criteria.description = "Nurses"
* group[1].population.criteria.name = "shortnurseTrue"
* group[1].population.criteria.language = #"text/plain"
* group[1].population.criteria.expression = "true"
* group[1].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[1].population[1].description = "NO - Registered nurses and licensed practical nurses"
* group[1].population[1].criteria.description = "Nurses"
* group[1].population[1].criteria.name = "shortnurseFalse"
* group[1].population[1].criteria.language = #"text/plain"
* group[1].population[1].criteria.expression = "false"
* group[2].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[2].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#442867008
* group[2].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Respiratory therapist"
* group[2].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Respiratory therapists"
* group[2].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[2].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[2].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shortrt
* group[2].code.text = "Certified medical professionals who specialize in knowledge and use of mechanical ventilation as well as other programs for respiratory care"
* group[2].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[2].population.description = "YES - Certified medical professionals who specialize in knowledge and use of mechanical ventilation as well as other programs for respiratory care"
* group[2].population.criteria.description = "Respiratory therapists"
* group[2].population.criteria.name = "shortrtTrue"
* group[2].population.criteria.language = #"text/plain"
* group[2].population.criteria.expression = "true"
* group[2].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[2].population[1].description = "NO - Certified medical professionals who specialize in knowledge and use of mechanical ventilation as well as other programs for respiratory care"
* group[2].population[1].criteria.description = "Respiratory therapists"
* group[2].population[1].criteria.name = "shortrtFalse"
* group[2].population[1].criteria.language = #"text/plain"
* group[2].population[1].criteria.expression = "false"
* group[3].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[3].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[3].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[3].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#46255001
* group[3].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Pharmacist"
* group[3].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Pharmacists and pharmacy techs"
* group[3].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[3].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[3].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shortphar
* group[3].code.text = "Pharmacists and pharmacy techs"
* group[3].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[3].population.description = "YES - Pharmacists and pharmacy techs"
* group[3].population.criteria.description = "Pharmacists and pharmacy techs"
* group[3].population.criteria.name = "shortpharTrue"
* group[3].population.criteria.language = #"text/plain"
* group[3].population.criteria.expression = "true"
* group[3].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[3].population[1].description = "NO - Pharmacists and pharmacy techs"
* group[3].population[1].criteria.description = "Pharmacists and pharmacy techs"
* group[3].population[1].criteria.name = "shortpharFalse"
* group[3].population[1].criteria.language = #"text/plain"
* group[3].population[1].criteria.expression = "false"
* group[4].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[4].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[4].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[4].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#309343006
* group[4].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Physician"
* group[4].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Physicians"
* group[4].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[4].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[4].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shortphys
* group[4].code.text = "Attending physicians, fellows"
* group[4].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[4].population.description = "YES - Attending physicians, fellows"
* group[4].population.criteria.description = "Physicians"
* group[4].population.criteria.name = "shortphysTrue"
* group[4].population.criteria.language = #"text/plain"
* group[4].population.criteria.expression = "true"
* group[4].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[4].population[1].description = "NO - Attending physicians, fellows"
* group[4].population[1].criteria.description = "Physicians"
* group[4].population[1].criteria.name = "shortphysFalse"
* group[4].population[1].criteria.language = #"text/plain"
* group[4].population[1].criteria.expression = "false"
* group[5].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[5].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[5].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[5].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#405623001
* group[5].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Assigned practitioner"
* group[5].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Temporary physicians, nurses, respiratory therapists, and pharmacists"
* group[5].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[5].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[5].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shorttemp
* group[5].code.text = "'per diems', 'travelers', retired, or other seasonal or intermittently contracted persons"
* group[5].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[5].population.description = "YES - 'per diems', 'travelers', retired, or other seasonal or intermittently contracted persons"
* group[5].population.criteria.description = "Temporary physicians, nurses, respiratory therapists, and pharmacists"
* group[5].population.criteria.name = "shorttempTrue"
* group[5].population.criteria.language = #"text/plain"
* group[5].population.criteria.expression = "true"
* group[5].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[5].population[1].description = "NO - 'per diems', 'travelers', retired, or other seasonal or intermittently contracted persons"
* group[5].population[1].criteria.description = "Temporary physicians, nurses, respiratory therapists, and pharmacists"
* group[5].population[1].criteria.name = "shorttempFalse"
* group[5].population[1].criteria.language = #"text/plain"
* group[5].population[1].criteria.expression = "false"
* group[6].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[6].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[6].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[6].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#33738006
* group[6].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Other medical/dental/veterinary/related worker"
* group[6].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Other HCP"
* group[6].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[6].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[6].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shortoth
* group[6].code.text = "Persons who work in the facility, regardless of clinical responsibility or patient contact not included in categories above"
* group[6].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[6].population.description = "YES - Persons who work in the facility, regardless of clinical responsibility or patient contact not included in categories above"
* group[6].population.criteria.description = "Other HCP"
* group[6].population.criteria.name = "shortothTrue"
* group[6].population.criteria.language = #"text/plain"
* group[6].population.criteria.expression = "true"
* group[6].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[6].population[1].description = "NO - Persons who work in the facility, regardless of clinical responsibility or patient contact not included in categories above"
* group[6].population[1].criteria.description = "Other HCP"
* group[6].population[1].criteria.name = "shortothFalse"
* group[6].population[1].criteria.language = #"text/plain"
* group[6].population[1].criteria.expression = "false"
* group[7].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[7].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[7].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[7].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#158965000
* group[7].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed].display = "Medical practitioner"
* group[7].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Other licensed independent practitioners"
* group[7].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[7].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[7].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#shortothlic
* group[7].code.text = "Advanced practice nurses, physician assistants"
* group[7].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[7].population.description = "YES - Advanced practice nurses, physician assistants"
* group[7].population.criteria.description = "Other licensed independent practitioners"
* group[7].population.criteria.name = "shortothlicTrue"
* group[7].population.criteria.language = #"text/plain"
* group[7].population.criteria.expression = "true"
* group[7].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[7].population[1].description = "NO - Advanced practice nurses, physician assistants"
* group[7].population[1].criteria.description = "Other licensed independent practitioners"
* group[7].population[1].criteria.name = "shortothlicFalse"
* group[7].population[1].criteria.language = #"text/plain"
* group[7].population[1].criteria.expression = "false"

* group[8].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[8].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[8].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[8].extension[groupAtts].extension[subject].valueCodeableConcept.coding[Snomed] = http://snomed.info/sct#106375005
* group[8].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Cleaning Staff"
* group[8].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[8].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[8].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#posshortenvsvc
* group[8].code.text = "Front-line persons who clean patient rooms and all areas in a healthcare facility"
* group[8].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[8].population.description = "YES - Front-line persons who clean patient rooms and all areas in a healthcare facility"
* group[8].population.criteria.description = "Environmental services"
* group[8].population.criteria.name = "posshortenvsvcTrue"
* group[8].population.criteria.language = #"text/plain"
* group[8].population.criteria.expression = "true"
* group[8].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[8].population[1].description = "NO - Front-line persons who clean patient rooms and all areas in a healthcare facility"
* group[8].population[1].criteria.description = "Environmental services"
* group[8].population[1].criteria.name = "posshortenvsvcFalse"
* group[8].population[1].criteria.language = #"text/plain"
* group[8].population[1].criteria.expression = "false"
* group[9].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[9].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[9].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[9].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Nursing Staff"
* group[9].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[9].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[9].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#posshortnurse
* group[9].code.text = "Registered nurses and licensed practical nurses"
* group[9].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[9].population.description = "YES - Registered nurses and licensed practical nurses"
* group[9].population.criteria.description = "Nurses"
* group[9].population.criteria.name = "posshortnurseTrue"
* group[9].population.criteria.language = #"text/plain"
* group[9].population.criteria.expression = "true"
* group[9].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[9].population[1].description = "NO - Registered nurses and licensed practical nurses"
* group[9].population[1].criteria.description = "Nurses"
* group[9].population[1].criteria.name = "posshortnurseFalse"
* group[9].population[1].criteria.language = #"text/plain"
* group[9].population[1].criteria.expression = "false"
* group[10].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[10].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[10].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[10].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Respiratory Specialists"
* group[10].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[10].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[10].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#posshortrt
* group[10].code.text = "Certified medical professionals who specialize in knowledge and use of mechanical ventilation as well as other programs for respiratory care"
* group[10].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[10].population.description = "YES - Certified medical professionals who specialize in knowledge and use of mechanical ventilation as well as other programs for respiratory care"
* group[10].population.criteria.description = "Respiratory therapists"
* group[10].population.criteria.name = "posshortrtTrue"
* group[10].population.criteria.language = #"text/plain"
* group[10].population.criteria.expression = "true"
* group[10].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[10].population[1].description = "NO - Certified medical professionals who specialize in knowledge and use of mechanical ventilation as well as other programs for respiratory care"
* group[10].population[1].criteria.description = "Respiratory therapists"
* group[10].population[1].criteria.name = "posshortrtFalse"
* group[10].population[1].criteria.language = #"text/plain"
* group[10].population[1].criteria.expression = "false"

* group[11].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[11].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[11].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[11].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Pharmacy Specialists"
* group[11].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[11].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[11].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#posshortphar
* group[11].code.text = "Pharmacists and pharmacy techs"
* group[11].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[11].population.description = "YES - Pharmacists and pharmacy techs"
* group[11].population.criteria.description = "Pharmacists and pharmacy techs"
* group[11].population.criteria.name = "posshortpharTrue"
* group[11].population.criteria.language = #"text/plain"
* group[11].population.criteria.expression = "true"
* group[11].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[11].population[1].description = "NO - Pharmacists and pharmacy techs"
* group[11].population[1].criteria.description = "Pharmacists and pharmacy techs"
* group[11].population[1].criteria.name = "posshortpharFalse"
* group[11].population[1].criteria.language = #"text/plain"
* group[11].population[1].criteria.expression = "false"

* group[12].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[12].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[12].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[12].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Attending Physicians"
* group[12].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[12].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[12].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#posshortphys
* group[12].code.text = "Attending physicians, fellows"
* group[12].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[12].population.description = "YES - Attending physicians, fellows"
* group[12].population.criteria.description = "Physicians"
* group[12].population.criteria.name = "posshortphysTrue"
* group[12].population.criteria.language = #"text/plain"
* group[12].population.criteria.expression = "true"
* group[12].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[12].population[1].description = "NO - Attending physicians, fellows"
* group[12].population[1].criteria.description = "Physicians"
* group[12].population[1].criteria.name = "posshortphysFalse"
* group[12].population[1].criteria.language = #"text/plain"
* group[12].population[1].criteria.expression = "false"

* group[13].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[13].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[13].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[13].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Intermittent Staff"
* group[13].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[13].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[13].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#posshorttemp
* group[13].code.text = "'per diems', 'travelers', retired, or other seasonal or intermittently contracted persons"
* group[13].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[13].population.description = "YES - 'per diems', 'travelers', retired, or other seasonal or intermittently contracted persons"
* group[13].population.criteria.description = "Temporary physicians, nurses, respiratory therapists, and pharmacists"
* group[13].population.criteria.name = "posshorttempTrue"
* group[13].population.criteria.language = #"text/plain"
* group[13].population.criteria.expression = "true"
* group[13].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[13].population[1].description = "NO - 'per diems', 'travelers', retired, or other seasonal or intermittently contracted persons"
* group[13].population[1].criteria.description = "Temporary physicians, nurses, respiratory therapists, and pharmacists"
* group[13].population[1].criteria.name = "posshorttempFalse"
* group[13].population[1].criteria.language = #"text/plain"
* group[13].population[1].criteria.expression = "false"

* group[14].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[14].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[14].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[14].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Other Staff"
* group[14].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[14].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[14].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#posshortoth
* group[14].code.text = "Persons who work in the facility, regardless of clinical responsibility or patient contact not included in categories above."
* group[14].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[14].population.description = "YES - Persons who work in the facility, regardless of clinical responsibility or patient contact not included in categories above."
* group[14].population.criteria.description = "Other HCP"
* group[14].population.criteria.name = "posshortothTrue"
* group[14].population.criteria.language = #"text/plain"
* group[14].population.criteria.expression = "true"
* group[14].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[14].population[1].description = "NO - Persons who work in the facility, regardless of clinical responsibility or patient contact not included in categories above."
* group[14].population[1].criteria.description = "Other HCP"
* group[14].population[1].criteria.name = "posshortothFalse"
* group[14].population[1].criteria.language = #"text/plain"
* group[14].population[1].criteria.expression = "false"

* group[15].extension[groupAtts].extension[scoring].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-scoring#continuous-variable
* group[15].extension[groupAtts].extension[type].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-type#structure
* group[15].extension[groupAtts].extension[subject].valueCodeableConcept.coding[ResourceType] = http://hl7.org/fhir/resource-types#Practitioner
* group[15].extension[groupAtts].extension[subject].valueCodeableConcept.text = "Advanced Practice Nurse/Physician Assistant"
* group[15].extension[groupAtts].extension[improvementNotation].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase
* group[15].extension[groupAtts].extension[rateAggregation].valueString = "count"
* group[15].code.coding = http://hl7.org/fhir/saner/CodeSystem/MeasuredValues#posshortothlic
* group[15].code.text = "Advanced practice nurses, physician assistants"
* group[15].population.code.coding = http://terminology.hl7.org/CodeSystem/special-values#true
* group[15].population.description = "YES - Advanced practice nurses, physician assistants"
* group[15].population.criteria.description = "Other licensed independent practitioners"
* group[15].population.criteria.name = "posshortothlicTrue"
* group[15].population.criteria.language = #"text/plain"
* group[15].population.criteria.expression = "true"
* group[15].population[1].code.coding = http://terminology.hl7.org/CodeSystem/special-values#false
* group[15].population[1].description = "NO - Advanced practice nurses, physician assistants"
* group[15].population[1].criteria.description = "Other licensed independent practitioners"
* group[15].population[1].criteria.name = "posshortothlicFalse"
* group[15].population[1].criteria.language = #"text/plain"
* group[15].population[1].criteria.expression = "false"
