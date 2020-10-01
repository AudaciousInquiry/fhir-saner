
Instance: Measure-report-csv
InstanceOf: OperationDefinition
Usage: #definition
Description: "Create or update a MeasureReport from the CSV Format. If a report already exists for the subject and reporter for the given time period, it is updated.
                            Otherwise, a new report is created. See [CSV Conversion](CSV_Conversion.html) for details."
* insert SanerDefinitionContent
 
* status = #draft
* kind = #operation
* code = #report-csv
* resource[0] = #Measure
* system = false
* type = false
* instance = true
* name = "CreateorupdateaMeasureReportfromCSVFormat"
* title = "Create or update a MeasureReport from CSV Format"
* description = """Create or update a MeasureReport from the CSV Format. If a report already exists for the subject and reporter for the given time period, it is updated.
                            Otherwise, a new report is created. See [CSV Conversion](CSV_Conversion.html) for details."""
* url = "http://hl7.org/fhir/saner/OperationDefinition/Measure-report-csv"

* parameter[0].name = #input
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "The input of the request is a CSV file with labeled columns containing the data in the report."
* parameter[0].type = #Binary

* parameter[1].name = #map
* parameter[1].use = #in
* parameter[1].min = 0
* parameter[1].max = "*"
* parameter[1].documentation = "Each parameter is a composite of column to measure mappings"
* parameter[1].searchType = #composite
* parameter[1].type = #string

* parameter[2].name = #period-end
* parameter[2].use = #in
* parameter[2].min = 1
* parameter[2].max = "1"
* parameter[2].documentation = "The end of the reporting period."
* parameter[2].searchType = #date
* parameter[2].type = #string

* parameter[3].name = #period-start
* parameter[3].use = #in
* parameter[3].min = 1
* parameter[3].max = "1"
* parameter[3].documentation = "The start of the reporting period."
* parameter[3].searchType = #date
* parameter[3].type = #string

* parameter[4].name = #reporter
* parameter[4].use = #in
* parameter[4].min = 0
* parameter[4].max = "1"
* parameter[4].documentation = """A reference or identifier of the reporter for the MeasureReport. If unspecified,
                                    the server may determine the reporter based on business rules (e.g., based on the identity of the sender)."""
* parameter[4].searchType = #reference
* parameter[4].type = #string

* parameter[5].name = #subject
* parameter[5].use = #in
* parameter[5].min = 0
* parameter[5].max = "1"
* parameter[5].documentation = """A reference or identifier of the subject for the MeasureReport. If unspecified,
                                    the server may determine the subject based on business rules (e.g., based on the identity of the sender)."""
* parameter[5].searchType = #reference
* parameter[5].type = #string

* parameter[6].name = #return
* parameter[6].use = #out
* parameter[6].min = 0
* parameter[6].max = "1"
* parameter[6].documentation = "The result of the reporting operation"
* parameter[6].type = #Bundle
