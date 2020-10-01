<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200404-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c416-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-04"/>
   <period>
      <start value="2020-04-04"/>
      <end value="2020-04-04"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="7853"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="4229"/>
      </population>
      <measureScore>
         <value value="53.85"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="75356"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="34124"/>
      </population>
      <measureScore>
         <value value="45.28"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200405-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c443-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-05"/>
   <period>
      <start value="2020-04-05"/>
      <end value="2020-04-05"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="6810"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3381"/>
      </population>
      <measureScore>
         <value value="49.65"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="82166"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="37505"/>
      </population>
      <measureScore>
         <value value="45.65"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200406-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c46f-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-06"/>
   <period>
      <start value="2020-04-06"/>
      <end value="2020-04-06"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="6866"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3585"/>
      </population>
      <measureScore>
         <value value="52.21"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="89032"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="41090"/>
      </population>
      <measureScore>
         <value value="46.15"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200407-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c49b-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-07"/>
   <period>
      <start value="2020-04-07"/>
      <end value="2020-04-07"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="5942"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3326"/>
      </population>
      <measureScore>
         <value value="55.97"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="94974"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="44416"/>
      </population>
      <measureScore>
         <value value="46.77"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200408-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c4c7-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-08"/>
   <period>
      <start value="2020-04-08"/>
      <end value="2020-04-08"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="5442"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3021"/>
      </population>
      <measureScore>
         <value value="55.51"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="100416"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="47437"/>
      </population>
      <measureScore>
         <value value="47.24"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200409-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c4f3-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-09"/>
   <period>
      <start value="2020-04-09"/>
      <end value="2020-04-09"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="6776"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3590"/>
      </population>
      <measureScore>
         <value value="52.98"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="107192"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="51027"/>
      </population>
      <measureScore>
         <value value="47.6"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200410-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c51f-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-10"/>
   <period>
      <start value="2020-04-10"/>
      <end value="2020-04-10"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="6331"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3561"/>
      </population>
      <measureScore>
         <value value="56.25"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="113523"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="54588"/>
      </population>
      <measureScore>
         <value value="48.09"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200411-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c54b-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-11"/>
   <period>
      <start value="2020-04-11"/>
      <end value="2020-04-11"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="6670"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3563"/>
      </population>
      <measureScore>
         <value value="53.42"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="120193"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="58151"/>
      </population>
      <measureScore>
         <value value="48.38"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200412-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c577-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-12"/>
   <period>
      <start value="2020-04-12"/>
      <end value="2020-04-12"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="6542"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3699"/>
      </population>
      <measureScore>
         <value value="56.54"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="126735"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="61850"/>
      </population>
      <measureScore>
         <value value="48.8"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200413-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c5a3-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-13"/>
   <period>
      <start value="2020-04-13"/>
      <end value="2020-04-13"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="2734"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="2734"/>
      </population>
      <measureScore>
         <value value="100"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="129469"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="64584"/>
      </population>
      <measureScore>
         <value value="49.88"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200414-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c5cf-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-14"/>
   <period>
      <start value="2020-04-14"/>
      <end value="2020-04-14"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="10305"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="4240"/>
      </population>
      <measureScore>
         <value value="41.15"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="139774"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="68824"/>
      </population>
      <measureScore>
         <value value="49.24"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200415-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c5fb-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-15"/>
   <period>
      <start value="2020-04-15"/>
      <end value="2020-04-15"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="4247"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="2206"/>
      </population>
      <measureScore>
         <value value="51.94"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="144021"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="71030"/>
      </population>
      <measureScore>
         <value value="49.32"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200416-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c627-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-16"/>
   <period>
      <start value="2020-04-16"/>
      <end value="2020-04-16"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="7809"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="4287"/>
      </population>
      <measureScore>
         <value value="54.9"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="151830"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="75317"/>
      </population>
      <measureScore>
         <value value="49.61"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200417-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c653-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-17"/>
   <period>
      <start value="2020-04-17"/>
      <end value="2020-04-17"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="5619"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3150"/>
      </population>
      <measureScore>
         <value value="56.06"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="157449"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="78467"/>
      </population>
      <measureScore>
         <value value="49.84"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200418-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c67f-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-18"/>
   <period>
      <start value="2020-04-18"/>
      <end value="2020-04-18"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="5087"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="2953"/>
      </population>
      <measureScore>
         <value value="58.05"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="162536"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="81420"/>
      </population>
      <measureScore>
         <value value="50.09"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200419-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c6ab-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-19"/>
   <period>
      <start value="2020-04-19"/>
      <end value="2020-04-19"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="8152"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3881"/>
      </population>
      <measureScore>
         <value value="47.61"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="170688"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="85301"/>
      </population>
      <measureScore>
         <value value="49.97"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200420-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c6d7-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-20"/>
   <period>
      <start value="2020-04-20"/>
      <end value="2020-04-20"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="7369"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3505"/>
      </population>
      <measureScore>
         <value value="47.56"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="178057"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="88806"/>
      </population>
      <measureScore>
         <value value="49.88"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200421-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c703-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-21"/>
   <period>
      <start value="2020-04-21"/>
      <end value="2020-04-21"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="6769"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3581"/>
      </population>
      <measureScore>
         <value value="52.9"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="184826"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="92387"/>
      </population>
      <measureScore>
         <value value="49.99"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200422-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c72f-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-22"/>
   <period>
      <start value="2020-04-22"/>
      <end value="2020-04-22"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="6833"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3478"/>
      </population>
      <measureScore>
         <value value="50.9"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="191659"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="95865"/>
      </population>
      <measureScore>
         <value value="50.02"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200423-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c75b-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-23"/>
   <period>
      <start value="2020-04-23"/>
      <end value="2020-04-23"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="8489"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="4124"/>
      </population>
      <measureScore>
         <value value="48.58"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="200148"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="99989"/>
      </population>
      <measureScore>
         <value value="49.96"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200424-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c787-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-24"/>
   <period>
      <start value="2020-04-24"/>
      <end value="2020-04-24"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="5814"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="2207"/>
      </population>
      <measureScore>
         <value value="37.96"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="205962"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="102196"/>
      </population>
      <measureScore>
         <value value="49.62"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
