namespace SampleSanerData
{
    internal static class Constants
    {
        /* Totals for the US
            hospitals:      6,146 [1]
            staffed beds: 924,107 [1]
            beds/hospital:   ~150
            largest:        2,259 [2]
            smallest:          19 [3] */
        public const int HospitalBedsMax = 2259;
        public const int HospitalBedsMin = 19;
        public const int HospitalBedsAverage = 150;
        public const double HospitalBedsStdDev = 100;

        /* "We do know that most systems/countries operate on a relatively fixed ratio of ICU beds to hospital beds of
            approximately 2 to 5 ICU beds for every 100 hospital beds in total, while the United States operates with
            a very different ratio of 9 to 10 ICU beds per 100 hospital beds in total." [4] */
        public const int IcuBedPercentHigh = 10;
        public const int IcuBedPercentLow = 9;

        /* Totals for the US
             Ventilators: 62,188 [5]
             Beds:       924,107 [1]
             ICU Bed %:     9-10% [4]
             ICU Beds:   ~87,790
             Vents / ICU Bed: 71% */
        public const int VentPercentOfIcuHigh = 80;
        public const int VentPercentOfIcuLow = 60;

        // Initialization values 
        public const int InUseBedsPercentHigh = 77;     // [6]
        public const int InUseBedsPercentLow = 64;      // [6]
        public const int InUseIcuBedsPercentHigh = 68;  // [7]
        public const int InUseIcuBedsPercentLow = 65;   // [7]
        public const int InUseVentsPercentHigh = 70;
        public const int InUseVentsPercentLow = 20;

        /* References
         * 1. https://www.aha.org/statistics/fast-facts-us-hospitals
         * 2. https://www.beckershospitalreview.com/lists/8-7-14-100-largest-hospitals-in-america.html
         * 3. anecdotal
         * 4. https://accessmedicine.mhmedical.com/content.aspx?bookid=1944&sectionid=143521546
         * 5. https://www.sccm.org/getattachment/Blog/March-2020/United-States-Resource-Availability-for-COVID-19/United-States-Resource-Availability-for-COVID-19.pdf?lang=en-US
         * 6. https://www.statista.com/statistics/185904/hospital-occupancy-rate-in-the-us-since-2001/
         * 7. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5520980/
         */
    }
}
