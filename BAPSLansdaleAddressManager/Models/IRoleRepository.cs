using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IRoleRepository
    {
        Role CreateRole(Role role);
        void DeleteRole(Role role);
        Role EditRole(Role role);
        Role GetRole(int id);
        IEnumerable<Role> ListRoles();
    }
}