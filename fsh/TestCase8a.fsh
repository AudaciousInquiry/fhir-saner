Instance: Patient8a
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 8a: No w/ outcome = No"
* identifier.value = "Pat334455"
* gender = #female
* birthDate = "1956-09-13"
Instance: Encounter8a
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 8a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc334455"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient8a)
* location.location = Reference(Location8a)
* reasonCode =  SCT#67782005 "Acute respiratory distress syndrome (disorder)"

Instance: Location8a
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 8a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1030-6 "Surgical Critical Care"
* type[1] =  ROLECODE#ICU  "Intensive care unit"

Instance: Condition8a
InstanceOf: Condition
Usage: #example
Description: "Condition for 8a"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con334455"
* code = SCT#233604007
* subject = Reference(Patient8a)

Instance: Observation18a
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 8a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs334455-1"
* status = #final
* encounter = Reference(Encounter8a)
* subject = Reference(Patient8a)
* effectiveDateTime = "2020-09-08"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#260373001 "Detected"

Instance: MedicationRequest18a
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 8a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med334455"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient8a)
* dosageInstruction.timing.repeat.boundsPeriod.start =  "2020-09-08"

