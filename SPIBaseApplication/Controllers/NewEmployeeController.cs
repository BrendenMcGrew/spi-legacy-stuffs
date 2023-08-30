using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.Json;
using System.Text.Json.Serialization;
using SPIBase.Models;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;

namespace SPIBaseApplication.Controllers
{
    public class NewEmployeeController : Controller
    {
        string connectValue = "";
        // GET: NewEmployee
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult CreateNewEntry(string[] PersonalData)
        {
            //Opens a connection to the database
            SPIConnection myConn = new SPIConnection();
            connectValue = myConn.MyConnection;
            SqlConnection conn = new SqlConnection(connectValue);
            conn.Open();


            //Creates an array of variables matching the names in the stored procedure.
            //The order must be in the same order to correspond to the values of the incoming array
            string[] sqlVars =
            {
                //Basic info
                "@Name",
                "@MiddleName",
                "@LastName",
                "@SSN",
                "@DODID",
                "@RankID",
                "@Unit",
                "@OfficeSymbol",
                "@Attached",
                "@pafsc",
                "@dsn",
                "@InprocessDate",
                "@InprocessedBy",

                //Personal info
                "@Height",
                "@Weight",
                "@HairColorID",
                "@EyeColorID",
                "@personalPhone",
                "@zipcode",
                "@Address",
                "@CurrentCity",
                "@CurrentState",

                //Clearance info
                "@ClearanceID",
                "@InvestigationTypeID",
                "@ClearanceStatus",
                "@InvestigationCloseDate",
                "@DateOfBirth",
                "@BirthCity",
                "@BirthState",
                "@BirthCountry",
                "@Citizenship",
                "@workemail",

                //Clearance Table
                "@Eligibility",
                "@EligibilityDate",
                "@SCI",
                "@CEDefermentDate"
            };

            try
            {
                //Calls the SQL stored procedure and runs it as a command
                using (SqlCommand cmd = new SqlCommand("[spCreateNewMember]", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //iterates through each item in the incoming array and matches it to each item of the sql variable array.
                    for (int i = 0; i < PersonalData.Length; i++)
                    {
                        cmd.Parameters.AddWithValue(sqlVars[i], PersonalData[i]);
                    }

                    cmd.ExecuteNonQuery();
                }
            }

            
            catch (Exception e)
            {
                conn.Close();
                return this.Json(new { success = false, message = e.Message});

            }

            conn.Close();
            return this.Json(new { success = true, message="New member created successfully" });
        }

    }
}
