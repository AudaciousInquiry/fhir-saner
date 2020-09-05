using System;
using MathNet.Numerics.Distributions;

namespace SampleSanerData
{
    public class Hospital
    {
        /// <summary>
        /// The total number of staffed inpatient beds in the hospital
        /// </summary>
        public int Beds { get; set; }

        /// <summary>
        /// The total number of staffed ICU beds in the hospital
        /// </summary>
        public int IcuBeds { get; set; }

        /// <summary>
        /// The total number of functional ventilators in the hospital
        /// </summary>
        public int Vents { get; set; }

        /// <summary>
        /// The number of inpatient beds currently in use by patients
        /// </summary>
        public int BedsInUse { get; set; }

        /// <summary>
        /// The number of ICU beds currently in use by patients
        /// </summary>
        public int IcuBedsInUse { get; set; }

        /// <summary>
        /// The number of ventilators currently in use by patients
        /// </summary>
        public int VentsInUse { get; set; }

        /// <summary>
        /// Each day, the patient population (the value for BedsInUse) changes by a random amount.  
        /// DeltaBedUseMax is the high end of the percent increase.  
        /// </summary>
        /// <example>
        /// If BedsInUse == 50 and DeltaBedUseMax == 20, the largest possible increase would be 10, 
        /// bringing BedsInUse to 60.
        /// </example>
        public int DeltaBedUseMax { get; set; }

        /// <summary>
        /// Each day, the patient population (the value for BedsInUse) changes by a random amount.  
        /// DeltaBedUseMin is the low end of the percent INCREASE.  It's recommended that this be a 
        /// negative value, so it's possible for the patient census to decrease.  
        /// </summary>
        /// <example>
        /// If BedsInUse == 50 and DeltaBedUseMin == -10, the smallest possible increase would be -5 
        /// (a decrease of 5), bringing BedsInUse to 45.
        /// </example>  
        public int DeltaBedUseMin { get; set; }

        /// <summary>
        /// When the patient population (BedsInUse) changes each day, the number of patients in 
        /// ICU Beds (IcuBedsInUse) also changes.  The delta for IcuBedsInUse is a random percentage 
        /// of the delta for BedsInUse; a certain number of the admissions and discharges from ALL
        /// beds are for ICU beds.  DeltaIcuBedMax is the high end of this random percentage.  
        /// </summary>
        public int DeltaIcuBedMax { get; set; }
        /// <summary>
        /// When the patient population (BedsInUse) changes each day, the number of patients in 
        /// ICU Beds (IcuBedsInUse) also changes.  The delta for IcuBedsInUse is a random percentage 
        /// of the delta for BedsInUse; a certain number of the admissions and discharges from ALL
        /// beds are for ICU beds.  DeltaIcuBedMin is the high end of this random percentage.  
        /// DeltaIcuBedMin should be >= 0; IcuBedsInUse will go down if BedsInUse goes down.
        /// </summary>
        public int DeltaIcuBedMin { get; set; }

        /// <summary>
        /// When IcuBedsInUse changes each day, the number of ventilators in use (VentsInUse) changes.  
        /// The delta for VentsInUse is a random percentage of delta for IcuBedsInUse.  DeltaVentMax 
        /// is the high end of this random percentage. 
        /// </summary>
        /// <example>
        /// If IcuBedsInUse decreases from 45 to 40 (a delta of -5) and DeltaVentMax is 80, the most 
        /// VentsInUse will decrease is 4.
        /// </example>
        public int DeltaVentMax { get; set; }

        /// <summary>
        /// When IcuBedsInUse changes each day, the number of ventilators in use (VentsInUse) changes.  
        /// The delta for VentsInUse is a random percentage of delta for IcuBedsInUse.  DeltaVentMin 
        /// is the low end of this random percentage. 
        /// DeltaVentMin should be >= 0; VentsInUse will go down if IcuBedsInUse goes down.
        /// </summary>
        /// <example>
        /// If IcuBedsInUse increases from 32 to 42 (a delta of 10) and DeltaVentMin is 50, the least 
        /// VentsInUse will increase is 5.
        /// </example>
        public int DeltaVentMin { get; set; }

        #region Constructors
        public Hospital(int beds, int icuBeds, int vents)
        {
            Initialize(beds, icuBeds, vents);
        }

        public Hospital(int beds)
        {
            int icuBeds = TotalIcuBeds(beds);
            int vents = TotalVents(icuBeds);
            Initialize(beds, icuBeds, vents);
        }

        public Hospital() 
        {
            int beds = TotalBeds();
            int icuBeds = TotalIcuBeds(beds);
            int vents = TotalVents(icuBeds);
            Initialize(beds, icuBeds, vents);
        }

        private void Initialize(int beds, int icuBeds, int vents)
        {
            Beds = beds;
            IcuBeds = icuBeds;
            Vents = vents;

            // Set default delta ranges; these can be reset manually if desired.
            DeltaBedUseMax = 15;
            DeltaBedUseMin = -15;
            DeltaIcuBedMax = 80;
            DeltaIcuBedMin = 0;
            DeltaVentMax = 100;
            DeltaVentMin = 0;

            DayOneOccupancy();
        }
        #endregion

