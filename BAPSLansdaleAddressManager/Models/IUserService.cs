using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IUserService
    {
        bool ValidateUser(User user);
        bool CreateUser(User user);
        bool DeleteUser(User user);
        bool EditUser(User user);
        User GetUser(int id);
        IEnumerable<User> ListUsers();
    }
}