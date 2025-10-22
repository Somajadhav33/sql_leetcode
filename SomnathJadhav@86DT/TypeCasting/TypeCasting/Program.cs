using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TypeCasting
{
    class Program
    {
        static void Main(string[] args)
        {
            int num1 = 100;
            double num2 = num1;

            Console.WriteLine("Type Casting Demonstration** \n");

            Console.WriteLine("Implicit Casting");
            Console.WriteLine("Integer value : " + num1);
            Console.WriteLine(" int --> double: " + num2);
            Console.WriteLine();

            double num3 = 320.98;
            int num4 = (int)num3;

            Console.WriteLine("Explicit Casting");
            Console.WriteLine("Double value : " + num3);
            Console.WriteLine("double --> int: " + num4);
            Console.WriteLine();

            string str = "1234";
            int str1 = int.Parse(str);

            Console.WriteLine("String value      : " + str);
            Console.WriteLine("String to Integer : " + str1);
            Console.Read();
        }
    }
}
