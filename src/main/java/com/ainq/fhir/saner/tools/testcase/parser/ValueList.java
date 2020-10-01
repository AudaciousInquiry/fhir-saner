package com.ainq.fhir.saner.tools.testcase.parser;

import java.util.ArrayList;
import java.util.List;

public class ValueList extends Declaration {
    private List<String> values = new ArrayList<>();
    private List<Integer> freqs = new ArrayList<>();
    private List<Integer> workingFreqs = null;
    private int numRemaining = 0;

    private String system = null;
    int maxStates = 0;
    int state = 0;

    public ValueList(String name) {
        super(name);
    }

    /**
     * @return the values
     */
    public String getValue(int n) {
        return values.get(n);
    }

    public ValueList addValue(String value, int frequency) {
        values.add(value);
        freqs.add(frequency);
        maxStates += frequency;
        return this;
    }

    public ValueList addValue(String value) {
        values.add(value);
        freqs.add(1);
        maxStates++;
        return this;
    }

    public void setFrequency(int nval) {
        Integer old = freqs.set(freqs.size() - 1, nval);
        if (old != null) {
            maxStates -= old;
        }
        maxStates += nval;
    }

    /**
     * @return the system
     */
    public String getSystem() {
        return system;
    }

    /**
     * @param system the system to set
     */
    public void setSystem(String system) {
        this.system = system;
    }

    public List<String> allValues() {
        return values;
    }

    /**
     * Iterate through the list, extracting those
     * values from the list with appropriate frequencies
     * but ensuring values are selected across all possible
     * values before repeating.
     * @return  The next value.
     */
    public String nextValue() {
        if (numRemaining == 0) {
            workingFreqs = new ArrayList<>(freqs);
            numRemaining = maxStates;
            state = 0;
        }
        String next = values.get(state);
        int freq = workingFreqs.get(state);
        workingFreqs.set(state, freq - 1);
        --numRemaining;
        if (numRemaining != 0) {
            do {
                if (++state >= values.size()) {
                    state = 0;
                }
            } while (workingFreqs.get(state) == 0);
        }
        return next;
    }

    public void resetState() {
        state = 0;
        numRemaining = 0;
    }
}
