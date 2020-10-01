package com.ainq.fhir.saner.tools.testcase.parser;

import java.util.ArrayList;
import java.util.List;

/**
 * Pojo for Variation
 *
 * Variations ::= FieldConstraints | Variations ',' FieldConstraints
 *
 */
public class Variation extends Named {

    public Variation(String name) {
        super(name);
    }

    private List<Constraint> constraint = new ArrayList<>();

    /**
     * @return the constraint
     */
    public List<Constraint> getConstraint() {
        return constraint;
    }
}