using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace SPIBase.Models
{
    public class SPIConnection
    {
        private string SPIConnectionString = ConfigurationManager.ConnectionStrings["SPIConnectionString"].ConnectionString;

        public SPIConnection()
        {
        }

        public string MyConnection
        {
            get { return SPIConnectionString; }
        }
    }
}