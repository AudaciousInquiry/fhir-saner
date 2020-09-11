Instance: Patient4b
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 4b: T-15 w/ outcome = No"
* identifier.value = "Pat234567"
* gender = #female
* birthDate = "1967-08-23"

Instance: Encounter4b
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 4b: T-15 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc234567"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* period.end = "2020-09-09"
* subject = Reference(Patient4b)
* location.location = Reference(Location4b)
* reasonCode =  SCT#67782005 "Acute respiratory distress syndrome (disorder)"

Instance: Location4b
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 4b: T-15 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1076-9 "Pediatric Medical Ward"
* type[1] =  ROLECODE#PEDU  "Pediatric unit"


Instance: Observation14b
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 4b: T-15 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs234567-1"
* status = #final
* encounter = Reference(Encounter4b)
* subject = Reference(Patient4b)
* effectiveDateTime = "2020-08-25"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#260373001 "Detected"

Instance: Observation34b
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 4b: T-15 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "234567-3"
* status = #final
* encounter = Reference(Encounter4b)
* subject = Reference(Patient4b)
* effectiveDateTime = "2020-09-09"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

Instance: Condition4b
InstanceOf: Condition
Usage: #example
Description: "Condition for 4b"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con234567"
* code = SCT#233604007
* subject = Reference(Patient4b)

Instance: MedicationRequest14b
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 4b: T-15 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med234567"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient4b)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-09-08"

