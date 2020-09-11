Instance: Patient7b
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 7b: Yes w/ outcome = Yes"
* identifier.value = "Pat223344"
* gender = #female
* birthDate = "1949-12-07"

Instance: Encounter7b
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 7b: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc223344"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient7b)
* location.location = Reference(Location7b)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location7b
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 7b: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Condition7b
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 7b: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con223344"
* subject = Reference(Patient7b)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-09

Instance: Observation17b
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 7b: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs223344-1"
* status = #final
* encounter = Reference(Encounter7b)
* subject = Reference(Patient7b)
* effectiveDateTime = "2020-09-08"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: MedicationRequest17b
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 7b: Yes w/ outcome = Yes"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med223344"
* status = #active
* intent = #order
* medicationCodeableConcept = #Remdesivir
* subject = Reference(Patient7b)
* dosageInstruction.timing.repeat.boundsPeriod.start =  "2020-09-08"

