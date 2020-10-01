package com.ainq.fhir.saner.tools;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Supplier;

import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.PrimitiveType;
import org.hl7.fhir.r4.model.Property;
import org.hl7.fhir.r4.model.Resource;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

public class FhirToGson extends TypeAdapter<Base> {
    private static FhirToGson INSTANCE = new FhirToGson();

    public static String fhirToGson(Object o) {
        return fhirToGson(o, null)[0];
    }

    public static String[] fhirToGson(Object... o) {
        Gson gson = newFhirToGson();
        String[] s = new String[o.length];
        int counter = 0;
        for (Object obj : o) {
            s[counter++] = gson.toJson(obj);
        }
        return s;
    }

    public static GsonBuilder newFhirToGsonBuilder() {
        GsonBuilder builder = new GsonBuilder();
        builder.registerTypeHierarchyAdapter(Base.class, INSTANCE);
        return builder.setPrettyPrinting();
    }

    public static Gson newFhirToGson() {
        return newFhirToGsonBuilder().create();
    }


    public static Supplier<String> fhirToGsonProducer(Object obj) {
        // TODO Auto-generated method stub
        return () -> { return FhirToGson.fhirToGson(obj); };
    }

    @Override
    public void write(JsonWriter out, Base elem) throws IOException {
        if (elem == null) {
            out.nullValue();
        } else if (elem.isPrimitive()) {
            writePrimitive((PrimitiveType<?>) elem, out);
        } else {
            out.beginObject();
            if (elem instanceof Resource) {
                out.name("resourceType");
                out.jsonValue(elem.fhirType());
            }
            writeProperties(elem.children(), out);
            out.endObject();
        }
    }

    private boolean writePrimitive(PrimitiveType<?> b, JsonWriter out) throws IOException {
        switch (b.fhirType()) {
        case "time":
        case "instant":
        case "date":
        case "dateTime":

        case "string":
            case "code":
            case "markdown":
            case "id":

        case "base64Binary":

        case "uri":
            case "oid":
            case "url":
            case "canonical":
            case "uuid":

            out.value(b.primitiveValue());
            break;

        case "integer":
            case "positiveInt":
            case "unsignedInt":
            out.value(Long.parseLong(b.primitiveValue()));
            break;

        case "decimal":
            out.value(new BigDecimal(b.primitiveValue()));
            break;

        case "boolean":
            out.value(Boolean.parseBoolean(b.primitiveValue()));
            break;

        default:
            throw new IOException("Do not know how to write a '" + b.fhirType() + "'");
        }
        return b.hasExtension() || b.hasId();
    }

    private void writeProperties(List<Property> props, JsonWriter out) throws IOException {
        for (Property p: props) {
            if (p.hasValues()) {
                out.name(p.getName());
                boolean hasExtension = false;
                if (p.isList()) {
                    out.beginArray();
                    for (Base b: p.getValues()) {
                        hasExtension = hasExtension || simpleWrite(out, b);
                    }
                    out.endArray();
                } else {
                    Base b = p.getValues().get(0);
                    hasExtension = hasExtension || simpleWrite(out, b);
                }
                if (hasExtension) {
                    // TODO: Handle extensions and id values on primitives
                }
            }
        }
    }

    private boolean simpleWrite(JsonWriter out, Base b) throws IOException {
        if (b == null) {
            out.nullValue();
            return false;
        } else if (b.isPrimitive()) {
            return writePrimitive((PrimitiveType<?>) b, out);
        } else {
            write(out, b);
            return false;
        }
    }

    @Override
    public Resource read(JsonReader in) throws IOException {
        // TODO Auto-generated method stub
        return null;
    }

}