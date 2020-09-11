Instance: Patient3a
InstanceOf: Patient
Usage: #example
Description: "Patient for Test Case 3a: Neither Adm diagnosis or Problem list  doument COVID w/ outcome = No"
* identifier.value = "Pat777777"
* gender = #female
* birthDate = "1940-02-02"

Instance: Encounter3a
InstanceOf: Encounter
Usage: #example
Description: "Encounter for Test Case 3a: Neither Adm diagnosis or Problem list  doument COVID w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Encounter"
* identifier.value = "Enc777777"
* status = http://hl7.org/fhir/encounter-status#in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* period.start = "2020-09-08"

* hospitalization.dischargeDisposition = http://terminology.hl7.org/CodeSystem/discharge-disposition#exp
* subject = Reference(Patient3a)
* location.location = Reference(Location3a)
* reasonCode =  SCT#67782005 "Acute respiratory distress syndrome (disorder)"

Instance: Location3a
InstanceOf: Location
Usage: #example
Description: "Location for Test Case 3a: Neither Adm diagnosis or Problem list  doument COVID w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Location"
* identifier.value = "Loc44082"
* type[0] = HSLOC#1027-2 "Medical Critical Care"
* type[1] =  ROLECODE#ICU "Intensive care unit"


Instance: Observation13a
InstanceOf: Observation
Usage: #example
Description: "Observation-1 for Test Case 3a: Neither Adm diagnosis or Problem list  doument COVID w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "Obs777777-1"
* status = #final
* encounter = Reference(Encounter3a)
* subject = Reference(Patient3a)
* effectiveDateTime = "2020-09-07"
* code = LOINC#94759-8 "SARS-CoV-2 (COVID-19) RNA [Presence] in Nasopharynx by NAA with probe detection"
* valueCodeableConcept = SCT#260415000   "Not detected"

Instance: Observation43a
InstanceOf: Observation
Usage: #example
Description: "Observation-4 for Test Case 3a: Neither Adm diagnosis or Problem list  doument COVID w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/Observation"
* identifier.value = "777777-4"
* status = #final
* encounter = Reference(Encounter3a)
* subject = Reference(Patient3a)
* effectiveDateTime = "2020-09-07"
* code = LOINC#20077-4  "Positive end expiratory pressure setting Ventilator"
* valueQuantity = 5 'cm[H20]'

Instance: MedicationRequest13a
InstanceOf: MedicationRequest
Usage: #example
Description: "MedicationRequest for Test Case 3a: Neither Adm diagnosis or Problem list  doument COVID w/ outcome = No"
* identifier.system = "http://sanerproject.org/test/MedicationRequest"
* identifier.value = "Med777777"
* status = #active
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#2367757
* subject = Reference(Patient3a)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-09-08"

