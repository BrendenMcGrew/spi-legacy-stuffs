using Newtonsoft.Json;
using SPIBase.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Windows.Forms;

namespace SPIBase.Controllers
{
    public class EmployeeDetailsController : Controller
    {
        /// <summary>
        /// A1C Goni
        /// Grabs a specific person using a unique key
        /// puts the persons information into a list to be later used in the tabbed display
        /// </summary>
        /// <param name="RowID"></param>
        /// <returns></returns>
        /// 
        string connectValue = "";

        public ActionResult EmployeeDetails(string RowID, string File, string Result)
        {

            SPIConnection myConn = new SPIConnection();
            connectValue = myConn.MyConnection;
            DataSet ds = new DataSet();
            SqlDataReader dr;

            GetDropdownList();
            GetAdjudicationList();

            SqlConnection conn = new SqlConnection(connectValue);
            conn.Open();

            RowID = RowID.Replace("/", "");
            MemberID = RowID;

            using (SqlCommand cmd = new SqlCommand("[spGetEmployeeDetails]", conn))
            {
                //parameter to make sure only this employee appears
                cmd.Parameters.AddWithValue("@MemID", RowID);

                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);

                Employee newEmp = new Employee();
                ViewBag.Employee = new Employee(dt.Rows[0]);
            }
            //checks to see if a file has been uploaded
            if (File != "XX")
            {
                ViewBag.FileMsg = File;
                ViewBag.FileMsgLast = Result;

                ViewBag.Secret = "Upload";
                return View();
            }
            //checks to see if they are comming from the incident alerts table
            else if (Result == "Incident")
            {        
                ViewBag.Secret = "Incident";
                return View();
            }
            else
            {
                return View();
            }
        }


        /// <summary>
        /// A1C Goad
        /// This is used to upload files from the documents tab into a folder for an individual it was uploaded under
        /// </summary>
        /// <param name="RowID"></param>
        /// <returns></returns>
        /// 
        public ActionResult UploadFile(HttpPostedFileBase file, string fullname, string RowID)
        {
            //get folder name
            string folderName = @"c:\PDFUploads";
            string pathString = System.IO.Path.Combine(folderName, fullname);

            System.IO.Directory.CreateDirectory(pathString);
            pathString = System.IO.Path.Combine(pathString, file.FileName);

            if (System.IO.File.Exists(pathString))
            {
                MessageBoxButtons buttons = MessageBoxButtons.YesNo;
                DialogResult result = MessageBox.Show(new Form() { TopMost = true }, "A file of this name already exists. Do you want to replace the existing file?",
                    "Warning", buttons);
                if (result == DialogResult.Yes)
                {
                    file.SaveAs(pathString);
                    return RedirectToAction("EmployeeDetails", new { RowID = RowID, File = file.FileName, Result = " uploaded successfully!!" });
                }
                else
                {
                    return RedirectToAction("EmployeeDetails",
                        new { RowID = RowID, File = file.FileName, Result = " already exists, was not uploaded!!" });
                }
            }
            else
            {
                file.SaveAs(pathString);
                return RedirectToAction("EmployeeDetails", new { RowID = RowID, File = file.FileName, Result = " uploaded successfully!!" });
            }
        }

        /// <summary>
        /// A1C Goni
        /// This method will create list that will later be used for the dropdown lists
        /// </summary>
        /// <param name="RowID"></param>
        /// <returns></returns>
        /// 
        public void GetDropdownList()
        {
            //Creates a list using the three values in the lookup table\

            States states = new States(0, null, null);

            List<States> StateList = new List<States>();
            StateList = states.GetStates();

            //Stores all states into the viewbag to be used in to the dropdown list
            ViewBag.States = StateList;
        }


        public void GetAdjudicationList()
        {
            //Creates a list using the three values in the lookup table
            AdjudicationGuidelineDropDownList adjudication = new AdjudicationGuidelineDropDownList(0, null);

            //Stores all states into the viewbag to be used in to the dropdown list
            ViewBag.Adjudication = adjudication.GetAdjudications();
        }

        //static string to grab unique key to use in the incidents table
        static string MemberID
        {
            get;
            set;
        }

