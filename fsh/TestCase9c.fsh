Instance: Patient9c
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 9c: Diagnosis of Suspected COVID-19 AND ALSO  positive viral test w/ outcome = No"
* identifier.value = "Pat778899"
* gender = #female
* birthDate = "1929-09-30"

Instance: Encounter9c
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 9c: Diagnosis of Suspected COVID-19 AND ALSO  positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc778899"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient9c)
* location.location = Reference(Location9c)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location9c
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 9c: Diagnosis of Suspected COVID-19 AND ALSO  positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Condition9c
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 9c: Diagnosis of Suspected COVID-19 AND ALSO  positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con778899"
* subject = Reference(Patient9c)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-08

Instance: Observation19c
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 9c: Diagnosis of Suspected COVID-19 AND ALSO  positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs778899-1"
* status = #final
* encounter = Reference(Encounter9c)
* subject = Reference(Patient9c)
* effectiveDateTime = "2020-09-09"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: Observation39c
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 9c: Diagnosis of Suspected COVID-19 AND ALSO  positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "778899-3"
* status = #final
* encounter = Reference(Encounter9c)
* subject = Reference(Patient9c)
* effectiveDateTime = "2020-09-09"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

Instance: MedicationRequest19c
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 9c: Diagnosis of Suspected COVID-19 AND ALSO  positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med778899"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient9c)
* dosageInstruction.timing.repeat.boundsPeriod.start =  "2020-09-08"

