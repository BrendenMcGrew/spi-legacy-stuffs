using SPIBase.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SPIBase.Models
{
    public class States
    {
        public int StateID { get; set; }
        string StateName { get; set; }
        public string StateCode { get; set; }

        //Struct that will be used for the states list
        public States(int ID, string Name, string Code)
        {
            StateID = ID;
            StateName = Name;
            StateCode = Code;
        }

        //List of states
        public List<States> GetStates()
        {
            SPIConnection myConn = new SPIConnection();
            string connectValue = myConn.MyConnection;
            DataSet ds = new DataSet();

            List<States> State = new List<States>();
            //SQL command used to bring all values from the states look up table
            string Command = "SELECT StateID, StateCode, StateName FROM tblLkup_States;";
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
                            StateID = Convert.ToInt32(reader[0]);
                            StateCode = reader[1].ToString();
                            StateName = reader[2].ToString();
                            State.Add(new States(StateID, StateName, StateCode));
                        }
                    }
                }
            }
            return State;
        }
    }

}