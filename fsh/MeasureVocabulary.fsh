// This sheet convert output to FHIR Shorthand for generating measures.
Alias: $Base = http://hl7.org/fhir/us/saner
Alias: HSLOC = https://www.cdc.gov/nhsn/cdaportal/terminology/codesystem/hsloc.html
Alias: ICD10CM = http://hl7.org/fhir/sid/icd-10-cm
Alias: SCT = http://snomed.info/sct
Alias: LOINC = http://loinc.org
Alias: RXNORM = http://www.nlm.nih.gov/research/umls/rxnorm
Alias: ROLECODE = http://terminology.hl7.org/CodeSystem/v3-RoleCode
Alias: UCUM = http://unitsofmeasure.com

CodeSystem:   PublicHealthMeasureScoring
Title: "Public Health Measure Scoring"
Description: "A code system describing types of measure scoring used for situational awareness measures"
* #capacity     "Capacity"  "Measures point in time capacity or utilization"
* #event-growth "Event Growth" "Measures cumulative growth by counting current and cumulative events over time"
* #queue-length "Queue Length" "Measures the point in time number of activities awaiting completion"
* #service-time "Service Time" "Measures the aggregate total time to complete activities / total number of activities"
* #availability "Availability" "Measures the point in time availability of resources"

CodeSystem: MeasurePopulationSystem
Title: "Situationa Awareness Measure Populations"
Description: "A Code System for Situation Awareness Measure Populations defined by The SANER Project"
* #numerator-complement "Numerator Complement"  "Like a numerator, but expresses that part of the Denominator not present in the Numerator"
* #duration             "Duration"              "A Time Duration"
* #duration-squared     "Duration Squared"      "The square of the time duration, useful for identifying variance"
* #supporting           "Supporting"            "A population supporting computation, but not needed for reporting"

CodeSystem: MeasuredValues
Title: "Measured Values in Sample Measures"
Description: "A Code System for Populations in Sample Measures defined by The SANER Project"
* #numTotBeds                   "All Hospital Beds" "Total number of all Inpatient and outpatient beds, including all staffed,ICU, licensed, and overflow (surge) beds used for inpatients or outpatients"
* #numTotBedsOcc                "Hospital Beds Occupied" "Total number of all Inpatient and outpatient beds that are occupied"
* #numTotBedsAvail              "Hospital Beds Available" "Total number of all Inpatient and outpatient beds that are available"
* #numbeds                      "Hospital Inpatient Beds" "Inpatient beds, including all staffed, licensed, and overflow (surge) beds used for inpatients"
* #numBedsOcc                   "Hospital Inpatient Bed Occupancy" "Total number of staffed inpatient beds that are occupied"
* #numICUBeds                   "ICU Beds" "Total number of staffed inpatient intensive care unit (ICU) beds"
* #numICUBedsOcc                "ICU Bed Occupancy" "Total number of staffed inpatient ICU beds that are occupied"
* #numICUBedsAvail              "ICU Bed Availability" "Total number of staffed inpatient ICU beds that are available"
* #numImpBeds                   "Inpatient (non-ICU) Beds" "Total number of staffed inpatient non-ICU beds"
* #numImpBedsOcc                "Inpatient (non-ICU) Bed Occupancy" "Total number of staffed inpatient non-ICU beds that are occupied"
* #numImpBedsAvail              "Inpatient (non-ICU) Bed Availability" "Total number of staffed inpatient non-ICU beds that are available"
* #numAmbBeds                   "Ambulatory Beds" "Total number of staffed ambulatory beds"
* #numAmbBedsOcc                "Ambulatory Bed Occupancy" "Total number of staffed ambulatory beds that are occupied"
* #numAmbBedsAvail              "Ambulatory Bed Availability" "Total number of staffed ambulatory beds that are available"
* #numVent                      "Mechanical Ventilators" "Total number of ventilators available"
* #numVentUse                   "Mechanical Ventilators in Use" "Total number of ventilators in use"
* #numVentAvail                 "Mechanical Ventilators Available" "Total number of ventilators available"
* #numC19Pats                   "All COVID-19 Confirmed or Suspected Patients" "Patients with suspected or confirmed COVID-19 in any location."
* #numC19HospPats               "Hospitalized COVID-19 Patients" "Patients currently hospitalized in an inpatient care location who have suspected or confirmed COVID-19"
* #numC19OverflowPats           "ED/Overflow COVID-19 Patients" "Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed"
* #numC19HOPats                 "Hospital Onset COVID-19 Patients" "Patients hospitalized in an NHSN inpatient care location with onset of suspected or confirmed COVID-19 14 or more days after hospitalization"
* #cumC19HOPats                 "Cumulative Hospital Onset COVID-19 Patients" "Cumulative total of patients hospitalized in an NHSN inpatient care location with onset of suspected or confirmed COVID-19 14 or more days after hospitalization"
* #numC19VentPats               "Ventilated COVID-19 Patients" "Patients in any location who have suspected or confirmed COVID-19 and are on a mechanical ventilator"
* #numC19MechVentPats           "Hospitalized and Ventilated COVID-19 Patients" "Patients hospitalized in an NHSN inpatient care location who have suspected or confirmed COVID-19 and are on a mechanical ventilator"
* #numC19OFMechVentPats         "ED/Overflow and Ventilated COVID-19 Patients" "Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed and on a mechanical ventilator"
* #numC19Died                   "COVID-19 Patient Deaths" "Patients with suspected or confirmed COVID-19 who died in the hospital, ED, or any overflow location"
* #cumC19Died                   "Cumulative COVID-19 Patient Deaths" "Cumulative total of Patients with suspected or confirmed COVID-19 who died in the hospital, ED, or any overflow location"
* #totalOrdersIncrease          "New Diagnostic Tests Ordered/Received"
* #totalOrders                  "Cumulative Diagnostic Tests Ordered/Received"
* #totalTestResultsIncrease     "New Tests Resulted"
* #rejected                     "Cumulative Specimens Rejected"
* #totalTestResults             "Cumulative Tests Performed"
* #positiveIncrease             "New Positive COVID-19 Tests"
* #positive                     "Cumulative Positive COVID-19 Tests"
* #allReports                   "All Laboratory Reports for any Order"
* #latestReports                "Most Recent Laboratory Reports for any Order"

