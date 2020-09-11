
Instance: Patient1a
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 1a: Admission date =Today (T) w/ outcome = No"
* identifier.value = "Pat111111"
* gender = #female
* birthDate = "1940-02-02"

Instance: Encounter1a
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 1a: Admission date =Today (T) w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc111111"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-09"
* period.end = "2020-09-09"
* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient1a)
* location.location = Reference(Location1a)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location1a
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 1a: Admission date =Today (T) w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44083"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"

Instance: Condition1a
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 1a: Admission date =Today (T) w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con111111"
* subject = Reference(Patient1a)
* code = SCT#870590002 "Acute hypoxemic respiratory failure due to disease caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-09

Instance: Observation11a
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 1a: Admission date =Today (T) w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs111111-1"
* status = #final
* encounter = Reference(Encounter1a)
* subject = Reference(Patient1a)
* effectiveDateTime = "2020-09-09"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: MedicationRequest11a
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 1a: Admission date =Today (T) w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med111111"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient1a)
* dosageInstruction.timing.repeat.boundsPeriod.start =  "2020-09-09"

