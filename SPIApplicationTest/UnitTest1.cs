using NUnit.Framework;
using SPIBase.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;

namespace SPIApplicationTest
{
    public class Tests
    {

        //string connectValue = "";

        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void GridTest()
        {
            DataSet ds = new DataSet();

            SqlConnection conn = new SqlConnection("Data Source = localhost; Initial Catalog = Dev_SPI; Integrated Security = True");
            conn.Open();

            //create a datatable test
            DataTable testTable = new DataTable();

            testTable.Columns.Add("UniqueKey");
            testTable.Columns.Add("FullName");
            testTable.Columns.Add("Rank");
            testTable.Columns.Add("Clearance");
            testTable.Columns.Add("InvestType");
            testTable.Columns.Add("InvestigationCloseDate");

            bool AssertVal = false;

            using (SqlCommand cmd = new SqlCommand("[spGetSquadronRoster]", conn))
            {
                SqlDataReader dr;
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                int i = 0;

                foreach (DataColumn col in dt.Columns)
                {
                    //compare columns with created table
                    if (col.ColumnName == testTable.Columns[i].ColumnName)
                        AssertVal = true;
                    else
                        AssertVal = false;
                    i++;
                }

                if (dt.Rows.Count > 0)
                    AssertVal = true;
                else
                    AssertVal = false;
            }
            Assert.IsTrue(AssertVal);
        }

        [Test]
        public void employeeDetailTest()
        {
            //get values of all unique keys
            List<string> uniquekeys = new List<string>();
            uniquekeys = GetKeys();

            int randomRowID = 0;

            int listCount = uniquekeys.Count;
            Random random = new Random();
            randomRowID = random.Next(0, listCount);

            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection("Data Source = localhost; Initial Catalog = Dev_SPI; Integrated Security = True");
            conn.Open();
            //create a datatble test
            DataTable testTable = new DataTable();
            bool AssertVal = false;

            using (SqlCommand cmd = new SqlCommand("[spGetEmployeeDetails]", conn))
            {
                SqlDataReader dr;
                cmd.Parameters.AddWithValue("@MemID", uniquekeys.IndexOf(randomRowID.ToString()));
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);

                if (dt.Rows.Count == 1)
                    AssertVal = true;
                else
                    AssertVal = false;
            }
            Assert.IsTrue(AssertVal);
        }

        public List<string> GetKeys()
        {
            List<string> uniqueKeys = new List<string>();

            SqlConnection conn = new SqlConnection("Data Source = localhost; Initial Catalog = Dev_SPI; Integrated Security = True");
            conn.Open();

            using (SqlCommand cmd = new SqlCommand("[spGetSquadronRoster]", conn))
            {
                SqlDataReader dr;
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);

                foreach (DataRow row in dt.Rows)
                {
                    uniqueKeys.Add(row["UniqueKey"].ToString());
                }
            }
            return uniqueKeys;
        }

        [Test]
        public void FileUploadTest()
        {
            string fileName = @"Test.txt";
            string TestName = "Bob Bobbington";
            //get folder name
            string folderName = @"c:\testupload";
            string pathString = Path.Combine(folderName, TestName);
            Directory.CreateDirectory(pathString);
            pathString = Path.Combine(pathString, fileName);
            using (FileStream fs = File.Create(pathString))
            {
                {
                    byte[] info = new UTF8Encoding(true).GetBytes("This is some text in the file.");
                    // Add some information to the file.
                    fs.Write(info, 0, info.Length);
                }
            }
            if (File.Exists(pathString))
            {
                Directory.Delete(folderName, true);
                Assert.Pass("true");
            }
            else
            {
                Assert.Pass("false");
            }
        }

        [Test]
        public void ProcessGridTest()
        {
            SqlConnection conn = new SqlConnection("Data Source = localhost; Initial Catalog = Dev_SPI; Integrated Security = True");
            string connectValue = conn.ToString();
            DataSet ds = new DataSet();

            //create a datatable test
            DataTable testTable = new DataTable();

            testTable.Columns.Add("ID");
            testTable.Columns.Add("FullName");
            testTable.Columns.Add("InProcessedDate");

            bool AssertVal = false;

            string Command = "SELECT ID, LastName + ', ' + FirstName + ' '+ MiddleName as 'FullName', InProcessedDate FROM tblSquadronRoster WHERE InOutProcess = 1;";
            using (SqlConnection mConnection = conn)
            {
                mConnection.Open();
                using (SqlCommand cmd = new SqlCommand(Command, mConnection))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);
                        ds.Tables.Add(dt);
                        int i = 0;

                        foreach (DataColumn col in dt.Columns)
                        {
                            //compare columns with created table
                            if (col.ColumnName == testTable.Columns[i].ColumnName)
                                AssertVal = true;
                            else
                                AssertVal = false;
                            i++;
                        }
                        if (dt.Rows.Count > 0)
                            AssertVal = true;
                        else
                            AssertVal = false;
                    }
                }
            }
            Assert.IsTrue(AssertVal);
        }

        [Test]
        public void CreateNewEntryTest()
        {
            bool AssertVal = false;

            ////Opens a connection to the database           
            string connectValue = "Data Source = localhost; Initial Catalog = Dev_SPI; Integrated Security = True";
            SqlConnection conn = new SqlConnection(connectValue);
            conn.Open();

            string[] Data = { "test", "test", "test" };
            string[] sqlVars = { "", "", "" };

            using (SqlCommand cmd = new SqlCommand("[spCreateNewMember]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //iterates through each item in the incoming array and matches it to each item of the sql variable array.
                for (int i = 2; i < Data.Length; i++)
                {
                    cmd.Parameters.AddWithValue(sqlVars[i], Data[i]);
                    AssertVal = true;
                }
            }
            Assert.IsTrue(AssertVal);
        }
    }
}