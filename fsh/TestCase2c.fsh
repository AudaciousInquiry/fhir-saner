Instance: Patient2c
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 2c: Negative test followed by Positive  w/ outcome = Yes"
* identifier.value = "Pat666666"
* gender = #male
* birthDate = "1929-09-30"

Instance: Encounter2c
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 2c: Negative test followed by Positive  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc666666"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient2c)
* location.location = Reference(Location2c)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location2c
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 2c: Negative test followed by Positive  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1030-6 "Surgical Critical Care"
* type[1] = ROLECODE#ICU  "Intensive care unit"

Instance: Condition12c
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 2c: Negative test followed by Positive  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con666666"
* subject = Reference(Patient2c)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-08

Instance: Observation12c
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 2c: Negative test followed by Positive  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs666666-1"
* status = #final
* encounter = Reference(Encounter2c)
* subject = Reference(Patient2c)
* effectiveDateTime = "2020-09-01"
* code = LOINC#94500-6 "SARS-CoV-2 (COVID-19) RNA [Presence] in Respiratory specimen by NAA with probe detection"
* valueCodeableConcept = SCT#260415000   "Not Detected"

Instance: Observation22c
InstanceOf: Observation
Usage: #example
Description: "Observation-2 for Test Case 2c: Negative test followed by Positive  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs666666-2"
* status = #final
* encounter = Reference(Encounter2c)
* subject = Reference(Patient2c)
* effectiveDateTime = "2020-09-08"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#260373001   "Detected"

Instance: Observation32c
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 2c: Negative test followed by Positive  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "666666-3"
* status = #final
* encounter = Reference(Encounter2c)
* subject = Reference(Patient2c)
* effectiveDateTime = "2020-09-09"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

Instance: Condition22c
InstanceOf: Condition
Usage: #example
Description: "Condition for 2c"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con666666"
* code = SCT#882784691000119100
* subject = Reference(Patient2c)
* onsetDateTime = "2020-09-08"

Instance: MedicationRequest12c
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 2c: Negative test followed by Positive  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med666666"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient2c)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-09-08"

Instance: Immunization12c
InstanceOf: Immunization
Usage: #example
Description: "Immunization for Test Case 2c: Negative test followed by Positive  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Immunization"
* identifier.value = "666666"
* occurrenceDateTime =  "2020-09-09"
* status = #completed
* vaccineCode = SCT#346524008
* patient = Reference(Patient2c)
