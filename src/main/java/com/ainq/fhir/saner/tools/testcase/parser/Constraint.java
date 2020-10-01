package com.ainq.fhir.saner.tools.testcase.parser;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.function.Supplier;

import org.apache.commons.lang3.NotImplementedException;
import org.apache.commons.lang3.tuple.Pair;
import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.Base64BinaryType;
import org.hl7.fhir.r4.model.BooleanType;
import org.hl7.fhir.r4.model.CanonicalType;
import org.hl7.fhir.r4.model.CodeType;
import org.hl7.fhir.r4.model.CodeableConcept;
import org.hl7.fhir.r4.model.Coding;
import org.hl7.fhir.r4.model.DateTimeType;
import org.hl7.fhir.r4.model.DateType;
import org.hl7.fhir.r4.model.DecimalType;
import org.hl7.fhir.r4.model.HumanName;
import org.hl7.fhir.r4.model.IdType;
import org.hl7.fhir.r4.model.Identifier;
import org.hl7.fhir.r4.model.InstantType;
import org.hl7.fhir.r4.model.IntegerType;
import org.hl7.fhir.r4.model.MarkdownType;
import org.hl7.fhir.r4.model.OidType;
import org.hl7.fhir.r4.model.Period;
import org.hl7.fhir.r4.model.PositiveIntType;
import org.hl7.fhir.r4.model.Property;
import org.hl7.fhir.r4.model.Quantity;
import org.hl7.fhir.r4.model.Reference;
import org.hl7.fhir.r4.model.Resource;
import org.hl7.fhir.r4.model.StringType;
import org.hl7.fhir.r4.model.TimeType;
import org.hl7.fhir.r4.model.UnsignedIntType;
import org.hl7.fhir.r4.model.UriType;
import org.hl7.fhir.r4.model.UrlType;
import org.hl7.fhir.r4.model.UuidType;

/**
 * Base class for field constraints
 *
 * FieldConstraints ::= fieldName{Code} CodeConstraint  | FieldConstraints{Code} 'or' CodeConstraint
 *                  | fieldName{Period} PeriodConstraint | FieldConstraints{Period} 'or' CodeConstraint
 *                  | fieldName{Quantity} QuantityConstraint | FieldConstraints{Quantity} 'or' CodeConstraint
 *                  | fieldName{Boolean} BooleanConstraint | FieldConstraints{Boolean} or CodeConstraint
 *                  | fieldName{Reference} ReferenceConstraint | FieldConstraints{Reference} or CodeConstraint
 */
public abstract class Constraint extends Named {
    private Datum datum;
    // Avoid serialization loops
    private transient Cases cases;
    private int lineNo = 0;
    private Base field;
    private String type = null;

    @SuppressWarnings("serial")
    public static class Context extends TreeMap<String, Pair<List<Base>, Integer>> {
        public Context() {
            super();
        }

        public List<Base> getItemAsList(String name) {
            Pair<List<Base>, Integer> p = get(name);
            if (p != null) {
                return Arrays.asList(p.getLeft().get(p.getRight()));
            }
            return null;
        }

        public void advance(String name, Base next) {
            Pair<List<Base>, Integer> p = get(name);
            if (p == null) {
                p = Pair.of(new ArrayList<Base>(), 0);
            } else {
                p = Pair.of(p.getLeft(), p.getRight() + 1);
            }
            p.getLeft().add(next);
            put(name, p);
        }
    }

    public Constraint(Cases cases, String name, Base field) {
        super(name);
        this.field = field;
        this.type = field.fhirType();
        this.cases = cases;
    }

    public Base getField() {
        return field;
    }

    public String getType() {
        return type;
    }

    public List<Base> getAll(Context context) {
        List<Base> b = context.getItemAsList(getName());
        if (b != null) {
            return b;
        }

        if (datum != null) {
            return datum.getAllValues(context);
        }
        return Collections.singletonList(getNext(context));
    }

    public Base getNext(Context context) {
        Base next = getNextValue();

        context.advance(getName(), next);
        // Annotate the provided element with the
        // function that can recreate it.
        Supplier<Base> nextSupplier = new Supplier<>() {
            @Override
            public Base get() {
                return getNextValue();
            }
        };
        next.setUserData("Supplier", nextSupplier);

        return next;
    }

    /**
     * Gets a value matching the constraint.
     * Subsequent calls are expected to return
     * a different value where possible.
     *
     * If value comes from a set of values, then this will
     * return the next available value from that set.
     *
     * If the value is specified to be an identifier
     * then the value will be the NEXT identifier.
     *
     * @return
     */
    protected abstract Base getNextValue();
    protected abstract void resetState();

    public Entry<String, List<Base>> getChange(Context context) {
        return new Map.Entry<String, List<Base>>() {
            String key = Constraint.this.getName();
            List<Base> value = getAll(context);

            @Override
            public String getKey() {
                return key;
            }

            @Override
            public List<Base> getValue() {
                return value;
            }

            @Override
            public List<Base> setValue(List<Base> value) {
                throw new NotImplementedException("setValue() is not implemented");
            }
        };
    }

    /**
     * @return the datum
     */
    public Datum getDatum() {
        return datum;
    }

    /**
     * @param datum the datum to set
     */
    public Constraint setDatum(Datum datum) {
        this.datum = datum;
        return this;
    }

