<p>This measure demonstrates reporting on bed availability and use at a facility location based on CDC/NHSN reporting requirements.</p>

<div>
<h3>Related artifacts</h3>
<ul>
<li><a href='https://www.cdc.gov/nhsn/acute-care-hospital/covid19/'>CDC/NHSN COVID-19 Acute Care Module Home Page</a></li>
<li><a href='https://www.cdc.gov/nhsn/pdfs/covid19/import-covid19-data-508.pdf'>Facility - How to Upload COVID-19 CSV Data Files</a></li>
<li><a href='https://www.cdc.gov/nhsn/pdfs/covid19/fac-analysis-qrg-508.pdf'>NHSN COVID-19 Module Analysis Reports</a></li>
<li><a href='https://www.cdc.gov/nhsn/pdfs/covid19/57.130-toi-508.pdf'>Instructions for Completion of the COVID-19 Patient Impact and Hospital Capacity Pathway (CDC 57.130)</a></li>
<li><a href='https://www.cdc.gov/nhsn/pdfs/covid19/57.130-covid19-pimhc-blank-p.pdf'>Patient Impact and Hospital Capacity Pathway Form</a></li>
<li><a href='https://www.cdc.gov/nhsn/pdfs/covid19/covid19-test-csv-import.csv'>CDC/NHSN COVID-19 Acute Care Patient Impact Reporting CSV File Template</a></li>
</div>

<div>
<h3>Definitions</h3>
<dl>
<dt>Ventilator</dt>
<dd>Any device used to support, assist or control respiration (inclusive of the weaning period) through the application of positive
pressure to the airway when delivered via an artificial airway, specifically an oral/nasal endotracheal or tracheostomy tube.
Note: Ventilation and lung expansion devices that deliver positive pressure to the airway (for example: CPAP, BiPAP, bi-level, IPPB and
PEEP) via non-invasive means (for example: nasal prongs, nasal mask, full face mask, total mask, etc.) are not considered ventilators
unless positive pressure is delivered via an artificial airway (oral/nasal endotracheal or tracheostomy tube).</dd>

<dt>Beds</dt>
<dd>Baby beds in mom's room count as 1 bed, even if there are multiple baby beds
Follow-up in progress if staffed is less than licensed.
Total includes all beds, even if with surge beds it exceeds licensed beds.</dd>

<dt>ICU beds</dt>
<dd>Include NICU (from CDC Webinar 31-Mar-2020) (outstanding question on burn unit)</dd>
</dl>
</div>

<div>
<h3>Group Definitions</h3>

<table class='grid'>
<thead>
<tr><th>Group System</th><th>Group Code</th><th>Population System</th><th>Population Code</th></tr>
</thead>
<tbody>
<tr><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem</td><td>Beds</td><td><nobr/></td><td><nobr/></td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues<br/>http://terminology.hl7.org/CodeSystem/measure-population</td><td>numTotBeds<br/>initial-population</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numBeds</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numBedsOcc</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numICUBeds</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numICUBedsOcc</td></tr>
<tr><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem</td><td>Ventilators</td><td><nobr/></td><td><nobr/></td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues<br/>http://terminology.hl7.org/CodeSystem/measure-population</td><td>numVent<br/>initial-population</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numVentUse</td></tr>
<tr><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasureGroupSystem</td><td>Encounters</td><td><nobr/></td><td><nobr/></td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numC19HospPats</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numC19MechVentPats</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numC19HOPats</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numC19OverflowPats</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numC19OFMechVentPats</td></tr>
<tr><td><nobr/></td><td><nobr/></td><td>http://hl7.org/fhir/us/saner/CodeSystem/MeasuredValues</td><td>numC19Died</td></tr>
</tbody>
</table>
</div>