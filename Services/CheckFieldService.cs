using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ChemSolution.Services
{
    public class CheckFieldService
    {
        public T CheckModelField<T>(T oldValue, T newValue) where T : IComparable =>  ( (newValue?.CompareTo(default(T)) ?? 0) == 0) ? oldValue: newValue;
    }
}