* #ventsupply                   "Ventilator supplies (any, including tubing) - On-hand Supply"
* #ventreuse                    "Ventilator supplies (any, including tubing) - Reusing or Extending Use"
* #ventobtain                   "Ventilator supplies (any, including tubing) - Able to Obtain"
* #n95masksupply                "N95 masks - On-hand Supply"
* #n95maskreuse                 "N95 masks - Reusing or Extending Use"
* #n95maskobtain                "N95 masks - Able to Obtain"
* #othrespsupply                "Other respirators including PAPRs - On-hand Supply"
* #othrespreuse                 "Other respirators including PAPRs - Reusing or Extending Use"
* #othrespobtain                "Other respirators including PAPRs - Able to Obtain"
* #surgmasksupply               "Surgical masks - On-hand Supply"
* #surgmaskreuse                "Surgical masks - Reusing or Extending Use"
* #surgmaskobtain               "Surgical masks - Able to Obtain"
* #shieldsupply                 "Eye protection including face shields or goggles - On-hand Supply"
* #shieldreuse                  "Eye protection including face shields or goggles - Reusing or Extending Use"
* #shieldobtain                 "Eye protection including face shields or goggles - Able to Obtain"
* #gownsupply                   "Gowns (single use) - On-hand Supply"
* #gownreuse                    "Gowns (single use) - Reusing or Extending Use"
* #gownobtain                   "Gowns (single use) - Able to Obtain"
* #glovesupply                  "Gloves - On-hand Supply"
* #glovereuse                   "Gloves - Reusing or Extending Use"
* #gloveobtain                  "Gloves - Able to Obtain"

