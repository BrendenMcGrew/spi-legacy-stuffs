using Newtonsoft.Json;
using SPIBase.Models;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.Mvc;


namespace SPIBase.Controllers
{
    public class EmployeeController : Controller
    {

        /// <summary>
        /// A1C Goni
        /// Grabs all available values from the stored procedure to be used on the employee grid
        /// </summary>
        /// <param name="RowID"></param>
        /// <returns></returns>
        string connectValue = "";
        public ActionResult EmployeeGridJSON()   
        {
            SPIConnection myConn = new SPIConnection();
            connectValue = myConn.MyConnection;          
            DataSet ds = new DataSet();
            SqlDataReader dr;
            string SlashVal = "";
            string dates = "";
            int i = 0;

            SqlConnection conn = new SqlConnection(connectValue);
            conn.Open();

            using (SqlCommand cmd = new SqlCommand("[spGetSquadronRoster]", conn))
            {    
                cmd.CommandType = CommandType.StoredProcedure;                
                dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();            
                dt.Load(dr);
                //create extra column because unique key column was an int
                DataColumn column = new DataColumn("ID" , typeof(string));
                //Create an extra column to store the new date that doesn't have the time
                DataColumn InvestDate = new DataColumn("InvestDate", typeof(string));
                dt.Columns.Add(column);
                dt.Columns.Add(InvestDate);
                foreach (DataColumn col in dt.Columns)
                {
                    col.ReadOnly = false;                    
                }
                ds.Tables.Add(dt);
                ds.Tables[0].TableName = "data";
                //Go through a foreach loop to add the new values to the newly created rows
                foreach(DataRow row in dt.Rows)
                {
                    //added slashes for encryption on url
                    SlashVal = "/" + ds.Tables[0].Rows[i]["UniqueKey"].ToString() + "/";
                    ds.Tables[0].Rows[i]["ID"] = SlashVal;
                    //Checks if date is null if not it will remove the time portion of DateTime
                    if (row["InvestigationCloseDate"].ToString() != "")
                        dates = Convert.ToDateTime(row["InvestigationCloseDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
                    //Allows null dates to still show up on the data table
                    else
                        dates = "";
                    ds.Tables[0].Rows[i]["InvestDate"] = dates;
                    i++;
                }                
            }
            conn.Close();
            return Json(JsonConvert.SerializeObject(ds, Formatting.Indented));
        }     

        public ActionResult EmployeeInfo()
        {
            return View();
        }

        public ActionResult NewEmployee()
        {
            return View();
        }
    }
}