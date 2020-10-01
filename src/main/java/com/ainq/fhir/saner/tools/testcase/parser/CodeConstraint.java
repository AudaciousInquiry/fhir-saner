package com.ainq.fhir.saner.tools.testcase.parser;

import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.CodeableConcept;
import org.hl7.fhir.r4.model.Coding;

/**
 * Pojo for CodeConstraint  ::= MissingConstraint
 *         | 'in' identifier{ValueSet}
 *         | 'not' 'in' identifier{ValueSet} [is this really necessary]
 *         | 'equals' CodeLiteral
 *
 */
class CodeConstraint extends Constraint {
    private String valueSet;
    private Coding code;
    private boolean notIn = false;


    public CodeConstraint(Cases cases, String fieldName, Base field) {
        super(cases, fieldName, field);
    }
    /**
     * @return the valueSet
     */
    public String getValueSet() {
        return valueSet;
    }
    /**
     * @param valueSet the valueSet to set
     */
    public CodeConstraint setValueSet(String valueSet) {
        this.valueSet = valueSet;
        return this;
    }
    /**
     * @return the code
     */
    public Coding getCode() {
        return code;
    }
    /**
     * @param code the code to set
     */
    public CodeConstraint setCode(Coding code) {
        this.code = code;
        return this;
    }

    /**
     * @return the notIn
     */
    public boolean isNotIn() {
        return notIn;
    }
    /**
     * @param notIn the notIn to set
     */
    public CodeConstraint setNotIn(boolean notIn) {
        this.notIn = notIn;
        return this;
    }

    @Override
    protected Base getNextValue() {
        if (code != null) {
            return typed(code);
        }
        if (valueSet != null) {
            ValueList vl = getCases().getValueList(valueSet);
            if (vl == null) {
                throw new RuntimeException(valueSet + " does not exist");
            }
            String value = vl.nextValue();
            String system = vl.getSystem();
            return getCodeFromString(value, system);
        }
        return null;
    }
    @Override
    protected void resetState() {
    }

    private Base getCodeFromString(String value, String system) {
        if (value == null || value.length() == 0) {
            // Setting the code value to "" should result in a null code
            // This allows a valuelist to specify that nulls should be
            // sent some of the time.
            return null;
        }

        if (system != null) {
            value = system + "|" + value;
        }
        if (value.length() == 0) {
            return null;
        }
        String parts[] = value.split("\\|");
        Coding coding = parseCodeParts(parts, 0);
        if (coding == null) {
            return null;
        }

        if (parts.length <= 3 || !"CodeableConcept".equals(getType())) {
            return typed(coding);
        }

        CodeableConcept cc = new CodeableConcept().addCoding(coding);
        for (int i = 3; i < parts.length; i += 3) {
            coding = parseCodeParts(parts, i);
            if (coding != null) {
                cc.addCoding(coding);
            }
        }
        return cc;
    }

    private Coding parseCodeParts(String parts[], int i) {
        Coding coding = new Coding();

        coding.setSystem(parts[i].length() != 0 ? parts[i] : null);
        if (parts.length > i + 1) {
            if (parts[i + 1].length() == 0) {
                // Setting the code value to "" should result in a null code
                // This allows a valuelist to specify that nulls should be
                // sent some of the time.
                return null;
            }
            coding.setCode(parts[i + 1]);
        }
        if (parts.length > i + 2) {
            coding.setDisplay(parts[i + 2]);
        }
        return coding;
    }

    private Base typed(Coding code) {
        return typed(code, getType());
    }
}