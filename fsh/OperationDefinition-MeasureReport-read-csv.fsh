
Instance: MeasureReport-read-csv
InstanceOf: OperationDefinition
Usage: #definition
Description: "Read a given MeasureReport using the CSV Format. See [CSV Conversion](CSV_Conversion.html) for details."
* insert SanerDefinitionContent
 
* status = #draft
* kind = #operation
* code = #read-csv
* resource[0] = #MeasureReport
* system = false
* type = false
* instance = true
* name = "ReadinCSVFormat"
* title = "Read in CSV Format"
* description = "Read a given MeasureReport using the CSV Format. See [CSV Conversion](CSV_Conversion.html) for details."
* url = "http://hl7.org/fhir/saner/OperationDefinition/MeasureReport-read-csv"

* parameter[0].name = #map
* parameter[0].use = #in
* parameter[0].min = 0
* parameter[0].max = "*"
* parameter[0].searchType = #composite
* parameter[0].type = #string

* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].type = #Binary
