package com.ainq.fhir.saner.tools.testcase.parser;

import java.math.BigDecimal;
import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.DecimalType;
import org.hl7.fhir.r4.model.IntegerType;
import org.hl7.fhir.r4.model.PositiveIntType;
import org.hl7.fhir.r4.model.Quantity;
import org.hl7.fhir.r4.model.UnsignedIntType;

/** Pojo for
 * QuantityConstraint  ::= Comparator QuantityLiteral
 */
class QuantityConstraint extends Constraint {
    private Quantity quantity;
    private Comparison comparison;
    private int state = 0;
    private final static int MAXSTATES = 10;
    private String type;

    public QuantityConstraint(Cases cases, String fieldName, Base field) {
        super(cases, fieldName, field);
        this.type = field.fhirType();
    }

    /**
     * @return the quantity
     */
    public Quantity getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public QuantityConstraint setQuantity(Quantity quantity) {
        this.quantity = quantity;
        return this;
    }

    /**
     * @return the comparison
     */
    public Comparison getComparison() {
        return comparison;
    }

    /**
     * @param comparison the comparison to set
     */
    public QuantityConstraint setComparison(Comparison comparison) {
        this.comparison = comparison;
        return this;
    }

    @Override
    protected void resetState() {
        state = 0;
    }

    @Override
    protected Base getNextValue() {
        state %= MAXSTATES;
        int mult[] = { 10, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

        BigDecimal value = quantity.getValue();
        int scale = value.scale();  // Get the scale of the value
        BigDecimal offset = BigDecimal.TEN.pow(scale + 1);

        switch (comparison) {
        case Equals:
            ++state;
            return typed(quantity);
        case Approximates:
            int change = -5 + mult[state];
            value = value.subtract(offset.multiply(BigDecimal.valueOf(change)));
            break;
        case GreaterThan:
            // Add units 1/2ths of precision up to state times
            value = value.add(offset.multiply(BigDecimal.valueOf(mult[state] * 5)));
            break;
        case GreaterThanEquals:
            // Add units 1/2ths of precision up to state-1 times
            value = value.add(offset.multiply(BigDecimal.valueOf((mult[state]-1) * 5)));
            break;
        case LessThan:
            value = value.subtract(offset.multiply(BigDecimal.valueOf((mult[state]) * 5)));
            break;
        case LessThanEquals:
            value = value.subtract(offset.multiply(BigDecimal.valueOf((mult[state]-1) * 5)));
            break;
        case NotEquals:
            if (mult[state] > 5) {
                value = value.add(offset.multiply(BigDecimal.valueOf((mult[state]-5) * -50)));
            } else {
                value = value.add(offset.multiply(BigDecimal.valueOf(-mult[state] * 50)));
            }
            break;
        default:
            break;
        }
        ++state;
        Quantity result = quantity.copy();
        result.setValue(value);
        return typed(result);
    }

    private Base typed(Quantity result) {
        switch (type) {
        case "integer":
            return new IntegerType(result.getValue().intValue());
        case "positiveInt":
            return new PositiveIntType(result.getValue().intValue());
        case "unsignedInt":
            return new UnsignedIntType(result.getValue().longValue());
        case "decimal":
            return new DecimalType(result.getValue());
        case "Quantity":
        default:
            return result.copy();
        }
    }
}