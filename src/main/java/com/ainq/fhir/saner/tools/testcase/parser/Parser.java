package com.ainq.fhir.saner.tools.testcase.parser;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StreamTokenizer;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hl7.fhir.instance.model.api.IBase;
import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.Coding;
import org.hl7.fhir.r4.model.DateTimeType;
import org.hl7.fhir.r4.model.Period;
import org.hl7.fhir.r4.model.Property;
import org.hl7.fhir.r4.model.Quantity;
import org.hl7.fhir.r4.model.Resource;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ca.uhn.fhir.context.BaseRuntimeElementDefinition;
import ca.uhn.fhir.context.FhirContext;

/** This class implements a parser for test cases
 *
 * This is the approximate grammar for test cases
 *
 *
 * TestCases ::= 'TestCase' identifier{TestCase} ':' DataSet
 *          | TestCases identifier{TestCase} ':' Datum
 *
 * Datum ::= DataType identifier{DataType} 'with' '(' Variations ')'
 *       |  Datum DataType identifier{DataType} 'with' '(' Variations ')'
 *
 * DataType ::= any FHIR data type
 *
 * Variations :: = Variation | Variations ',' Variation
 *
 * Variation ::= FieldConstraints
 *
 * FieldConstraint ::= fieldName{Code} CodeConstraint  | FieldConstraint{Code} or CodeConstraint
 *                  | fieldName{Period} PeriodConstraint | FieldConstraint{Period} or CodeConstraint
 *                  | fieldName{DateTime} DateConstraint | FieldConstraint{DateTime} or CodeConstraint
 *                  | fieldName{Quantity} QuantityConstraint | FieldConstraint{Quantity} or CodeConstraint
 *                  | fieldName{Boolean} BooleanConstraint | FieldConstraint{Boolean} or CodeConstraint
 *                  | fieldName{Reference} ReferenceConstraint | FieldConstraint{Reference} or CodeConstraint
 *
 * CodeConstraint  ::= MissingConstraint
 *         | 'in' identifier{ValueSet}
 *         | 'not' 'in' identifier{ValueSet}
 *         | 'equals' CodeLiteral
 *
 * PeriodConstraint ::= MissingConstraint
 *         | 'before' (identifier{Period} | DateLiteral )
 *         | 'after'  (identifier{Period} | DateLiteral )
 *         | 'within' (identifier{Period} | PeriodLiteral )
 *         | 'equals' (identifier{Period} | PeriodLiteral )
 *
 * DateConstraint ::= MissingConstraint
 *         | Quantity? 'before' identifier{DateTime}
 *         | Quantity? 'after' identifier{DateTime}
 *         | identifier{DateTime}
 *         | DateLiteral
 *
 * QuantityConstraint  ::= Comparator QuantityLiteral
 *
 * BooleanConstraint   ::= 'true' | 'false'
 *
 * ReferenceConstraint ::= 'references' identifier{Resource}
 *
 * Comparator  ::= '<'|'<='|'>'|'>='|'='
 *
 * DateLiteral ::= '@' date
 *
 * PeriodLiteral   ::= DateLiteral 'to' DateLiteral
 *
 * CodeLiteral ::= URL? #identifier{code} string?
 *
 * QuantityLiteral ::= number identifier{Unit}?
 *
 * @author Keith W. Boone
 *
 */
public class Parser {

    private StreamTokenizer tok;
    FhirContext context =
        FhirContext.forR4();
    private Map<String, BaseRuntimeElementDefinition<? extends IBase>> fhirTypes = new HashMap<>();
    private Cases cases = null;

