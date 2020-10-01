package com.ainq.fhir.saner.tools.testcase.parser;

import java.util.ArrayList;
import java.util.List;

import com.ainq.fhir.saner.tools.testcase.parser.Constraint.Context;

/**
 *  Pojo for TestCase
 *  TestCases ::= identifier{TestCase} ':' DataSet
 *              | TestCases identifier{TestCase} ':' DataSet
 */
public class TestCase extends Declaration {
    private Context context = null;
    private List<Datum> dataset = new ArrayList<>();

    public TestCase(String name) {
        super(name);
    }

    /**
     * @return the dataset
     */
    public List<Datum> getDataset() {
        return dataset;
    }

    public Datum getDatumByName(String name) {
        for (Datum d: dataset) {
            if (name.equals(d.getName())) {
                return d;
            }
        }
        return null;
    }

    public Context getContext() {
        if (context == null) {
            context = new Context();
        }
        return context;
    }
}