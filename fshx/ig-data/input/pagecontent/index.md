
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
      <li><a href="StructureDefinition-PublicHealthMeasure.html">The Public Health Measure Profile</a> - </li>
      <li><a href="measure_automation.html">Computing Measures</a> - Describes mechanisms to automate measure computation.</li>
      <li><a href="phrase_book.html">Creating Measures supporting Automation</a> - A Phrase Book for creating automatable Measures</li>
      <li><a href="measures.html">Example Measures used for Reporting</a> - Demonstrates examples for measures used by CDC as FHIR Measure resources.</li>
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
        <li>Profiles
            <ol>
               {% include list-simple-profiles.xhtml %}
            </ol></li>
        <li>Extensions
            <ol>
               {% include list-simple-extensions.xhtml %}
            </ol>
        </li>
    </ol>
</details>

<details>
    <summary>Chapter IV: <a href="vocabulary.html">Vocabulary</a></summary>
    <ol>
        <li>Value Sets
            <ol>
               {% include list-simple-valuesets.xhtml %}
            </ol>
        </li>
        <li>Code Systems
            <ol>
               {% include list-simple-codesystems.xhtml %}
            </ol>
        </li>
        <li>Concept Maps
            <ol>
               {% include list-simple-conceptmaps.xhtml %}
            </ol>
        </li>
    </ol>
</details>
<details>
    <summary>Chapter V: Testing and Conformance</summary>
    <ol>
        <li><a href='test_plan.html'>Test Plan</a></ol></li>
        <li id='capabilities'>Capability Statements
            <ol>
               {% include list-simple-capabilitystatements.xhtml %}
            </ol>
        </li>
        <li>Operations
            <ol>
               {% include list-simple-operationdefinitions.xhtml %}
            </ol>
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
        <li>Measures
            <ol>
               {% include list-simple-measures.xhtml %}
            </ol>
        </li>
        <li>Locations
            <ol>
               {% include list-simple-locations.xhtml %}
            </ol>
        </li>
        <li>Organizations
            <ol>
                 {% include list-simple-organizations.xhtml %}
            </ol>
        </li>
        <li>Measure Reports
            <ol>
               {% include list-simple-measurereports.xhtml %}
            </ol>
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
[https://github.com/AudaciousInquiry/saner-ig](https://github.com/AudaciousInquiry/saner-ig).


![The SANER Project Logo](SANERLogo.png)
<div style='float: clear'/>
**Fighting COVID-19 with FHIR®**