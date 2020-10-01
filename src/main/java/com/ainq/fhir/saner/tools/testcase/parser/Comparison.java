package com.ainq.fhir.saner.tools.testcase.parser;

/** Pojo for
 * Comparison  ::= '<'|'<='|'>'|'>='|'='|'!='
 */
public enum Comparison {
    LessThan, LessThanEquals, GreaterThan, GreaterThanEquals, Equals, NotEquals, Approximates
}