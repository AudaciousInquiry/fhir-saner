
The Situational Awareness for Novel Epidemic Response Implementation Guide enables transmission
of high level situational awareness information from inpatient facilities to centralized data repositories
to support the treatment of novel influenza-like illness.


### About This Guide
This is a draft implementation guide to promote discussion with leaders in the Health
IT industry, and very much a work in progress.  All content in this guide is subject
to discussion and change.

The goal of publishing this guide is to encourage the creation of a community interested
in extremely rapid development of interfaces that can support communication Bed and other
resources to Public Health in this time of crisis.

This implementation guide provides the FHIR Implementation materials associated with
the SANER project.

### Organization of This Guide
This guide is organized into five main sections:

<details>
    <summary>Chapter I: <a href="overview.html">Overview</a> - Provides an overview of the challenges this effort is trying to address.</summary>
    <ol>
      <li><a href="situational_awareness_measures.html">Measuring Situational Awareness</a> - Describes situational awareness and how to measure it.</li>
      <li><a href="measure_aggregation.html">Aggregating Data</a> - Describes how to aggregate Measure data.</li>
      <li><a href="measure_automation.html">Computing Measures</a> - Describes mechanisms to automate measure computation.</li>
      <li><a href="phrase_book.html">Creating Measures supporting Automation</a> - A Phrase Book for creating automatable Measures</li>
      <li><a href="measure_creation.html">Creating an Automated Measure</a> - Walks through the steps of creating an automated measure.</li>
    </ol>
</details>

<details>
    <summary>Chapter II: <a href="transactions.html">Technical Implementation</a> - Describes the technical approach of this guide.</summary>
    <ol>
        <li><a href="technology_environment.html">Environment</a> - Describes the technology environment.</li>
        <li><a href="architecture.html">Architecture</a> - Illustrates the Microservice Architecture.</li>
        <li><a href="security_considerations.html">Security Considerations</a> - Documents security concerns and mitigations.</li>
        <li><a href="use_cases.html">Use Cases</a> - Illustrates key use cases.</li>
        <li><a href="actors.html">Actors and Transactions</a> - Provides an overview of technical components.</li>
        <li><a href="transaction-1.html">Query Measure [PULL-TX]</a></li>
        <li><a href="transaction-2.html">Produce Measure [PUSH-TX]</a></li>
        <li><a href="transaction-3.html">Communicate Results [REPORT-TX]</a></li>
    </ol>
</details>

<details>
    <summary>Chapter III: <a href="profiles.html">Profiles and Extensions</a> - Describes the purpose of the resource profiles and
extensions defined by this guide.</summary>
    <ol>
        <li><summary>Profiles<details>
            <ol>
               {% include list-simple-profiles.xhtml %}
            </ol></details></summary>
        </li>
        <li><summary>Extensions<details>
            <ol>
               {% include list-simple-extensions.xhtml %}
            </ol></details></summary>
        </li>
    </ol>
</details>

<details>
    <summary>Chapter IV: <a href="vocabulary.html">Vocabulary</a></summary>
    <ol>
        <li><summary>Value Sets<details>
            <ol>
               {% include list-simple-valuesets.xhtml %}
            </ol></details></summary>
        </li>
        <li>Code Systems
            <ol>
               {% include list-simple-codesystems.xhtml %}
            </ol>
        </li>
        <!--li>Concept Maps
            <ol>
               {% include list-simple-conceptmaps.xhtml %}
            </ol>
        </li-->
    </ol>
</details>
<details>
    <summary>Chapter V: Testing and Conformance</summary>
    <ol>
        <li><a href='test_plan.html'>Test Plan</a></ol></li>
        <li id='capabilities'><summary>Capability Statements<details>
            <ol>
               {% include list-simple-capabilitystatements.xhtml %}
            </ol></details></summary>
        </li>
        <li><summary>Operations<details>
            <ol>
               {% include list-simple-operationdefinitions.xhtml %}
            </ol></details></summary>
        </li>
        <li>Search Parameters
            <ol>
               {% include list-simple-searchparameters.xhtml %}
            </ol>
        </li>
    </ol>
</details>

<details>
    <summary>Chapter VI: <a id='examples' href="examples.html">Examples</a></summary>
    <ol>
        <li><summary>Measures<details>
            <ol>
               {% include list-simple-measures.xhtml %}
            </ol></details></summary>
        </li>
        <li><summary>Locations<details>
            <ol>
               {% include list-simple-locations.xhtml %}
            </ol></details></summary>
        </li>
        <li><summary>Organizations<details>
            <ol>
                 {% include list-simple-organizations.xhtml %}
            </ol></details></summary>
        </li>
        <li><summary>Measure Reports<details>
            <ol>
               {% include list-simple-measurereports.xhtml %}
            </ol></details></summary>
        </li>
    </ol>
</details>

Click on any of the links above, head on over the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on
[https://github.com/AudaciousInquiry/saner-ig](https://github.com/AudaciousInquiry/fhir-saner).


![The SANER Project Logo](SANERLogo.png)
<div style='float: clear'/>
**Fighting COVID-19 with FHIR®**

### Copyrights and Acknowledgements

Value Sets in this guide include:

* Vocabulary Content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards
Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT
is not covered by this agreement.

* Vocabulary Content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and
the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license
at LOINC/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc

* Vocabulary Content developed by the US National Library of Medicine: Reference to specific
commercial products, manufacturers, companies, or trademarks does not constitute its endorsement or recommendation
by the U.S. Government, Department of Health and Human Services, or NLM. Source materials are available from the
NLM Website at no charge at https://www.nlm.nih.gov/research/umls/rxnorm/index.html

* Vocabulary Content developed by CDC: Reference to specific commercial products, manufacturers, companies, or
trademarks does not constitute its endorsement or recommendation by the U.S. Government, Department of Health and
Human Services, or Centers for Disease Control and Prevention. Source materials are available from the CDC Website
at no charge at https://www.cdc.gov/nhsn/cdaportal/terminology/codesystem/hsloc.html
