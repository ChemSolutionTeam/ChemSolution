using System.Collections.Generic;

namespace ChemSolution.Services.CheckProperties
{
    public class ClearOptions
    {
        public string[] ClearInModel { set; get; } = new string[0];
        public Dictionary<string, string[]> ClearInLinkedList { set; get; } = new Dictionary<string, string[]>();
    }
}