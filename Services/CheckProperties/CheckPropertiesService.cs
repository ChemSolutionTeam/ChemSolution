using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using ChemSolution.Models;
using ChemSolution.Services.CheckProperties;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore.Internal;
using Org.BouncyCastle.Utilities.IO.Pem;

namespace ChemSolution.Services
{
    public class CheckPropertiesService
    {
        public T CheckModelProperty<T>(T oldValue, T newValue) where T : IComparable =>  ( (newValue?.CompareTo(default(T)) ?? 0) == 0) ? oldValue: newValue;


        public void CheckModelProperties<T>(T oldModel, T newModel)
        {
            Type modelType = typeof(T);
            foreach (var propertyInfo in modelType.GetProperties())
            {
                Type tmpType = Type.GetType(propertyInfo.PropertyType.ToString(), true, false);
                if (tmpType.GetInterfaces().All(i => i.Name != "IList"))
                {
                    dynamic oldData =propertyInfo.GetValue(oldModel);
                    dynamic newData =  propertyInfo.GetValue(newModel);
                    propertyInfo.SetValue( oldModel , CheckModelProperty(oldData, newData) );
                }
            }
        }

        private void ClearLists(object obj, string[] clearProperties)
        {
            Type objType = obj.GetType();
            foreach (var propertyInfo in objType.GetProperties())
            {
                Type tmp = Type.GetType(propertyInfo.PropertyType.ToString(), true, false);
                if (tmp.GetInterfaces().Any(i => i.Name == "IList"))
                {
                    propertyInfo.SetValue(obj, null);
                }
                if (clearProperties.Contains(propertyInfo.Name))
                {
                    propertyInfo.SetValue(obj, null);
                }
                
                //It works but it needs to be fixed later
                if (propertyInfo.Name == "Status")
                {
                    var tmpStatus = (Status) propertyInfo.GetValue(obj);
                    tmpStatus.Requests = null;
                    propertyInfo.SetValue(obj, tmpStatus);
                }
            }
        }

        public T PrepareModelForJson<T>(T obj, ClearOptions options)
        {
            Type objType = obj.GetType();
            foreach (var propertyInfo in objType.GetProperties())
            {
                Type tmp = Type.GetType(propertyInfo.PropertyType.ToString(), true, false);
                if(options.ClearInModel.Contains(propertyInfo.Name))
                {
                   CleanInModel(propertyInfo, obj);
                }
                else if (options.ClearInLinkedModel.Keys.Contains(propertyInfo.Name))
                {
                    CleanInLinkedModel(options, propertyInfo, obj);
                }
                else if (tmp.GetInterfaces().Any(i => i.Name == "IList"))
                {
                    CleanInLinkedList(options, propertyInfo, obj);
                }
            }
            return obj;
        }

        private void CleanInModel(PropertyInfo propertyInfo, object obj)
        {
            propertyInfo.SetValue(obj,null);
        }

        private void CleanInLinkedModel(ClearOptions options, PropertyInfo propertyInfo, object obj)
        {
            object tmpObj = propertyInfo.GetValue(obj);
            
            Type tmp = Type.GetType(propertyInfo.PropertyType.ToString(), true, false);
                    
            foreach (var p in tmp.GetProperties())
            {
                if (options.ClearInLinkedModel[propertyInfo.Name].Contains(p.Name))
                {
                    p.SetValue(tmpObj, null);
                }
            }
        }

        private void CleanInLinkedList(ClearOptions options, PropertyInfo propertyInfo, object obj)
        {
            var list = (IEnumerable) propertyInfo.GetValue(obj);
            foreach (var tmpEntity in list)
            {
                if (options.ClearInLinkedList.Keys.Contains(propertyInfo.Name))
                {
                    ClearLists(tmpEntity,options.ClearInLinkedList[propertyInfo.Name]);
                }else if (options.ClearInLinkedList.Keys.Contains("All"))
                {
                    ClearLists(tmpEntity,options.ClearInLinkedList["All"]);
                }
            }
        }
        
    }
}
