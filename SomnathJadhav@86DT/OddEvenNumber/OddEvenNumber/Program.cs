using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OddEvenNumber
{
    class Program
    {
        static void Main(string[] args)
        {
            int num = int.Parse(args[0]);
            if (num % 2 == 0)
            {
                Console.Write("Given Number is Even");
            }
            else
            {
                Console.Write("Given Number is Odd");
            }
            Console.Read();

        }
    }
}
