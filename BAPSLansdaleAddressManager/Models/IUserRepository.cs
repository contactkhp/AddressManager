using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IUserRepository
    {
        User CreateUser(User user);
        void DeleteUser(User user);
        User EditUser(User user);
        User GetUser(int id);
        IEnumerable<User> ListUsers();
    }
}