* #shortenvsvc                  "Environmental services - Critical Staffing Shortage Today"
* #shortnurse                   "Nurses - Critical Staffing Shortage Today"
* #shortrt                      "Respiratory therapists - Critical Staffing Shortage Today"
* #shortphar                    "Pharmacists and pharmacy techs - Critical Staffing Shortage Today"
* #shortphys                    "Attending physicians, fellows - Critical Staffing Shortage Today"
* #shorttemp                    "Temporary physicians, nurses, respiratory therapists, and pharmacists - Critical Staffing Shortage Today"
* #shortoth                     "Other HCP - Critical Staffing Shortage Today"
* #shortothlic                  "Other licensed independent practitioners - Critical Staffing Shortage Today"
* #shortothsfy                  "Other HCP - Specify the groups - Critical Staffing Shortage Today"
* #posshortenvsvc               "Environmental services - Critical Staffing Shortage Within a Week"
* #posshortnurse                "Nurses - Critical Staffing Shortage Within a Week"
* #posshortrt                   "Respiratory therapists - Critical Staffing Shortage Within a Week"
* #posshortphar                 "Pharmacists and pharmacy techs - Critical Staffing Shortage Within a Week"
* #posshortphys                 "Attending physicians, fellows - Critical Staffing Shortage Within a Week"
* #posshorttemp                 "Temporary physicians, nurses, respiratory therapists, and pharmacists - Critical Staffing Shortage Within a Week"
* #posshortoth                  "Other HCP - Critical Staffing Shortage Within a Week"
* #posshortothlic               "Other licensed independent practitioners - Critical Staffing Shortage Within a Week"
* #posshortothsfy               "Other HCP - Specify the groups - Critical Staffing Shortage Within a Week"


 * #state
 * #county
 * #facilityId
 * #collectionDate
 * #summaryCensusId

CodeSystem: MeasureGroupSystem
Title: "Measure Group System"
Description: "A Code System for Groups defined by The SANER Project"
* #Beds             "Beds" "This group reports on Bed availability"
* #Ventilators      "Ventilators" "This group reports on Ventilator availability"
* #Encounters       "Encounters" "This group reports on COVID-19 Patient Encounters"
* #CovidDeaths      "COVID-19 Deaths" "This group reports on COVID-19 Patient Deaths"
* #AcquiredCovid    "Acquired COVID-19 in Hospital" "This group reports on Hospital Acquired COVID-19 Infections"
* #VentilatorSupplies "Ventilator supplies (any, including tubing)"
* #N95Masks "N95 masks"
* #OtherRespirators "Other respirators including PAPRs"
* #SurgicalMasks "Surgical masks"
* #EyeProtection "Eye protection including face shields or goggles"
* #Gown "Gowns (single use)"
* #Glove "Gloves"
* #positiveIncreasePercent "Percent Positive among Newly Resulted Tests"
* #positivePercent         "Cumulative Percent Positive among Resulted Tests"


ValueSet: MeasureGroups
Title: "Measure Groups"
Description: "Measure Groups defined by the SANER Project"
* codes from system MeasureGroupSystem

ValueSet: MeasurePopulations
Title: "Measure Populations"
Description: "Measure Populations defined by The SANER Project"
* codes from system MeasuredValues
* codes from system MeasurePopulationSystem
* codes from system http://terminology.hl7.org/CodeSystem/special-values

ValueSet: MeasureStatus
Title: "Measure Status Values"
Description: "Allowed Status Values for Saner Measures"
* http://hl7.org/fhir/publication-status#active
* http://hl7.org/fhir/publication-status#draft
* http://hl7.org/fhir/publication-status#retired

CodeSystem: MeasureRateAggregation
Title: "Measure Rate Aggregation Coding System"
Description: "This Coding System Identifies methods of rate aggregation"
* #count "Aggregable" "Rates can be summed over consecutive periods"
* #point-in-time "Point in Time" "Rates are point in time measures during the reporting period, the most recent measure is retained in an aggregate"
* #cumulative "Cumulative" "Rates are point in time measures showing cumulative values over all reporting periods, the most recent measure is retained in an aggregate"

ValueSet: MeasureRateAggregationValues
Title: "Measure Rate Aggregation Value Set"
Description: "This Value Set Identifies methods of rate aggregation"
* codes from system MeasureRateAggregation

