Instance: Patient2a
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 2a: Positive test result w/ outcome = Yes/No"
* identifier.value = "Pat444444"
* gender = #male
* birthDate = "1956-09-13"

Instance: Encounter2a
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 2a: Positive test result w/ outcome = Yes/No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc444444"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* period.end = "2020-09-09"

* subject = Reference(Patient2a)
* location.location = Reference(Location2a)
* reasonCode =  SCT#233604007 "Pneumonia (disorder)"

Instance: Location2a
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 2a: Positive test result w/ outcome = Yes/No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1208-8 "Telemetry Ward"

Instance: Condition2a
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 2a: Positive test result w/ outcome = Yes/No"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con444444"
* subject = Reference(Patient2a)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"* onsetDateTime = 2020-09-08


Instance: Observation12a
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 2a: Positive test result w/ outcome = Yes/No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs444444-1"
* status = #final
* encounter = Reference(Encounter2a)
* subject = Reference(Patient2a)
* effectiveDateTime = "2020-09-08"
// This observation will not qualify on day 2 b/c it uses the Ag test.
* code = LOINC#94558-4 "SARS-CoV-2 (COVID-19) Ag [Presence] in Respiratory specimen by Rapid immunoassay"
* valueCodeableConcept = SCT#260415000   "Not detected"

Instance: Immunization12a
InstanceOf: Immunization
Usage: #example
Description: "Immunization for Test Case 2a: Positive test result w/ outcome = Yes/No"
* identifier.system = "http://sanerproject.org/test/Immunization"
* identifier.value = "444444"
* occurrenceDateTime =  "2020-09-09"
* status = #completed
* vaccineCode = SCT#346524008
* patient = Reference(Patient2a)