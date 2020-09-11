package com.ainq.fhir.saner.tools;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.text.StringEscapeUtils;
import org.hl7.fhir.instance.model.api.IBaseResource;
import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.Bundle;
import org.hl7.fhir.r4.model.CanonicalType;
import org.hl7.fhir.r4.model.CodeType;
import org.hl7.fhir.r4.model.CodeableConcept;
import org.hl7.fhir.r4.model.Coding;
import org.hl7.fhir.r4.model.Identifier;
import org.hl7.fhir.r4.model.Location;
import org.hl7.fhir.r4.model.MeasureReport;
import org.hl7.fhir.r4.model.Meta;
import org.hl7.fhir.r4.model.Organization;
import org.hl7.fhir.r4.model.PrimitiveType;
import org.hl7.fhir.r4.model.Property;
import org.hl7.fhir.r4.model.Resource;
import org.hl7.fhir.r4.model.ValueSet;

import ca.uhn.fhir.context.ConfigurationException;
import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.parser.DataFormatException;
import ca.uhn.fhir.parser.IParser;

public class ResourceToFSH {
    private static FhirContext ctx = FhirContext.forR4();
    private static boolean explode = false;
    private static String WILDCARDS[] = { "*.json", "*.xml" };
    public static void main(String args[]) {
        boolean isB64 = false;
        for (String arg: args) {
            switch (arg) {
            case "-b":
                isB64 = true;
                continue;
            case "-4":
                ctx = FhirContext.forR4();
                continue;
            case "-3":
                ctx = FhirContext.forDstu3();
                continue;
            case "-2":
                ctx = FhirContext.forDstu3();
                continue;
            case "-explode":
                explode = true;
                continue;
            }
            if (arg.contains("?") || arg.contains("*")) {
                String front = StringUtils.substringBeforeLast(arg.replace("\\", "/"),"/");
                readFiles(new File(front), isB64, arg.substring(front.length() + 1));
            } else {
                readFiles(new File(arg), isB64, WILDCARDS);
            }
        }
    }

    private static void readFiles(File f, boolean isB64, String ... wildcards) {
        if (f.isDirectory()) {
            FileFilter fileFilter = new WildcardFileFilter(wildcards);
            for (File file: f.listFiles(fileFilter)) {
                readFile(file, isB64);
            }
        } else {
            readFile(f, isB64);
        }
    }

    private static void readFile(File f, boolean isB64) {
        String resource = null;
        try {
            if (isB64) {
                byte data[] = FileUtils.readFileToByteArray(f);
                Base64.Encoder encoder = Base64.getMimeEncoder();
                String encoded = encoder.encodeToString(data);
                System.out.println(f.getName());
                System.out.println(encoded);
                System.out.println("------");
                return;
            }
            resource = FileUtils.readFileToString(f, StandardCharsets.UTF_8);
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }
        IParser p = resource.trim().startsWith("{") ? ctx.newJsonParser() : ctx.newXmlParser();
        try {
            IBaseResource r = p.parseResource(resource);
            if (r instanceof ValueSet) {
                writeValueSet((ValueSet) r);
            } else if (r instanceof org.hl7.fhir.r4.model.Bundle) {
                writeBundle((Bundle)r, explode);
            } else if (r instanceof org.hl7.fhir.r4.model.Resource) {
                writeResource((Resource)r, false);
            }
        } catch (ConfigurationException | DataFormatException e) {
            e.printStackTrace();
        }
    }

    private static void writeResource(Resource r, boolean include) {
        String name = r.getIdElement().getIdPart();
        if (name.startsWith(r.fhirType() + "-")) {
            name = name.substring(r.fhirType().length() + 1);
        }
        System.out.printf("Instance: %s%n", name);

        String type = r.fhirType();
        Meta m = r.getMeta();
        for (CanonicalType t : m.getProfile()) {
            String v = t.getValueAsString();
            if (v.matches("^http://hl7\\.org/fhir(/R4)?/StructureDefinition/" + type + "$")) {
                continue;
            }
            type = v;
            break;
        }
        System.out.printf("InstanceOf: %s%n", type);

        String props[] = { "title", "description" };
        String measure = "";
        for (String prop : props) {
            try {
                Property p = r.getChildByName(prop);
                if (p != null && p.hasValues()) {
                    String value = p.getValues().get(0).toString();
                    System.out.printf("%s: \"%s\"%n", StringUtils.capitalize(prop), value);
                } else if ("description".equals(prop)) {
                    // There is no description, create one.
                    String date = "";
                    if (r instanceof MeasureReport) {
                        MeasureReport mr = (MeasureReport) r;
                        measure = type = StringUtils.substringAfterLast(mr.getMeasure(),"/");
                        name = mr.getSubject().getDisplay();
                        if (name == null) {
                            name = mr.getSubject().getReferenceElement().getIdPart();
                        }
                        date = " on " + mr.getDateElement().toHumanDisplay();
                    } else if (r instanceof Organization || r instanceof Location) {
                        p = r.getChildByName("name");
                        name = p != null && p.hasValues() ? p.getValues().get(0).toString() : "Unknown";
                    }
                    System.out.printf("Description: \"%s for %s%s\"%n",
                        type, name, date);

                }
            } catch (Exception ex) {
                // Swallow this, assume there's no title
            }
        }

        System.out.printf("* id = \"%s\"%n", r.getIdElement().getIdPart());

        introspect("meta", m);
        introspect("", r);

        System.out.println();
    }

