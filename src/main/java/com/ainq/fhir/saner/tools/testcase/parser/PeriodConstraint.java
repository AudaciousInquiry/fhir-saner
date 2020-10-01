package com.ainq.fhir.saner.tools.testcase.parser;

import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.DateTimeType;
import org.hl7.fhir.r4.model.Period;
import org.hl7.fhir.r4.model.Quantity;
import ca.uhn.fhir.model.api.TemporalPrecisionEnum;

/** Pojo for
 * PeriodConstraint ::= MissingConstraint
 *         | 'before' (identifier{Period} | PeriodLiteral )
 *         | 'after'  (identifier{Period} | PeriodLiteral )
 *         | 'within' (identifier{Period} | PeriodLiteral )
 *         | 'equals' (identifier{Period} | PeriodLiteral )
 */

class PeriodConstraint extends Constraint {
    private Period period;
    private String comparison;
    private String type;
    private Quantity offset;
    private PeriodConstraint basePeriod;
    int state = 0;
    private static final int MAXSTATES = 7;

    public PeriodConstraint(Cases cases, String fieldName, Base field) {
        super(cases, fieldName, field);
        this.type = field.fhirType();
    }
    /**
     * @return the period
     */
    public Period getPeriod() {
        return period;
    }
    /**
     * @param period the period to set
     */
    public PeriodConstraint setPeriod(Period period) {
        this.period = period;
        return this;
    }

    /**
     * @return the comparison
     */
    public String getComparison() {
        return comparison;
    }

    public PeriodConstraint setComparison(String keyword) {
        comparison = keyword;
        return this;
    }

    @Override
    protected void resetState() {
        state = 0;
    }

    @Override
    public List<Base> getAll(Context context) {
        List<Base> b = context.getItemAsList(getName());
        if (b != null) {
            return b;
        }

        if (getDatum() != null) {
            return getDatum().getAllValues(context);
        } else if (offset != null && period == null) {
            // If this was a set of offsets from a
            // base period, compute them.
            List<Base> values = basePeriod.getAll(context);
            for (int i = 0; i < values.size(); i++) {
                Period p = makePeriod(values.get(i));
                p = offsetPeriod(p, offset, "before".equals(basePeriod.comparison));
                values.set(i, typed(p, type));
            }
            return values;
        }
        Base next = getNextValue();
        return Collections.singletonList(next);
    }

    private Period makePeriod(Base base) {
        if (base == null) {
            return null;
        } else if (base.isEmpty()) {
            return null;
        }
        Period p = new Period();
        DateTimeType dt = null;
        switch (base.fhirType()) {
        case "datetime":
            p.setStartElement(dt = (DateTimeType) base);
            break;
        case "string":
        case "date":
        case "instant":
            p.setStartElement(dt = new DateTimeType(base.primitiveValue()));
            break;

        case "Period":
            return (Period) base;
        }
        DateTimeType end = dt.copy();
        end.add(end.getPrecision().getCalendarConstant(), 1);
        p.setEndElement(end);
        return p;
    }

    @Override
    protected Base getNextValue() {
        if (offset != null && period == null) {
            Base value = basePeriod.getNextValue();
            if (value instanceof Period) {
                return offsetPeriod((Period)value, offset, "before".equals(basePeriod.comparison));
            } else {
                throw new IllegalStateException("basePeriod is wrong type");
            }
        }
        if (period == null) {
            throw new RuntimeException(String.format("No Period set for %s:%s(%d)",
                getClass().getSimpleName(), getName(), getLineNo()));
        }
        state %= MAXSTATES;
        state++;
        Period newPeriod = new Period();;
        long difference = period.getEnd().getTime() - period.getStart().getTime();
        TemporalPrecisionEnum prec = null;
        DateTimeType start = null, end = null;

        switch (comparison) {
        case "before":
            if (period.getStart() == null) {
                return null;
            }
            end = period.getStartElement().copy();
            prec = end.getPrecision();
            end.add(prec.getCalendarConstant(), -state);
            newPeriod.setEndElement(end);
            start = end.copy();
            start.add(TemporalPrecisionEnum.MILLI.getCalendarConstant(), (int) -difference);
            newPeriod.setStart(start.getValue(), prec);
            return typed(newPeriod);

        case "after":
            if (period.getEnd() == null) {
                return null;
            }
            start = period.getEndElement().copy();
            prec = start.getPrecision();
            start.add(prec.getCalendarConstant(), state);
            newPeriod.setStartElement(start);
            end = start.copy();
            end.add(TemporalPrecisionEnum.MILLI.getCalendarConstant(), (int) difference);
            newPeriod.setEnd(end.getValue(), prec);
            return typed(newPeriod);

        case "within":
            start = timeBetween(period.getStartElement(), period.getEndElement(), true);
            end = timeBetween(start, period.getEndElement(), false);
            return typed(new Period().setStartElement(start).setEndElement(end));

        case "equals":
            return typed(period);  // Make a copy just in case

        default:
            throw new RuntimeException("Should not get here");
        }
    }

