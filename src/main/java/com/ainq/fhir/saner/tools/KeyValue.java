package com.ainq.fhir.saner.tools;

public class KeyValue<S, T> {
    S key;
    T value;
    public KeyValue(S s, T t) {
        key = s;
        value = t;
    }
    /**
     * @return the key
     */
    public S getKey() {
        return key;
    }
    /**
     * @return the value
     */
    public T getValue() {
        return value;
    }
}