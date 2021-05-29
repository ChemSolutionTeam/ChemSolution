using System.Collections.Generic;

namespace ChemSolution.Services.CheckProperties
{
    public class ClearOptions
    {
        public string[] ClearInModel { set; get; } = new string[0];
        public Dictionary<string, string[]> ClearInLinkedList { set; get; } = new ();
        public Dictionary<string, string[]> ClearInLinkedModel { set; get; } = new();
    }
}