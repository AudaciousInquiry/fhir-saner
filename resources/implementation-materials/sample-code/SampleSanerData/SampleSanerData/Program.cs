using System;

namespace SampleSanerData
{
    class Program
    {
        static void Main(string[] args)
        {
            Hospital hospital = new Hospital();
            
            Console.WriteLine("{0,6} {1,6} {2,8} {3,6} {4,6} {5,6}",
                "Beds", "in use", "ICU Beds", "in use", "Vents", "in use");
            Console.WriteLine("{0,6} {0,6} {1,8} {0,6} {0,6} {0,6}",
                "------", "--------", "ICU Beds", "in use", "Vents", "in use");

            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine("{0,6} {1,6} {2,8} {3,6} {4,6} {5,6}",
                    hospital.Beds, hospital.BedsInUse, hospital.IcuBeds, hospital.IcuBedsInUse, hospital.Vents, hospital.VentsInUse);
                hospital.Tomorrow();
            }
        }
    }
}
