CodeSystem: IHE_ADX_agerange
Id: IHE-ADX-agerange
Title: "Age Range Coding System"
Description: "This Coding System provides a way to Code age ranges"
* ^url = "http://profiles.ihe.net/fhir/CodeSystem/IHE_ADX_agerange"
* ^status = #active
* ^publisher = "IHE"
* ^contact[0].name = "IHE"
* ^contact[0].telecom.system = #url
* ^contact[0].telecom.value = "http://ihe.net"
* ^contact[1].name = "Keith W. Boone"
* ^contact[1].telecom.system = #email
* ^contact[1].telecom.value = "kboone@ainq.com"
* ^copyright = "Some content from IHE� Copyright � 2015 [IHE International, Inc](http://www.ihe.net/Governance/#Intellectual_Property)."
* ^caseSensitive = true
* ^description = """
The description below includes text from CP-QRPH-238. The normative text describing this code system can be found at
https://www.ihe.net/uploadedFiles/Documents/QRPH/IHE_QRPH_Suppl_ADX.pdf#page=78

The representation of age group ranges code should be unambiguous, human readable and machine-readable. There being no commonly
available coding system or convention for expressing or representing age ranges for aggregate data exchange, ADX expresses an
age group band through two simple durations as defined in the ISO 8601. The definition below provides the grammar for a coding
system.  The URL for this Coding System is [http://profiles.ihe.net/fhir/CodeSystem/IHE_ADX_agerange](./CodeSystem-IHE-ADX-agerange.html) (for use in HL7® FHIR®),
and the OID is 1.3.6.1.4.1.19376.1.7.3.1.1.29.1 (for use in HL7® CDA® and Version 3 standards).

ADX describes an age group range as two durations:  <duration1> -- <duration2>. Where duration1 specifies the beginning of the
age group band (everyone who is this age and above) and duration2 signify the upper bound of the age group band.
Therefore, age groups like "1-9 years" means everyone who is at least one year old and less than 10 years old represented as
P1Y--P10Y,age group like "10-14 years" means everyone who is at least 10 years old and less than 15 years old is represented
as P10Y--P15Y.

Durations define the amount if an intervening time between two time points. These durations are represented in the
form P[n]Y[n]M[n]DT[n]H[n]M[n]S or P[n]W. The [n] is replaced by the value for each of the time elements that follow
the [n] and the letters have the meaning:

* P is the duration designator (for period) placed at the start of the duration representation.
* Y is the year designator that follows the value for the number of years.
* M is the month designator that follows the value for the number of months.
* W is the week designator that follows the value for the number of weeks.
* D is the day designator that follows the value for the number of days.
* T is the time designator that precedes the time components of the representation.
* H is the hour designator that follows the value for the number of hours.
* M is the minute designator that follows the value for the number of minutes.
* S is the second designator that follows the value for the number of seconds.
"""

* #P0M--P7M "0-6 Months" "A age of less than 7 months old"
* #P0Y--P1Y "<1 Year"  "A age of less than 1 year old"
* #P1Y--P5Y "1-4 Years" "A age greater or equal to 1 and less than 5 years"
* #P5Y--P10Y "5-9 Years" "A age greater or equal to 5 and less than 10 years"
* #P10Y--P15Y "10-14 Years" "A age greater or equal to 10 and less than 15 years"
* #P15Y--P20Y "15-19 Years" "A age greater or equal to 15 and less than 20 years"
* #P20Y--P9999Y "20+ Years" "A age greater or equal to 20 and years"


* #P0Y--P20Y "< 20 Years" "A age of less than 20 years old"
* #P20Y--P30Y "20-30 Years" "A age greater or equal to 20 and less than 30 years"
* #P30Y--P40Y "30-40 Years" "A age greater or equal to 30 and less than 40 years"
* #P20Y--P40Y "20-40 Years" "A age greater or equal to 20 and less than 40 years"
* #P40Y--P50Y "40-50 Years" "A age greater or equal to 40 and less than 50 years"
* #P50Y--P60Y "50-60 Years" "A age greater or equal to 50 and less than 60 years"
* #P40Y--P60Y "40-60 Years" "A age greater or equal to 40 and less than 60 years"
* #P60Y--P70Y "60-70 Years" "A age greater or equal to 60 and less than 70 years"
* #P70Y--P80Y "70-80 Years" "A age greater or equal to 70 and less than 80 years"
* #P60Y--P80Y "60-80 Years" "A age greater or equal to 60 and less than 80 years"
* #P80Y--P9999Y "80+ Years" "A age greater or equal to 80 years"
