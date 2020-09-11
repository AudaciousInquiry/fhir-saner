Instance: Patient5c
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 5c: Positives collected T-13 and T w/ outcome = No"
* identifier.value = "Pat876543"
* gender = #male
* birthDate = "1949-12-07"

Instance: Encounter5c
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 5c: Positives collected T-13 and T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc876543"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient5c)
* location.location = Reference(Location5c)
* reasonCode =  SCT#67782005 "Acute respiratory distress syndrome (disorder)"

Instance: Location5c
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 5c: Positives collected T-13 and T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Condition5c
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 5c: Positives collected T-13 and T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con876543"
* subject = Reference(Patient5c)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"* onsetDateTime = 2020-09-08

Instance: Observation15c
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 5c: Positives collected T-13 and T w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs876543-1"
* status = #final
* encounter = Reference(Encounter5c)
* subject = Reference(Patient5c)
* effectiveDateTime = "2020-08-27"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#260373001 "Detected"



