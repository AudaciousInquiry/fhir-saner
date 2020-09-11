Instance: Patient1b
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 1b: Admission date =T-1 w/ outcome = Yes/No"
* identifier.value = "Pat222222"
* gender = #female
* birthDate = "1967-08-23"

Instance: Encounter1b
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 1b: Admission date =T-1 w/ outcome = Yes/No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc222222"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient1b)
* location.location = Reference(Location1b)
* reasonCode =  SCT#233604007 "Pneumonia (disorder)"

Instance: Location1b
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 1b: Admission date =T-1 w/ outcome = Yes/No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1076-9 "Pediatric Medical Ward"
* type[1] =  ROLECODE#PEDU "Pediatric unit"

Instance: Observation11b
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 1b: Admission date =T-1 w/ outcome = Yes/No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs222222-1"
* status = #final
* encounter = Reference(Encounter1b)
* subject = Reference(Patient1b)
* effectiveDateTime = "2020-09-08"
// This observation will not qualify on day 2 b/c it uses the Ag test.
* code = LOINC#94558-4 "SARS-CoV-2 (COVID-19) Ag [Presence] in Respiratory specimen by Rapid immunoassay"
* valueCodeableConcept = SCT#260373001 "Detected"

Instance: Condition1b
InstanceOf: Condition
Usage: #example
Description: "Condition for 1b"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con222222"
* code = SCT#67782005
* subject = Reference(Patient1b)

Instance: MedicationRequest11b
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 1b: Admission date =T-1 w/ outcome = Yes/No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med222222"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient1b)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-09-08"

