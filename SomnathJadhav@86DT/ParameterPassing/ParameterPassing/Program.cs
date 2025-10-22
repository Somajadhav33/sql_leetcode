using System;

namespace ParameterPassing
{
    class Program
    {
        void SwapByValue(int x, int y)
        {
            int temp = x;
            x = y;
            y = temp;
        }

        void SwapByReference(ref int x, ref int y)
        {
            int temp = x;
            x = y;
            y = temp;
        }

        void AreaOfRectangle(out int length, out int width, out int area)
        {
            length = 10;
            width = 5;
            area = length * width;
        }

        static void Main(string[] args)
        {
            Program obj = new Program();

            int a = 10, b = 20;
            Console.WriteLine("Before Swapping: A = " + a + "  B = " + b);

            obj.SwapByValue(a, b);
            Console.WriteLine("\n--- Using Pass By Value ---");
            Console.WriteLine("After Swapping: A = " + a + "  B = " + b);

            obj.SwapByReference(ref a, ref b);
            Console.WriteLine("\n--- Using Pass By Reference ---");
            Console.WriteLine("After Swapping: A = " + a + "  B = " + b);

            int len, wid, area;
            obj.AreaOfRectangle(out len, out wid, out area);
            Console.WriteLine("\n--- Using Out Parameters ---");
            Console.WriteLine("Length = " + len + "  Width = " + wid + "  Area = " + area);

            Console.ReadLine();
        }
    }
}
