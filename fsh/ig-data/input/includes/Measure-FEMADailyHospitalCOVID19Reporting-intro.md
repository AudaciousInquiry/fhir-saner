
<p>This measure demonstrates reporting about Daily Laboratory Testing at a inpatient test sites capturing laboratory orders and results daily increase and cumulative counts.</p>

<div>
<h3>Related artifacts</h3>

<ul>
<li><a href='https://www.cms.gov/newsroom/press-releases/trump-administration-engages-americas-hospitals-unprecedented-data-sharing'>Trump Administration Engages America’s Hospitals in Unprecedented Data Sharing
<li><a href='https://www.whitehouse.gov/briefings-statements/text-letter-vice-president-hospital-administrators/'>Text of a Letter from the Vice President to Hospital Administrators</a></li>
<li><a href='https://www.aha.org/advisory/2020-03-30-coronavirus-update-administration-requests-hospitals-report-daily-covid-19'>Administration Requests Hospitals Report Daily on COVID-19 Testing Results, Bed and Ventilator</a></li>
<li><a href='https://images.magnetmail.net/images/clients/AHA_MCHF/attach/2020/March/0330/Template_for_Daily_Hospital_COVID19_Reporting.xlsx'>Template for Daily Hospital COVID-19 Reporting.xlsx</a></li>
</ul>

<div>
<h3>Group Definitions</h3>

Group System|Group Code|Population System|Population Code
------------|----------|-----------------|---------------
http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem|positiveIncreasePercent|<nobr/>|<nobr/>
<nobr/>|<nobr/>|http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem<br/>http://terminology.hl7.org/CodeSystem/measure-population|totalOrdersIncrease<br/>initial-population
<nobr/>|<nobr/>|http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem<br/>http://terminology.hl7.org/CodeSystem/measure-population|totalTestResultsIncrease<br/>denominator
<nobr/>|<nobr/>|http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem<br/>http://terminology.hl7.org/CodeSystem/measure-population|positiveIncrease<br/>numerator
http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem|positivePercent|<nobr/>|<nobr/>
<nobr/>|<nobr/>|http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem<br/>http://terminology.hl7.org/CodeSystem/measure-population|totalOrders<br/>initial-population
<nobr/>|<nobr/>|http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem<br/>http://terminology.hl7.org/CodeSystem/measure-population|totalTestResults<br/>denominator
<nobr/>|<nobr/>|http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem<br/>http://terminology.hl7.org/CodeSystem/measure-population|positive<br/>numerator
<nobr/>|<nobr/>|http://hl7.org/fhir/us/saner/CodeSystem/MeasurePopulationSystem<br/>http://terminology.hl7.org/CodeSystem/measure-population|rejected<br/>denominator-exclusion
