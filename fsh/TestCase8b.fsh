Instance: Patient8b
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 8b: Yes w/ outcome = Yes"
* identifier.value = "Pat265928"
* gender = #male
* birthDate = "1949-04-04"
Instance: Encounter8b
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 8b: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc265928"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient8b)
* location.location = Reference(Location8b)
* reasonCode =  SCT#233604007 "Pneumonia (disorder)"

Instance: Location8b
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 8b: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1097-5 "Post-anesthesia Care Unit (as an Overflow unit)"


Instance: Observation18b
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 8b: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs265928-1"
* status = #final
* encounter = Reference(Encounter8b)
* subject = Reference(Patient8b)
* effectiveDateTime = "2020-09-09"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: MedicationRequest18b
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 8b: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med265928"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient8b)
* dosageInstruction.timing.repeat.boundsPeriod.start =  "2020-09-08"

