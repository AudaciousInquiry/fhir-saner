package com.ainq.fhir.saner.tools.testcase.parser;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import org.apache.commons.lang3.tuple.Pair;
import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.Element;
import org.hl7.fhir.r4.model.Property;
import org.hl7.fhir.r4.model.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ainq.fhir.saner.tools.testcase.Generator;
import com.ainq.fhir.saner.tools.testcase.parser.Constraint.Context;

/**
 * Pojo for Datum
 *
 * Datum ::= DataType identifier{DataType} 'with' '(' Variations ')'
 *       |  Datum DataType identifier{DataType} 'with' '(' Variations ')'
 */
public class Datum extends Named {
    private static final Logger LOGGER = LoggerFactory.getLogger(Datum.class);
    /** records DataType ::= any FHIR data type */
    private transient Class<? extends Base> datatype;
    private Base prototype;
    private String type = null;
    /** Datum ::= DataType identifier{DataType} 'with' '(' FieldConstraints ')' */
    private List<Variation> variations = new ArrayList<>();
    /** The number to generate */
    private int number;
    private Expansion expansion;
    private List<Set<String>> dependsOn = new ArrayList<>();

    @SuppressWarnings("serial")
    public static class Expansion extends ArrayList<Instructions> {
        private Base base = null;
        public Expansion() {
            super();
        }
        public Expansion(List<Instructions> c, Base b) {
            super(c);
            setBase(b);
        }

        public Expansion(Instructions[] array, Base b) {
            super();
            for (Instructions a: array) {
                add(a);
            }
            setBase(b);
        }
        /**
         * @return the base
         */
        public Base getBase() {
            return base;
        }
        /**
         * @param base the base to set
         */
        private void setBase(Base base) {
            this.base = base;
        }
    }

    @SuppressWarnings("serial")
    public static class Instructions extends TreeMap<String, Base> {
        public Instructions() {
            super();
        }
        public Instructions(Map<String, Base> map) {
            super(map);
        }
    }

    public Datum(String name) {
        super(name);
    }
    /**
     * @return the datatype
     */
    public Class<? extends Base> getDatatype() {
        return datatype;
    }
    /**
     * @param datatype the datatype to set
     * @throws ParseException
     */
    public Datum setDatatype(Class<? extends Base> datatype) throws ParseException {
        this.datatype = datatype;
        try {
            this.prototype = datatype.getDeclaredConstructor().newInstance();
            prototype.setIdBase(getName());
        } catch (InstantiationException | IllegalAccessException | IllegalArgumentException
            | InvocationTargetException | NoSuchMethodException | SecurityException e) {
            throw new ParseException(String.format("Cannot create a prototype %s", datatype.getSimpleName()), 0);
        }
        this.type = prototype.fhirType();
        return this;
    }

    /**
     * @return the variations
     */
    public List<Variation> getVariations() {
        return variations;
    }
    /**
     * @return the prototype
     */
    public Base getPrototype() {
        return prototype;
    }
    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    public Datum setNumber(int qty) {
        this.number = qty;
        return this;
    }

    public int getNumber() {
        return number;
    }

    public Datum setExpansion(Expansion result) {
        expansion = result;
        setDependencies();
        return this;
    }

    private void setDependencies() {
        dependsOn.clear();
        for (Instructions inst: expansion) {
            Set<String> dep = new TreeSet<>();
            String id = inst.get("id").primitiveValue();
            dep.add(id);
            for (Map.Entry<String, Base> field: inst.entrySet()) {
                Base b = field.getValue();
                String id2 = b.getIdBase();
                if (id2 != null) {
                    dep.add(id2);
                }
            }
            dependsOn.add(dep);
        }
        int i = 0;
        for (Set<String> dep: dependsOn) {
            LOGGER.trace("{}-{} -> {}", getName(), ++i, dep);
        }
        return;
    }

    public Expansion getExpansion() {
        return expansion;
    }

    public List<Base> getAllValues(Context context) {
        if (expansion == null) {
            return null;
        }

        List<Base> b = context.getItemAsList(getName());
        if (b != null) {
            return b;
        }

        Base[] allValues = new Base[expansion.size()];
        for (int i = 0; i < allValues.length; i++) {
            Instructions map = expansion.get(i);
            Base result = map.get("value");
            if (result == null) {
                result = prototype;
            }
            if (result instanceof Resource) {
                Resource res = ((Resource) result).copy();
                res.setIdBase(map.get("id").toString());
                allValues[i] = copyUserData(result, Constraint.typed(res, "Reference"));

            } else if (result instanceof Element) {
                allValues[i] = copyUserData(result, Constraint.typed(((Element) result).copy(), type));
                allValues[i].setIdBase(getName() + "-" + (i+1));
            }
            allValues[i].setUserData("rules", expansion.get(i));
        }
        context.put(getName(), Pair.of(Arrays.asList(allValues), 0));
        return Arrays.asList(allValues);
    }
    private static final String USERDATA_KEYS[] = { "rules" };
    private Base copyUserData(Base source, Base target) {
        for (String key: USERDATA_KEYS) {
            Object o = source.getUserData(key);
            if (o != null) {
                target.setUserData(key, o);
            }
        }
        return target;
    }

    public static Set<String> computeDependencies(Base a) {
        Set<String> dep = new TreeSet<String>();
        for (Property p: a.children()) {
            if (p.hasValues()) {
                for (Base b: p.getValues()) {
                    if (b != null) {
                        String id = b.getIdBase();
                        if (id != null) {
                            dep.add(id);
                        }
                        dep.addAll(computeDependencies(b));
                    }
                }
            }
        }
        return dep;
    }

    public Set<String> getDependencies(int index) {
        return dependsOn.get(index);
    }
}