<MeasureReport xmlns="http://hl7.org/fhir">
   <id value="ExampleNJ-20200425-FEMADailyHospitalCOVID19Reporting"/>
   <identifier>
      <system value="urn:ietf:rfc:3986"/>
      <value value="urn:uuid:6df9c7b3-9493-11ea-1882-09173f13e4c5"/>
   </identifier>
   <date value="2020-04-25"/>
   <period>
      <start value="2020-04-25"/>
      <end value="2020-04-25"/>
   </period>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positiveIncreasePercent"/>
            <display value="Percent Positive among Newly Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrdersIncrease"/>
               <display value="New Diagnostic Tests Ordered/Received"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResultsIncrease"/>
               <display value="New Tests Resulted"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="7724"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positiveIncrease"/>
               <display value="New Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="3327"/>
      </population>
      <measureScore>
         <value value="43.07"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
   <group>
      <code>
         <coding>
            <system value="http://hl7.org/fhir/saner/CodeSystem/MeasureGroupSystem"/>
            <code value="positivePercent"/>
            <display value="Cumulative Percent Positive among Resulted Tests"/>
         </coding>
      </code>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalOrders"/>
               <display value="Cumulative Diagnostic Tests Ordered/Recieved"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="initial-population"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="rejected"/>
               <display value="Cumulative Specimens Rejected*"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator-exclusion"/>
            </coding>
         </code>
         <count>
            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
               <valueCode value="unsupported"/>
            </extension>
         </count>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="totalTestResults"/>
               <display value="Cumulative Tests Performed"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="denominator"/>
            </coding>
         </code>
         <count value="213686"/>
      </population>
      <population>
         <code>
            <coding>
               <system value="http://hl7.org/fhir/saner/CodeSystem/MeasuredValues"/>
               <code value="positive"/>
               <display value="Cumulative Positive COVID-19 Tests"/>
            </coding>
            <coding>
               <system value="http://terminology.hl7.org/CodeSystem/measure-population"/>
               <code value="numerator"/>
            </coding>
         </code>
         <count value="105523"/>
      </population>
      <measureScore>
         <value value="49.38"/>
         <unit value="%"/>
         <code value="%"/>
         <system value="http://unitsofmeasure.org"/>
      </measureScore>
   </group>
</MeasureReport>
