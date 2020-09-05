This page lists all the ValueSets, CodeSystems and ConceptMaps defined as part of the SANER Implementation Guide.

### Value Sets
These Value Sets have been defined for this implementation guide.

<ol>
  {% include list-name-valuesets.xhtml %}
</ol>

The following Value Sets are defined in other guides and are used in this implementation
guide.


### Code Systems
These Code Systems have been defined for this implementation guide.

<ol>
  {% include list-name-codesystems.xhtml %}
</ol>

The following Code Systems are defined elsewhere and are used in this guide.

### Concept Maps
This Concept Map has been defined for this implementation guide.

<ol>
  {% include list-name-conceptmaps.xhtml %}
</ol>

### Using Codes in the SANER Implementation Guide
The SANER Implementation Guide follows the same rules for use of codes as is found in
the US Core Implementation Guide. This guidance is summarized below, but more detail can be found in the
[Using Codes section](https://www.hl7.org/fhir/us/core/general-guidance.html#using-codes-in-us-core-profiles)
of the US Core Implementation Guide.

#### Required binding for CodeableConcept Datatype
Required binding to a value set definition means that one of the codes from the specified value set **shall** be used and using only text is not valid.
Multiple codings (translations) are permitted as is discussed below.

#### Extensible binding for CodeableConcept Datatype
Extensible binding to a value set definition for this IG means that if the data type is CodeableConcept, then one of the coding values **shall** be from
the specified value set if a code applies, but if no suitable code exists in the value set, alternate code(s) may be provided in its place. If only
text available, then just text may be used.

#### Using multiple codes with CodeableConcept Datatype
Alternate codes may be provided in addition to the standard codes defined in required or extensible value sets. The alternate codes are called
"translations". These translations may be equivalent to or narrower in meaning to the standard concept code.

