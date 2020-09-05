### Overview
Some Health IT systems in a facility may not yet support HL7 FHIR.  To incorporate data from these systems, this guide enables reports to be
provided in CSV format through a simplified interface.

This interface provides operations that support conversion of a MeasureReport to CSV format and from CSV format to a MeasureReport.  Conversion is handled in a
two stage process which includes both a conversion step, and a column remapping step.

The Conversion step assumes that there is a canonical CSV representation of a MeasureReport.
This canonical representation makes the following assumptions.

1. There are no populations or groups whose code has the value subject, reporter, period.start, period.end, stratifier or stratum.
2. The first code in MeasureReport.group.code or MeasureReport.group.population.code matches the column head for scores and counts.
3. The value sets for MeasureReport.group.coding[0].code and MeasureReport.group.population.coding[0].code do not contain identical code values.
4. Order is preserved in transmission of CodeableConcept values between systems using FHIR, so that the order of codes in a coding are not changed.
5. MeasureReport.group.stratifier.stratum.population.code and MeasureReport.group.population.code are bound to the same value set within any Measure.

#### Conversion Process

##### Conversion from MeasureReport to CSV Format
The process described below can be used to convert a MeasureReport to its canonical CSV Format. If the canonical format is sufficient for conversion operations
then only this process need be followed.  However, the CSV report may need to be modified to remap and/or reorder column values using the map argument in operations
supporting CSV conversion.  See the section on [Remapping](#remapping) below for details on this step.


Given a collection of MeasureReport resources using the same Measure Resource, and a value set of codes used for conversion

   1. Produce the column heads for the MeasureReport resources

      1. Add the "subject" column represents the subject of the report (e.g., a location)
      2. Add the "reporter" column represents the reporter providing the data (e.g., a system or facility)
      3. Add the "period-start" and "period-end" columns represent the reporting period.  This may be
         simplified to "period" if period-start and period-end have the same value for the report.

      4. If there are strata in the MeasureReport

         1. Add the "stratifier" column to represent which stratifier is being reporting on (e.g., age, gender, race, ethnicity, etc.)
         2. Add the "stratum" column to represent the stratum within the stratifier (e.g., male, female).

      5. For each group in the MeasureReport,

         1. Add a column using the code from group.code in the conversion value set to represent the column that contains the measureScore value.
         2. For each population in in the group

            1. Add a column using the code from group.population.code in the conversion value set to represent the column that contains the count value.

   2. Produce the rows for each group within the MeasureReport

      1. Produce a row ror each population within the group which contains:

         1. The identifier of the subject
         2. The identifier of the reporter
         3. The period or period-start and period-end for the reporting period
         4. If there are strata for the population

            1. A blank value for the code identifying the type of stratum
            2. A blank value for the code identifying the category within the stratum

         5. The count of the total in for each population
         6. The measure score for each population

      2. For each stratifier within the group

         1. For each population within each stratum of the stratifier

            1. Produce a row for each population which contains values the population within the stratum, including:

               1. The identifier of the subject (MeasureReport.subject.identifier.value)
               2. The identifier of the reporter (MeasureReport.reporter.identifier.value)
               3. The period or period-start and period-end for the reporting period (MeasureReport.period.start and MeasureReport.period.end)
               4. A code identifying the type of stratum (e.g., gender) (stratifier.code.coding[0].code)
               5. A code identifying the category of the stratum (e.g., male) (stratum.code.coding[0].code)
               6. The count of the number in the stratum for each population (stratum.population.code.coding[0].code)
               7. The measure score for the stratum for each population (stratum.measureScore)

#### Conversion from CSV format to MeasureReport
The process described below can be used to convert from the canonical CSV Format to a MeasureReport.  If the canonical format is sufficient for conversion operations
then only this process need be followed.  However, the CSV report may need to be modified prior to conversion to remap and/or reorder column values using the
map argument in operations supporting CSV conversion.  See the section on [Remapping](#remapping) below for details on this step.

Given a Measure, a CSV file, and a value set of codes used for conversion:

    1. Extract the column heads from the CSV file.
    2. For each group of rows with the same period-start, period-end, subject and reporter values:

       1. Produce a MeasureReport resource for the group.
       2. Set MeasureReport.measure to the canonical URL of the Measure being reported on.
       3. Set MeasureReport.date to the current dateTime value.
       4. Set MeasureReport.status to complete
       5. Set MeasureReport.type to summary
       6. Set MeasureReport.subject.identifier to the value found in the first subject column in the group of rows.
       7. Set MeasureReport.reporter.identifier to the value found in the first reporter column in the group of rows.
       8. Set MeasureReport.period from the period-start and period-end columns in the first row of the group.
       9. For each row without a value in the Stratifier column (or if a Stratifier is not present, each row of the group)

          1. For each unused column value in the row

             1. If the column name matches Measure.group.code in the conversion value set for some group, copy the column value to
                the measureValue field for the named group.
             2. Otherwise if the column name matches Measure.group.population.code in the conversion value set for some population, copy the column
                value to the count field for the named population.
          2. For each unmatched group.measureValue or population.count, add a

       10. If the CSV file contains a Stratifier column

           1. If there is more than one row in the group which contains the same pair of values for stratum and stratifier, this is an error.
           2. For the unique row in the group which contains a distinct pair for stratum and stratifier

              1. For each unused column value in the row:

                 1. If the column name matches a Measure.group.stratifier.stratum.code in the conversion value set for some group, copy the column value to
                    the measureValue field for the named group into the identified stratifier and stratum.

                 2. Otherwise if the column name matches Measure.stratifier.stratum.population.coding[0].code in the conversion value set for some population, copy the column
                    value to the count field for the named population into the identified stratifier and stratum.

#### Remapping
The mapping processes described above will produce a canonical mapping from one or more MeasureReports to a CSV file
given a Measure and value set for conversion codes.  Over time, the names of columns may change in a CSV file,
or additional columns may be added, and others might be removed.  For example, the CSV format for the
[CDC COVID-19 Patient Capacity](https://www.cdc.gov/nhsn/pdfs/covid19/import-covid19-data-508.pdf#page=6) module
made many of these changes to expand upon reported data and clarify the content of certain feilds.

To support reporting under these circumstances, the canonical form of the CSV file needs to be remapped to support
reporting of existing data fields using new field names, or to remove fields from the report that do not need to
be reported.  This is a process involving mapping from concepts from one value set to another, and can be supported
by the FHIR [ConceptMap](http://www.hl7.org/fhir/R4/ConceptMap) resource.

However, many systems needing remapping will not generally have FHIR API capabilities, and so an alternate form of expression is
needed that can be used in API calls.

This IG defines a representation using the map parameter in queries and operations.  This is a composite parameter representing
a code in the conversion value set, and a string in thee output CSV. Each value given for the map parameter represents one
of the mappings from the Measure value set, to the CSV column headings. These mappings are reversible.  Use of this parameter
to perform remapping is shown below.

    map=fromSystem1|fromCode1$toColumnName1,fromSystem2|fromCode2$toColumnName2,...,fromSystemN|fromCodeN$toColumnNameN

When the code systems used for a Measure can be inferred from the code value, the following representation is also valid:

    map=fromCode1$toColumnName1,fromCode2$toColumnName2,...,fromCodeN$toColumnNameN

When a map is given to a conversion operation, an entry must be provided for every column that **should** appear in the CSV file (either input or output) that
is being mapped to a MeasureReport.  If no mapping is provided for a given column, then that column is not used during the conversion (i.e., it is not output on
conversion to CSV, nor is it read on conversion from CSV format).

When the code and column name are the same, the column name part of the composite
may be omitted. This allows for:

    map=code1,code2,...,codeN

This would specify that column heads be named code1 code2 ... codeN in the CSV file used during conversion.

Although FHIR does not generally specify the importance of ordering in multi-valued parameters, implementations **should** use the order
to manage the order of the columns in the CSV output.  Thus:

    map=code2,code1,...,codeN

This specify that column heads be output in the order code2 code1 ... codeN in the CSV file (reversing the order of code1 and code2).


