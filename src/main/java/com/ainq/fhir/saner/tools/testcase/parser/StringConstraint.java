package com.ainq.fhir.saner.tools.testcase.parser;

import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.Base64BinaryType;
import org.hl7.fhir.r4.model.BooleanType;
import org.hl7.fhir.r4.model.CanonicalType;
import org.hl7.fhir.r4.model.CodeType;
import org.hl7.fhir.r4.model.DateTimeType;
import org.hl7.fhir.r4.model.DateType;
import org.hl7.fhir.r4.model.DecimalType;
import org.hl7.fhir.r4.model.IdType;
import org.hl7.fhir.r4.model.InstantType;
import org.hl7.fhir.r4.model.IntegerType;
import org.hl7.fhir.r4.model.MarkdownType;
import org.hl7.fhir.r4.model.OidType;
import org.hl7.fhir.r4.model.PositiveIntType;
import org.hl7.fhir.r4.model.StringType;
import org.hl7.fhir.r4.model.TimeType;
import org.hl7.fhir.r4.model.UnsignedIntType;
import org.hl7.fhir.r4.model.UriType;
import org.hl7.fhir.r4.model.UrlType;
import org.hl7.fhir.r4.model.UuidType;

class StringConstraint extends Constraint {
    private String string;
    private String valueSet;
    private boolean identifier;

    public StringConstraint(Cases cases, String fieldName, Base field) {
        super(cases, fieldName, field);
    }
    /**
     * @return the string
     */
    public String getString() {
        return string;
    }
    /**
     * @param string the string to set
     */
    public StringConstraint setString(String string) {
        this.string = string;
        return this;
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
    public StringConstraint setValueSet(String valueSet) {
        this.valueSet = valueSet;
        return this;
    }

    @Override
    protected Base getNextValue() {
        if (identifier) {
            return getCases().nextIdentifier(string);
        }

        if (valueSet == null) {
            return new StringType(getString());
        }

        ValueList v = getCases().getValueList(valueSet);
        if (v == null) {
            throw new RuntimeException(String.format("Value List %s is undefined", valueSet));
        }
        return typed(v.nextValue());
    }

    protected void resetState() {
        if (valueSet != null) {
            ValueList v = getCases().getValueList(valueSet);
            if (v == null) {
                throw new RuntimeException(String.format("Value List %s is undefined", valueSet));
            }
            v.resetState();
        }
    }

    private Base typed(String nextValue) {
        switch (getType()) {
        case "time":
            return new TimeType(nextValue);
        case "instant":
            return new InstantType(nextValue);
        case "date":
            return new DateType(nextValue);

        case "dateTime":
            return new DateTimeType(nextValue);

        case "string":
            return new StringType(nextValue);
        case "code":
            return new CodeType(nextValue);
        case "markdown":
            return new MarkdownType(nextValue);
        case "id":
            return new IdType(nextValue);

        case "base64Binary":
            return new Base64BinaryType(nextValue);

        case "uri":
            return new UriType(nextValue);
        case "oid":
            return new OidType(nextValue);
        case "url":
            return new UrlType(nextValue);
        case "canonical":
            return new CanonicalType(nextValue);
        case "uuid":
            return new UuidType(nextValue);

        case "integer":
            return new IntegerType(nextValue);

        case "positiveInt":
            return new PositiveIntType(nextValue);

        case "unsignedInt":
            return new UnsignedIntType(nextValue);

        case "decimal":
            return new DecimalType(nextValue);

        case "boolean":
            return new BooleanType(nextValue);
        default:
            return new StringType(nextValue);
        }
    }

    public StringConstraint setIdentifier(boolean b) {
        if (this.identifier = b) {
            if (string == null)
                string = ""; // use the default identifier if none are set
        }
        return this;
    }
    /**
     * @return the identifier
     */
    public boolean isIdentifier() {
        return identifier;
    }

}
