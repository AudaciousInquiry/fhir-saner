Instance: ComputableNHSNMeasureLibrary
InstanceOf: PublicHealthMeasureLibrary
// We aren't automating anything other than patient impact and hospital capacity, this library
// will be referenced by other NHSN inspired measures but will not be used by them.

 * insert SanerDefinitionContent
 * id = "ComputableNHSNMeasureLibrary"
 * name = "ComputableNHSNMeasureLibrary"
 * url = "http://hl7.org/fhir/us/saner/StructureDefinition/ComputableNHSNMeasureLibrary"
 * title = "Computable NHSN Patient Impact and Hospital Capacity Measure Library"
 * type = http://terminology.hl7.org/CodeSystem/library-type#asset-collection
 * useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
 * useContext.valueCodeableConcept = http://snomed.info/sct#840539006 "COVID-19"
 * author.name = "HL7 Public Health Workgroup"
 * author.telecom.system = #email
 * author.telecom.value = "mailto:pher@lists.hl7.org"
 * insert NHSNArtifacts

* content[0].id = "BedLocationOperationalStatus"
* content[0].url = Canonical(BedLocationOperationalStatus)
* content[0].title = "Bed Location Operational Status"
* content[0].contentType = #application/fhir+xml

* content[1].id = "ConfirmedCOVID19Diagnoses"
* content[1].url = Canonical(ConfirmedCOVID19Diagnoses)
* content[1].title = "Confirmed COVID-19 Diagnosis Values"
* content[1].contentType = #application/fhir+xml

* content[2].id = "PositiveResults"
* content[2].url = Canonical(PositiveResults)
* content[2].title = "Confirmed COVID-19 Diagnosis"
* content[2].contentType = #application/fhir+xml

* content[3].id = "Covid19Labs"
* content[3].url = Canonical(Covid19Labs)
* content[3].title = "COVID-19 Diagnostic Test"
* content[3].contentType = #application/fhir+xml

* content[4].id = "NegativeResults"
* content[4].url = Canonical(NegativeResults)
* content[4].title = "COVID-19 Not Detected"
* content[4].contentType = #application/fhir+xml

* content[5].id = "COVID19Antibody"
* content[5].url = Canonical(COVID19Antibody)
* content[5].title = "COVID19Antibody"
* content[5].contentType = #application/fhir+xml

* content[6].id = "COVID19DXICD10"
* content[6].url = Canonical(COVID19DXICD10)
* content[6].title = "COVID19DXICD10"
* content[6].contentType = #application/fhir+xml

* content[7].id = "COVID19DXSNOMED"
* content[7].url = Canonical(COVID19DXSNOMED)
* content[7].title = "COVID19DXSNOMED"
* content[7].contentType = #application/fhir+xml

* content[8].id = "COVID19Exposures"
* content[8].url = Canonical(COVID19Exposures)
* content[8].title = "COVID19Exposures"
* content[8].contentType = #application/fhir+xml

* content[9].id = "COVID19Organism"
* content[9].url = Canonical(COVID19Organism)
* content[9].title = "COVID19Organism"
* content[9].contentType = #application/fhir+xml

* content[10].id = "HealthcareServiceLocation"
* content[10].url = Canonical(HealthcareServiceLocation)
* content[10].title = "HealthcareServiceLocation"
* content[10].contentType = #application/fhir+xml

* content[11].id = "ICULocations"
* content[11].url = Canonical(ICULocations)
* content[11].title = "ICU Locations"
* content[11].contentType = #application/fhir+xml

* content[12].id = "InpatientLocations"
* content[12].url = Canonical(InpatientLocations)
* content[12].title = "Inpatient Locations"
* content[12].contentType = #application/fhir+xml

* content[13].id = "MeasureGroups"
* content[13].url = Canonical(MeasureGroups)
* content[13].title = "Measure Groups"
* content[13].contentType = #application/fhir+xml

* content[14].id = "MeasurePopulations"
* content[14].url = Canonical(MeasurePopulations)
* content[14].title = "Measure Populations"
* content[14].contentType = #application/fhir+xml

* content[15].id = "MeasureRateAggregationValues"
* content[15].url = Canonical(MeasureRateAggregationValues)
* content[15].title = "Measure Rate Aggregation Value Set"
* content[15].contentType = #application/fhir+xml

* content[16].id = "MeasureStatus"
* content[16].url = Canonical(MeasureStatus)
* content[16].title = "Measure Status Values"
* content[16].contentType = #application/fhir+xml

* content[17].id = "PatientsOnVentilator"
* content[17].url = Canonical(PatientsOnVentilator)
* content[17].title = "Observations for Patients on a Ventilator"
* content[17].contentType = #application/fhir+xml

* content[18].id = "PatientDeaths"
* content[18].url = Canonical(PatientDeaths)
* content[18].title = "Patient Died"
* content[18].contentType = #application/fhir+xml

* content[19].id = "Remdesivir"
* content[19].url = Canonical(Remdesivir)
* content[19].title = "Remdesivir"
* content[19].contentType = #application/fhir+xml

* content[20].id = "SARSCoV2GeneticLabs"
* content[20].url = Canonical(SARSCoV2GeneticLabs)
* content[20].title = "SARSCoV2 Genetic Labs"
* content[20].contentType = #application/fhir+xml

* content[21].id = "SARSCoV2Labs"
* content[21].url = Canonical(SARSCoV2Labs)
* content[21].title = "SARSCoV2Labs"
* content[21].contentType = #application/fhir+xml

* content[22].id = "SuspectedCOVID19Diagnoses"
* content[22].url = Canonical(SuspectedCOVID19Diagnoses)
* content[22].title = "Suspected COVID-19 Diagnosis Values"
* content[22].contentType = #application/fhir+xml

* content[23].id = "SuspectedOrConfirmedCOVID19Diagnoses"
* content[23].url = Canonical(SuspectedOrConfirmedCOVID19Diagnoses)
* content[23].title = "Suspected Or Diagnosed COVID-19"
* content[23].contentType = #application/fhir+xml

* content[24].id = "VentilatorDevices"
* content[24].url = Canonical(VentilatorDevices)
* content[24].title = "Ventilator Devices"
* content[24].contentType = #application/fhir+xml

* content[25].id = "VentilatorWithTracheostomyDevices"
* content[25].url = Canonical(VentilatorWithTracheostomyDevices)
* content[25].title = "Ventilator Devices when used with Tracheostomy"
* content[25].contentType = #application/fhir+xml

* content[26].id = "VentilatorObservations"
* content[26].url = Canonical(VentilatorObservations)
* content[26].title = "Ventilator Observations"
* content[26].contentType = #application/fhir+xml

* content[27].id = "VentilatorProcedures"
* content[27].url = Canonical(VentilatorProcedures)
* content[27].title = "Ventilator Procedures"
* content[27].contentType = #application/fhir+xml


