ValueSet: BedLocationOperationalStatus
Title: "Bed Location Operational Status"
Description: "This Value Set is used to indicate whether a bed is in use (O), available for use (U), or not available (C) for use."
* http://terminology.hl7.org/CodeSystem/v2-0116#C
* http://terminology.hl7.org/CodeSystem/v2-0116#O
* http://terminology.hl7.org/CodeSystem/v2-0116#U

CodeSystem: BedType
Title: "Saner Bed Type Coding System"
Description: "This Coding System fills gaps describing types of care services that a bed can support."
* #ROOM "Top level category for rooms" "Rooms used for treatment of inpatient or ambulatory patients"
*    #OR "Operating Room" "Operating Rooms used for surgical procedures. When a room is used for both surgical andnon-surgical procedures, it should be classified as an operating room."
*    #PR "Procedure Room" "Procedure Rooms are those rooms used for non-surgical procedures"
*    #RR "Recovery Room" "Recovery Rooms"
*    #EX "Examination Room" "Rooms used for principally for patient examination and minor procedures"
*    #DIALR "Dialysis Treatment Room" "Room used for dialysis treatment"

* #BURNU "Burn Unit" "Beds in a Burn Unit"

* #NEGISO "Negative Pressure Isolation Unit" "Beds in a negative pressure isolation environment"
* #OTHISO "Other Isolation Unit" "Beds in an other (non-negative pressure) isolation environment"
* #NONISO "Non-isolating unit" "Bed in a unit that does not support isolation"

* #NEONATAL "Neonatal Patient use"      "Resources designated for neonatal use"
* #ADULT  "Adult Patient use"           "Resources designated for adult patient use"
* #PEDIATRIC "Pediatric Patient use"    "Resources designated for pediatric patient use"

* #PHYSICAL "Total Physical Resources"  "Total physical resources, whether licensed, staffed, or otherwise"
*   #LICENSED "Licensed Resources"      "Maximum licensed resources"
*   #OVERFLOW "Overflow Resources"      "Overflow / Surge resources that can be or have been added to add capacity"

*   #STAFFED "Staffed Resources"        "Resources for which staff is available to provide support"
*   #UNSTAFFED "Unstaffed Resources"    "Resources that can be used but which are not staffed"

* #INUSE "This resource is in use"  "Resources that are currently in use"
* #AVAILABLE "This resource is available for use"  "Resources that are available for use"
* #NOTAVAIL "This resource is not available for use" "Resources that are not available and are not in use"

ValueSet: BedType
Title: "Bed Type"
Description: "This Value Set describes the types of care services that a bed can support."
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#HOSP
*   http://terminology.hl7.org/CodeSystem/v3-RoleCode#ICU
*   http://terminology.hl7.org/CodeSystem/v3-RoleCode#ER

CodeSystem: LocationFields
Title: "Location Resource Field Names"
Description: "This Coding System identifies legal field names in a FHIR R4 Location Resource."
* ^url = "http://hl7.org/fhir/R4/StructureDefinition/Device"
* ^status = #active
* ^content = #complete
* #Location
* #Location.id
* #Location.meta
* #Location.implicitRules
* #Location.language
* #Location.text
* #Location.contained
* #Location.extension
* #Location.modifierExtension
* #Location.identifier
* #Location.status
* #Location.operationalStatus
* #Location.name
* #Location.alias
* #Location.description
* #Location.mode
* #Location.type
* #Location.telecom
* #Location.address
* #Location.physicalType
* #Location.position
* #Location.position.id
* #Location.position.extension
* #Location.position.modifierExtension
* #Location.position.longitude
* #Location.position.latitude
* #Location.position.altitude
* #Location.managingOrganization
* #Location.partOf
* #Location.hoursOfOperation
* #Location.hoursOfOperation.id
* #Location.hoursOfOperation.extension
* #Location.hoursOfOperation.modifierExtension
* #Location.hoursOfOperation.daysOfWeek
* #Location.hoursOfOperation.allDay
* #Location.hoursOfOperation.openingTime
* #Location.hoursOfOperation.closingTime
* #Location.availabilityExceptions
* #Location.endpoint

CodeSystem: DeviceFields
Title: "Device Resource Field Names"
Description: "This Coding System identifies legal field names in a FHIR R4 Device Resource."
* ^url = "http://hl7.org/fhir/R4/StructureDefinition/Device"
* ^status = #active
* ^content = #complete
* #Device
* #Device.id
* #Device.meta
* #Device.implicitRules
* #Device.language
* #Device.text
* #Device.contained
* #Device.extension
* #Device.modifierExtension
* #Device.identifier
* #Device.definition
* #Device.udiCarrier
* #Device.udiCarrier.id
* #Device.udiCarrier.extension
* #Device.udiCarrier.modifierExtension
* #Device.udiCarrier.deviceIdentifier
* #Device.udiCarrier.issuer
* #Device.udiCarrier.jurisdiction
* #Device.udiCarrier.carrierAIDC
* #Device.udiCarrier.carrierHRF
* #Device.udiCarrier.entryType
* #Device.status
* #Device.statusReason
* #Device.distinctIdentifier
* #Device.manufacturer
* #Device.manufactureDate
* #Device.expirationDate
* #Device.lotNumber
* #Device.serialNumber
* #Device.deviceName
* #Device.deviceName.id
* #Device.deviceName.extension
* #Device.deviceName.modifierExtension
* #Device.deviceName.name
* #Device.deviceName.type
* #Device.modelNumber
* #Device.partNumber
* #Device.type
* #Device.specialization
* #Device.specialization.id
* #Device.specialization.extension
* #Device.specialization.modifierExtension
* #Device.specialization.systemType
* #Device.specialization.version
* #Device.version
* #Device.version.id
* #Device.version.extension
* #Device.version.modifierExtension
* #Device.version.type
* #Device.version.component
* #Device.version.value
* #Device.property
* #Device.property.id
* #Device.property.extension
* #Device.property.modifierExtension
* #Device.property.type
* #Device.property.valueQuantity
* #Device.property.valueCode
* #Device.patient
* #Device.owner
* #Device.contact
* #Device.location
* #Device.url
* #Device.note
* #Device.safety
* #Device.parent

ValueSet: Fields
Title: "Resource Fields"
Description: "This value set describes fields used to stratify groups in a report"
* codes from system LocationFields
* codes from system DeviceFields

