RuleSet: NJExamplesFEMA
   * status = #complete
   * type = #summary
   * measure = "http://hl7.org/fhir/us/saner/Measure/FEMADailyHospitalCOVID19Reporting"
   * subject.identifier.system = "https://www.census.gov/geographies"
   * subject.identifier.value = "34"
   * subject.reference = "Location/states-NJ"
   * subject.display = "State of New Jersey"

   * reporter.reference = "Organization/NJ-DPH"
   * reporter.display = "New Jersey Department of Public Health"



Instance: ExampleNJ-20200404-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/04/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200404-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3957-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-04"
* period.start = "2020-04-04"
* period.end = "2020-04-04"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 7853
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 4229
* group.measureScore.value = 53.85
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 75356
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 34124
* group[1].measureScore.value = 45.28
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200405-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/05/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200405-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c396d-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-05"
* period.start = "2020-04-05"
* period.end = "2020-04-05"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 6810
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3381
* group.measureScore.value = 49.65
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 82166
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 37505
* group[1].measureScore.value = 45.65
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200406-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/06/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200406-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3982-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-06"
* period.start = "2020-04-06"
* period.end = "2020-04-06"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 6866
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3585
* group.measureScore.value = 52.21
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 89032
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 41090
* group[1].measureScore.value = 46.15
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200407-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/07/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200407-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3997-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-07"
* period.start = "2020-04-07"
* period.end = "2020-04-07"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 5942
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3326
* group.measureScore.value = 55.97
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 94974
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 44416
* group[1].measureScore.value = 46.77
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200408-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/08/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200408-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c39ac-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-08"
* period.start = "2020-04-08"
* period.end = "2020-04-08"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 5442
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3021
* group.measureScore.value = 55.51
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 100416
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 47437
* group[1].measureScore.value = 47.24
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200409-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/09/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200409-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c39c1-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-09"
* period.start = "2020-04-09"
* period.end = "2020-04-09"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 6776
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3590
* group.measureScore.value = 52.98
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 107192
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 51027
* group[1].measureScore.value = 47.6
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200410-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/10/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200410-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c39d6-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-10"
* period.start = "2020-04-10"
* period.end = "2020-04-10"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 6331
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3561
* group.measureScore.value = 56.25
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 113523
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 54588
* group[1].measureScore.value = 48.09
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200411-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/11/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200411-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c39eb-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-11"
* period.start = "2020-04-11"
* period.end = "2020-04-11"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 6670
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3563
* group.measureScore.value = 53.42
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 120193
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 58151
* group[1].measureScore.value = 48.38
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200412-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/12/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200412-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3a00-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-12"
* period.start = "2020-04-12"
* period.end = "2020-04-12"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 6542
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3699
* group.measureScore.value = 56.54
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 126735
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 61850
* group[1].measureScore.value = 48.8
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200413-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/13/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200413-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3a15-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-13"
* period.start = "2020-04-13"
* period.end = "2020-04-13"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 2734
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 2734
* group.measureScore.value = 100
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 129469
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 64584
* group[1].measureScore.value = 49.88
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200414-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/14/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200414-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3a2a-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-14"
* period.start = "2020-04-14"
* period.end = "2020-04-14"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 10305
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 4240
* group.measureScore.value = 41.15
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 139774
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 68824
* group[1].measureScore.value = 49.24
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200415-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/15/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200415-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3a3f-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-15"
* period.start = "2020-04-15"
* period.end = "2020-04-15"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 4247
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 2206
* group.measureScore.value = 51.94
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 144021
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 71030
* group[1].measureScore.value = 49.32
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200416-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/16/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200416-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3a54-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-16"
* period.start = "2020-04-16"
* period.end = "2020-04-16"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 7809
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 4287
* group.measureScore.value = 54.9
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 151830
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 75317
* group[1].measureScore.value = 49.61
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200417-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/17/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200417-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3a69-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-17"
* period.start = "2020-04-17"
* period.end = "2020-04-17"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 5619
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3150
* group.measureScore.value = 56.06
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 157449
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 78467
* group[1].measureScore.value = 49.84
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200418-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/18/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200418-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3a7e-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-18"
* period.start = "2020-04-18"
* period.end = "2020-04-18"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 5087
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 2953
* group.measureScore.value = 58.05
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 162536
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 81420
* group[1].measureScore.value = 50.09
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200419-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/19/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200419-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3a93-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-19"
* period.start = "2020-04-19"
* period.end = "2020-04-19"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 8152
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3881
* group.measureScore.value = 47.61
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 170688
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 85301
* group[1].measureScore.value = 49.97
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200420-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/20/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200420-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3aa8-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-20"
* period.start = "2020-04-20"
* period.end = "2020-04-20"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 7369
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3505
* group.measureScore.value = 47.56
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 178057
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 88806
* group[1].measureScore.value = 49.88
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200421-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/21/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200421-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3abd-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-21"
* period.start = "2020-04-21"
* period.end = "2020-04-21"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 6769
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3581
* group.measureScore.value = 52.9
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 184826
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 92387
* group[1].measureScore.value = 49.99
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200422-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/22/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200422-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3ad2-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-22"
* period.start = "2020-04-22"
* period.end = "2020-04-22"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 6833
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3478
* group.measureScore.value = 50.9
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 191659
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 95865
* group[1].measureScore.value = 50.02
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200423-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/23/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200423-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3ae7-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-23"
* period.start = "2020-04-23"
* period.end = "2020-04-23"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 8489
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 4124
* group.measureScore.value = 48.58
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 200148
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 99989
* group[1].measureScore.value = 49.96
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200424-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/24/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200424-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3afc-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-24"
* period.start = "2020-04-24"
* period.end = "2020-04-24"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 5814
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 2207
* group.measureScore.value = 37.96
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 205962
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 102196
* group[1].measureScore.value = 49.62
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"

Instance: ExampleNJ-20200425-FEMADailyHospitalCOVID19Reporting
InstanceOf: PublicHealthMeasureReport
Description : "Example MeasureReport of FEMADailyHospitalCOVID19Reporting for NJ on 04/25/2020"
* insert NJExamplesFEMA
* id = "ExampleNJ-20200425-FEMADailyHospitalCOVID19Reporting"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:375c3b11-9219-11ea-1863-09173f13e4c5"
* date = "2020-04-25"
* period.start = "2020-04-25"
* period.end = "2020-04-25"
* group.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positiveIncreasePercent
* group.population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrdersIncrease
* group.population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group.population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group.population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group.population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResultsIncrease
* group.population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group.population[1].count = 7724
* group.population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positiveIncrease
* group.population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group.population[2].count = 3327
* group.measureScore.value = 43.07
* group.measureScore.unit = "%"
* group.measureScore.code = #%
* group.measureScore.system = "http://unitsofmeasure.org"
* group[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem#positivePercent
* group[1].population.code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalOrders
* group[1].population.code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[1].population.count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population.count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[1].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#rejected
* group[1].population[1].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator-exclusion
* group[1].population[1].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[1].population[1].count.extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported
* group[1].population[2].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#totalTestResults
* group[1].population[2].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[1].population[2].count = 213686
* group[1].population[3].code.coding = http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem#positive
* group[1].population[3].code.coding[1] = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[1].population[3].count = 105523
* group[1].measureScore.value = 49.38
* group[1].measureScore.unit = "%"
* group[1].measureScore.code = #%
* group[1].measureScore.system = "http://unitsofmeasure.org"