    /**
     * @return the cases
     */
    public Cases getCases() {
        return cases;
    }

    /**
     * @return the lineno
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineno the lineno to set
     */
    public Constraint setLineNo(int lineno) {
        this.lineNo = lineno;
        return this;
    }

    public static Base typed(Base base, String type) {
        switch (base.fhirType()) {
        case "Coding":
            Coding code = (Coding) base;
            if ("Coding".equals(type))
                return code;
            else if ("CodeableConcept".equals(type)) {
                return new CodeableConcept().addCoding(code).setText(code.getDisplay()).setId(code.getId());
            }
            else if ("code".equals(type))
                return code.getCodeElement().setId(code.getId());
            return code;
        case "Period":
            Period period = (Period) base;
            switch (type) {
            case "date":    return new DateType(period.getStart());
            case "dateTime":    return period.getStartElement().copy();
            case "instant": return new InstantType(period.getStart());
            case "time":
                Calendar cal = Calendar.getInstance();
                cal.setTime(period.getStart());
                SimpleDateFormat sf = null;
                switch (period.getStartElement().getPrecision()) {
                case MILLI:
                    sf = new SimpleDateFormat("HH:mm:ss.SSS");
                    break;
                case SECOND:
                    sf = new SimpleDateFormat("HH:mm:ss");
                    break;
                case MINUTE:
                default:
                    sf = new SimpleDateFormat("HH:mm");
                    break;
                }
                String time = sf.format(period.getStart());
                return new TimeType(time).setId(period.getId());
            case "Period":
            default:
                return period.copy();
            }
        case "Quantity":
            Quantity result = (Quantity) base;
            switch (type) {
            case "integer":
                return new IntegerType(result.getValue().intValue()).setId(result.getId());
            case "positiveInt":
                return new PositiveIntType(result.getValue().intValue()).setId(result.getId());
            case "unsignedInt":
                return new UnsignedIntType(result.getValue().longValue()).setId(result.getId());
            case "decimal":
                return new DecimalType(result.getValue()).setId(result.getId());
            case "Quantity":
            default:
                return result.copy();
            }

        case "string":
            String string = base.primitiveValue();
            switch (type) {
            case "time":
                return new TimeType(string).setId(base.getIdBase());
            case "instant":
                return new InstantType(string).setId(base.getIdBase());
            case "date":
                return new DateType(string).setId(base.getIdBase());

            case "dateTime":
                return new DateTimeType(string).setId(base.getIdBase());

            case "string":
                return new StringType(string).setId(base.getIdBase());
            case "code":
                return new CodeType(string).setId(base.getIdBase());
            case "markdown":
                return new MarkdownType(string).setId(base.getIdBase());
            case "id":
                return new IdType(string).setId(base.getIdBase());

            case "base64Binary":
                return new Base64BinaryType(string).setId(base.getIdBase());

            case "uri":
                return new UriType(string).setId(base.getIdBase());
            case "oid":
                return new OidType(string).setId(base.getIdBase());
            case "url":
                return new UrlType(string).setId(base.getIdBase());
            case "canonical":
                return new CanonicalType(string).setId(base.getIdBase());
            case "uuid":
                return new UuidType(string).setId(base.getIdBase());

            case "integer":
                return new IntegerType(string).setId(base.getIdBase());

            case "positiveInt":
                return new PositiveIntType(string).setId(base.getIdBase());

            case "unsignedInt":
                return new UnsignedIntType(string).setId(base.getIdBase());

            case "decimal":
                return new DecimalType(string).setId(base.getIdBase());

            case "boolean":
                return new BooleanType(string).setId(base.getIdBase());
            default:
                return new StringType(string).setId(base.getIdBase());
            }
        default:
            if (base instanceof Resource && "Reference".equals(type)) {
                Resource res = (Resource) base;
                Reference r = new Reference(base.fhirType() + "/" + res.getId());
                r.setId(res.getId());
                Property prop = res.getNamedProperty("name".hashCode(), "name", false);
                if (prop != null && prop.hasValues()) {
                    Base name = prop.getValues().get(0);
                    if (!name.isEmpty()) {
                        r.setDisplay(getNameAsString(name));
                    }
                }
                prop = res.getNamedProperty("identifier".hashCode(), "identifier", false);
                if (prop != null && prop.hasValues()) {
                    Base ident = prop.getValues().get(0);
                    if (!ident.isEmpty()) {
                        r.setIdentifier((Identifier) ident);
                    }
                }
            }
        }
        return base;
    }

    protected static String getNameAsString(Base base) {
        if (base == null || base.isEmpty()) {
            return null;
        }
        switch (base.fhirType()) {
        case "string":
            return base.primitiveValue();
        case "HumanName":
            HumanName nm = (HumanName) base;
            List<String> names = new ArrayList<>();
            if (nm.hasGiven()) {
                nm.getGiven().forEach(g -> names.add(g.getValue()));
            }
            if (nm.hasFamily()) {
                names.add(nm.getFamily());
            }
            nm.getGiven();
            StringBuilder b = new StringBuilder();
            for (String part: names) {
                b.append(part);
                b.append(" ");
            }
            if (b.length() > 0) {
                b.setLength(b.length() - 1);
            }
            return b.toString();
        default:
            return base.primitiveValue();
        }
    }
}