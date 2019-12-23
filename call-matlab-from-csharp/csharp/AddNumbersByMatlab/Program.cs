using AddNumbersMatlabNative;
using System;

namespace AddNumbersByMatlab
{
    class Program
    {
        static void Main(string[] args)
        {
            var matlabOjb = new AddNumbersClass();

            var num1 = 10.1;
            var num2 = 11.2;
            var result = matlabOjb.AddNumbers(1, num1, num2)[0] as double[,];
            var sum = result[0, 0];

            Console.WriteLine($"Result: {num1} + {num2} = {sum}");
        }
    }
}
