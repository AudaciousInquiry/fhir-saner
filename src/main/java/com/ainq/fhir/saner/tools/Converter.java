package com.ainq.fhir.saner.tools;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.hl7.fhir.instance.model.api.IBaseResource;
import org.hl7.fhir.r4.model.DomainResource;
import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.parser.IParser;
import net.sf.saxon.Transform;

public class Converter {
    static FhirContext context = FhirContext.forR4();
    static IParser jp = context.newJsonParser();
    static IParser xp = context.newXmlParser();

    public static void main(String args[]) throws Exception {
        for (String arg: args) {
            generateText(arg);
        }
    }

    private static void generateText(String arg) throws Exception {
        File fin = new File(arg);
        @SuppressWarnings("unused")
        File fout = convertXml(fin);
    }

    public static String convertJson(File fin) throws IOException {

        try (FileReader fr = new FileReader(fin); ) {
            IBaseResource r = jp.parseResource(fr);
            return xp.encodeResourceToString(r);
        } catch (IOException e) {
            System.err.printf("Cannot convert %s: %s\n", fin, e.getMessage());
            throw e;
        }
    }

    public static File convertXml(File fin) throws Exception {
        if (!fin.exists()) {
            throw new IOException(fin + " does not exist.");
        }
        File fout = new File(fin.getParentFile().getParentFile().getParent(), "fsh/ig-data/input/xml/" + fin.getName().replace(".json", ".xml"));
        try (FileReader fr = new FileReader(fin);
             FileWriter fw = new FileWriter(fout);
            ) {
            IBaseResource r = jp.parseResource(fr);
            xp.encodeResourceToWriter(r, fw);
            return check(r, transformXmlToNarrative(fout, r.getIdElement().getIdPart()));
        } catch (IOException e) {
            System.err.printf("Cannot convert %s: %s\n", fin, e.getMessage());
            throw e;
        }
    }

    private static File check(IBaseResource r, File file) throws IOException {
        String delim = "\"\"\"\n";
        String content = FileUtils.readFileToString(file, StandardCharsets.UTF_8);
        String div = StringUtils.substringBetween(content, delim, delim);
        try {
            DomainResource dr = (DomainResource) r;
            // Veirfy that the content works
            dr.getText().setDivAsString(div);
            // If we got here, it should pass.
            File out = new File(file.getParent(), file.getName().replace(".new", ".fsh"));
            FileUtils.writeStringToFile(out, content, StandardCharsets.UTF_8);
            file.delete();
            return out;
        } catch (Exception ex) {
            System.err.printf("Cannot use %s: %s\n%s\n", file, ex.getMessage(), div);
            return file;
        }
    }

    public static File transformXmlToNarrative(File xml, String id) throws Exception {
        File out = new File(xml.getParentFile().getParentFile().getParentFile().getParent(), id + "Text.new");
        System.out.println("Converting " + xml.getCanonicalPath() + " to " + out.getCanonicalPath().toString());
        String args[] = { "-s:" + xml.getCanonicalPath(), "-xsl:fsh/ig-data/input/measure-intro.xslt", "-o:" + out.getCanonicalPath()};
        Transform.main(args);
        return out;
    }

    public static void main2(String args[]) {
        IParser op = null;
        IParser ip = null;
        for (String arg: args) {
            IBaseResource r;
            File fin = new File(arg);
            File fout;
            if (arg.endsWith(".json")) {
                fout = new File(fin.getParent(), fin.getName().replace(".json", ".xml"));
                op = xp;
                ip = jp;
            } else if (arg.endsWith(".xml")) {
                fout = new File(fin.getParent(), fin.getName().replace(".xml", ".json"));
                op = jp;
                ip = xp;
            } else {
                System.err.println("Do not know how to convert " + arg);
                continue;
            }

            try (FileReader fr = new FileReader(fin); FileWriter fw = new FileWriter(fout)) {
                r = ip.parseResource(fr);
                op.encodeResourceToWriter(r, fw);
            } catch (IOException e) {
                System.err.printf("Cannot convert %s: %s\n", arg, e.getMessage());
            }
        }
    }
}
