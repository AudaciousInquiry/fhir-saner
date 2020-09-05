<?xml version="1.0" encoding="UTF-8"?>

<!--
    This XSLT will consume a CSV input file and convert it to a MeasureReport
    against the selected Measure.
    -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs f s uuid"
    xmlns:uuid="http://www.uuid.org"
    xmlns:s="https://github.com/FHIR/sushi" xmlns="http://hl7.org/fhir"
    xmlns:f="http://hl7.org/fhir" version="2.0">
    <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- Limit the number of rows to convert, set to 0 to convert everything -->
    <xsl:param name='count' select='2000'/>
    <!-- set to the name of the mapping file

        The mapping file should have the names of the CSV file columns in the first column
        and the codes that they map to in the column row.  Headers should for the first
        row should be column,item  e.g.:

        column,item
        deathIncrease,numC19died
        hospitalizedCurrently,numC19HospPats
        hospitalizedIncrease,numC19Pats
        inIcuCurrently,numC19VentPats
        numAcuteBeds,numBeds
        numICUBeds,numICUBeds
        numTotBeds,numTotBeds
        numVent,numVent
        numVentUse,numVentUse
        -->
    <xsl:param name="mapping" select="'Mapping.csv'"/>

    <!-- Specifies the source of the input data.  The first row
        must be column names for the data.  The second and subsequent
        rows should be the data to convert to measurements -->
    <xsl:param name="csvInputData" select="'njSampleData.csv'"/>

    <!-- Set to the output format:
        fsh  To generate sushi output
        xml  To generate xml output
        json Will also generate XML output, sorry, we aren't there yet.
    -->
    <xsl:param name="format" select="'xml'"/>

    <!-- Set to the name of the measure to generate from the CSV input data file
        This must be the name of a file from which the Measure resource can be
        read so relevant material can be copied from it.
    -->
    <!--xsl:param name='measureResource' select='"Measure-CDCPatientImpactAndHospitalCapacity.xml"' /-->
    <xsl:param name='measureResource' select='"Measure-FEMADailyHospitalCOVID19Reporting.xml"'/>

    <!-- Load up some geodata for states (for generating example output) -->
    <xsl:variable name="geo" select="document('US-States-Geocenters.xml')"/>

    <!-- Set the BASE URL for saner IG artifacts (we changed it once) -->
    <xsl:variable name="base" select="'http://hl7.org/fhir/us/saner/'"/>

    <!-- Load up the mapping file and convert to XML for XSLT processing -->
    <xsl:variable name="map">
        <xsl:call-template name="getSheetAsXML">
            <xsl:with-param name="names" select="('maps', 'map')"/>
            <xsl:with-param name="attribute">value</xsl:with-param>
            <xsl:with-param name="useFieldNames" select="true()"/>
            <xsl:with-param name="pathToCSV" select="$mapping"/>
        </xsl:call-template>
    </xsl:variable>


    <!-- Load up the Measure definition resource -->
    <xsl:variable name="def" select='document($measureResource)'/>

    <!-- Import CSV to XML utilities -->
    <xsl:import href="CSVtoXML.xslt"/>

    <!-- Import UUID Generation utilities -->
    <xsl:import href="uuid.xslt"/>

    <!-- Import FSH Support Functions -->
    <xsl:import href="fsh.xslt"/>

    <!-- Process the input -->
    <xsl:template match="/">
        <!-- Load the CSV file to process -->
        <xsl:variable name="res">
            <xsl:call-template name="getSheetAsXML">
                <xsl:with-param name="names" select="('results', 'result')"/>
                <xsl:with-param name="attribute">value</xsl:with-param>
                <xsl:with-param name="useFieldNames" select="true()"/>
                <xsl:with-param name="pathToCSV" select='$csvInputData'/>
            </xsl:call-template>
        </xsl:variable>
        <!-- One could also load data from an XML file in a regular format -->
        <!-- xsl:variable name="res" select="document('stateLabReportingData.xml')" /-->

        <!-- iterator over rows -->
        <xsl:for-each select="distinct-values($res/results/result[$count = 0 or position() &lt; $count]/state/@value)">
            <xsl:variable name="state" select="."/>
            <!-- Load the geographic data for the state -->
            <xsl:variable name="geoData" select="$geo/states/state[@PostalCode = $state]"/>

            <!-- NOTE: For conversion, these should come from
                existing Location and Organization records
            -->
            <!-- Generate State Record body -->
            <xsl:variable name="stateBody">
                <xsl:copy-of select="s:string(('id'), ('states-',$state))"/>
                <xsl:copy-of select="s:wrap('identifier',(
                    s:string(('identifier.system'), 'https://www.census.gov/geographies'),
                    s:string(('identifier.value'), $res/results/result[state/@value=$state][fips][1]/fips/@value))
                    )"/>
                <xsl:if test='$geoData/@Lat and $geoData/@Long'>
                    <xsl:copy-of select="s:wrap('position',
                        (s:name(('position.latitude'), ($geoData/@Lat)),
                         s:name(('position.longitude'), ($geoData/@Long))
                        )
                    )"/>
                </xsl:if>
            </xsl:variable>
            <!-- Generate the record -->
            <xsl:if test='$format = "fsh"'>
                <xsl:copy-of
                    select="s:instance(concat('states-', $state), 'Location', concat('Example Location for the State of ', $geoData/@Name),
                     (s:string(('id'), ('states-',$state)),
                      s:wrap('identifier',(
                         s:string(('identifier.system'), 'https://www.census.gov/geographies'),
                         s:string(('identifier.value'), $res/results/result[state/@value=$state][fips][1]/fips/@value))),
                      s:wrap('position',
                         (s:name(('position.latitude'), ($geoData/@Lat)),
                          s:name(('position.longitude'), ($geoData/@Long))
                         )
                      )
                     ), 'Location'
                    )"/>

                <xsl:copy-of
                    select="s:instance(concat($state, '-DPH'), 'Organization', concat('Example Organization for the ', $geoData/@Name, ' Department of Public Health'),
                    (s:string(('id'), ($state,'-DPH')), s:string(('name'), ($geoData/@Name, ' Department of Public Health'))), 'Organization'
                    )"/>
            </xsl:if>
        </xsl:for-each>
        <xsl:apply-templates select="$res/results/result[position() &lt; $count]"/>
    </xsl:template>

    <xsl:template match="result">
        <xsl:call-template name="result"/>
    </xsl:template>

    <xsl:function name="s:name">
        <xsl:param name="f"/>
        <xsl:param name="v"/>
        <xsl:variable name="lastPart" select="translate(tokenize(string-join($f),'\.')[last()],'[]0123456789','')"/>
        <xsl:choose>
            <xsl:when test="$format = 'fsh'">
                <xsl:text>* </xsl:text>
                <xsl:value-of select="string-join($f, '')"/>
                <xsl:text> = </xsl:text>
                <xsl:value-of select="string-join($v, '')"/>
                <xsl:text>&#xA;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$lastPart}">
                    <xsl:attribute name="value" select="string-join($v)"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="s:string">
        <xsl:param name="f"/>
        <xsl:param name="v"/>
        <xsl:variable name="lastPart" select="translate(tokenize(string-join($f),'\.')[last()],'[]0123456789','')"/>
        <xsl:choose>
            <xsl:when test="$format = 'fsh'">
                <xsl:text>* </xsl:text>
                <xsl:value-of select="string-join($f, '')"/>
                <xsl:text> = "</xsl:text>
                <xsl:if test="contains(string-join($v, ''),'&#xA;')">""</xsl:if>
                <xsl:value-of select="string-join($v, '')"/>
                <xsl:if test="contains(string-join($v, ''),'&#xA;')">""</xsl:if>
                <xsl:text>"&#xA;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$lastPart}">
                    <xsl:attribute name="value" select="string-join($v)"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="s:code">
        <xsl:param name="f"/>
        <xsl:param name="c"/>
        <xsl:param name="s"/>
        <xsl:variable name="lastPart" select="translate(tokenize(string-join($f),'\.')[last()],'[]0123456789','')"/>
        <xsl:choose>
            <xsl:when test="$format = 'fsh'">
                <xsl:text>* </xsl:text><xsl:value-of select="string-join($f, '')"/><xsl:text> = </xsl:text>
                <xsl:value-of select="$s"/>#<xsl:value-of select="string-join($c, '')"/>
                <xsl:text>&#xA;</xsl:text>
            </xsl:when>
            <xsl:when test="not($s)">
                <xsl:element name="{$lastPart}">
                    <xsl:attribute name="value" select="$c"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$lastPart}">
                    <xsl:attribute name="code" select="$c"/>
                    <xsl:attribute name="system" select="$s"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="s:def">
        <xsl:param name="n"/>
        <xsl:param name="v"/>
        <xsl:variable name="lastPart" select="translate(tokenize(string-join($n),'\.')[last()],'[]0123456789','')"/>
        <xsl:choose>
            <xsl:when test="$format = 'fsh'">
                <xsl:value-of select="concat($n, ': ',string-join($v, ''),'&#xA;')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="def-{$lastPart}">
                    <xsl:attribute name="value" select="string-join($v, '')"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="s:instance">
        <xsl:param name="n"/>
        <xsl:param name="t"/>
        <xsl:param name="d"/>
        <xsl:param name="body"/>
        <xsl:param name="res"/>
        <xsl:choose>
            <xsl:when test="$format = 'fsh'">
                <xsl:text>&#xA;</xsl:text>
                <xsl:value-of select="s:def('Instance', $n)"/>
                <xsl:value-of select="s:def('InstanceOf', $t)"/>
                <xsl:value-of select="concat('Description : &quot;',string-join($d, ''),'&quot;&#xA;')"/>
                <xsl:copy-of select="$body"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name='{$res}'>
                    <xsl:copy-of select="$body"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:template name="result">

        <!-- Take the data row, and compute some values into it -->
        <!-- NOTE: We should be able to automate for
            (numerator - sum(numerator-exclusion))/(denominator - sum(denominator-exclusion))
            -->
        <xsl:variable name="data">
            <result xmlns="">
                <xsl:copy-of select="*"/>
                <xsl:variable name='num1' select='positive/@value'/>
                <xsl:variable name='denom1' select='totalTestResults/@value'/>
                <xsl:if test="$num1 and $denom1 &gt; 0">
                    <positivePercent xmlns="" value='{round( 10000 * $num1 div $denom1) div 100}' unit='%'/>
                </xsl:if>
                <xsl:variable name='num2' select='positiveIncrease/@value'/>
                <xsl:variable name='denom2' select='totalTestResultsIncrease/@value'/>
                <xsl:if test="$num2 and $denom2 &gt; 0">
                    <positiveIncreasePercent xmlns="" value='{round( 10000 * $num2 div $denom2) div 100}' unit='%'/>
                </xsl:if>
            </result>
        </xsl:variable>


        <!-- Generate Instance -->
        <xsl:call-template name="createMeasureReportHeader">
            <xsl:with-param name="state" select="state/@value"/>
            <xsl:with-param name="date" select="date/@value"/>
            <xsl:with-param name="def" select="$def"/>
            <xsl:with-param name="fips" select="fips/@value"/>
            <xsl:with-param name="body">
                <xsl:apply-templates select="$def/f:Measure/f:group" mode="copyMeasureToReport">
                    <xsl:with-param name="values" select="$data"/>
                </xsl:apply-templates>
            </xsl:with-param>
        </xsl:call-template>

    </xsl:template>

    <xsl:function name="s:wrap">
        <xsl:param name="elemName"/>
        <xsl:param name="body"/>
        <xsl:choose>
            <xsl:when test="$format='fsh'">
                <xsl:copy-of select="$body"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$elemName}">
                    <xsl:copy-of select="$body"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:template name="createMeasureReportHeader">
        <xsl:param name="state"/>
        <xsl:param name="date"/>
        <xsl:param name="def"/>
        <xsl:param name="fips"/>
        <xsl:param name="body"/>

        <xsl:variable name="measure" select="$def/f:Measure/f:id/@value"/>
        <xsl:variable name="geoData" select="$geo/states/state[@PostalCode = $state]"/>
        <xsl:variable name="exampleName" select="concat('Example', $state, '-', $date, '-', $measure)"/>

        <xsl:variable name='measureBody'>
            <xsl:if test='$format="fsh"'>
                <xsl:text>* insert NJExamplesFEMA&#xA;</xsl:text>
            </xsl:if>
            <!--xsl:value-of select="s:def('Usage', '#inline')"/-->
            <xsl:copy-of select="s:string(('id'), ($exampleName))"/>
            <xsl:copy-of select="
                s:wrap('identifier',
                (s:string(('identifier.system'), 'urn:ietf:rfc:3986'),
                     s:string(('identifier.value'), concat('urn:uuid:', lower-case(uuid:get-uuid($body))))
                    ))"/>

            <xsl:copy-of
                select="s:string(('date'), (substring($date, 1, 4), '-', substring($date, 5, 2), '-', substring($date, 7, 2)))"/>
            <xsl:copy-of select="s:wrap('period',
                (s:string(('period.start'), (substring($date, 1, 4), '-', substring($date, 5, 2), '-', substring($date, 7, 2))),
                 s:string(('period.end'), (substring($date, 1, 4), '-', substring($date, 5, 2), '-', substring($date, 7, 2)))
                ))"/>
            <xsl:copy-of select="$body"/>
        </xsl:variable>
        <xsl:copy-of
            select="s:instance(
                ($exampleName),
                'PublicHealthMeasureReport',
                ('Example MeasureReport of ', $measure, ' for ', $state, ' on ', (substring($date, 5, 2), '/', substring($date, 7, 2), '/', substring($date, 1, 4))),
                $measureBody, 'MeasureReport')"/>


        <!--xsl:choose>
            <xsl:when test="$format='fsh'">
                <xsl:copy-of select="$header"/>
                <xsl:copy-of select="$body"/>
            </xsl:when>
            <xsl:otherwise>
                <MeasureReport>
                    <xsl:copy-of select="$header"/>
                    <xsl:copy-of select="$body"/>
                </MeasureReport>
            </xsl:otherwise>
        </xsl:choose-->
    </xsl:template>

    <xsl:function name="s:getName">
        <xsl:param name="s"/>
        <xsl:if test="lower-case(substring(local-name($s),1,1)) = substring(local-name($s),1,1)">
            <xsl:variable name="p"><xsl:value-of select="s:getName($s/..)"/></xsl:variable>
            <xsl:if test="string-length($p) != 0">
                <xsl:value-of select="$p"/>
                <xsl:text>.</xsl:text>
            </xsl:if>
            <xsl:value-of select="local-name($s)"/>
            <xsl:if test="count($s/preceding-sibling::f:*[local-name() = local-name($s)]) != 0">
                <xsl:text>[</xsl:text>
                <xsl:value-of select="count($s/preceding-sibling::f:*[local-name() = local-name($s)])"/>
                <xsl:text>]</xsl:text>
            </xsl:if>
        </xsl:if>
    </xsl:function>

    <xsl:template match="@value" mode="copyMeasureToReport">
        <xsl:variable name="name" select="s:getName(..)"/>
        <xsl:choose>
            <xsl:when test="$format != 'fsh' and contains(local-name(../..), 'coding')">
                <xsl:copy-of select="../.."/>
            </xsl:when>
            <xsl:when test="$format != 'fsh'">
                <xsl:copy-of select=".."/>
            </xsl:when>
            <xsl:when test="contains(local-name(../..), 'coding')">
                <xsl:value-of select="s:code(s:getName(../..), ., ../../f:system/@value)"/>
            </xsl:when>
            <xsl:when test="contains(lower-case(local-name(..)), 'code')">
                <xsl:value-of select="s:code($name, ., null)"/>
            </xsl:when>
            <xsl:when test="contains(local-name(..), 'name') or contains(local-name(..), 'text') or contains(lower-case(local-name(..)), 'string')">
                <xsl:value-of select="s:string($name, (.))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="s:name($name, .)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="@url" mode="copyMeasureToReport">
        <xsl:choose>
            <xsl:when test="$format='fsh'">
                <xsl:value-of select="s:string((s:getName(..),'.url'), .)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match='f:extension[@url="http://hl7.org/fhir/us/saner/StructureDefinition/MeasureGroupAttributes"]' mode="copyMeasureToReport">
        <!-- Skip this extension, it's not needed in the report, just the measure -->
    </xsl:template>

    <!-- f:code[not(../f:coding)] | f:coding  | f:text | -->
    <xsl:template
        match="f:group | f:population | (f:group|f:population)/f:code | f:stratifier | f:value | f:extension | f:valueCodeableConcept | f:valueString"
        mode="copyMeasureToReport">
        <xsl:param name="values"/>
        <xsl:variable name="content">
            <content>
                <xsl:apply-templates select="@*" mode="copyMeasureToReport"/>
                <xsl:choose>
                    <xsl:when test='self::f:code'>
                        <xsl:apply-templates select="f:coding/f:code/@value" mode="copyMeasureToReport"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="*" mode="copyMeasureToReport">
                            <xsl:with-param name="values" select="$values"/>
                        </xsl:apply-templates>
                    </xsl:otherwise>
                </xsl:choose>

                <!-- If this is a group|population, we may need to output a measure score|count -->
                <xsl:if test="self::f:group | self::f:population">
                    <xsl:variable name="score" select="f:code/f:coding[starts-with(f:system/@value, 'http://hl7.org/fhir/us/saner/CodeSystem')]/f:code/@value"/>
                    <xsl:variable name="mappedScore" select="$map/maps/map[item/@value=$score]/column/@value"/>

                    <xsl:variable name="v" select="$values/result/*[local-name()=string($mappedScore)]"/>
                    <!-- If this is a group, and the group reports a score and the score has a value -->
                    <xsl:variable name="n" select="s:getName(.)"/>
                    <xsl:choose>
                        <xsl:when test="self::f:group">
                            <xsl:choose>
                                <xsl:when test="not($v) and not(f:population/f:code/f:coding/f:code/@value='denominator')">
                                    <!-- don't output a value when there isn't one -->
                                </xsl:when>
                                <xsl:when test="$v">
                                    <xsl:variable name='score'>
                                        <xsl:copy-of select="s:name(($n, '.measureScore.value'), $v/@value)"/>
                                        <xsl:if test='$v/@unit'>
                                            <xsl:copy-of select="s:string(($n, '.measureScore.unit'), ($v/@unit))"/>
                                            <xsl:copy-of
                                                select="s:code(($n, '.measureScore.code'), $v/@unit, '')"/>
                                            <xsl:copy-of
                                                select="s:string(($n, '.measureScore.system'), 'http://unitsofmeasure.org')"/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test='$format="xml"'>
                                            <measureScore>
                                                <xsl:copy-of select="$score"/>
                                            </measureScore>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$score"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="$format='fsh'">
                                    <xsl:copy-of
                                        select="s:string(($n, '.measureScore.value.extension.url'), 'http://hl7.org/fhir/StructureDefinition/data-absent-reason')"/>
                                    <xsl:copy-of select="s:name(($n, '.measureScore.value.extension.valueCode'),
                                        concat('http://terminology.hl7.org/CodeSystem/data-absent-reason#',if (not($mappedScore)) then 'unsupported' else 'unknown'))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <measureScore>
                                        <value>
                                            <extension url='http://hl7.org/fhir/StructureDefinition/data-absent-reason'>
                                                <valueCode value="{if (not($mappedScore)) then 'unsupported' else 'unknown'}"/>
                                            </extension>
                                        </value>
                                    </measureScore>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="self::f:population">
                            <xsl:choose>
                                <xsl:when test="$v">
                                    <xsl:copy-of select="s:name(($n,'.count'), $v/@value)"/>
                                </xsl:when>
                                <xsl:when test="$format = 'fsh'">
                                    <xsl:copy-of select="s:string(($n, '.count.extension.url'), 'http://hl7.org/fhir/StructureDefinition/data-absent-reason')"/>
                                    <xsl:copy-of select="s:name(($n, '.count.extension.valueCode'), 'http://terminology.hl7.org/CodeSystem/data-absent-reason#unsupported')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <count>
                                        <extension url='http://hl7.org/fhir/StructureDefinition/data-absent-reason'>
                                            <valueCode value="{if (not($mappedScore)) then 'unsupported' else 'unknown'}"/>
                                        </extension>
                                    </count>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
            </content>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$format='fsh'">
                <xsl:value-of select="$content/f:content"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:copy-of select="$content/f:content/@*"/>
                    <xsl:copy-of select="$content/f:content/*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
