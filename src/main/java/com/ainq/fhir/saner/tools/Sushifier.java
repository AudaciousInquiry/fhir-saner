package com.ainq.fhir.saner.tools;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.CanonicalType;
import org.hl7.fhir.r4.model.CodeableConcept;
import org.hl7.fhir.r4.model.Coding;
import org.hl7.fhir.r4.model.Property;
import org.hl7.fhir.r4.model.Quantity;
import org.hl7.fhir.r4.model.Reference;
import org.hl7.fhir.r4.model.Resource;

public class Sushifier {

    /**
     * Produce SUSHI code to generate an instance for result.
     * @param result    The encoded SUSHI instructions.
     * @param d         The datum for the resource being generated.
     * @param index     The index of the variation number
     * @param out       Where to write the output
     * @throws IOException  If an IO Error occured while writing.
     */
    public static void sushify(Map<String, Base> result, Resource r, String name, String type, int index, PrintWriter out) throws IOException {
        // TODO Auto-generated method stub
        if (r instanceof Resource) {
            String description = name.contains("-") ? StringUtils.substringAfter(name, "-").trim() : null;
            if (description != null) {
                name = StringUtils.substringBefore(name, "-").trim();
            }
            out.printf("\nInstance: %s%d\n", name, index);
            out.printf("InstanceOf: %s\n", type);
            if (description != null) {
                out.printf("Description: \"%s\"\n", description);
            }
            for (Map.Entry<String, Base> e: result.entrySet()) {
                sushifyType(e.getValue(), e.getKey(), out);
            }
        }
        out.flush();
    }

    /**
     * Given a FHIR Data type, write it out in SUSHI instructions
     * @param b The data element to write
     * @param key   The current index of it in the resource
     * @param out   Where to write it.
     * @throws IOException
     */
    private static void sushifyType(Base b, String key, PrintWriter out) throws IOException {
        if (b == null) {
            return;
        }

        if (b.isPrimitive()) {
            out.printf("* %s = ", key);
        }
        switch (b.fhirType()) {
        case "time": case "instant": case "date": case "dateTime":
        case "uri": case "oid": case "url": case "uuid":
        case "string": case "id": case "base64Binary":
            String s = b.primitiveValue();
            if (!StringUtils.containsAny(s, "\n\r\t\"")) {
                out.printf("\"%s\"\n", s);
                break;
            }

        case "markdown":
            s = b.primitiveValue();
            out.printf("\"\"\"\n%s\n\"\"\"", s);
            break;

        case "code":
            out.printf("#%s\n", b.primitiveValue());
            break;

        case "integer": case "positiveInt": case "unsignedInt":
            out.printf("%d\n", Long.parseLong(b.primitiveValue()));
            break;

        case "decimal":
            out.printf("%s\n", new BigDecimal(b.primitiveValue()).toPlainString());
            break;


        case "boolean":
            out.printf("%s\n", b.primitiveValue());
            break;

        case "canonical":
            CanonicalType canonical = (CanonicalType) b;
            out.printf("Canonical(%s)\n", canonical.getValue());
            break;

        // Take advantagee of Sushi Syntax for SOME Composites
        case "CodeableConcept":
            CodeableConcept cc = (CodeableConcept)b;
            if (cc.hasCoding()) {
                for (int i = 0; i < cc.getCoding().size(); i++) {
                    sushifyType(cc.getCoding().get(i), key + ".coding[" + i + "]", out);
                }
            }
            if (cc.hasTextElement()) sushifyType(cc.getTextElement(), key + ".text", out);
            break;

        case "Coding":
            Coding coding = (Coding) b;
            out.printf("* %s = %s#%s", key, coding.hasSystem() ? coding.getSystem() : "", coding.getCode());
            if (coding.hasDisplay()) {
                out.printf(" \"%s\"\n", coding.getDisplay());
            } else {
                out.println();
            }
            break;

        case "Quantity":
            Quantity q = (Quantity) b;
            out.printf("* %s = %s", key, q.getValue().toPlainString());
            if (q.hasCode()) {
                out.printf(" '%s'\n", q.getCode());
            } else out.println();
            break;

        case "Reference":
            Reference r = (Reference) b;
            out.printf("* %s = Reference(%s)\n", key, r.getReference());
            if (r.hasTypeElement()) sushifyType(r.getTypeElement(), key + ".type", out);
            if (r.hasIdentifier()) sushifyType(r.getIdentifier(), key + ".identifier", out);
            if (r.hasDisplayElement()) sushifyType(r.getDisplayElement(), key + ".dispay", out);
            break;

        default:
            // Handle everything else using FHIR Reflection
            List<Property> props = b.children();
            for (Property prop: props) {
                if (prop.hasValues()) {
                    if (prop.isList()) {
                        int counter = 0;
                        for (Base child: prop.getValues()) {
                            if (child == null) {
                                continue;
                            }
                            sushifyType(child, key + "." + prop.getName() + "[" + counter + "]", out);
                            counter++;
                        }
                    } else {
                        Base child = prop.getValues().get(0);
                        String name = prop.getName();
                        if (name.endsWith("[x]")) {
                            name = name.substring(0, name.length() - 3) + child.fhirType();
                        }
                        sushifyType(child, key + "." + prop.getName(), out);
                    }
                }
            }
        }
    }

}
