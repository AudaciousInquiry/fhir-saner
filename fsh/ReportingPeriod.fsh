Extension: ReportingPeriod
Title: "Enables specification of proposed measure reporting"
Description: "The timing used for measure reporting"
* insert SanerStructureDefinitionContent
* ^context.type = #element
* ^context.expression = "Measure"
* value[x] only MeasureReportingTiming
* valueTiming 1..1

Profile:        MeasureReportingTiming
Parent:         Timing
Title:          "Recommended Measure Reporting Times"
Description:    "Provides the timing for measure  reporting"
* insert SanerStructureDefinitionContent
* event 0..0
* repeat 1..1
// How long to be reporting for Start/Stop
* repeat.bounds[x] only Period
* repeat.boundsPeriod 0..1
* repeat.count 0..0
* repeat.countMax 0..0
* repeat.duration 0..0
* repeat.durationMax 0..0

// What is reporting frequency
* repeat.frequency 1..1
* repeat.frequency = 1
* repeat.frequencyMax 0..0
// What is reporting period
* repeat.period 1..1
* repeat.periodUnit 1..1
* repeat.periodMax 0..0
* repeat.timeOfDay 0..0
* repeat.when 0..0
* repeat.offset 0..0
* repeat.dayOfWeek 0..0

RuleSet: DailyReporting
* extension[measureTiming].valueTiming.repeat.frequency = 1
* extension[measureTiming].valueTiming.repeat.period = 1
* extension[measureTiming].valueTiming.repeat.periodUnit =  http://unitsofmeasure.org#d "day"

