Instance: Patient5b
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 5b: Only positive collected T-1 w/ outcome = No"
* identifier.value = "Pat987654"
* gender = #female
* birthDate = "1967-08-23"

Instance: Encounter5b
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 5b: Only positive collected T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc987654"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient5b)
* location.location = Reference(Location5b)
* reasonCode =  SCT#67782005 "Acute respiratory distress syndrome (disorder)"

Instance: Location5b
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 5b: Only positive collected T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Observation15b
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 5b: Only positive collected T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs987654-1"
* status = #final
* encounter = Reference(Encounter5b)
* subject = Reference(Patient5b)
* effectiveDateTime = "2020-09-07"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: MedicationRequest15b
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 5b: Only positive collected T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med987654"
* status = #active
* intent = #order
* subject = Reference(Patient5b)
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-09-08"

