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
    public class ProcessController : Controller
    {
        /// <summary>
        /// A1C Goad
        /// Grabs all people that have been recently inprocessed
        /// </summary>
        public ActionResult InProcess()
        {
            string dates = "";
            int i = 0;
            SPIConnection myConn = new SPIConnection();
            string connectValue = myConn.MyConnection;
            DataSet ds = new DataSet();

            //Command that grabs the people that have recently inprocessed
            string Command = "SELECT ID, LastName + ', ' + FirstName + ' '+ MiddleName as 'FullName', InProcessedDate, InOutProcess FROM tblSquadronRoster WHERE InOutProcess = 1;";
            using (SqlConnection mConnection = new SqlConnection(connectValue))
            {
                mConnection.Open();
                using (SqlCommand cmd = new SqlCommand(Command, mConnection))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);
                        //Create an extra column to store the new date that doesn't have the time
                        DataColumn ProcessDate = new DataColumn("ProcessDate", typeof(string));
                        dt.Columns.Add(ProcessDate);
                        ds.Tables.Add(dt);
                        ds.Tables[0].TableName = "data";

                        //Go through a foreach loop to add the new values to the newly created rows
                        foreach (DataRow row in dt.Rows)
                        {
                            //removes the time portion of DateTime
                            dates = Convert.ToDateTime(row["InProcessedDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
                            ds.Tables[0].Rows[i]["ProcessDate"] = dates;
                            i++;
                        }
                    }
                }
            mConnection.Close();
            }
            return Json(JsonConvert.SerializeObject(ds, Formatting.Indented));
        }

        /// <summary>
        /// A1C Goni
        /// Grabs all people that have been recently outprocessed
        /// </summary>
        public ActionResult OutProcess()
        {
            string dates = "";
            int i = 0;
            SPIConnection myConn = new SPIConnection();
            string connectValue = myConn.MyConnection;
            DataSet ds = new DataSet();

            //Command that grabs the people that have recently outprocessed and their reason for outprocessing
            string Command = "SELECT sq.ID, sq.LastName + ', ' + sq.FirstName + ' '+ sq.MiddleName as 'FullName', sq.InProcessedDate, sq.InOutProcess, o.Reason  " +
            "FROM tblSquadronRoster sq  " +
            "JOIN tblLkup_OutprocessReason o on sq.OutProcessID = o.OutProcessID  " +
            "WHERE InOutProcess = 0";
            using (SqlConnection mConnection = new SqlConnection(connectValue))
            {
                mConnection.Open();
                using (SqlCommand cmd = new SqlCommand(Command, mConnection))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);
                        //Create an extra column to store the new date that doesn't have the time
                        DataColumn ProcessDate = new DataColumn("ProcessDate", typeof(string));
                        dt.Columns.Add(ProcessDate);
                        ds.Tables.Add(dt);
                        ds.Tables[0].TableName = "data";

                        //Go through a foreach loop to add the new values to the newly created rows
                        foreach (DataRow row in dt.Rows)
                        {
                            //removes the time portion of DateTime
                            dates = Convert.ToDateTime(row["InProcessedDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
                            ds.Tables[0].Rows[i]["ProcessDate"] = dates;
                            i++;
                        }
                    }
                }
                mConnection.Close();
            }
            return Json(JsonConvert.SerializeObject(ds, Formatting.Indented));
        }

        /// <summary>
        /// A1C Goni
        /// Grabs all people that have an incident on their record
        /// </summary>
        public ActionResult IncidentReports()
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
                //Create two extra column to store the new date that doesn't have the time
                DataColumn OpenDate = new DataColumn("OpenDate", typeof(string));
                DataColumn CloseDate = new DataColumn("CloseDate", typeof(string));
                //DataColumn IncidentType = new DataColumn("IncidentType", typeof(string));
                dt.Columns.Add(column);
                dt.Columns.Add(OpenDate);
                dt.Columns.Add(CloseDate);

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
                    //removes the time portion of DateTime
                    IncidentOpendate = Convert.ToDateTime(row["IncidentOpenDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
                    //Checks if date is null if not it will remove the time portion of DateTime
                    if (row["IncidentCloseDate"].ToString() != "")
                        IncidentClosedate = Convert.ToDateTime(row["IncidentCloseDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
                    //Allows null dates to still show up on the data table
                    else
                        IncidentClosedate = "";

                    ds.Tables[0].Rows[i]["OpenDate"] = IncidentOpendate;
                    ds.Tables[0].Rows[i]["CloseDate"] = IncidentClosedate;
                    i++;
                }
            }
            return Json(JsonConvert.SerializeObject(ds, Formatting.Indented));
        }
    }
}