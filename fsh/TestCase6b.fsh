Instance: Patient6b
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 6b: Ventilator (intubation)start date = T-3 and stop (extubation) date = T  w/ outcome = Yes"
* identifier.value = "Pat654321"
* gender = #female
* birthDate = "1967-08-23"

Instance: Encounter6b
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 6b: Ventilator (intubation)start date = T-3 and stop (extubation) date = T  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc654321"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient6b)
* location.location = Reference(Location6b)
* reasonCode =  SCT#67782005 "Acute respiratory distress syndrome (disorder)"

Instance: Location6b
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 6b: Ventilator (intubation)start date = T-3 and stop (extubation) date = T  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1076-9 "Pediatric Medical Ward"
* type[1] =  ROLECODE#PEDU "Pediatric unit"

Instance: Observation16b
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 6b: Ventilator (intubation)start date = T-3 and stop (extubation) date = T  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs654321-1"
* status = #final
* encounter = Reference(Encounter6b)
* subject = Reference(Patient6b)
* effectiveDateTime = "2020-09-08"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#260373001 "Detected"

Instance: Observation36b
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 6b: Ventilator (intubation)start date = T-3 and stop (extubation) date = T  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "654321-3"
* status = #final
* encounter = Reference(Encounter6b)
* subject = Reference(Patient6b)
* effectiveDateTime = "2020-09-06"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

Instance: Observation46b
InstanceOf: Observation
Usage: #example
Description: "Observation-4 for Test Case 6b: Ventilator (intubation)start date = T-3 and stop (extubation) date = T  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "654321-4"
* status = #final
* encounter = Reference(Encounter6b)
* subject = Reference(Patient6b)
* effectiveDateTime = "2020-09-09"
* code = LOINC#20077-4  "Positive end expiratory pressure setting Ventilator"
* valueQuantity = 5 'cm[H20]'

Instance: MedicationRequest16b
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 6b: Ventilator (intubation)start date = T-3 and stop (extubation) date = T  w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med654321"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient6b)
* dosageInstruction.timing.repeat.boundsPeriod.start =  "2020-09-08"
