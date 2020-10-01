Instance: Patient2b
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 2b: Negative test result w/ outcome = No"
* identifier.value = "Pat555555"
* gender = #female
* birthDate = "1949-04-04"

Instance: Encounter2b
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 2b: Negative test result w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc555555"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient2b)
* location.location = Reference(Location2b)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location2b
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 2b: Negative test result w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1060-3 "Medical Ward"
* type[1] =  ROLECODE#HU "Hospital unit"

Instance: Condition2b
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 2b: Negative test result w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con555555"
* subject = Reference(Patient2b)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"* onsetDateTime = 2020-09-08


Instance: Observation12b
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 2b: Negative test result w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs555555-1"
* status = #final
* encounter = Reference(Encounter2b)
* subject = Reference(Patient2b)
* effectiveDateTime = "2020-09-09"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#260415000   "Not detected"

Instance: Observation42b
InstanceOf: Observation
Usage: #example
Description: "Observation-4 for Test Case 2b: Negative test result w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "555555-4"
* status = #final
* encounter = Reference(Encounter2b)
* subject = Reference(Patient2b)
* effectiveDateTime = "2020-09-07"
* code = LOINC#20077-4  "Positive end expiratory pressure setting Ventilator"
* valueQuantity = 5 'cm[H2O]'

Instance: MedicationRequest12b
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 2b: Negative test result w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med555555"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient2b)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-09-08"

Instance: Immunization12b
InstanceOf: Immunization
Usage: #example
Description: "Immunization for Test Case 2b: Negative test result w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Immunization"
* identifier.value = "555555"
* occurrenceDateTime =  "2020-09-09"
* status = #completed
* vaccineCode = SCT#346524008
* patient = Reference(Patient2b)


