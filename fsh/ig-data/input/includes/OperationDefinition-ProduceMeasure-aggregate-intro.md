This operation enables multiple reports to be aggregated:
* From multiple systems reporting partial results within a facility into a singular consolidated report which can be reported to local, regional and national agencies.
* From multiple reports over a period of time from a given location, e.g., to aggregate daily measure reports into a weekly report.
* From multiple subjects within a geographic region into a MeasureReport describing that region.


### Aggregating MeasureReport Resources
The process for aggregating MeasureReport resources up to a geographic region or time period
follows the steps below:

1. Collect all MeasureReport resources to be aggregated.
   Note: All MeasureReport resources being aggregated must refererence a common Measure in MeasureReport.measure.
2. Determine the subject of the report (the larger location)
3. Compute the start of the time period for the aggregate as the minimum of MeasureReport.period.start for all MeasureReport resources being aggregated.
4. Compute the end of the time period for the aggregate as the maximum of MeasureReport.period.end for all MeasureReport resources being aggregated.
5. Compute the population.count values found in group.population and group.stratifier.stratum.population from the matching population.count values in
the MeasureReport
6. Compute the group.measureScore and group.stratifier.stratum.measure score for each group and stratum from the computed counts.

#### Aggregation of Population Counts
The computation of population.count in Step 5 in the procedure described above requires further explanation:

For a given facility and time period, a measures can be aggregated in different ways (see the
[Measure Rate Aggregation Values](ValueSet-MeasureRateAggregationValues.html) value set for more details.
Each of these must be considered differently, and are aggregated in different ways for a given subject.
Measures can report:
* A count of events that happened, or of things consumed over that period in time (e.g., admissions, deaths, tests performed).<br/>
  Quantity measurements, e.g., those counting events such as admissions, deaths, or test performed represent a count.  When aggregated for the same facility over
  multiple time periods, the population.count values can be summed to produce a count of events or things in the total time period.
* A count of things at a point in time (e.g., active cases, beds currently occupied, ventilators in use).<br/>
  Point in time measurements (e.g., bed occupancy, ventilators in use) represent a current state. When aggregated for the same facility
  over multiple (continguous) time  periods, the most recent population.count is the "aggregated" value.
* A cumulative quantity (e.g., cumulative total tests performed).<br/>
  Cumulative measures are like point in time measurements (in fact, they are a specialization of point in time measurements).  These represent the total performed
  over "all time" (e.g., cumulative total tests performed).  When these are aggregated over multiple time periods, the aggregate is the most recent population.count value.

Across subjects (locations or facilities), counts are always summed.  This assumes that subjects are non-overlapping (one is not trying to aggregate county data
with the data for an entire state that contains the county).

Each each Measure.group within a Measure that conforms to this IG describes their rateAggregation behavior using the MeasureRateAggregation coding system defined
by this implementation guide.