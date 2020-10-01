Instance: Patient9b
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 9b: No Diagnosis of Suspected  COVID-19 nor positive viral test w/ outcome = No"
* identifier.value = "Pat667788"
* gender = #female
* birthDate = "1949-04-04"

Instance: Encounter9b
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 9b: No Diagnosis of Suspected  COVID-19 nor positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc667788"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"

* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient9b)
* location.location = Reference(Location9b)
* reasonCode =  SCT#233604007 "Pneumonia (disorder)"

Instance: Location9b
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 9b: No Diagnosis of Suspected  COVID-19 nor positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Condition9b
InstanceOf: Condition
Usage: #example
Description: "Condition for 9b"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con667788"
* code = SCT#67782005
* subject = Reference(Patient9b)

Instance: Observation49b
InstanceOf: Observation
Usage: #example
Description: "Observation-4 for Test Case 9b: No Diagnosis of Suspected  COVID-19 nor positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "667788-4"
* status = #final
* effectiveDateTime = "2020-09-07"
* code = LOINC#20077-4  "Positive end expiratory pressure setting Ventilator"
* valueQuantity = 5 'cm[H2O]'

Instance: Immunization19b
InstanceOf: Immunization
Usage: #example
Description: "Immunization for Test Case 9b: No Diagnosis of Suspected  COVID-19 nor positive viral test w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Immunization"
* identifier.value = "667788"
* occurrenceDateTime =  "2020-09-09"
* status = #completed
* vaccineCode = SCT#346524008
* patient = Reference(Patient9b)


