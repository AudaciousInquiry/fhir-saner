Instance: Patient3b
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 3b: Adm diagnosis documents COVID but problem list does not w/ outcome = Yes"
* identifier.value = "Pat999999"
* gender = #male
* birthDate = "1949-12-07"

Instance: Encounter3b
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 3b: Adm diagnosis documents COVID but problem list does not w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc999999"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient3b)
* location.location = Reference(Location3b)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location3b
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 3b: Adm diagnosis documents COVID but problem list does not w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1060-3 "Medical Ward"
* type[1] =  ROLECODE#HU "Hospital unit"

Instance: Condition3b
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 3b: Adm diagnosis documents COVID but problem list does not w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con999999"
* subject = Reference(Patient3b)
* code = SCT#67782005 "Acute respiratory distress syndrome (disorder)"* onsetDateTime = 2020-09-09



Instance: Observation13b
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 3b: Adm diagnosis documents COVID but problem list does not w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs999999-1"
* status = #final
* encounter = Reference(Encounter3b)
* subject = Reference(Patient3b)
* effectiveDateTime = "2020-09-08"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#260385009   "Negative"

Instance: Observation33b
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 3b: Adm diagnosis documents COVID but problem list does not w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "999999-3"
* status = #final
* encounter = Reference(Encounter3b)
* subject = Reference(Patient3b)
* effectiveDateTime = "2020-09-09"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

