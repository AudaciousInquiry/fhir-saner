Instance: Patient9a
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 9a: Diagnosis of Suspected COVID-19 WITHOUT positive viral test w/ outcome = Yes"
* identifier.value = "Pat556677"
* gender = #male
* birthDate = "1956-09-13"

Instance: Encounter9a
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 9a: Diagnosis of Suspected COVID-19 WITHOUT positive viral test w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc556677"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* subject = Reference(Patient9a)
* location.location = Reference(Location9a)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location9a
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 9a: Diagnosis of Suspected COVID-19 WITHOUT positive viral test w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1030-6 "Surgical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Condition9a
InstanceOf: Condition
Usage: #example
Description: "Condition for 9a"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con556677"
* code = SCT#233604007
* subject = Reference(Patient9c)

Instance: Immunization19a
InstanceOf: Immunization
Usage: #example
Description: "Immunization for Immunization1-9a"
* identifier.system = "http://sanerproject.org/test/Immunization"
* identifier.value = "556677"
* status = #completed
* vaccineCode = http://SCT#346524008
* patient = Reference(Patient9c)
* occurrenceDateTime = "2020-09-09"

