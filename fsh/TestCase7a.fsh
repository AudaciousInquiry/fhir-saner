Instance: Patient7a
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 7a: No w/ outcome = No"
* identifier.value = "Pat112233"
* gender = #female
* birthDate = "1967-08-23"
Instance: Encounter7a
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 7a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc112233"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"
* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient7a)
* location.location = Reference(Location7a)
* reasonCode = http://hl7.org/fhir/sid/icd-10-cm#U07.1 "COVID-19"

Instance: Location7a
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 7a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1208-8 "Telemetry Ward"

Instance: Condition7a
InstanceOf: Condition
Usage: #example
Description: "Condition for Test Case 7a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Condition"
* identifier.value = "Con112233"
* subject = Reference(Patient7a)
* code = SCT#882784691000119100 "Pneumonia caused by Severe acute respiratory syndrome coronavirus 2 (disorder)"
* onsetDateTime = 2020-09-09

Instance: Observation17a
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 7a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs112233-1"
* status = #final
* encounter = Reference(Encounter7a)
* subject = Reference(Patient7a)
* effectiveDateTime = "2020-09-08"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#10828004  "Positive"

Instance: Observation37a
InstanceOf: Observation
Usage: #example
Description: "Observation-3 for Test Case 7a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "112233-3"
* status = #final
* encounter = Reference(Encounter7a)
* subject = Reference(Patient7a)
* effectiveDateTime = "2020-09-08"
* code = LOINC#19994-3  "Oxygen/Inspired gas setting [Volume Fraction] Ventilator"
* valueQuantity = 100 '%'

Instance: Observation47a
InstanceOf: Observation
Usage: #example
Description: "Observation-4 for Test Case 7a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "112233-4"
* status = #final
* encounter = Reference(Encounter7a)
* subject = Reference(Patient7a)
* effectiveDateTime = "2020-09-09"
* code = LOINC#20077-4  "Positive end expiratory pressure setting Ventilator"
* valueQuantity = 5 'cm[H20]'

Instance: MedicationRequest17a
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 7a: No w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med112233"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient7a)
* dosageInstruction.timing.repeat.boundsPeriod.start =  "2020-09-08"