ValueSet:    InpatientLocations
Title:       "Inpatient Locations"
Description: "Codes used for inpatient locations"
* ^copyright = """Materials developed by CDC: Reference to specific commercial products, manufacturers, companies, or trademarks does not
 constitute its endorsement or recommendation by the U.S. Government, Department of Health and Human Services, or Centers for Disease Control
 and Prevention. Source materials are available from the CDC Website at no charge at
 https://www.cdc.gov/nhsn/cdaportal/terminology/codesystem/hsloc.html"""
* HSLOC#1026-4  "Burn Critical Care"
* HSLOC#1028-0  "Medical Cardiac Critical Care"
* HSLOC#1027-2  "Medical Critical Care"
* HSLOC#1029-8  "Medical-Surgical Critical Care"
* HSLOC#1035-5  "Neurologic Critical Care"
* HSLOC#1031-4  "Neurosurgical Critical Care"
* HSLOC#1223-7  "ONC Medical Critical Care"
* HSLOC#1224-5  "ONC Surgical Critical Care"
* HSLOC#1225-2  "ONC Medical-Surgical Critical Care"
* HSLOC#1034-8  "Prenatal Critical Care"
* HSLOC#1033-0  "Respiratory Critical Care"
* HSLOC#1032-2  "Surgical Cardiothoracic Critical Care"
* HSLOC#1030-6  "Surgical Critical Care"
* HSLOC#1025-6  "Trauma Critical Care"
* HSLOC#1233-6  "ONC Pediatric Critical Care"
* HSLOC#1042-1  "Pediatric Burn Critical Care"
* HSLOC#1043-9  "Cardiothoracic Critical Care"
* HSLOC#1044-7  "Pediatric Medical Critical Care"
* HSLOC#1045-4  "Pediatric Medical-Surgical Critical Care"
* HSLOC#1046-2  "Pediatric Neurosurgical Critical Care"
* HSLOC#1047-0  "Pediatric Respiratory Critical Care"
* HSLOC#1048-8  "Pediatric Surgical Critical Care"
* HSLOC#1049-6  "Pediatric Trauma Critical Care"
* HSLOC#1038-9  "Well Baby Nursery (Level I)"
* HSLOC#1041-3  "Step down Neonatal Nursery (Level II)"
* HSLOC#1039-7  "Neonatal Critical Care (Level II/III)"
* HSLOC#1040-5  "Neonatal Critical Care (Level III)"
* HSLOC#1269-0  "Neonatal Critical Care  (Level IV)"
* HSLOC#1198-1  "Dialysis Specialty Care Area"
* HSLOC#1091-8  "Pediatric Dialysis Specialty Care Area"
* HSLOC#1093-4  "Transplant  Specialty Care Area"
* HSLOC#1092-6  "Solid Organ Transplant   Specialty Care Area"
* HSLOC#1205-4  "Antenatal Care Ward"
* HSLOC#1051-2  "Behavioral Health/Psych Ward"
* HSLOC#1052-0  "Burn Ward"
* HSLOC#1053-8  "Ear, Nose, Throat Ward"
* HSLOC#1054-6  "Gastrointestinal Ward"
* HSLOC#1055-3  "Genitourinary Ward"
* HSLOC#1056-1  "Gerontology Ward"
* HSLOC#1057-9  "Gynecology Ward"
* HSLOC#1171-8  "Jail Unit"
* HSLOC#1058-7  "Labor and Delivery Ward"
* HSLOC#1059-5  "Labor, Delivery, Recovery, Postpartum Suite"
* HSLOC#1060-3  "Medical Ward"
* HSLOC#1061-1  "Medical-Surgical Ward"
* HSLOC#1062-9  "Neurology Ward"
* HSLOC#1063-7  "Neurosurgical Ward"
* HSLOC#1226-0  "ONC Leukemia Ward"
* HSLOC#1228-6  "ONC Lymphoma Ward"
* HSLOC#1229-4  "ONC Leukemia/Lymphoma Ward"
* HSLOC#1230-2  "ONC Solid Tumor Ward"
* HSLOC#1231-0  "ONC Hematopoietic Stem Cell Transplant Ward"
* HSLOC#1232-8  "Hematology/Oncology Ward"
* HSLOC#1064-5  "Ophthalmology Ward"
* HSLOC#1065-2  "Orthopedic Ward"
* HSLOC#1066-0  "Orthopedic Trauma Ward"
* HSLOC#1067-8  "Plastic Surgery Ward"
* HSLOC#1068-6  "Postpartum Ward"
* HSLOC#1069-4  "Pulmonary Ward"
* HSLOC#1070-2  "Rehabilitation Ward   (within Acute Care Hospital)"
* HSLOC#1172-6  "School Infirmary"
* HSLOC#1071-0  "Stroke (Acute) Ward"
* HSLOC#1072-8  "Surgical Ward"
* HSLOC#1208-8  "Telemetry Ward"
* HSLOC#1073-6  "Vascular Surgery Ward"
* HSLOC#1075-1  "Adolescent Behavioral Health Ward"
* HSLOC#1234-4  "ONC Pediatric Hematopoietic Stem Cell Transplant Ward"
* HSLOC#1235-1  "Hematology/Oncology Ward"
* HSLOC#1077-7  "Pediatric Behavioral Health Ward"
* HSLOC#1078-5  "Pediatric Burn Ward"
* HSLOC#1079-3  "Pediatric Ear, Nose, Throat Ward"
* HSLOC#1080-1  "Pediatric Genitourinary Ward"
* HSLOC#1076-9  "Pediatric Medical Ward"
* HSLOC#1081-9  "Pediatric Medical-Surgical Ward"
* HSLOC#1082-7  "Pediatric Neurology Ward"
* HSLOC#1083-5  "Pediatric Neurosurgical Ward"
* HSLOC#1084-3  "Pediatric Orthopedic Ward"
* HSLOC#1085-0  "Pediatric Rehabilitation Ward (within Acute Care Hospital)"
* HSLOC#1086-8  "Pediatric Surgical Ward"
* HSLOC#1099-1  "Adult Step Down Unit"
* HSLOC#1227-8  "(all ages) (e.g., post-critical care)"
* HSLOC#1100-7  "Pediatric Step Down Unit"
* HSLOC#1210-4  "Adult Mixed Acuity Unit"
* HSLOC#1211-2  "Pediatric Mixed Acuity Unit"
* HSLOC#1212-0  "Mixed Age Mixed Acuity Unit"
* HSLOC#1236-9  "(all ages)"
* HSLOC#1005-8  "Cardiac Catheterization Room/Suite"
* HSLOC#1095-9  "Cesarean Section Room/Suite"
* HSLOC#1203-9  "Interventional Radiology"
* HSLOC#1096-7  "Operating Room/Suite"
* HSLOC#1097-5  "Post Anesthesia Care Unit/Recovery Room"
* HSLOC#1165-0  "Inpatient Hospice"
* HSLOC#1103-1  "Chronic Alzheimer's Unit"
* HSLOC#1104-9  "Chronic Behavioral Health/Psych Unit"
* HSLOC#1105-6  "Chronic Rehabilitation Unit"
* HSLOC#1102-3  "Chronic Care Unit"
* HSLOC#1164-3  "Ventilator Dependent Unit"
* HSLOC#1254-2  "Long Term Care Facility Inpatient Hospice Unit"
* HSLOC#1255-9  "Long Term Care Facility  Dementia Unit"
* HSLOC#1256-7  "Long Term Care Facility  Psychiatric Unit"
* HSLOC#1257-5  "Rehabilitation"
* HSLOC#1258-3  "Long Term Care Facility  General Nursing Unit"
* HSLOC#1259-1  "Long Term Care Facility  Ventilator Dependent Unit"
* HSLOC#1260-9  "Long Term Care Facility Bariatric Unit"
* HSLOC#1220-3  "Long Term Acute Care Intensive Care Unit"
* HSLOC#1221-1  "Long Term Acute Care Ward"
* HSLOC#1222-9  "Long Term Acute Care Intensive Care Unit"
* HSLOC#1214-6  "Long Term Acute Care Pediatric Ward"
* HSLOC#1217-9  "Rehabilitation Facility)"
* HSLOC#1218-7  "Rehabilitation Facility)"
* HSLOC#1223-7  "Oncology Medical Critical Care"
* HSLOC#1224-5  "Oncology Surgical Critical Care"
* HSLOC#1225-2  "Oncology Medical-Surgical Critical Care"
* HSLOC#1233-6  "Oncology Pediatric Critical Care"
* HSLOC#1226-0  "Oncology Leukemia Ward"
* HSLOC#1228-6  "Oncology Lymphoma Ward"
* HSLOC#1229-4  "Oncology LeukemiaLymphoma Ward"
* HSLOC#1230-2  "Oncology Solid Tumor Ward"
* HSLOC#1231-0  "Oncology Hematopoietic Stem Cell Transplant Ward"
* HSLOC#1232-8  "Hematology-Oncology Ward"
* HSLOC#1234-4  "Hematopoietic Stem Cell Transplant Ward"
* HSLOC#1235-1  "Oncology Pediatric General Hematology-Oncology Ward"
* HSLOC#1227-8  "Oncology Step Down Unit"
* HSLOC#1236-9  "Oncology  Mixed Acuity Unit (all ages)"
ValueSet:    ICULocations
Title:       "ICU Locations"
Description: "Codes used for ICU locations"
* ^copyright = """This value set includes source materials developed by CDC: Reference to specific commercial products, manufacturers,
companies, or trademarks does not constitute its endorsement or recommendation by the U.S. Government, Department of Health and Human
Services, or Centers for Disease Control and Prevention. Source materials are available from the CDC Website at no charge at
https://www.cdc.gov/nhsn/cdaportal/terminology/codesystem/hsloc.html"""
* HSLOC#1026-4  "Burn Critical Care"
* HSLOC#1028-0  "Medical Cardiac Critical Care"
* HSLOC#1027-2  "Medical Critical Care"
* HSLOC#1029-8  "Medical-Surgical Critical Care"
* HSLOC#1035-5  "Neurologic Critical Care"
* HSLOC#1223-7  "ONC Medical Critical Care"
* HSLOC#1224-5  "ONC Surgical Critical Care"
* HSLOC#1225-2  "ONC Medical-Surgical Critical Care"
* HSLOC#1034-8  "Prenatal Critical Care"
* HSLOC#1033-0  "Respiratory Critical Care"
* HSLOC#1032-2  "Surgical Cardiothoracic Critical Care"
* HSLOC#1233-6  "ONC Pediatric Critical Care"
* HSLOC#1043-9  "Cardiothoracic Critical Care"
* HSLOC#1044-7  "Pediatric Medical Critical Care"
* HSLOC#1045-4  "Pediatric Medical-Surgical Critical Care"
* HSLOC#1047-0  "Pediatric Respiratory Critical Care"
* HSLOC#1048-8  "Pediatric Surgical Critical Care"
* HSLOC#1039-7  "Neonatal Critical Care (Level II/III)"
* HSLOC#1221-1  "Long Term Acute Care Ward"
* HSLOC#1224-5  "Oncology Surgical Critical Care"
* HSLOC#1225-2  "Oncology Medical-Surgical Critical Care"
ValueSet:    VentilatorDevices
Title:       "Ventilator Devices"
Description: "Codes used for Ventilator Devices [Populate VentilatorDevices](#todo)"
// We have none at the momement

