// Define a rule set for commonly used rules for definition resources using instances
RuleSet: SanerDefinitionContent
 * status = #draft      // draft until final published
 * experimental = true  // true until ready for pilot, then false
 * version = "0.1.0"    // Follow IG Versioning rules
 * publisher = "HL7 International"
 * contact[0].telecom.system = #url
 * contact[0].telecom.value = "http://hl7.org/Special/committees/pafm/index.cfm"
 * contact[1].telecom.system = #email
 * contact[1].telecom.value = "mailto:kboone@ainq.com"
 * jurisdiction.coding = urn:iso:std:iso:3166#US

// Define a rule set for commonly used rules for definition resources using other Sushi features
RuleSet: SanerStructureDefinitionContent
 * ^status = #draft      // draft until final published
 * ^experimental = true  // true until ready for pilot, then false
 * ^version = "0.1.0"    // Follow IG Versioning rules
 * ^publisher = "HL7 International"
 * ^contact[0].telecom.system = #url
 * ^contact[0].telecom.value = "http://hl7.org/Special/committees/pafm/index.cfm"
 * ^contact[1].telecom.system = #email
 * ^contact[1].telecom.value = "mailto:kboone@ainq.com"
 * ^jurisdiction.coding = urn:iso:std:iso:3166#US

RuleSet: SanerExample
 * meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST "test health data"

RuleSet: SanerCapabilityStatementContent
 * status = #draft
 * experimental = true
 * date = "2020-05-07"
 * publisher = "Audacious Inquiry, Inc."
 * contact.name = "Keith W. Boone"
 * contact.telecom.system = #email
 * contact.telecom.value = "kboone@ainq.com"
 * kind = #requirements
 * fhirVersion = #4.0.1
 * format = #json
 