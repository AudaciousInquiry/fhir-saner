package com.ainq.fhir.saner.tools;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hl7.fhir.r4.model.Address;
import org.hl7.fhir.r4.model.Coding;
import org.hl7.fhir.r4.model.ContactPoint;
import org.hl7.fhir.r4.model.ContactPoint.ContactPointSystem;
import org.hl7.fhir.r4.model.Identifier;
import org.hl7.fhir.r4.model.Location;
import org.hl7.fhir.r4.model.Location.LocationMode;
import org.hl7.fhir.r4.model.Organization;
import org.hl7.fhir.r4.model.Reference;

import com.opencsv.CSVReaderHeaderAware;
import com.opencsv.CSVReaderHeaderAwareBuilder;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.parser.IParser;

/**
 * A converter that reads a CSV File created from ARCGIS Hospitals data set
 * and converts them to Organization and Location Resources.
 *
 * @author Keith W. Boone
 *
 */
public class CSVtoLocationOrganization {
    private final static String ARCGIS_HOSPITALS = "https://hifld-geoplatform.opendata.arcgis.com/datasets/hospitals";
    private static IParser parser = FhirContext.forR4().newJsonParser().setPrettyPrint(true);

    public static void main(String args[]) {
        for (String arg: args) {
            convert(arg);
        }
    }

    private static void convert(String arg) {
        try (FileReader fr = new FileReader(arg);
            CSVReaderHeaderAware r = new CSVReaderHeaderAwareBuilder(fr).build();
            )
        {
            Map<String, String> row;

            // For Each row
            while ((row = r.readMap()) != null) {
                if (!"MD".equals(row.get("STATE"))) continue;
                Location loc = new Location();
                Organization org = new Organization();
                Identifier ident = new Identifier();
                ContactPoint telephone = new ContactPoint();
                ContactPoint web = new ContactPoint();
                org.setActive("OPEN".equals(row.get("STATUS")));
                loc.setMode(LocationMode.INSTANCE);
                ident.setValue(row.get("ID"));
                ident.setSystem(ARCGIS_HOSPITALS);
                loc.addIdentifier(ident);
                org.addIdentifier(ident);
                String value = row.get("NAME");
                loc.setName(value);
                org.setName(value);
                value = row.get("TELEPHONE");
                if (!StringUtils.isBlank(value) && !value.startsWith("NOT AVAIL")) {
                    telephone.setValue(value);
                    telephone.setSystem(ContactPointSystem.PHONE);
                    loc.addTelecom(telephone);
                    org.addTelecom(telephone);
                }
                value = StringUtils.defaultString(row.get("WEBSITE"));
                if (value.startsWith("http")) {
                    web.setValue(value);
                    web.setSystem(ContactPointSystem.URL);
                    loc.addTelecom(web);
                    org.addTelecom(web);
                }
                Reference ref = new Reference();
                ref.setIdentifier(ident);
                loc.setManagingOrganization(ref);

                value = row.get("ALT_NAME");
                if (!StringUtils.isBlank(value) && !value.startsWith("NOT AVAIL")) {
                    loc.addAlias(value);
                    org.addAlias(value);
                }

                Address addr = new Address();
                value = row.get("ADDRESS");
                addr.addLine(value);
                addr.setCity(row.get("CITY"));
                addr.setState(row.get("STATE"));
                addr.setPostalCode(row.get("ZIP"));
                addr.setCountry(row.get("COUNTRY"));
                addr.setDistrict(row.get("COUNTY"));
                loc.setAddress(addr);
                org.addAddress(addr);

                loc.getPosition().setLatitude(new BigDecimal(row.get("LATITUDE")));
                loc.getPosition().setLongitude(new BigDecimal(row.get("LONGITUDE")));
                Coding coding = new Coding();
                coding.setSystem("http://terminology.hl7.org/CodeSystem/naics");
                coding.setCode(row.get("NAICS_CODE"));
                coding.setDisplay(row.get("NAICS_DESC"));
                org.addType().addCoding(coding);
                loc.addType().addCoding(coding);
                loc.getPhysicalType().addCoding()
                    .setSystem("http://terminology.hl7.org/CodeSystem/location-physical-type")
                    .setCode("si");
                File f = new File("C:/temp", "Location-" + loc.getName() + ".json");
                try (FileWriter fw = new FileWriter(f)) {
                    parser.encodeResourceToWriter(loc, fw);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                f = new File("C:/temp", "Organization-" + org.getName() + ".json");
                try (FileWriter fw = new FileWriter(f)) {
                    parser.encodeResourceToWriter(org, fw);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }

}