ValueSet:    VentilatorWithTracheostomyDevices
Title:       "Ventilator Devices when used with Tracheostomy"
Description: "Codes used for Devices that support Ventilation with a Tracheostomy [Populate VentilatorWithTracheostomyDevices](#todo)"
// We have none at the momement

ValueSet:    VentilatorObservations
Title:       "Ventilator Observations"
Description: "Codes used to report ventilation activity"
//* codes from valueset PatientsOnVentilator
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* LOINC#19835-8 // Breath rate setting Ventilator synchronized intermittent mandatory
* LOINC#19994-3 // Oxygen/Inspired gas setting [Volume Fraction] Ventilator
* LOINC#20077-4 // Positive end expiratory pressure setting Ventilator
* LOINC#20079-0 // Pressure support setting Ventilator
* LOINC#20103-8 // Tidal volume expired/Plateau pressure --post 1.5-2.0 seconds inspiratory hold on ventilator
* LOINC#20112-9 // Tidal volume setting Ventilator
* LOINC#20115-2 // Tidal volume.spontaneous/Body weight [Volume/mass] --on ventilator
* LOINC#33438-3 // Breath rate mechanical --on ventilator
* LOINC#57655-3 // Tidal volume.exhaled maximum setting Ventilator alarm
* LOINC#76530-5 // Mean pressure Respiratory system airway --on ventilator
* LOINC#19839-0 // Breath rate spontaneous --on ventilator

