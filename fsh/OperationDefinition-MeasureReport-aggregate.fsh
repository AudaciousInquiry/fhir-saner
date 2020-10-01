
Instance: MeasureReport-aggregate
InstanceOf: OperationDefinition
Usage: #definition
Description: "This operation enables a Measure Intermediary to create a measure report that aggregates data from multiple measure reports.
The MeasureReport to be aggregated can be provided in the measure-report parameter, or the caller can indicate which measures **should** be aggregated by
specifying the search criteria which the Intermediary will use to select the MeasureReport resources to aggregate.  In all cases, the MeasureReport resources
being aggregated must reference the same Measure resource defining the MeasureReport to generate.
                        "
* insert SanerDefinitionContent
 
* status = #draft
* kind = #operation
* code = #aggregate
* resource[0] = #MeasureReport
* system = false
* type = false
* instance = true
* name = "AggregatetwoormoremoreMessureReportresourcesintoasingleMeasureReport."
* title = "Aggregate two or more more Messure Report resources into a single MeasureReport."
* description = """This operation enables a Measure Intermediary to create a measure report that aggregates data from multiple measure reports.
The MeasureReport to be aggregated can be provided in the measure-report parameter, or the caller can indicate which measures **should** be aggregated by
specifying the search criteria which the Intermediary will use to select the MeasureReport resources to aggregate.  In all cases, the MeasureReport resources
being aggregated must reference the same Measure resource defining the MeasureReport to generate.
                        """
* url = "http://hl7.org/fhir/saner/OperationDefinition/MeasureReport-aggregate"

* parameter[0].name = #_id
* parameter[0].use = #in
* parameter[0].min = 0
* parameter[0].max = "*"
* parameter[0].searchType = #string
* parameter[0].type = #string

* parameter[1].name = #measure
* parameter[1].use = #in
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].searchType = #uri
* parameter[1].type = #string

* parameter[2].name = #measure-report
* parameter[2].use = #in
* parameter[2].min = 0
* parameter[2].max = "*"
* parameter[2].documentation = "The MeasureReport resources to aggregate."
* parameter[2].type = #MeasureReport

* parameter[3].name = #measure.title
* parameter[3].use = #in
* parameter[3].min = 0
* parameter[3].max = "1"
* parameter[3].searchType = #string
* parameter[3].type = #string

* parameter[4].name = #period
* parameter[4].use = #in
* parameter[4].min = 1
* parameter[4].max = "2"
* parameter[4].searchType = #date
* parameter[4].type = #string

* parameter[5].name = #reporter
* parameter[5].use = #in
* parameter[5].min = 0
* parameter[5].max = "*"
* parameter[5].searchType = #reference
* parameter[5].type = #string

* parameter[6].name = #reporter:identifier
* parameter[6].use = #in
* parameter[6].min = 0
* parameter[6].max = "*"
* parameter[6].searchType = #token
* parameter[6].type = #string

* parameter[7].name = #result-reporter
* parameter[7].use = #in
* parameter[7].min = 0
* parameter[7].max = "1"
* parameter[7].documentation = """A reference or identifier of the reporter for the MeasureReport. May be omitted if all MeasureReport resources
being aggregated have a common reporter. A server may determine the reporter based on business rules (e.g., based on the identity of the sender of the request).
                                """
* parameter[7].searchType = #reference
* parameter[7].type = #string

* parameter[8].name = #result-subject
* parameter[8].use = #in
* parameter[8].min = 0
* parameter[8].max = "1"
* parameter[8].documentation = """A reference or identifier of the subject for the MeasureReport. May be omitted if all MeasureReport resources
being aggregated have a common subject."""
* parameter[8].searchType = #reference
* parameter[8].type = #string

* parameter[9].name = #subject
* parameter[9].use = #in
* parameter[9].min = 0
* parameter[9].max = "*"
* parameter[9].searchType = #reference
* parameter[9].type = #string

* parameter[10].name = #subject:identifier
* parameter[10].use = #in
* parameter[10].min = 0
* parameter[10].max = "*"
* parameter[10].searchType = #token
* parameter[10].type = #string

* parameter[11].name = #return
* parameter[11].use = #out
* parameter[11].min = 0
* parameter[11].max = "1"
* parameter[11].documentation = "The result of the aggregation operation."
* parameter[11].type = #MeasureReport
