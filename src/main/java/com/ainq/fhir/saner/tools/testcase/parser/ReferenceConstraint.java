package com.ainq.fhir.saner.tools.testcase.parser;

import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.Reference;

/** Pojo for
 * ReferenceConstraint ::= 'references' identifier{Resource}
 */
class ReferenceConstraint extends Constraint {
    private String value;
    public ReferenceConstraint(Cases cases, String fieldName, Base field) {
        super(cases, fieldName, field);
    }
    /**
     * @return the value
     */
    @Override
    protected Reference getNextValue() {
        // NOTE: This is NOT an actual reference to a resource,
        // but rather the name of the Datum that would create
        // the set of referenced resources. This will require
        // special handling in the generator.
        return new Reference(value);
    }

    /**
     * @param value the value to set
     */
    public ReferenceConstraint setDatum(Datum datum) {
        super.setDatum(datum);
        this.value = datum.getName();
        return this;
    }

    @Override
    protected void resetState() {
    }

}