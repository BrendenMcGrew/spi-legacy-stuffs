using SPIBase.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SPIBase.Models
{
    public class AdjudicationGuidelineDropDownList
    {
        public int AdjudicationID { get; set; }
        public string AdjudicationGuideline { get; set; }

        //Struct that will be used for the states list
        public AdjudicationGuidelineDropDownList(int ID, string Name)
        {
            AdjudicationID = ID;
            AdjudicationGuideline = Name;
        }

        //List of states
        public List<AdjudicationGuidelineDropDownList> GetAdjudications()
        {
            //try
            //{
                SPIConnection myConn = new SPIConnection();
                string connectValue = myConn.MyConnection;
                DataSet ds = new DataSet();

                List<AdjudicationGuidelineDropDownList> Adjudication = new List<AdjudicationGuidelineDropDownList>();
                //SQL command used to bring all values from the Adjudication Guideline look up table
                string Command = "SELECT AdjudicationID, AdjudicationGuideline FROM tblLkup_AdjudicationGuidelines;";
                using (SqlConnection mConnection = new SqlConnection(connectValue))
                {
                    mConnection.Open();
                    using (SqlCommand cmd = new SqlCommand(Command, mConnection))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            //adds each state to the list
                            while (reader.Read())
                            {
                                AdjudicationID = Convert.ToInt32(reader[0]);
                                AdjudicationGuideline = reader[1].ToString();
                                Adjudication.Add(new AdjudicationGuidelineDropDownList(AdjudicationID, AdjudicationGuideline));
                            }
                        }
                    }
                }

            //}
            //catch (Exception)
            //{

            //}
            
            return Adjudication;

        }


    }
}