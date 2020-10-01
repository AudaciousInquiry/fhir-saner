Instance: Patient6c
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 6c: Ventilator (intubation) start date = T-6 and stop date (extubation) =T-1 w/ outcome = No"
* identifier.value = "Pat543210"
* gender = #male
* birthDate = "1949-12-07"

Instance: Encounter6c
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 6c: Ventilator (intubation) start date = T-6 and stop date (extubation) =T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc543210"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* period.end = "2020-09-10"

* subject = Reference(Patient6c)
* location.location = Reference(Location6c)
* reasonCode =  SCT#67782005 "Acute respiratory distress syndrome (disorder)"

Instance: Location6c
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 6c: Ventilator (intubation) start date = T-6 and stop date (extubation) =T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1028-0 "Medical Cardiac Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Condition6c
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 6c: Ventilator (intubation) start date = T-6 and stop date (extubation) =T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con543210"
* subject = Reference(Patient6c)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-07

Instance: Observation16c
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 6c: Ventilator (intubation) start date = T-6 and stop date (extubation) =T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs543210-1"
* status = #final
* encounter = Reference(Encounter6c)
* subject = Reference(Patient6c)
* effectiveDateTime = "2020-09-02"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#260415000   "Not detected"

Instance: Observation36c
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 6c: Ventilator (intubation) start date = T-6 and stop date (extubation) =T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "543210-3"
* status = #final
* encounter = Reference(Encounter6c)
* subject = Reference(Patient6c)
* effectiveDateTime = "2020-09-03"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

Instance: Observation46c
InstanceOf: Observation
Usage: #example
Description: "Observation-4 for Test Case 6c: Ventilator (intubation) start date = T-6 and stop date (extubation) =T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "543210-4"
* status = #final
* encounter = Reference(Encounter6c)
* subject = Reference(Patient6c)
* effectiveDateTime = "2020-09-08"
* code = LOINC#20077-4  "Positive end expiratory pressure setting Ventilator"
* valueQuantity = 5 'cm[H2O]'

Instance: MedicationRequest16c
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 6c: Ventilator (intubation) start date = T-6 and stop date (extubation) =T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med543210"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient6c)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-09-08"

Instance: Immunization16c
InstanceOf: Immunization
Usage: #example
Description: "Immunization for Test Case 6c: Ventilator (intubation) start date = T-6 and stop date (extubation) =T-1 w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Immunization"
* identifier.value = "543210"
* occurrenceDateTime =  "2020-09-09"
* status = #completed
* vaccineCode = SCT#346524008
* patient = Reference(Patient6c)


