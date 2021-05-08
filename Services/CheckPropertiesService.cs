using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore.Internal;
using Org.BouncyCastle.Utilities.IO.Pem;

namespace ChemSolution.Services
{
    public class CheckPropertiesService
    {
        public T CheckModelProperty<T>(T oldValue, T newValue) where T : IComparable =>  ( (newValue?.CompareTo(default(T)) ?? 0) == 0) ? oldValue: newValue;
        private void ClearLists(object obj)
        {
            Type objType = obj.GetType();
            foreach (var propertyInfo in objType.GetProperties())
            {
                Type tmp = Type.GetType(propertyInfo.PropertyType.ToString(), true, false);
                if (tmp.GetInterfaces().Any(i => i.Name == "IList"))
                {
                    propertyInfo.SetValue(obj, null);
                }
            }
        }

        public T PrepareModelForJson<T>(T obj)
        {
            Type objType = obj.GetType();
            foreach (var propertyInfo in objType.GetProperties())
            {
                Type tmp = Type.GetType(propertyInfo.PropertyType.ToString(), true, false);
                if (tmp.GetInterfaces().Any(i => i.Name == "IList"))
                {
                    var list = (IEnumerable) propertyInfo.GetValue(obj);
                    foreach (var tmpEntity in list)
                    {
                        ClearLists(tmpEntity);
                    }
                }
            }
            return obj;
        }
        
        
    }
}
