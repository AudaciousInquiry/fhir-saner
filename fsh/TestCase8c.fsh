Instance: Patient8c
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 8c: Yes w/ outcome = Yes"
* identifier.value = "Pat445566"
* gender = #female
* birthDate = "1929-09-30"
Instance: Encounter8c
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 8c: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc445566"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient8c)
* location.location = Reference(Location8c)
* reasonCode =  SCT#67782005 "Acute respiratory distress syndrome (disorder)"

Instance: Location8c
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 8c: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1108-0 "Emergency Department"
* type[1] =  ROLECODE#ER "Emergency room"

Instance: Observation18c
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 8c: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs445566-1"
* status = #final
* encounter = Reference(Encounter8c)
* subject = Reference(Patient8c)
* effectiveDateTime = "2020-09-08"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: Observation38c
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 8c: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "445566-3"
* status = #final
* encounter = Reference(Encounter8c)
* subject = Reference(Patient8c)
* effectiveDateTime = "2020-09-08"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

Instance: Observation48c
InstanceOf: Observation
Usage: #example
Description: "Observation-4 for Test Case 8c: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "445566-4"
* status = #final
* encounter = Reference(Encounter8c)
* subject = Reference(Patient8c)
* effectiveDateTime = "2020-09-09"
* code = LOINC#20077-4  "Positive end expiratory pressure setting Ventilator"
* valueQuantity = 5 'cm[H2O]'

Instance: MedicationRequest18c
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 8c: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med445566"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient8c)
* dosageInstruction.timing.repeat.boundsPeriod.start =  "2020-09-08"

