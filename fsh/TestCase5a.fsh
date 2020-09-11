Instance: Patient5a
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 5a: Only positive collected today w/ outcome = Yes"
* identifier.value = "Pat456789"
* gender = #male
* birthDate = "1940-02-02"

Instance: Encounter5a
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 5a: Only positive collected today w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc456789"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"

* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient5a)
* location.location = Reference(Location5a)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location5a
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 5a: Only positive collected today w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU  "Intensive care unit"

Instance: Condition5a
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 5a: Only positive collected today w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con456789"
* subject = Reference(Patient5a)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-09


Instance: Observation15a
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 5a: Only positive collected today w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs456789-1"
* status = #final
* encounter = Reference(Encounter5a)
* subject = Reference(Patient5a)
* effectiveDateTime = "2020-09-08"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: MedicationRequest15a
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 5a: Only positive collected today w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med456789"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient5a)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-09-08"

