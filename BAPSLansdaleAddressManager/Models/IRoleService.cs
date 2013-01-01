using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IRoleService
    {
        bool ValidateRole(Role role);
        bool CreateRole(Role role);
        bool DeleteRole(Role role);
        bool EditRole(Role role);
        Role GetRole(int id);
        IEnumerable<Role> ListRoles();
    }
}