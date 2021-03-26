Instance:  HAvBED2toFHIR
Title: "HAvBED2 to FHIR Concept Map"
InstanceOf: http://hl7.org/fhir/StructureDefinition/ConceptMap
 * insert SanerDefinitionContent
 * description = "This Concept Map provides mappings from terms used in the HAvBED2 specification to HL7 FHIR"
 * name = "HAvBED2toFHIR"
 * status = #draft
 * experimental = true
 * date = "2020-03-24"
 * publisher = "HL7 International Public Health Workgroup"
 * contact.name = "HL7 Public Health Workgroup"
 * contact.telecom.system = #url
 * contact.telecom.value = "http://hl7.org/Special/committees/pher/index.cfm"
 * contact[1].name = "Keith W. Boone"
 * contact[1].telecom.system = #email
 * contact[1].telecom.value = "kboone@ainq.com"
 * sourceUri = "https://archive.ahrq.gov/prep/havbed2/"
 * group[0].target = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
 * group[0].element[0].code = #AdultICU
 * group[0].element[0].display = "Adult ICU bed type"
 * group[0].element[0].target.code = #ICU
 * group[0].element[0].target.equivalence = #equivalent
 * group[0].element[0].target.comment = "These can support critically ill or injured patients, including ventilator support This category includes all major subtypes of ICU beds, including neurological, cardiac, trauma, or medical, with the exception that this category does not include burn ICU beds"
 * group[0].element[1].code = #PediatricICU
 * group[0].element[1].display = "Pediatric ICU beds."
 * group[0].element[1].target.code = #PEDICU
 * group[0].element[1].target.equivalence = #equivalent
 * group[0].element[1].target.comment = "This is similar to adult ICU beds, but for patients 17-years-old and younger."
 * group[0].element[2].code = #NeonatalICU
 * group[0].element[2].display = "Neonatal ICU beds"
 * group[0].element[2].target.code = #PEDNICU
 * group[0].element[2].target.equivalence = #equivalent
 * group[0].element[2].target.comment = "Neonatal ICU beds"
 * group[0].element[3].code = #ED
 * group[0].element[3].display = "Emergency Department beds used for acute care"
 * group[0].element[3].target.code = #ER
 * group[0].element[3].target.equivalence = #equivalent
 * group[0].element[3].target.comment = "Emergency Department beds used for acute care"
 * group[0].element[4].code = #MedicalSurgical
 * group[0].element[4].display = "Medical-surgical beds"
 * group[0].element[4].target.code = #HU
 * group[0].element[4].target.equivalence = #equivalent
 * group[0].element[4].target.comment = "These are also thought of as ward beds. These beds may or may not include cardiac telemetry capability"
 * group[0].element[5].code = #RehabLongTermCare
 * group[0].element[5].display = "Rehabilitation/Long term care beds"
 * group[0].element[5].target.code = #RHU
 * group[0].element[5].target.equivalence = #equivalent
 * group[0].element[5].target.comment = "Beds designated as long term care rehabilitation. These do not include floor beds"
 * group[0].element[6].code = #Pediatrics
 * group[0].element[6].display = "Pediatrics beds."
 * group[0].element[6].target.code = #PEDU
 * group[0].element[6].target.equivalence = #equivalent
 * group[0].element[6].target.comment = "These are ward medical/surgical beds for patients 17-years-old and younger"
 * group[0].element[7].code = #Psychiatric
 * group[0].element[7].display = "Ward beds on a closed/locked psychiatric unit or ward beds where a patient will be staffed by an attendant."
 * group[0].element[7].target.code = #PHU
 * group[0].element[7].target.equivalence = #equivalent
 * group[0].element[7].target.comment = "Ward beds on a closed/locked psychiatric unit or ward beds where a patient will be staffed by an attendant."
 * group[0].element[8].code = #Burn
 * group[0].element[8].display = "Burn beds"
 * group[0].element[8].target.equivalence = #unmatched
 * group[0].element[9].code = #NurseryBeds
 * group[0].element[9].display = "Neonatal or newborn care beds including all bed types other than Neonatal ICU"
 * group[0].element[9].target.equivalence = #unmatched
 * group[0].element[10].code = #OperatingRooms
 * group[0].element[10].display = "Operating rooms which are equipped, staffed and could be made available for patient care in a short period of time"
 * group[0].element[10].target.equivalence = #unmatched
 * group[0].element[11].code = #NegativeFlowIsolation
 * group[0].element[11].display = "Negative airflow isolation beds."
 * group[0].element[11].target.equivalence = #unmatched
 * group[0].element[12].code = #OtherIsolation
 * group[0].element[12].display = "Isolation beds."
 * group[0].element[12].target.equivalence = #unmatched
 * group[0].element[13].code = #NONISO
 * group[0].element[13].display = "Non-Isolation beds."
 * group[0].element[13].target.equivalence = #unmatched