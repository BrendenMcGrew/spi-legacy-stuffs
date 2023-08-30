using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using System.Web.Routing;
using System.Data;
using SPIBase.Models;
using System.Data.SqlClient;
using System.ComponentModel;
using Newtonsoft.Json.Linq;



namespace SPIBase.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default
        //public ActionResult IDTest()
        //{
        //    return View();
        //}

            string filePath = Server.MapPath("~/Javascript/SPIData.json");
            DataSet dataSet = JsonConvert.DeserializeObject<System.Data.DataSet>(System.IO.File.ReadAllText(filePath));
            //List<Models.Employee> employee = JsonConvert.DeserializeObject<List<Models.Employee>>(System.IO.File.ReadAllText(filePath));
            //var empList = dataSet.Tables[0].AsEnumerable().Select(DataRow => new Employee
            //{
            //    FName = DataRow.Field<string>("FName")
            //}).ToList();
            var vm = new Models.TestModel();
            vm.DODID = RowID;
            return View(vm);

    }
}