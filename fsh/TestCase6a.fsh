Instance: Patient6a
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 6a: Ventilator (intubation) start date = T-1 and no stop (extubation) date w/ outcome = Yes"
* identifier.value = "Pat765432"
* gender = #male
* birthDate = "1940-02-02"

Instance: Encounter6a
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 6a: Ventilator (intubation) start date = T-1 and no stop (extubation) date w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc765432"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* period.end = "2020-09-09"
* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient6a)
* location.location = Reference(Location6a)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location6a
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 6a: Ventilator (intubation) start date = T-1 and no stop (extubation) date w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU  "Intensive care unit"

Instance: Condition6a
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 6a: Ventilator (intubation) start date = T-1 and no stop (extubation) date w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con765432"
* subject = Reference(Patient6a)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-09

Instance: Observation16a
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 6a: Ventilator (intubation) start date = T-1 and no stop (extubation) date w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs765432-1"
* status = #final
* encounter = Reference(Encounter6a)
* subject = Reference(Patient6a)
* effectiveDateTime = "2020-09-09"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: Observation36a
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 6a: Ventilator (intubation) start date = T-1 and no stop (extubation) date w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "765432-3"
* effectiveDateTime = "2020-09-08"
* status = #final
* encounter = Reference(Encounter6a)
* subject = Reference(Patient6a)
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