        #region Initialize the hospital
        /// <returns>A realistic random number of beds in a hospital</returns>
        private int TotalBeds()
        {
            int averageBeds = Constants.HospitalBedsAverage;
            int maxBeds = Constants.HospitalBedsMax;
            int minBeds = Constants.HospitalBedsMin;
            double standardDeviation = Constants.HospitalBedsStdDev;
            return Convert.ToInt32(RandomFromBetaDist(minBeds, maxBeds, averageBeds, standardDeviation));
        }

        /// <param name="totalInpatientBeds">The total number of inpatient beds in the hospital</param>
        /// <returns>A realistic random number of ICU beds based on the total number of beds</returns>
        private int TotalIcuBeds(int totalInpatientBeds)
        {
            return RandomPercentOf(totalInpatientBeds, Constants.IcuBedPercentLow, Constants.IcuBedPercentLow);
        }

        /// <param name="totalIcuBeds">The total number of ICU beds in a hospital</param>
        /// <returns>A realistic random number of ventilators based on the number of ICU beds</returns>
        private int TotalVents(int totalIcuBeds)
        {
            return RandomPercentOf(totalIcuBeds, 60, 80);
        }

        /// <summary>
        /// Set "in use" numbers for the first day of sample data
        /// </summary>
        private void DayOneOccupancy()
        {
            BedsInUse = RandomPercentOf(Beds, Constants.InUseBedsPercentLow, Constants.InUseBedsPercentHigh);        
            IcuBedsInUse = RandomPercentOf(IcuBeds, Constants.InUseIcuBedsPercentLow, Constants.InUseIcuBedsPercentHigh);  
            if (IcuBedsInUse > BedsInUse) { IcuBedsInUse = BedsInUse; }
            VentsInUse = RandomPercentOf(IcuBedsInUse, Constants.InUseVentsPercentLow, Constants.InUseVentsPercentHigh);
        }
        #endregion

        #region Adjust the numbers each day
        /// <summary>
        /// Simulate passage of a day.  
        ///     BedsInUse changes based on DeltaBedUse* and constrained by Beds
        ///     IcuBedsInUse changes based on DeltaIcuBed* and constrained by IcuBeds and BedsInUse
        ///     VentsInUse changes based on DeltaVent* and constrained by Vents.
        /// </summary>
        public void Tomorrow()
        {
            int bedChange = RandomPercentOf(Beds, DeltaBedUseMin, DeltaBedUseMax);
            int icuChange = RandomPercentOf(bedChange, DeltaIcuBedMin, DeltaIcuBedMax);
            int ventChange = RandomPercentOf(icuChange, DeltaVentMin, DeltaVentMax);

            BedsInUse = Adjust(BedsInUse, bedChange, 0, Beds);
            IcuBedsInUse = Adjust(IcuBedsInUse, icuChange, 0, Math.Min(IcuBeds, BedsInUse));
            VentsInUse = Adjust(VentsInUse, ventChange, 0, Vents);
        }

        /// <summary>
        /// Increase <paramref name="initial"/> by <paramref name="delta"/> with a total no \
        /// larger than <paramref name="max"/> and no smaller than <paramref name="min"/>.
        /// </summary>
        /// <param name="delta">How much to increase <paramref name="initial"/>; if this is 
        /// negative, initial is decreased.</param>
        private int Adjust(int initial, int delta, int min, int max)
        {
            int newValue = initial + delta;
            if (newValue < min) { return min; }
            if (newValue > max) { return max; }
            return newValue;
        }
        #endregion

        #region Probability helper functions
        /// <summary>
        /// Return a random percent of a provided value.
        /// </summary>
        /// <param name="denominator">The base value of which to take a percentage</param>
        /// <param name="lowPercent">The low end of the range; this can be a negative value</param>
        /// <param name="highPercent">The high end of the range</param>
        private int RandomPercentOf(int denominator, int lowPercent, int highPercent)
        {
            Random rand = new Random();
            int range = highPercent - lowPercent;
            double percentage = ((rand.NextDouble() * range) + lowPercent) / 100;
            double result = denominator * percentage;
            return Convert.ToInt32(result);
        }

        /// <summary>
        /// Generate a random value using a beta distribution.
        /// </summary>
        /// <seealso cref="https://en.wikipedia.org/wiki/Beta_distribution"/>
        private double RandomFromBetaDist(double min, double max, double mean, double standardDeviation)
        {
            double scale = max - min;
            double location = min;
            double unscaledMean = (mean - min) / scale;
            double unscaledVariance = Math.Pow((standardDeviation / scale), 2);
            double t = unscaledMean / (1 - unscaledMean);
            double b = ((t / unscaledVariance) - (t * t) - (2 * t) - 1) / ((t * t * t) + (3 * t * t) + (3 * t) + 1);
            double a = b * t;

            // Reality is swingier
            a = a / 4;
            b = b / 4;

            return BetaScaled.Sample(a, b, location, scale);
        }
        #endregion
    }
}
