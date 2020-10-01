package com.ainq.fhir.saner.tools.testcase.parser;

import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.BooleanType;

/** Pojo for
 * BooleanConstraint   ::= 'true' | 'false'
 */
class BooleanConstraint extends Constraint {
    private BooleanType value;
    public BooleanConstraint(Cases cases, String fieldName, Base field) {
        super(cases, fieldName, field);
        // TODO Auto-generated constructor stub
    }
    /**
     * @param value the value to set
     */
    public void setValue(BooleanType value) {
        this.value = value;
    }
    @Override
    protected BooleanType getNextValue() {
        return value;
    }
    protected void resetState() {
    }
}