    private Base typed(Period period) {
        return typed(period, type);
    }

    private static Period offsetPeriod(Period value, Quantity offset, boolean negate) {
        Period p = value.copy();
        if (p.hasStart()) {
            p.getStartElement().add(
                getDateField(offset),
                getOffsetValue(offset, negate));
            p.setStart(p.getStart(), value.getStartElement().getPrecision());
        }
        if (p.hasEnd()) {
            p.getEndElement().add(
                getDateField(offset),
                getOffsetValue(offset, negate));
            p.setEnd(p.getEnd(), value.getEndElement().getPrecision());
        }
        return p;
    }
    private static int getOffsetValue(Quantity offset, boolean negate) {
        int value = offset.getValue().intValue();
        if (negate) {
            value = -value;
        }
        return "wk".equals(offset.getCode()) ? 7 * value : value;
    }
    private static int getDateField(Quantity offset) {
        switch (offset.getCode()) {
        case "a":   return Calendar.YEAR;
        case "mo":  return Calendar.MONTH;
        case "wk":  return Calendar.DATE;
        case "d":   return Calendar.DATE;
        case "h":   return Calendar.HOUR;
        case "m":   return Calendar.MINUTE;
        case "s":   return Calendar.SECOND;
        case "ms":  return Calendar.MILLISECOND;
        }
        return Calendar.ALL_STYLES;
    }
    /**
     * Compute a time between two times.
     * @param startElement The starting time.
     * @param endElement The ending time.
     * @param isStart If isStart is true, return a value in the starting half of the
     * period defined by the two, otherwise, the ending half.
     * @return
     */
    private DateTimeType timeBetween(DateTimeType startElement, DateTimeType endElement, boolean isStart) {
        Date startDate = startElement.getValue(),
             endDate = endElement.getValue();

        // Adjust for infinite start/end dates
        if (startDate == null) {
            startDate = new Date();
            startElement = new DateTimeType(startDate);
            startElement.add(TemporalPrecisionEnum.YEAR.getCalendarConstant(), -10);
            startDate = startElement.getValue();
        }

        if (endDate == null) {
            endDate = new Date();
            endElement = new DateTimeType(endDate);
            endElement.add(TemporalPrecisionEnum.YEAR.getCalendarConstant(), 10);
            endDate = endElement.getValue();
        }

        long difference = endDate.getTime() - startDate.getTime();
        // difference now has the number of milliseconds between the two.
        TemporalPrecisionEnum prec = TemporalPrecisionEnum.MILLI;
        int mult = "Period".equals(type) ? MAXSTATES * 2 + 1 : MAXSTATES + 1;
        if (difference > mult * 1000) {
            difference /= 1000;
            prec = TemporalPrecisionEnum.SECOND;
            if (difference > mult * 60) {
                difference /= 60;
                prec = TemporalPrecisionEnum.MINUTE;
                if (difference > mult * 60 * 24) {
                    difference /= 60 * 24;
                    prec = TemporalPrecisionEnum.DAY;
                }
            }
        }
        difference /= mult;
        if (isStart) {
            DateTimeType start = startElement.copy();
            start.add(prec.getCalendarConstant(), state * (int) difference);
            return start;
        } else {
            DateTimeType end = endElement.copy();
            end.add(prec.getCalendarConstant(), -state * (int) difference);
            return end;
        }
    }
    /**
     * @return the offset
     */
    public Quantity getOffset() {
        return offset;
    }
    /**
     * @param offset the offset to set
     */
    public PeriodConstraint setOffset(Quantity offset) {
        this.offset = offset;
        return this;
    }
    /**
     * @return the basePeriod
     */
    public PeriodConstraint getBasePeriod() {
        return basePeriod;
    }
    /**
     * @param basePeriod the basePeriod to set
     */
    public PeriodConstraint setBasePeriod(PeriodConstraint basePeriod) {
        this.basePeriod = basePeriod;
        return this;
    }
    /**
     * @return the type
     */
    public String getType() {
        return type;
    }
}