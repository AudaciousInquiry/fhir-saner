Instance: Patient4a
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 4a: T-1 w/ outcome = Yes"
* identifier.value = "Pat123456"
* gender = #male
* birthDate = "1940-02-02"

Instance: Encounter4a
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 4a: T-1 w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc123456"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* period.end = "2020-09-09"
* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient4a)
* location.location = Reference(Location4a)
* reasonCode =  SCT#67782005 "Acute respiratory distress syndrome (disorder)"

Instance: Location4a
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 4a: T-1 w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"


Instance: Observation14a
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 4a: T-1 w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs123456-1"
* status = #final
* encounter = Reference(Encounter4a)
* subject = Reference(Patient4a)
* effectiveDateTime = "2020-09-07"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: Observation34a
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 4a: T-1 w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "123456-3"
* status = #final
* encounter = Reference(Encounter4a)
* subject = Reference(Patient4a)
* effectiveDateTime = "2020-09-09"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