        /// <summary>
        /// A1C Goni
        /// This is used to create the incident table displayed in the incidents tab
        /// </summary>
        /// <returns></returns>
        public JsonResult About()
        {
            connectValue = "";
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

            using (SqlCommand cmd = new SqlCommand("[spGetMemberIncidents]", conn))
            {
                //parameter to make sure only this employees incidents appear
                cmd.Parameters.AddWithValue("@MemID", MemberID);

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
                        IncidentClosedate = "";
                    //if (row["IncidentType"].ToString() != "")
                    //    IncidentType = row["IncidentType"].ToString();

                    ds.Tables[0].Rows[i]["OpenDate"] = IncidentOpendate;
                    ds.Tables[0].Rows[i]["CloseDate"] = IncidentClosedate;
                    //ds.Tables[0].Rows[i]["IncidentType"] = IncidentType;
                    i++;
                }
            }
            conn.Close();
            return Json(JsonConvert.SerializeObject(ds, Formatting.Indented));
        }





        public ActionResult SaveIncidentFile(HttpPostedFileBase[] files, string fullname, string RowID)
        {
            //get folder name
            string folderName = @"c:\PDFUploads";
            string pathString = Path.Combine(folderName, fullname, "Incidents");

            Directory.CreateDirectory(pathString);

            // saves the uploaded file(s) to the individuals Incident folder
            if (files[0] != null)
            {
                foreach (HttpPostedFileBase item in files)
                {
                    //pathString = System.IO.Path.Combine(pathString, item.FileName);
                    item.SaveAs(pathString + @"\" + item.FileName);
                }
                ViewBag.Incident = "Saved Successfully!";
            }
            else
            {
                ViewBag.Incident = null;
            }

            return RedirectToAction("EmployeeDetails", new { RowID = RowID, File = "XX", Result = "Incident" });
        }


        public void SavingData(string[] IncidentData, string Notes, string FullName)
        {
            Array.Resize(ref IncidentData, IncidentData.Length + 3);
            IncidentData[6] = MemberID;
            IncidentData[7] = DateTime.Today.ToString();
            IncidentData[8] = IncidentData[4] == "" ? "0" : "1";

            SPIConnection myConn = new SPIConnection();
            connectValue = myConn.MyConnection;
            SqlConnection conn = new SqlConnection(connectValue);
            conn.Open();

            string[] sqlVars =
            {
                //Incident Info
                "@IncidentDate",
                "@ReportDate",
                "@SelfReported",
                "@AdjudicationID",
                "@IncidentCloseDate",
                "@Verdict",
                "@SquadRosterID",
                "@IncidentOpenDate",
                "@IsClosedDate"
            };

            using (SqlCommand cmd = new SqlCommand("[spUpdateIncidentReferenceTable]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i < IncidentData.Length; i++)
                {
                    cmd.Parameters.AddWithValue(sqlVars[i], IncidentData[i]);
                }

                cmd.ExecuteNonQuery();
            }
            conn.Close();

            CreateFile(FullName, IncidentData[0], Notes);
            //return RedirectToAction("EmployeeDetails", new { /*RowID = RowID,*/ File = "XX", Result = "Incident" });

        }

        public void CreateFile(string FullName, string openDate, string Notes)
        {
            string path = "C:\\PDFUploads";
            string folderName = @"C:\PDFUploads\";
            bool FolderExists = false;
            string pathString = "";
            string FolderPath = "";
            int incidentCount = 0;

            //check to see if folder exists with same name as member
            foreach (string dirFolder in Directory.GetDirectories(path))
            {
                FolderPath = folderName + FullName;
                if (FolderPath == dirFolder)
                {
                    FolderExists = true;
                    break;
                }
            }

            //if named member does not have a folder, create a new folder
            if (!FolderExists)
            {
                pathString = Path.Combine(path, FullName, "Incidents");
                Directory.CreateDirectory(pathString);
            }
            else
                pathString = Path.Combine(path, FullName, "Incidents");

            //check to see how many files exist in incidents folder         
            foreach (string IncidentFile in Directory.GetFiles(pathString))
            {
                //check to see if the notes is the same as a previous one
                if (IncidentFile.Contains(openDate))
                {
                    incidentCount++;
                }
            }

            //add incremented value to name of file created, so we dont overwrite existing file
            if (incidentCount > 0)
                openDate = openDate + "(" + incidentCount + ")";

            using (FileStream fs = System.IO.File.Create(pathString + @"\" + openDate + ".txt"))
            {
                if (System.IO.File.Exists(fs.Name))
                {
                    byte[] info = new System.Text.UTF8Encoding(true).GetBytes(Notes);
                    // Add some information to the file.  
                    fs.Write(info, 0, info.Length);
                }

                // byte[] info = new System.Text.UTF8Encoding(true).GetBytes(Notes);
                //// Add some information to the file.
                //fs.Write(info, 0, info.Length);                
            }
        }
    }
}
