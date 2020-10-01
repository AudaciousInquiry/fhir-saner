package com.ainq.fhir.saner.tools.testcase.parser;

import org.hl7.fhir.r4.model.Base;

/** Pojo for
 * MissingConstraint ::= 'missing'
 */
public class MissingConstraint extends Constraint {

    public MissingConstraint(Cases cases, String fieldName) {
        super(cases, fieldName, null);
    }

    @Override
    protected Base getNextValue() {
        return null;
    }

    @Override
    protected void resetState() {
    }

}