    public Parser(Reader r) {
        tok = new StreamTokenizer(r);
        tok.slashSlashComments(true);
        tok.slashStarComments(true);
        tok.commentChar('#');
        tok.parseNumbers();
        tok.quoteChar('\'');
        tok.quoteChar('"');
        tok.wordChars('a', 'z');
        tok.wordChars('A', 'Z');
        tok.wordChars('.', '.');
        tok.wordChars('[', '[');
        tok.wordChars(']', ']');
        tok.whitespaceChars(' ', ' ');
        tok.whitespaceChars('\t', '\t');

        for (String res: context.getResourceNames()) {
            BaseRuntimeElementDefinition<?> ed = context.getResourceDefinition(res);
            fhirTypes.put(ed.getName(), ed);
            //System.out.println(ed.getName());
        }
        for (BaseRuntimeElementDefinition<?> ed: context.getElementDefinitions()) {
            if (!ed.getName().contains(".") && fhirTypes.get(ed.getName()) == null) {
                fhirTypes.put(ed.getName(), ed);
                //System.out.println(ed.getName());
            }
        }
    }

    public static void main(String args[]) {
        for (String arg: args) {
            Parser p;
            try {
                System.out.printf("Reading %s%n", arg);
                p = new Parser(new FileReader(arg, StandardCharsets.UTF_8));
                Cases l = p.parse();
                l.setSource(arg);
                GsonBuilder builder = new GsonBuilder();
                Gson gson = builder.setPrettyPrinting().create();

                System.out.printf("%s%n", gson.toJson(l));

            } catch (ParseException ex) {
                int line = ex.getErrorOffset();
                System.err.printf("Error: %s at (%s:%d)", ex.getMessage(), arg, line);
                ex.printStackTrace();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    public Cases parse() throws IOException, ParseException {
        cases = new Cases(null);

        while (testcase() != null)
            /* SLURP */;

        if (tok.nextToken() == StreamTokenizer.TT_WORD && "Values".equals(tok.sval)) {
            while (valueList() != null)
                /* SLURP */;
        }

        if (tok.nextToken() != StreamTokenizer.TT_EOF) {
            throw new ParseException(String.format("Unrecognized value %s", tok),tok.lineno());
        }
        return cases;
    }

    private ValueList valueList() throws ParseException, IOException {
        if (tok.nextToken() == StreamTokenizer.TT_EOF) {
            return null;
        }
        tok.pushBack();

        ValueList valueList = getIdentifierOrString(ValueList.class, true);
        if (tok.nextToken() != ':') {
            throw new ParseException(
                String.format("Expected ':' after declaration of value list %s, but got %s", valueList.getName(), tok),tok.lineno());
        }
        if (tok.nextToken() != '{') {
            throw new ParseException(
                String.format("Expected '{' after declaration of value list %s, but got %s", valueList.getName(), tok),tok.lineno());
        }
        if (tok.nextToken() == StreamTokenizer.TT_WORD && "system".equals(tok.sval)) {
            if (tok.nextToken() != '=') {
                throw new ParseException(
                    String.format("Expected '=' after declaration of system for value list %s, but got %s", valueList.getName(), tok), tok.lineno());
            }
            switch (tok.nextToken()) {
            case '\'': case '"':
                valueList.setSystem(tok.sval);
                break;
            default:
                throw new ParseException(
                    String.format("Expected system url, but got %s", valueList.getName(), tok), tok.lineno());
            }
            if (tok.nextToken() != ',') {
                throw new ParseException(
                    String.format("Expected ',' at end of system declaration for value list %s, but got %s", valueList.getName(), tok), tok.lineno());
            }
        } else {
            tok.pushBack();
        }

        while (tok.nextToken() != '}') {
            switch (tok.ttype) {
            case StreamTokenizer.TT_WORD:
            case '\'': case '"':
                valueList.addValue(tok.sval);
            }
            if (tok.nextToken() == StreamTokenizer.TT_NUMBER) {
                valueList.setFrequency((int)tok.nval);
            } else {
                tok.pushBack();
            }
        }

        if (tok.ttype != '}') {
            throw new ParseException(
                String.format("Expected '}' and end of declaration of value list %s", valueList.getName()),tok.lineno());
        }
        return valueList;
    }

    private <T extends Named> T getIdentifierOrString(Class<T> clazz, boolean isNew) throws ParseException, IOException {
        if (tok.nextToken() != StreamTokenizer.TT_WORD &&
            tok.ttype != '\'' && tok.ttype != '"') {
            throw new ParseException(String.format("An identifier was expected, but found %s", tok), tok.lineno());
        }
        return getIdentifier2(clazz, isNew);
    }

    private <T extends Named> T getIdentifier(Class<T> clazz, boolean isNew) throws ParseException, IOException {
        if (tok.nextToken() != StreamTokenizer.TT_WORD) {
            throw new ParseException(String.format("An identifier was expected, but found %s", tok), tok.lineno());
        }
        return getIdentifier2(clazz, isNew);
    }

    private <T extends Named> T getIdentifier2(Class<T> clazz, boolean isNew) throws ParseException, IOException {
        Object o = cases.getIdentifiedObject(tok.sval);
        if (!isNew) {
            if (o == null) {
                throw new ParseException(
                    String.format("Identifier %s is not defined as a %s", tok.sval, clazz.getSimpleName()),
                        tok.lineno());
            } else if (clazz.isInstance(o)) {
                return clazz.cast(o);
            } else {
                throw new ParseException(
                    String.format("Identifier %s is already defined as a %s, expecting a %s", tok.sval,
                        o.getClass().getSimpleName(), clazz.getSimpleName()),
                        tok.lineno());
            }
        }
        if (o != null) {
            throw new ParseException(
                String.format("Identifier %s is already defined as a %s", tok.sval, clazz.getSimpleName()),
                    tok.lineno());
        }

        T t;
        try {
            t = clazz.getConstructor(String.class).newInstance(tok.sval);
        } catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException
            | NoSuchMethodException | SecurityException e) {
            throw new ParseException(String.format("Error constructing %s", clazz.getSimpleName()), tok.lineno());
        }
        cases.register(t);
        return t;
    }

    public TestCase testcase() throws IOException, ParseException {
        if (tok.nextToken() == StreamTokenizer.TT_EOF) {
            return null;
        }

        if (tok.ttype != StreamTokenizer.TT_WORD || !"TestCase".equals(tok.sval)) {
            tok.pushBack();
            return null;
        }

        TestCase t = getIdentifier(TestCase.class, true);

        if ("Values".equals(tok.sval)) {
            // We are now in the values section.
            tok.pushBack();
            return null;
        }

        if (tok.nextToken() != ':') {
            throw new ParseException(
                String.format("':' expected after %s", t.getName()), tok.lineno());
        }

        List<Datum> datasets = datasets();
        if (datasets == null) {
            throw new ParseException(
                String.format("Data set expected"), tok.lineno());
        }

        t.getDataset().addAll(datasets);
        return t;
    }

    /**
     * Parser for Datum
     *
     * Datum ::= DataType identifier{DataType} [x Number] 'with' '(' Variations ')'
     *       |  Datum DataType identifier{DataType} [x Number] 'with' '(' Variations ')'
     * @throws ParseException
     */
    private List<Datum> datasets() throws IOException, ParseException {
        List<Datum> data = new ArrayList<>();

        while (tok.nextToken() == StreamTokenizer.TT_WORD) {
            String dataType = tok.sval;
            if ("TestCase".equals(tok.sval) || "Values".equals(tok.sval)) {
                tok.pushBack();
                break;
            }
            BaseRuntimeElementDefinition<?> type = fhirTypes.get(dataType);
            if (type == null) {
                throw new ParseException(String.format("%s is not a FHIR Data type or Resource", dataType), tok.lineno());
            }

            Datum datum = getIdentifierOrString(Datum.class, true);

            @SuppressWarnings("unchecked")
            Class<? extends Base> clazz = (Class<? extends Base>) type.getImplementingClass();
            datum.setDatatype(clazz);

            String next = expecting("X", "x", "with");
            int qty = 0;
            if (next.equalsIgnoreCase("X")) {
                if (tok.nextToken() != StreamTokenizer.TT_NUMBER) {
                    throw new ParseException(String.format("Number expected after 'X' in %s", datum.getName()), tok.lineno());
                }
                qty = (int) tok.nval;
                datum.setNumber(qty);
                expecting("with");
            } else if (!"with".equals(next)) {
                if (tok.nextToken() != StreamTokenizer.TT_WORD || !"with".equals(tok.sval)) {
                    throw new ParseException(String.format("'with' or 'X' expected after %s", datum.getName()), tok.lineno());
                }
            }

            List<Variation> v = variations(datum.getPrototype());
            if (v.isEmpty()) {
                throw new ParseException(String.format("At least one variation expected for %s", datum.getName()), tok.lineno());
            }
            datum.getVariations().addAll(v);
            data.add(datum);
        }
        if (data.isEmpty()) {
            throw new ParseException("Expected at least one test data Base", tok.lineno());
        }
        return data;
    }

    private List<Variation> variations(Base Base) throws ParseException, IOException {
        List<Variation> data = new ArrayList<>();

        int expecting = '(';

        while (tok.nextToken() == expecting) {
            switch (tok.nextToken()) {
            case StreamTokenizer.TT_WORD:
            case '\'': case '"':    // Have to accept string to allow name[0].given
                String fieldName = tok.sval;
                Variation v = new Variation(fieldName);
                data.add(v);

                v.getConstraint().addAll(constraint(fieldName, Base));

                expecting = ',';
                break;
            default:
                throw new ParseException(String.format("Expected fieldname in %s but got %s", Base.fhirType(), tok.sval), tok.lineno());
            }
        }
        if (tok.ttype != ')') {
            throw new ParseException(String.format("Expected '%c' or ')', but got %s", expecting, tok), tok.lineno());
        }
        return data;
    }

    /**
     * FieldConstraints ::= fieldName{Code} CodeConstraint  | FieldConstraints{Code} 'or' CodeConstraint
     *                  | fieldName{Period} PeriodConstraint | FieldConstraints{Period} 'or' CodeConstraint
     *                  | fieldName{DateTime} DateConstraint | FieldConstraints{DateTime} 'or' CodeConstraint
     *                  | fieldName{Quantity} QuantityConstraint | FieldConstraints{Quantity} 'or' CodeConstraint
     *                  | fieldName{Boolean} BooleanConstraint | FieldConstraints{Boolean} or CodeConstraint
     *                  | fieldName{Reference} ReferenceConstraint | FieldConstraints{Reference} or CodeConstraint
     * @param type
     * @throws IOException
     * @throws ParseException
     */
    private List<? extends Constraint> constraint(String fieldName, Base base) throws IOException, ParseException {
        List<Constraint> constraint = new ArrayList<>();

        do {
            // the switch below needs to be based on the field type;
            Base field = getField(base, fieldName);
            switch (field.fhirType()) {
            case "Coding": case "CodeableConcept":
                constraint.add(codeConstraint(fieldName, base, field));
                break;
            case "Period":
            case "date": case "dateTime": case "instant":
                constraint.add(periodConstraint(fieldName, base, false, field));
                break;

            case "integer": case "unsignedInt": case "positiveInt": case "decimal": case "Quantity":
                constraint.add(quantityConstraint(fieldName, base, field));
                break;

            case "string":
            case "code":
            case "uri":
                constraint.add(stringConstraint(fieldName, base, field));
                break;

            case "boolean":
                constraint.add(booleanConstraint(fieldName, field));
                break;

            case "Reference": case "canonical":
                constraint.add(referenceConstraint(fieldName, base, field));
                break;

            }
        } while (tok.nextToken() == StreamTokenizer.TT_WORD && "or".equals(tok.sval));

        switch (tok.ttype) {
        case ')':
        case ',':
            tok.pushBack();
            return constraint;
        default:
            throw new ParseException(
                String.format("Premature end of constraint: 'or', ',' or ')' expected, %s found", tok.sval),
                    tok.lineno());
        }
    }

    private Base getField(Base Base, String fieldName) throws ParseException {
        // Strip any whitespace from feild name
        fieldName = fieldName.replaceAll("\\s+","")
            // and also remove any indexer parts so that name[1].given becomes name.given
            .replaceAll("\\[[0-9]+\\]","");
        // Because all we care about is type Information

        String fields[] = fieldName.split("\\.");
        String actualFieldName = null;
        for (String field: fields) {
            List<Property> p = Base.children();
            Base next = null;
            if (Base.isPrimitive() && "value".equals(field)) {
                next = Base;
            } else {
                for (Property prop: p) {
                    String name = actualFieldName = prop.getName();
                    if (name.equals(field)) {
                        if (StringUtils.isEmpty(prop.getTypeCode())) {
                            next = Base.addChild(prop.getName());
                            next.setUserData("type", next.fhirType());   // Save this in case we need it later
                        } else {
                            next = (Base) fhirTypes.get(fixReference(prop.getTypeCode()))
                                .newInstance();
                            next.setUserData("type", prop.getTypeCode());   // Save this in case we need it later
                        }
                        break;
                    } else if (name.contains("[x]")) {
                        String prefix = name.substring(0, name.length() - 3);
                        if (field.startsWith(prefix) && isFhirType(field.substring(prefix.length()))) {
                            String actualType = field.substring(prefix.length());
                            next = (Base) fhirTypes.get(actualType).newInstance();
                            next.setUserData("type", prop.getTypeCode()); // Save this in case we need it later
                            break;
                        }
                    }
                }
            }
            if (next == null) {
                // We didn't find it.
                throw new ParseException(
                    String.format("%s is not a field in %s", field, Base.fhirType()), tok.lineno());
            } else if (!Base.isPrimitive()) {
                // Set values for non-primitive types
                Base.setProperty(actualFieldName, next);
            }
            Base = next;
        }
        return Base;
    }

    private String fixReference(String typeCode) {
        if (typeCode.startsWith("Reference(")) {
            return "Reference";
        }
        return typeCode;
    }

    private boolean isFhirType(String substring) {
        return fhirTypes.get(substring) != null;
    }

    /**
     * CodeConstraint  ::= MissingConstraint
     *  | 'in' identifier{ValueSet}
     *  | 'not' 'in' identifier{ValueSet} [is this really necessary]
     *  | 'equals' CodeLiteral
     *
     * @param Base
     * @return
     * @throws IOException
     * @throws ParseException
     */
    private Constraint codeConstraint(String fieldName, Base Base, Base field) throws IOException, ParseException {
        String values[] = { "missing", "in", "not", "equals" };
        int lineno = tok.lineno();
        String keyword = expecting(values);

        boolean negate = false;
        switch (keyword) {
        case "missing":
            return new MissingConstraint(cases, fieldName).setLineNo(lineno);

        case "not":
            expecting("in");
            negate = true;
        case "in":
            String valueSet = getString();
            return new CodeConstraint(cases, fieldName, field).setNotIn(negate).setValueSet(valueSet).setLineNo(lineno);

        case "equals":
            String codeParts[] = getString().split("\\|");
            if (codeParts.length == 1) {
                return new CodeConstraint(cases, fieldName, field).setNotIn(negate)
                    .setCode(new Coding().setCode(codeParts[0])).setLineNo(lineno);
            } else {
                return new CodeConstraint(cases, fieldName, field).setNotIn(negate).setCode(
                    new Coding().setSystem(codeParts[0]).setCode(codeParts[1])
                ).setLineNo(lineno);
            }
        default:
            throw new Error("We should never get here");
        }
    }

    private String getString() throws ParseException, IOException {
        switch (tok.nextToken()) {
        case '\'': case '"':
            return tok.sval;
        default:
            throw new ParseException(String.format("A string was expected but found %s", tok.sval), tok.lineno());
        }
    }

    private String getStringOrKeyword(String ... keywords) throws ParseException, IOException {
        switch (tok.nextToken()) {
        case '\'': case '"':
            return tok.sval;
        case StreamTokenizer.TT_WORD:
            if (Arrays.asList(keywords).contains(tok.sval)) {
                return tok.sval;
            }
        default:
            throw new ParseException(String.format("A string or one of %s was expected but found %s",
                Arrays.asList(keywords), tok), tok.lineno());
        }
    }

    private String getOptionalStringOrKeyword() throws ParseException, IOException {
        switch (tok.nextToken()) {
        case '\'': case '"':
        case StreamTokenizer.TT_WORD:
            return tok.sval;
        default:
            tok.pushBack();
            return "";
        }
   }

    private String expecting(String ... values ) throws IOException, ParseException {
        switch (tok.nextToken()) {
        case StreamTokenizer.TT_WORD:   // Don't force quotes around 'days', et ceter
        case '\'': case '"':            // but allow them to be used
            if (Arrays.asList(values).contains(tok.sval)) {
                return tok.sval;
            }
        default:
            // deal with single character strings that are tokens
            if (tok.ttype > 0) {
                char a[] = { (char)tok.ttype };
                String s = new String(a);
                if (Arrays.asList(values).contains(s)) {
                    return s;
                }
            }
            if (values.length > 1) {
                throw new ParseException(String.format("expected one of %s, but got %s", Arrays.asList(values), tok), tok.lineno());
            } else {
                throw new ParseException(String.format("expected %s, but got %s", values[0], tok.sval), tok.lineno());
            }
        }
    }

    /*
     * PeriodConstraint ::= MissingConstraint
     *         | 'before' (identifier{Period} | PeriodLiteral )
     *         | 'after'  (identifier{Period} | PeriodLiteral )
     *         | 'within' (identifier{Period} | PeriodLiteral )
     *         | 'equals' (identifier{Period} | PeriodLiteral )
     *         | Quantity? 'before' (identifier{Period} | PeriodLiteral)
     *         | Quantity? 'after' (identifier{Period} | PeriodLiteral)

     */
    private Constraint periodConstraint(String fieldName, Base Base, boolean simple, Base field) throws IOException, ParseException {
        String values[] = { "missing", "before", "after", "within", "equals", "=" };
        int lineno = tok.lineno();
        String keyword = expecting(values);
        Quantity q = null;

        switch (keyword) {
        case "missing":
            if (simple) {
                throw new ParseException(String.format("missing not expected."), tok.lineno());
            }
            return new MissingConstraint(cases, fieldName).setLineNo(lineno);

        case "=":
            keyword = "equals";
        case "before":
        case "after":
        case "within":
        case "equals":
            switch (tok.nextToken()) {
            case StreamTokenizer.TT_WORD:
                // It's a word, it should be an identifier of a Period datum.
                Named o = cases.getIdentifiedObject(tok.sval);
                if (o == null) {
                    throw new ParseException(String.format("%s is not defined.", tok.sval), tok.lineno());
                } else if (o instanceof Datum) {
                    Datum datum = (Datum) o;
                    switch (datum.getType()) {
                    case "date":
                    case "dateTime":
                    case "instant":
                    case "Period":
                        return new PeriodConstraint(cases, fieldName, field).setComparison(keyword)
                            .setDatum(datum).setLineNo(lineno);
                    default:
                        throw new ParseException(String.format("%s is a %s, not a date, dateTime, instant or Period.",
                            tok.sval, datum.getType()), tok.lineno());
                    }
                }
                throw new ParseException(String.format("%s is a %s, not a datum.", tok.sval, o.getClass().getSimpleName()), tok.lineno());
            case StreamTokenizer.TT_NUMBER:
                if (simple) {
                    throw new ParseException(String.format("Quantity %s found, but Period expected", tok.sval), tok.lineno());
                }
                q = new Quantity(tok.nval);
                String unit = expecting(
                    "year", "years", "a", "month", "months", "mo", "weeks", "week", "wk", "days", "day", "d",
                    "hours", "hour", "h", "minutes", "minute", "min", "seconds", "second", "s", "millis", "ms"
                );

                switch (unit) {
                case "year": case "years": case  "a":
                    q.setCode("a");
                    break;
                case "month": case "months": case "mo":
                    q.setCode("mo");
                    break;
                case "weeks": case "week": case "wk":
                    q.setCode("wk");
                    break;
                case "days": case "day": case "d":
                    q.setCode("d");
                    break;
                case "hours": case "hour": case "h":
                    q.setCode("h");
                    break;
                case "minutes": case "minute": case "min":
                    q.setCode("min");
                    break;
                case "seconds": case "second": case "s":
                    q.setCode("s");
                    break;
                case "millis": case "ms":
                    q.setCode("ms");
                    break;
                }
                q.setUnit(unit);  // Keep the original units to be nice
                return new PeriodConstraint(cases, fieldName, field).setComparison(keyword).setOffset(q).setBasePeriod(
                    (PeriodConstraint) periodConstraint(fieldName, Base, true, field)
                ).setLineNo(lineno);


            case '\'': case '"':
                // It's a string, convert to date
                String time = tok.sval;
                if (time.startsWith("@")) {
                    DateTimeType t = new DateTimeType(time.substring(1)), end = getEnd(t);

                    if (optional("to") != null) {
                        String endString = getString();
                        if (!endString.startsWith("@")) {
                            throw new ParseException(String.format("A date literal was expected but got %s.", tok.sval), tok.lineno());
                        }
                        end = new DateTimeType(endString.substring(1));
                    }
                    return new PeriodConstraint(cases, fieldName, field).setComparison(keyword)
                        .setPeriod(new Period().setStartElement(t).setEndElement(end)).setLineNo(lineno);
                }
                throw new ParseException(String.format("A date literal was expected but got %s.", tok.sval), tok.lineno());
            default:
                throw new ParseException(String.format("An identifier or date literal was expected but got %s.", tok.sval), tok.lineno());
            }
        default:
            throw new Error("We should never get here");
        }

    }

    private String optional(String ... string) throws IOException {
        if (tok.nextToken() == StreamTokenizer.TT_WORD && Arrays.asList(string).contains(tok.sval)) {
            return tok.sval;
        }
        tok.pushBack();
        return null;
    }

    private DateTimeType getEnd(DateTimeType t) {
        DateTimeType end = t.copy();
        end.add(t.getPrecision().getCalendarConstant(), 1);
        return end;
    }

    private Constraint stringConstraint(String fieldName, Base Base, Base field) throws IOException, ParseException {
        boolean isString = false;
        int lineno = tok.lineno();
        switch (tok.nextToken()) {
        case '=':
            isString = true;
            break;
        case StreamTokenizer.TT_WORD:
            if (!"in".equals(tok.sval)) {
                throw new ParseException(String.format("Expected in, but got %s.", tok), tok.lineno());
            }
            break;
        }

        String word = getStringOrKeyword("Identifier");
        if (isString) {
            if (tok.ttype == StreamTokenizer.TT_WORD) {
                word = getOptionalStringOrKeyword();
                if (word == null) {
                    word = ""; // Use the default counter;
                }
                return new StringConstraint(cases, fieldName, field).setString(word).setIdentifier(true).setLineNo(lineno);
            }
            return new StringConstraint(cases, fieldName, field).setString(word).setIdentifier(word.startsWith("Identifier")).setLineNo(lineno);
        }
        return new StringConstraint(cases, fieldName, field).setValueSet(word).setLineNo(lineno);
    }

    /**
     * QuantityConstraint  ::= Comparator QuantityLiteral
     * Comparison  ::= '<'|'<='|'>'|'>='|'='|'!=' | ~=
     * @param cases
     * @param fieldName
     * @param Base
     * @param type
     * @return
     * @throws ParseException
     * @throws IOException
     */
    private Constraint quantityConstraint(String fieldName, Base Base, Base field) throws IOException, ParseException {
        Comparison comp = Comparison.Equals;
        int lineno = tok.lineno();
        switch (tok.nextToken()) {
        case '<':
            if (tok.nextToken() == '=') {
                comp = Comparison.LessThanEquals;
            } else {
                comp = Comparison.LessThan;
                tok.pushBack();
            }
            break;
        case '>':
            if (tok.nextToken() == '=') {
                comp = Comparison.GreaterThanEquals;
            } else {
                comp = Comparison.GreaterThan;
                tok.pushBack();
            }
            break;
        case '~':
            comp = Comparison.Approximates;
            break;
        case '=':
            comp = Comparison.Equals;
            break;
        case '!':
            if (tok.nextToken() != '=') {
                throw new ParseException(String.format("Expected !=, but got !%c.", tok.ttype), tok.lineno());
            }
            comp = Comparison.NotEquals;
            break;
        default:
            throw new ParseException(String.format("Expected a comparison operator (e.g., =, <=), but got %s.", tok.sval), tok.lineno());
        }

        Quantity q = null;
        switch (tok.nextToken()) {
        case StreamTokenizer.TT_NUMBER:
            q = new Quantity(tok.nval);
            break;
        case '\'': case '"':
            // Use a string if precision is important.
            q = new Quantity().setValue(new BigDecimal(tok.sval));
            break;
        default:
            throw new ParseException(String.format("Expected a number but got %s.", tok.sval), tok.lineno());
        }

        tok.nextToken();
        if (tok.ttype == '\'' || tok.ttype == '\"') {
            String parts[] = tok.sval.split("\\|");
            if (parts.length == 2) {
                q.setSystem(parts[0]);
                q.setCode(parts[1]);
            } else {
               q.setCode(parts[0]);
            }
        }
        return new QuantityConstraint(cases, fieldName, field).setComparison(comp).setQuantity(q).setLineNo(lineno);
    }


    private Constraint booleanConstraint(String fieldName, Base Base) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * ReferenceConstraint ::= '=' identifier{Resource}
     * @param fieldName
     * @param base
     * @return
     * @throws ParseException
     * @throws IOException
     */
    private Constraint referenceConstraint(String fieldName, Base base, Base field) throws IOException, ParseException {
        int lineno = tok.lineno();
        if (tok.nextToken() != '=') {
            throw new ParseException(String.format("'=' expected but found %s", tok), tok.lineno());
        }

        if (tok.nextToken() != StreamTokenizer.TT_WORD) {
            throw new ParseException(String.format("Resource Datum identifier expected but found %s", tok), tok.lineno());
        }

        Named o = cases.getIdentifiedObject(tok.sval);
        if (o == null) {
            throw new ParseException(String.format("%s does not exist", tok.sval), tok.lineno());
        }

        if (o instanceof Datum) {
            Datum datum = (Datum) o;
            Base b = datum.getPrototype();
            field.setIdBase(datum.getName());
            if (b instanceof Resource) {
                return new ReferenceConstraint(cases, fieldName, field).setDatum(datum).setLineNo(lineno);
            } else {
                throw new ParseException(String.format("%s does not reference a Resource, it is an %s", tok.sval,
                    b.fhirType()), tok.lineno());
            }
        } else {
            throw new ParseException(String.format("%s does not reference Datum, it is an %s", tok.sval,
                o.getClass().getSimpleName()), tok.lineno());
        }
    }
}
