using SPIBase.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SPIBaseApplication.Models
{
    public class NewEmployee
    {
        public string Name { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public string SSN { get; set; }
        public string DODIDnum { get; set; }
    }
}