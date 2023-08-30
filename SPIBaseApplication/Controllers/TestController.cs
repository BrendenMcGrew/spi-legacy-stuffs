using Newtonsoft.Json;
using SPIBase.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SPIBaseApplication.Controllers
{
    public class TestController : Controller
    {
        // GET: Test
        public JsonResult About()
        {
            string connectValue = "";
            SPIConnection myConn = new SPIConnection();
            connectValue = myConn.MyConnection;
            DataSet ds = new DataSet();
            SqlDataReader dr;
            string SlashVal = "";
            string IncidentOpendate = "";
            string IncidentClosedate = "";
            //string IncidentType = "";
            int i = 0;

            SqlConnection conn = new SqlConnection(connectValue);
            conn.Open();

            using (SqlCommand cmd = new SqlCommand("[spGetIncidents]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                //create extra column because unique key column was an int
                DataColumn column = new DataColumn("ID", typeof(string));
                DataColumn OpenDate = new DataColumn("OpenDate", typeof(string));
                DataColumn CloseDate = new DataColumn("CloseDate", typeof(string));
                //DataColumn IncidentType = new DataColumn("IncidentType", typeof(string));
                dt.Columns.Add(column);
                dt.Columns.Add(OpenDate);
                dt.Columns.Add(CloseDate);
                //dt.Columns.Add(IncidentType);

                foreach (DataColumn col in dt.Columns)
                {
                    col.ReadOnly = false;
                }
                ds.Tables.Add(dt);
                ds.Tables[0].TableName = "data";
                foreach (DataRow row in dt.Rows)
                {
                    //added slashes for encryption on url
                    SlashVal = "/" + ds.Tables[0].Rows[i]["UniqueKey"].ToString() + "/";
                    ds.Tables[0].Rows[i]["ID"] = SlashVal;
                    if (row["IncidentOpenDate"].ToString() != "")
                        IncidentOpendate = Convert.ToDateTime(row["IncidentOpenDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
                    if (row["IncidentCloseDate"].ToString() != "")
                        IncidentClosedate = Convert.ToDateTime(row["IncidentCloseDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
                    else
                        IncidentClosedate  = "";
                    //if (row["IncidentType"].ToString() != "")
                    //    IncidentType = row["IncidentType"].ToString();

                    ds.Tables[0].Rows[i]["OpenDate"] = IncidentOpendate;
                    ds.Tables[0].Rows[i]["CloseDate"] = IncidentClosedate;
                    //ds.Tables[0].Rows[i]["IncidentType"] = IncidentType;
                    i++;
                }
            }
            return Json(JsonConvert.SerializeObject(ds, Formatting.Indented));
    
            ////return Json("~/Content/TestData.json");
            //return Json(new {id = "1",
            //    name = "Tiger Nixon",
            //    position = "System Architect", 
            //    salary = "$320,800", 
            //    start_date = "2011/04/25", 
            //    office = "Edinburgh", 
            //    extn = "5421"
            //});
        }
    }
}