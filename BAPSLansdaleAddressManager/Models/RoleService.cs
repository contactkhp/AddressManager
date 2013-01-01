using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BAPSLansdaleAddressManager.Models.Validation;

namespace BAPSLansdaleAddressManager.Models
{
    public class RoleService : IRoleService
    {
        private IValidationDictionary _validationDictionary;
        private IRoleRepository _roleRepository;

        public RoleService(IValidationDictionary validationDictionary) 
            : this(validationDictionary, new RoleRepository())
        {}

        public RoleService(IValidationDictionary validationDictionary, IRoleRepository roleRepository)
        {
            _validationDictionary = validationDictionary;
            _roleRepository = roleRepository;
        }

        public bool ValidateRole(Role role)
        {
            if (role.Name.Trim().Length == 0)
                _validationDictionary.AddError("RoleName", "Role name is required.");
            return _validationDictionary.IsValid;
        }

        public bool CreateRole(Role role)
        {
            // Validation logic
            if (!ValidateRole(role))
                return false;

            // Database logic
            try
            {
                _roleRepository.CreateRole(role);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool DeleteRole(Role role)
        {
            try
            {
                _roleRepository.DeleteRole(role);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool EditRole(Role role)
        {
            // Validation logic
            if (!ValidateRole(role))
                return false;

            // Database logic
            try
            {
                _roleRepository.EditRole(role);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public Role GetRole(int id)
        {
            return _roleRepository.GetRole(id);
        }

        public IEnumerable<Role> ListRoles()
        {
            return _roleRepository.ListRoles();
        }
    }
}