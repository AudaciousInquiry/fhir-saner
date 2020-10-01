
Instance: MeasureReport-search-csv
InstanceOf: OperationDefinition
Usage: #definition
Description: "Search Measure Report resources using the CSV Format. See [CSV Conversion](CSV_Conversion.html) for details."
* insert SanerDefinitionContent
 
* status = #draft
* kind = #operation
* code = #search-csv
* resource[0] = #MeasureReport
* system = false
* type = true
* instance = false
* name = "SearchinCSVFormat"
* title = "Search in CSV Format"
* description = "Search Measure Report resources using the CSV Format. See [CSV Conversion](CSV_Conversion.html) for details."
* url = "http://hl7.org/fhir/saner/OperationDefinition/MeasureReport-search-csv"

* parameter[0].name = #_lastUpdated
* parameter[0].use = #in
* parameter[0].min = 0
* parameter[0].max = "2"
* parameter[0].searchType = #date
* parameter[0].type = #string

* parameter[1].name = #date
* parameter[1].use = #in
* parameter[1].min = 0
* parameter[1].max = "2"
* parameter[1].searchType = #date
* parameter[1].type = #string

* parameter[2].name = #map
* parameter[2].use = #in
* parameter[2].min = 0
* parameter[2].max = "*"
* parameter[2].searchType = #composite
* parameter[2].type = #string

* parameter[3].name = #measure
* parameter[3].use = #in
* parameter[3].min = 1
* parameter[3].max = "*"
* parameter[3].searchType = #uri
* parameter[3].type = #string

* parameter[4].name = #measure.title
* parameter[4].use = #in
* parameter[4].min = 0
* parameter[4].max = "*"
* parameter[4].searchType = #string
* parameter[4].type = #string

* parameter[5].name = #period
* parameter[5].use = #in
* parameter[5].min = 1
* parameter[5].max = "2"
* parameter[5].searchType = #date
* parameter[5].type = #string

* parameter[6].name = #reporter
* parameter[6].use = #in
* parameter[6].min = 0
* parameter[6].max = "*"
* parameter[6].searchType = #reference
* parameter[6].type = #string

* parameter[7].name = #reporter:identifier
* parameter[7].use = #in
* parameter[7].min = 0
* parameter[7].max = "*"
* parameter[7].searchType = #token
* parameter[7].type = #string

* parameter[8].name = #subject
* parameter[8].use = #in
* parameter[8].min = 0
* parameter[8].max = "*"
* parameter[8].searchType = #reference
* parameter[8].type = #string

* parameter[9].name = #subject:Location.near
* parameter[9].use = #in
* parameter[9].min = 0
* parameter[9].max = "1"
* parameter[9].searchType = #special
* parameter[9].type = #string

* parameter[10].name = #subject:identifier
* parameter[10].use = #in
* parameter[10].min = 0
* parameter[10].max = "*"
* parameter[10].searchType = #token
* parameter[10].type = #string

* parameter[11].name = #return
* parameter[11].use = #out
* parameter[11].min = 1
* parameter[11].max = "1"
* parameter[11].type = #Binary