ValueSet:    VentilatorProcedures
Title:       "Ventilator Procedures"
Description: "Codes used to report a ventilation procedure"
// We have none at the momement

ValueSet:    ConfirmedCOVID19Diagnoses
Title:       "Confirmed COVID-19 Diagnosis Values"
Description: "Codes confirming a COVID-19 diagnosis"
 * ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
//* codes from valueset COVID19DXSNOMED
 * ICD10CM#B34.2 "Coronavirus infection, unspecified"
 * ICD10CM#B97.2 "Coronavirus as the cause of diseases classified elsewhere"
 * ICD10CM#B97.29 "Other coronavirus as the cause of diseases classified elsewhere"
 * ICD10CM#U07.1 "COVID-19"
//* codes from valueset COVID19DXICD10
 * SCT#186747009 "Coronavirus infection (disorder)"
 * SCT#713084008 "Pneumonia caused by Human coronavirus (disorder)"
 * SCT#840539006 "Disease caused by severe acute respiratory syndrome coronavirus 2 (disorder)"
 * SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"

ValueSet:    SuspectedCOVID19Diagnoses
Description: "This Value Set identifies conditions that may be related to COVID-19"
 * ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
 * ^version = "20200410"
 * ^status = #draft
 * ^date = "2020-04-10T01:00:18-04:00"
 * ^publisher = "HL7"