    private static void introspect(String name, Base e) {
        // Adjust name.
        if (name == null) {
            name = "";
        } else if (name.length() != 0 && !name.endsWith(".")) {
            name += ".";
        }

        for (Property p: e.children()) {
            List<Base> l = p.getValues();
            if (l != null && l.size() > 0) {
                int counter = 0;
                for (Base v: l) {
                    String accessor = name + p.getName() + (counter == 0 ? "" : ("[" + counter + "]"));
                    counter++;
                    if (v.isPrimitive()) {
                        PrimitiveType<?> prim = (PrimitiveType<?>) v;
                        Object o = prim.getValue();
                        if (o instanceof CodeType || "code".equals(p.getTypeCode())) {
                            MeasureReport r;
                            System.out.printf("* %s = #%s%n", accessor, prim.getValueAsString());
                        } else if (o instanceof Number || o instanceof Boolean) {
                            System.out.printf("* %s = %s%n", accessor, prim.getValueAsString());
                        } else {
                            System.out.printf("* %s = \"%s\"%n", accessor, prim.getValueAsString());
                        }
                    } else if (v instanceof Coding) {
                        if (((Coding) v).hasSystem()) {
                            System.out.printf("* %s = %s#%s%n", accessor,
                                ((Coding) v).getSystem(),
                                ((Coding) v).getCode());
                        } else {
                            System.out.printf("* %s = #%s%n", accessor,
                                ((Coding) v).getCode());
                        }
                    } else {
                        introspect(accessor, v);
                    }
                }
            }
        }
    }

    private static void writeBundle(Bundle r, boolean explode) {
        if (explode) {
            for (Bundle.BundleEntryComponent c: r.getEntry()) {
                writeResource(c.getResource(), false);
            }
        }

    }

    private static void writeValueSet(ValueSet r) {
        // Keywords: ValueSet, Id, Title and Description
        String name = null;
        if (r.hasName()) {
            name = r.getName();
        } else if (r.hasTitle()) {
            name = r.getTitle().replaceAll("\\s+", "_");
        } else if (r.hasUrl()) {
            name = StringUtils.substringAfterLast(r.getUrl(),"/");
        } else {
            name = r.getIdElement().getIdPart();
        }
        System.out.printf("%nValueSet: %s%n", name);
        System.out.printf("Id: %s%n", r.getIdElement().getIdPart());
        if (r.hasTitle()) {
            System.out.printf("Title: \"%s\"%n", expand(r.getTitle()));
        }
        if (r.hasDescription()) {
            System.out.printf("Description: \"%s\"%n", expand(r.getDescription()));
        }
        int count = 0;
        for (Identifier ident: r.getIdentifier()) {
            System.out.printf(" * ^identifier[%d] = %s#%s%n", count++, ident.getSystem(), ident.getValue());
        }
        count = 0;
        if (r.hasVersion()) {
            System.out.printf(" * ^version = \"%s\"%n", r.getVersion());
        }
        if (r.hasUrl()) {
            System.out.printf(" * ^url = \"%s\"%n", r.getUrl());
        }
        if (r.hasStatus()) {
            System.out.printf(" * ^status = #%s%n", r.getStatus().toCode());
        }
        if (r.hasExperimental()) {
            System.out.printf(" * ^experimental = %s%n", r.getExperimental() ? "true" : "false");
        }
        if (r.hasImmutable()) {
            System.out.printf(" * ^immutable = %s%n", r.getImmutable() ? "true" : "false");
        }
        if (r.hasDate()) {
            System.out.printf(" * ^date = \"%s\"%n", r.getDateElement().asStringValue());
        }
        if (r.hasPublisher()) {
            System.out.printf(" * ^publisher = \"%s\"%n", expand(r.getPublisher()));
        }
        if (r.hasCopyright()) {
            System.out.printf(" * ^copyright = \"%s\"%n", expand(r.getCopyright()));
        }
        if (r.hasPurpose()) {
            System.out.printf(" * ^copyright = \"%s\"%n", expand(r.getPurpose()));
        }

        if (r.hasJurisdiction()) {
            for (CodeableConcept cc: r.getJurisdiction()) {
                // TODO: Not Perfect, only gets the first jurisdiction from a CodeableConcept
                Coding c = cc.getCoding().get(0);
                System.out.printf(" * ^juristiction[%d] = %s#%s%n", count++, c.getSystem(), c.getCode());
            }
        }


        if (r.hasCompose()) {
            for (ValueSet.ConceptSetComponent include: r.getCompose().getInclude()) {
                if (include.hasValueSet()) {

                } else {
                    for (ValueSet.ConceptReferenceComponent ref: include.getConcept()) {
                        System.out.printf(" * %s#%s \"%s\"%n",
                            include.getSystem(), ref.getCode(),
                            expand(ref.getDisplay()));
                    }
                }
            }
            for (ValueSet.ConceptSetComponent exclude: r.getCompose().getExclude()) {
                if (exclude.hasValueSet()) {

                } else {

                }
            }
        } else {
            for (ValueSet.ValueSetExpansionContainsComponent contains: r.getExpansion().getContains()) {
                System.out.printf(" * %s#%s \"%s\"%n",
                    contains.getSystem(), contains.getCode(),
                    expand(contains.getDisplay()));
            }
        }
    }

    private static String expand(String title) {
        if (title == null) {
            return "";
        }
        title = StringEscapeUtils.unescapeJson(title);

        if (title.split("[\\n\\r\\\"#]").length > 1) {
            return "\"\"" + title + "\"\"";
        }
        return StringEscapeUtils.escapeJson(title);
    }

}
