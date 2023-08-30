using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SPIBase.Models;


namespace SPIBase.Services
{
    public class UserService : IUserService
    {
        public User GetUserByCacId(string cacId)
        {
            // todo: implement DB call to get User information (maybe use EF for this?)

            // for now, return fake user information.
            return new User()
            {
                CACId = cacId,
                LastName = "Doe",
                FirstName = "John",
                MiddleName = "Michael"
            };
        }
    }

    public interface IUserService
    {
        User GetUserByCacId(string cacId);
    }
}