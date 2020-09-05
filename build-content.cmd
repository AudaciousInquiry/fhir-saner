pushd %LOC%
del ..\..\CapabilityStatement-*.fsh
del ..\..\OperationDefinition-*.fsh
REM %JAVAEXE% -classpath %SAXONCP% net.sf.saxon.Transform -s:SANER.xml -xsl:index.xslt
%JAVAEXE% -classpath %SAXONCP% net.sf.saxon.Transform -s:SANER.xml -xsl:overview.xslt
%JAVAEXE% -classpath %SAXONCP% net.sf.saxon.Transform -s:SANER.xml -xsl:actorsandtransactions.xslt
popd