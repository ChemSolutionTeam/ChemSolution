using System;
using System.Linq;
using System.Text;

namespace ChemSolution.Middlewares.Authorization.Settings
{
    internal static class RandomKey
    { 
        /// <summary>
        /// It create random key 
        /// </summary>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string CreateKey(int length)
        {
            Random random = new Random();
            return Enumerable.Range(0, length)
                .Select( _ => random.Next(0, 255))
                .Aggregate((new StringBuilder()), (s, i) => s.Append((char) i))
                .ToString();
        }

    }
}