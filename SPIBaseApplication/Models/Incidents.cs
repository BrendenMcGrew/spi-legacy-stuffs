using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SPIBase.Models
{
    public class Incidents
    {
        public string IncidentDate { get; set; }
        public string ReportDate { get; set; }
        public bool SelfReported { get; set; }
        public string AdjudicationGuideline { get; set; }
        public string Notes { get; set; }
        public string CloseDate { get; set; }
        public string Verdict { get; set; }

        //public Incidents(DataRow row)
        //{
        //    //this.IncidentDate = row[""]
        //}
    }
}