Instance: Patient4c
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 4c: T w/ outcome = No"
* identifier.value = "Pat345678"
* gender = #male
* birthDate = "1949-12-07"

Instance: Encounter4c
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 4c: T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc345678"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* period.end = "2020-09-10"
* subject = Reference(Patient4c)
* location.location = Reference(Location4c)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location4c
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 4c: T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1028-0 "Medical Cardiac Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Condition4c
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 4c: T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con345678"
* subject = Reference(Patient4c)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-08

Instance: Observation14c
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 4c: T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs345678-1"
* status = #final
* encounter = Reference(Encounter4c)
* subject = Reference(Patient4c)
* effectiveDateTime = "2020-09-08"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: Observation34c
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 4c: T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "345678-3"
* status = #final
* encounter = Reference(Encounter4c)
* subject = Reference(Patient4c)
* effectiveDateTime = "2020-09-09"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

Instance: MedicationRequest14c
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 4c: T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med345678"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient4c)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-09-08"

