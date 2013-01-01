using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public class RoleRepository : IRoleRepository
    {
        private BAPSLansdaleEntities _entities = new BAPSLansdaleEntities();

        public string[] GetRolesForUser(string username)
        {
            var result = new List<string>();
            using (var entities = new BAPSLansdaleEntities())
            {
                var users = from u in entities.Users where (u.UserName == username) select u;
                if (users.Count() != 0)
                {
                    var user = users.FirstOrDefault();
                    var roles = from r in entities.Roles where (r.RoleId == user.RoleID) select r;
                    if (roles.Count() != 0)
                    {
                        var role = roles.FirstOrDefault();
                        if (role != null) result.Add(role.Name);
                    }
                }
            }
            return result.ToArray();
        }

        public bool IsUserInRole(string username, string roleName)
        {
            using (var entities = new BAPSLansdaleEntities())
            {
                var users = from u in entities.Users where (u.UserName == username) select u;
                if (users.Count() != 0)
                {
                    var user = users.FirstOrDefault();
                    var roles = from r in entities.Roles where (r.RoleId == user.RoleID) select r;
                    if (roles.Count() != 0)
                    {
                        var role = roles.FirstOrDefault();
                        if (role != null && role.Name == roleName) return true;
                    }
                }
            }
            return false;
        }

        public Role CreateRole(Role role)
        {
            _entities.AddToRoles(role);
            _entities.SaveChanges();
            return role;
        }

        public void DeleteRole(Role role)
        {
            var originalPerson = GetRole(role.RoleId);
            _entities.Roles.DeleteObject(role);
            _entities.SaveChanges();
        }

        public Role EditRole(Role role)
        {
            // Get original person object from database, no need to assig it to a variable
            GetRole(role.RoleId);
            _entities.Roles.ApplyCurrentValues(role);
            _entities.SaveChanges();
            return role;
        }

        public Role GetRole(int id)
        {
            return _entities.Roles.Single(p => p.RoleId == id);
        }

        public IEnumerable<Role> ListRoles()
        {
            return _entities.Roles.ToList();
        }
    }
}