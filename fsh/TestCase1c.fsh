Instance: Patient1c
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 1c: Admission date =T-2 w/ outcome = No"
* identifier.value = "Pat333333"
* gender = #male
* birthDate = "1949-12-07"

Instance: Encounter1c
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 1c: Admission date =T-2 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc333333"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-07"
* period.end = "2020-09-10"

* subject = Reference(Patient1c)
* location.location = Reference(Location1c)
* reasonCode =  SCT#233604007 "Pneumonia (disorder)"

Instance: Location1c
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 1c: Admission date =T-2 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44081"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Condition1c
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 1c: Admission date =T-2 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con333333"
* subject = Reference(Patient1c)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-07

Instance: Observation11c
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 1c: Admission date =T-2 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs333333-1"
* status = #final
* encounter = Reference(Encounter1c)
* subject = Reference(Patient1c)
* effectiveDateTime = "2020-09-02"
* code = LOINC#94500-6 "SARS-CoV-2 (COVID-19) RNA [Presence] in Respiratory specimen by NAA with probe detection"
* valueCodeableConcept = SCT#260415000   "Not detected"

Instance: Observation31c
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 1c: Admission date =T-2 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "333333-3"
* status = #final
* encounter = Reference(Encounter1c)
* subject = Reference(Patient1c)
* effectiveDateTime = "2020-09-07"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

Instance: Observation41c
InstanceOf: Observation
Usage: #example
Description: "Observation-4 for Test Case 1c: Admission date =T-2 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "333333-4"
* status = #final
* encounter = Reference(Encounter1c)
* subject = Reference(Patient1c)
* effectiveDateTime = "2020-09-07"
* code = LOINC#20077-4  "Positive end expiratory pressure setting Ventilator"
* valueQuantity = 5 'cm[H2O]'

Instance: Immunization11c
InstanceOf: Immunization
Usage: #example
Description: "Immunization for Test Case 1c: Admission date =T-2 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Immunization"
* identifier.value = "333333"
* occurrenceDateTime =  "2020-09-09"
* status = #completed
* vaccineCode = SCT#346524008
* patient = Reference(Patient1c)