//* codes from valueset COVID19Exposures
 * SCT#840546002 "Exposure to severe acute respiratory syndrome coronavirus 2 (event)"
//*
 * ICD10CM#A41.89 "Other specified sepsis"
 * ICD10CM#B34.2 "Coronavirus infection, unspecified"
 * ICD10CM#J12.8 "Other viral pneumonia"
 * ICD10CM#J12.89 "Other viral pneumonia"
 * ICD10CM#J20.8 "Acute bronchitis due to other specified organisms"
 * ICD10CM#J22 "Unspecified acute lower respiratory infection"
 * ICD10CM#J40 "Bronchitis, not specified as acute or chronic"
 * ICD10CM#J80 "Acute respiratory distress syndrome"
 * ICD10CM#J98.8 "Other specified respiratory disorders"
 * ICD10CM#R05 "Cough"
 * ICD10CM#R06.0 "Dyspnea"
 * ICD10CM#R06.02 "Shortness of breath"
 * ICD10CM#R50.9 "Fever, unspecified"
 * SCT#840544004 "Suspected disease caused by severe acute respiratory coronavirus 2 (situation)"
 * SCT#233604007 "Pneumonia (disorder)"
 * SCT#67782005 "Acute respiratory distress syndrome (disorder)"

ValueSet:    SuspectedOrConfirmedCOVID19Diagnoses
Title:       "Suspected Or Diagnosed COVID-19"
Description: "Codes identifying suspected or confirmed COVID-19"
 * ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
//* codes from ConfirmedCOVID19Diagnoses
 * ICD10CM#B34.2 "Coronavirus infection, unspecified"
 * ICD10CM#B97.2 "Coronavirus as the cause of diseases classified elsewhere"
 * ICD10CM#B97.29 "Other coronavirus as the cause of diseases classified elsewhere"
 * ICD10CM#U07.1 "COVID-19"
 * SCT#186747009 "Coronavirus infection (disorder)"
 * SCT#713084008 "Pneumonia caused by Human coronavirus (disorder)"
 * SCT#840539006 "Disease caused by severe acute respiratory syndrome coronavirus 2 (disorder)"
