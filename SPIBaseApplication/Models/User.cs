using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SPIBase.Models
{
    public class User
    {
        private string _firstName;
        private string _lastName;
        private string _middleName;
        private string _cacId;

        public string FirstName
        {
            get { return _firstName; }
            set { _firstName = value; }
        }

        public string LastName
        {
            get { return _lastName; }
            set { _lastName = value; }
        }

        public string MiddleName
        {
            get { return _middleName; }
            set { _middleName = value; }
        }

        public string CACId
        {
            get { return _cacId; }
            set { _cacId = value; }
        }
    }
}