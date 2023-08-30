using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Globalization;

namespace SPIBase.Models
{
    public class Employee
    {
        //values we need are last name, first name, rank,  SSN, clearance, investigation date, investigation type

        public string UniqueKey { get; set; }
        public string FullName { get; set; }
        public string Rank { get; set; }
        public string SSN { get; set; }
        public string Clearance { get; set; }
        public string InvestigationCloseDate { get; set; }
        public string InvestType { get; set; }
        public string LName { get; set; }
        public string MName { get; set; }
        public string FName { get; set; }
        public string DODIDNumber { get; set; }
        public string DSN { get; set; }
        public string LastDissUpdate { get; set; }
        public string Unit { get; set; }
        public string PAFSC { get; set; }
        public string Attached { get; set; }
        public string CrewPosition { get; set; }
        public string ClearanceStatus { get; set; }
        public bool OpenInvestigation { get; set; }
        public string Accesses { get; set; }
        public string Eligibility { get; set; }
        public string EligibleDate { get; set; }
        public bool NDASigned { get; set; }
        public string ceDerfermentDate { get; set; }
        public bool SCI { get; set; }
        public bool ProximityCard { get; set; }
        public bool NATO { get; set; }
        public string Forms { get; set; }
        public string InProcessedBy { get; set; }
        public bool JPAS { get; set; }
        public string LineBadgeNumber { get; set; }
        public string CoManners { get; set; }
        public string DerivativeTraining { get; set; }
        public string InitialAnnualTraining { get; set; }
        public string NatoAccessCert { get; set; }
        public string MarkingClassifiedTraining { get; set; }
        public string AtLevelLast { get; set; }
        public string InProcessDate { get; set; }
        public string BirthCity { get; set; }
        public string BirthState { get; set; }
        public string BirthCountry { get; set; }
        public string EmailAddress { get; set; }
        public string BirthDate { get; set; }
        public string CitizenShip { get; set; }
        public string CurrentStreetAddress { get; set; }
        public string CurrentCity { get; set; }
        public string CurrentState { get; set; }
        public string CurrentZipCode { get; set; }
        public string HomePhone { get; set; }
        public string Height { get; set; }
        public string Weight { get; set; }
        public string EyeColor { get; set; }
        public string HairColor { get; set; }
        public string OpsecDate { get; set; }
        public bool SiprToken { get; set; }
        public bool NatoIndoc { get; set; }
        public string OtherRemarks { get; set; }    
        public string RecordLastUpdated { get; set; }
        public int StateID { get; set; }

        public Employee() { }

        /// <summary>
        /// A1C Goni
        /// Uses all information obtained from the employee and converts it to usable data
        /// </summary>
        /// <param name="RowID"></param>
        /// <returns></returns>
        /// 
        public Employee (DataRow row)
        {
            this.Attached = row["Attached"].ToString();
            this.BirthCity = row["BirthCity"].ToString();
            this.BirthCountry = row["BirthCountry"].ToString();
            if (row["BirthDate"].ToString() != "")
                this.BirthDate = Convert.ToDateTime(row["BirthDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
            this.BirthState = row["BirthState"].ToString();
            if (row["CRDefermentDate"].ToString() != "")
                this.ceDerfermentDate = Convert.ToDateTime(row["CRDefermentDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
            this.CitizenShip = row["Citizenship"].ToString();
            this.Clearance = row["ClearanceLevel"].ToString();
            this.ClearanceStatus = row["ClearanceStatus"].ToString();
            //this.CrewPosition = row["CrewPosition"].ToString();
            this.DODIDNumber = row["DODID"].ToString();
            this.DSN = row["DSN"].ToString();
            this.Eligibility = row["Eligibility"].ToString();
            if (row["EligibleDate"].ToString() != "")
                this.EligibleDate = Convert.ToDateTime(row["EligibleDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
            this.EmailAddress = row["WorkEmail"].ToString();
            this.EyeColor = row["EyeColor"].ToString();
            this.FullName = row["FullName"].ToString();
            this.HairColor = row["HairColor"].ToString();
            this.Height = row["Height"].ToString();
            this.InProcessDate = Convert.ToDateTime(row["InProcessDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
            this.InProcessedBy = row["InProcessedBy"].ToString();
            if (row["InvestigationCloseDate"].ToString() != "")
                this.InvestigationCloseDate = Convert.ToDateTime(row["InvestigationCloseDate"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
            this.InvestType = row["InvestigationType"].ToString();
            this.LineBadgeNumber = row["LineBadgeNumber"].ToString();
            this.PAFSC = row["PAFSC"].ToString();
            this.Rank = row["Rank"].ToString();
            //this.RecordLastUpdated = Convert.ToDateTime(row["RecordLastUpdated"], new CultureInfo("en-US")).ToString("yyyy-MM-dd");
            this.SSN = row["SSN"].ToString();
            if (row["StateID"] != System.DBNull.Value)
                this.StateID = Convert.ToInt32(row["StateID"]);
            this.UniqueKey = row["UniqueKey"].ToString();
            this.Unit = row["Unit"].ToString();
            this.Weight = row["Weight"].ToString();        
        }
      

    }

}