//* codes from SuspectedCOVID19Diagnoses
 * SCT#840544004 "Suspected disease caused by severe acute respiratory coronavirus 2 (situation)"
 * SCT#840546002 "Exposure to severe acute respiratory syndrome coronavirus 2 (event)"
 * SCT#233604007 "Pneumonia (disorder)"
 * SCT#67782005 "Acute respiratory distress syndrome (disorder)"
 * ICD10CM#A41.89 "Other specified sepsis"
 * ICD10CM#B34.2 "Coronavirus infection, unspecified"
 * ICD10CM#J12.8 "Other viral pneumonia"
 * ICD10CM#J12.89 "Other viral pneumonia"
 * ICD10CM#J20.8 "Acute bronchitis due to other specified organisms"
 * ICD10CM#J22 "Unspecified acute lower respiratory infection"
 * ICD10CM#J40 "Bronchitis, not specified as acute or chronic"
 * ICD10CM#J80 "Acute respiratory distress syndrome"
 * ICD10CM#J98.8 "Other specified respiratory disorders"
 * ICD10CM#R05 "Cough"
 * ICD10CM#R06.0 "Dyspnea"
 * ICD10CM#R06.02 "Shortness of breath"
 * ICD10CM#R50.9 "Fever, unspecified"

ValueSet:    PatientDeaths
Title:       "Patient Died"
Description: "Codes used to identify that a patient has died"
* http://terminology.hl7.org/CodeSystem/discharge-disposition#exp "Expired"

ValueSet:    Covid19Labs
Title:       "COVID-19 Diagnostic Test"
Description: "Codes for COVID-19 Diagnostic Tests"
 * ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at LOINC/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"

 * codes from valueset SARSCoV2Labs // Day 2: SARSCoV2GeneticLabs

 * LOINC#94307-6 "SARS-CoV-2 (COVID-19) N gene [Presence] in Unspecified specimen by Nucleic acid amplification using CDC primer-probe set N1"
 * LOINC#94308-4 "SARS-CoV-2 (COVID-19) N gene [Presence] in Unspecified specimen by Nucleic acid amplification using CDC primer-probe set N2"
 * LOINC#94309-2 "SARS-CoV-2 (COVID-19) RNA [Presence] in Unspecified specimen by NAA with probe detection"
 * LOINC#94310-0 "SARS-like coronavirus N gene [Presence] in Unspecified specimen by NAA with probe detection"
 * LOINC#94314-2 "SARS-CoV-2 (COVID-19) RdRp gene [Presence] in Unspecified specimen by NAA with probe detection"
 * LOINC#94315-9 "SARS-related coronavirus E gene [Presence] in Unspecified specimen by NAA with probe detection"
 * LOINC#94316-7 "SARS-CoV-2 (COVID-19) N gene [Presence] in Unspecified specimen by NAA with probe detection"
 * LOINC#94500-6 "SARS-CoV-2 (COVID-19) RNA [Presence] in Respiratory specimen by NAA with probe detection"
 * LOINC#94533-7 "SARS-CoV-2 (COVID-19) N gene [Presence] in Respiratory specimen by NAA with probe detection"
 * LOINC#94534-5 "SARS-CoV-2 (COVID-19) RdRp gene [Presence] in Respiratory specimen by NAA with probe detection"
 * LOINC#94559-2 "SARS-CoV-2 (COVID-19) ORF1ab region [Presence] in Respiratory specimen by NAA with probe detection"
 * LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"

 // This should be deleted for day 2
 * LOINC#94558-4 "SARS-CoV-2 (COVID-19) Ag [Presence] in Respiratory specimen by Rapid immunoassay"

ValueSet:    PositiveResults
Title:       "Confirmed COVID-19 Diagnosis"
Description: "Codes for a positive COVID-19 Diagnostic Test Result"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* SCT#10828004  "Positive"
* SCT#260373001 "Detected"

ValueSet:    NegativeResults
Title:       "COVID-19 Not Detected"
Description: "Codes for a negative COVID-19 Diagnostic Test Result"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* SCT#260385009   "Negative"
* SCT#260415000   "Not detected"
