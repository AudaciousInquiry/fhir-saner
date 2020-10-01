package com.ainq.fhir.saner.tools.testcase.parser;

public class Named {
    private String name;

    public Named(String name) {
        setName(name);
    }
    public String getName() {
        return name;
    }
    public Named setName(String name) {
        this.name = name;
        return this;
    }
}