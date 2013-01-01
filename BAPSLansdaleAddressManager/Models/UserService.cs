using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BAPSLansdaleAddressManager.Models.Validation;

namespace BAPSLansdaleAddressManager.Models
{
    public class UserService : IUserService
    {
        private IValidationDictionary _validationDictionary;
        private IUserRepository _userRepository;

        public UserService(IValidationDictionary validationDictionary) 
            : this(validationDictionary, new UserRepository())
        {}

        public UserService(IValidationDictionary validationDictionary, IUserRepository userRepository)
        {
            _validationDictionary = validationDictionary;
            _userRepository = userRepository;
        }
        
        public bool ValidateUser(User user)
        {
            if (user.UserName.Trim().Length == 0)
                _validationDictionary.AddError("UserName", "Username is required.");
            if (user.Password.Trim().Length == 0)
                _validationDictionary.AddError("Password", "Password is required.");
            return _validationDictionary.IsValid;
        }

        public bool CreateUser(User user)
        {
            // Validation logic
            if (!ValidateUser(user))
                return false;

            // Database logic
            try
            {
                _userRepository.CreateUser(user);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool DeleteUser(User user)
        {
            try
            {
                _userRepository.DeleteUser(user);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool EditUser(User user)
        {
            // Validation logic
            if (!ValidateUser(user))
                return false;

            // Database logic
            try
            {
                _userRepository.EditUser(user);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public User GetUser(int userId)
        {
            return _userRepository.GetUser(userId);
        }

        public IEnumerable<User> ListUsers()
        {
            return _userRepository.ListUsers();
        }
    }
}