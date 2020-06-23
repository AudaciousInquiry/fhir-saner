<?xml version="1.0" encoding="UTF-8"?>
The sections below describe the use cases supported by the
Audacious Inquiry SANER Implementation Guide.


### Use Case 1: Collecting Hospital and Ventilator Measures

This use case addresses the collection and exchange of data from several information systems in a Facility
to a centralized reporting system that communicates to Public Health. The ICU/Central Monitoring System collects data
for multiple data elements by examining messages recieved and data in its database, and then reports these to a Measure Collector
within the hospital.


This use case is supported by the following

* Actors

  - [Measure Source](actors.html#measure-source)

  - [Measure Consumer](actors.html#measure-consumer)

* Transactions

  - [Query Measure](transaction-1.html)

  - [Produce Measure](transaction-2.html)

#### Use Case 1: Collecting Hospital and Ventilator Measures Process Flow 

Measure report data can come from multiple systems within a facility.  For example, the CDC/NHSN Patient Impact
and Hospital Capacity Module asks for the following data elements:

1. **Patient Impact**
   1. Hospitalized Patients w/ COVID-19
   2. Hospitalized and Ventilated Patients w/ COVID-19
   3. Patients with Hospital Onset of COVID-19
   4. Patients in ED/Overflow w/ COVID-19
   5. Ventilated Patients in ED/Overflow w/ COVID-19
   6. Patient Deaths due to COVID-19
2. **Hospital Bed/ Intensive Care Unit (ICU)/ Ventilator Capacity**
   1. Total number of available (inpatient and outpatient) beds
   2. Total Acute staffed beds
   3. Total Occupied Beds
   4. Total ICU Beds
   5. Total Occupied ICU Beds
   6. Total Ventilators
   7. Total Ventilators in Use


These data elements are often not available through a single system. For example, an
[ICU/Central Monitoring System](technology_environment.html#icucentral-monitoring-systems) might
have knowledge of 1.2,5 and 2.4-7 above, while the
[Bed Management System](technology_environment.html#bed-management-aka-housekeeping-systems) could report
on 2.1-3, the Hospital's [EHR](technology_environment.html#ehr-systems) is aware of 1.1, 1.3 and 1.6, and the
[Emergency Department system](technology_environment.html#emergency-department-systems) can provide
an update on 1-4.

In order to  automate capture of this information, a central reporting system (e.g., a FHIR Server) can be made
available to accept partial reports for data.  This data can then be aggregated from reports made by the various
information systems, and forwarded to a public endpoint for reporting.


![Figure 2.3.1.1-1: Use Case 1: Collecting Hospital and Ventilator Measures Process Flow](usecase1-processflow.svg "Figure 2.3.1.1-1: Use Case 1: Collecting Hospital and Ventilator Measures Process Flow")

**Figure 2.3.1.1-1: Use Case 1: Collecting Hospital and Ventilator Measures Process Flow**


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="GETVALUES">ICU/Central Monitoring System collects data</html:span>

   The ICU/Central Monitoring System is triggered (by request or schedule) to generate
a report on ICU beds and equipment, including ventilated patients in ED/Overflow w/ COVID-19,
Total ICU Beds, Occupied ICU Beds, Total Ventilators, Ventilators in Use.


   
   1. The system collects information about ventilators outside the ICU for which the associated patient
was admitted for suspected or confirmed COVID-19. It can makes the determination of suspected/confirmed COVID-19 from
the DG1 segment of the ADT message it recieved regarding the patient.
   2. The system counts the number of ICU beds that it has been configured to recognize and which are operational
   3. The system counts the number of ICU beds that are transmitting telemetry (patient monitoring) information.
   4. The system counts the number of ventilators that it has been configured to recognize and which are operational
   5. The system counts the number of ventilators that are transmitting telemetry data to it in the ICU.
            


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="REPORTVALUES-1.5-2.4-7">ICU/Central Monitoring System Reports
on multiple data elements
(measure populations)</html:span>

   Multiple collected values are aggregated into a report which is then transmitted to the Measure Collector.


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="GETHOSPITALBEDS">Bed Management System Reports
on multiple data elements
(measure populations)</html:span>

   The Hospitals Bed Management System collects data for multiple data elements by
examining messages recieved and data in its database, and then reports these to a Measure Collector
within the hospital.


   
   1. The Bed Management System examines master file data to count the total number of beds in the hospital,
as well as those beds specifically identified as being for acute (inpatient) care. The Bed Management solution can be a component
of the EHR, or as occurs in some hospital settings, a third party solution that integrates with the EHR (usually through ADT and master file
messages).
   2. The bed management system counts the occupied beds (based on current state of each bed) as tracked through
state changes communicated through ADT messages.  The Bed Management solution might be used to support housekeeping, or to support an [electronic
bedboard](https://it.johnshopkins.edu/services/applications/administrative/ebb.html) that might used by a hospital
"[Bed Czar](http://www.ihi.org/resources/Pages/Changes/RealTimeDemandCapacityManagement.aspx)."


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="GETCOVID19DATA">EHR System reports
on multiple data elements
(measure populations)</html:span>

   The Hospital's EHR collects data for multiple data elements.


   
   1. The EHR collects data on hospitalized patients w/ COVID-19.
   2. The EHR collects data on hospitalized patients diagnosed with COVID-19 14 days after admission.
   3. The EHR collects data on patient deaths due to COVID-19.


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="GETEDDATA">The ED System reports
on patients in the ED and/or overflow area.</html:span>

1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="BED-STEP1">Measure Collector aggregates reports for
transmission to a Public Health Agency</html:span>

   Either periodically on some schedule configured for the hospital, or upon recieving a
full set of data, the Measure Collector gathers a set of results from different systems
that have communicated them, putting together a complete MeasureReport for later reporting to the Public Health Agency.


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="BED-STEP3">Transmit Aggregated MeasureReport Data</html:span>

   In a "push" model, the Measure Collector sends the aggregated MeasureReport to a MeasureConsumer (e.g., a Public
            Health endpoint used for measure transmission).


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="BED-STEP4">A Public Health Agency queries the
hospitals Measure Collector
for the most recent reports.</html:span>

   As an alternative to push, the Public Health Agency can also "pull" data by querying the Hospitals
"Measure Collector" endpoint (in fact, a FHIR Server with some additional features supporting aggregation).


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="BED-STEP5">Transmit Aggregated MeasureReport Data</html:span>

   The Measure Collector sends the aggregated MeasureReports to the requesting Public Health Agency.


### Use Case 2: Reporting on A Measure

A public health user queries a reporting system to report on a measure for a region.


This use case is supported by the following

* Actors

  - [Measure Consumer](actors.html#measure-consumer)

  - [Measure Intermediary](actors.html#measure-intermediary)

* Transactions

  - [Communicate Results](transaction-1.html)

#### Use Case 2: Reporting on A Measure Process Flow 

In this use case, we see the classic "dashboard" panel, where a public health user
selects a region, and one or more measures (or functions of measures) to report on, and the data is presented
to them in an easy to view format.


![Figure 2.3.1.2-1: Use Case 2: Reporting on A Measure Process Flow](usecase2-processflow.svg "Figure 2.3.1.2-1: Use Case 2: Reporting on A Measure Process Flow")

**Figure 2.3.1.2-1: Use Case 2: Reporting on A Measure Process Flow**


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="Aggregating-STEP2">Measure Consumer component of a Measure Intermediary gathers data from one or Measure Sources</html:span>

   The Measure Intermediary, acting as a Measure Consumer gathers and aggregates data (possibly computing a function with other associated data) from one or more Measure Sources,
and makes them available through a Measure Source interface it provides.


   The specific ordering in which gathering and aggregation is performed is not further specified
by this implementation guide. It is shown as occuring before the user initiates the query here, but could also occur
after. However, for many cases, geospatial systems can likely do a better job if the aggregation is done ahead of time.
The application of a function to the data can enable a measure such as # of cases to be combined with other data such as
population for the area to report # of cases per 10K population, or similar functions to better present data
in a way that allows it to be reported using comparable scales.


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="Reporting-STEP1">User Initiates Search</html:span>

   The Public Health User navigates to a web page where collected data is reported.


   The user selects a geographic region and an issue of concern (e.g., beds, ventilators, PPE).  The Measure Consumer collects the appropriate reports
and displays the results.


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="">Display Results</html:span>

   The Measure Consumer displays an overview of aggregated regional results to the
user, and additional links which enable navigation to finer grained or alternative displays.


   Data can be displayed as aggregated or fine-grained status information based
on the current focus of the public health user.  It may be shown as a map, a table, or a graph.


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="Reporting-STEP2">User refines Focus or Form of Display</html:span>

   The Public Health User selects a new form of display (e.g., Map, table or graph) or refines their
focus (e.g., wider or smaller region).


1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="">Display Refined Results</html:span>

   The Measure Repository modifies the users focus and reporting format

