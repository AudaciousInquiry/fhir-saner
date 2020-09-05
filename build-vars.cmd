REM Ensure use of UTF-8 for files.
SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
REM Configure JAVA from JAVA_HOME folder
SET JAVAEXE="%JAVA_HOME%\bin\java.exe" %JAVA_TOOL_OPTIONS% %JVM_OPTIONS%
REM Set location of Fish tank infput folder, this is where XSLT runs from
SET LOC=fsh\ig-data\input
REM SET TX=-tx n/a
REM Modify these values to match locations in your installation
SET PLANTUMLCP=C:\plantuml\plantuml.jar
SET SAXONCP=C:\saxon9he\saxon9he.jar
SET GRAPHVIZ_DOT=c:\bin\dot.exe
