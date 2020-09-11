
Instance: Measure-evaluate-measure
InstanceOf: OperationDefinition
Usage: #definition
Description: "Create or update a MeasureReport for the given time period. If a report already exists for the subject and reporter for the given time period, it is updated.
                            Otherwise, a new report is created."
* insert SanerDefinitionContent
 
* status = #draft
* kind = #operation
* code = #evaluate-measure
* resource[0] = #Measure
* system = false
* type = false
* instance = true
* name = "Evaluatethemeasure"
* title = "Evaluate the measure"
* description = """Create or update a MeasureReport for the given time period. If a report already exists for the subject and reporter for the given time period, it is updated.
                            Otherwise, a new report is created."""
* url = "http://hl7.org/fhir/us/saner/OperationDefinition/Measure-evaluate-measure"

* parameter[0].name = #periodEnd
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "The end of the measurement period."
* parameter[0].searchType = #date
* parameter[0].type = #string

* parameter[1].name = #periodStart
* parameter[1].use = #in
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].documentation = "The start of the measurement period."
* parameter[1].searchType = #date
* parameter[1].type = #string

* parameter[2].name = #report
* parameter[2].use = #in
* parameter[2].min = 1
* parameter[2].max = "1"
* parameter[2].documentation = """If report is true, then the created measure report will be created or updated in the system.
If report is false or omitted, the computed MeasureReport will simply be returned to the caller.
                                """
* parameter[2].searchType = #string
* parameter[2].type = #string

* parameter[3].name = #return
* parameter[3].use = #out
* parameter[3].min = 1
* parameter[3].max = "1"
* parameter[3].documentation = "The computed MeasureReport"
* parameter[3].type = #MeasureReport
