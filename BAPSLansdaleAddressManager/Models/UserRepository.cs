using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Security.Cryptography;

namespace BAPSLansdaleAddressManager.Models
{
    public class UserRepository: IUserRepository
    {
        private BAPSLansdaleEntities _entities = new BAPSLansdaleEntities();

        private static string CreateSalt()
        {
            var rng = new RNGCryptoServiceProvider();
            var buff = new byte[32];
            rng.GetBytes(buff);

            return Convert.ToBase64String(buff);
        }

        private static string CreatePasswordHash(string password, string salt)
        {
            // merge password and salt together
            string sHashWithSalt = password + salt;
            // convert this merged value to a byte array
            byte[] saltedHashBytes = Encoding.UTF8.GetBytes(sHashWithSalt);
            
            // use hash algorithm to compute the hash
            HashAlgorithm algorithm = new SHA512Managed();
            
            // convert merged bytes to a hash as byte array
            byte[] hash = algorithm.ComputeHash(saltedHashBytes);
            // return the has as a base 64 encoded string
            return Convert.ToBase64String(hash);
        }

        private static int GetDefaultRoleId(BAPSLansdaleEntities entities)
        {
            var result = 0;
            foreach (var role in entities.Roles)
            {
                if (role.Name == "DBUser")
                {
                    result = role.RoleId;
                }
            }
            return result;
        }

        public MembershipUser CreateUser(string username, string password, string email)
        {
            using (var entities = new BAPSLansdaleEntities())
            {
                var user = new User();
                user.UserName = username;
                user.PasswordSalt = CreateSalt();
                user.Password = CreatePasswordHash(password, user.PasswordSalt);
                user.Email = email;
                user.LastLogin = DateTime.Now;
                user.Active = true;
                user.NeedsPasswordChange = true;
                user.RoleID = GetDefaultRoleId(entities);

                entities.AddToUsers(user);
                entities.SaveChanges();

                return GetUser(username);
            }
        }

        public bool ValidateUser(string username, string password)
        {
            var result = false;
            using (var entities = new BAPSLansdaleEntities())
            {
                var users = from u in entities.Users where (u.UserName == username) select u;
                if (users.Count() != 0)
                {
                    var user = users.FirstOrDefault();
                    if (user != null)
                    {
                        if (!user.Active)
                            throw new Exception(
                                "User found but it is marked inactive in the database. Please contact your database administrator karyakar.");

                        if (user.Password == CreatePasswordHash(password, user.PasswordSalt) && user.Active)
                        {
                            result = true;
                        }
                    }
                }
            }
            return result;
        }

        public string GetUserNameByEmail(string email)
        {
            using (var entities = new BAPSLansdaleEntities())
            {
                var users = from u in entities.Users where (u.Email == email) select u;

                if (users.Count() != 0)
                {
                    var user = users.FirstOrDefault();
                    return user != null ? user.UserName : string.Empty;
                }
                else
                {
                    return string.Empty;
                }
            }
        }

        public MembershipUser GetUser(string username)
        {
            using (var entities = new BAPSLansdaleEntities())
            {
                var users = from u in entities.Users where (u.UserName == username) select u;

                if (users.Count() != 0)
                {
                    var dbuser = users.FirstOrDefault();

                    var _username = dbuser.UserName;
                    var _providerUserKey = dbuser.UserId;
                    var _email = dbuser.Email;
                    var _passwordQuestion = string.Empty;
                    var _comment = string.Empty;
                    var _isApproved = true;
                    var _isLockedOut = false;
                    var _creationDate = DateTime.Now;
                    var _lastLoginDate = (DateTime)dbuser.LastLogin;
                    var _lastActivityDate = DateTime.Now;
                    var _lastPasswordChangedDate = DateTime.Now;
                    var _lastLockedOutDate = DateTime.Now;

                    var user = new MembershipUser("CustomMembershipProvider",
                                                              _username,
                                                              _providerUserKey,
                                                              _email,
                                                              _passwordQuestion,
                                                              _comment,
                                                              _isApproved,
                                                              _isLockedOut,
                                                              _creationDate,
                                                              _lastLoginDate,
                                                              _lastActivityDate,
                                                              _lastPasswordChangedDate,
                                                              _lastLockedOutDate);

                    return user;
                }
                else
                {
                    return null;
                }
            }
        }

        public bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            var result = false;
            if (ValidateUser(username, oldPassword))
            {
                using (var entities = new BAPSLansdaleEntities())
                {
                    var users = from u in entities.Users where (u.UserName == username) select u;
                    if (users.Count() != 0)
                    {
                        var user = users.FirstOrDefault();
                        if (user != null)
                        {
                            user.PasswordSalt = CreateSalt();
                            user.Password = CreatePasswordHash(newPassword, user.PasswordSalt);
                            user.NeedsPasswordChange = false;
                            entities.SaveChanges();
                            result = true;
                        }

                    }
                }
            }
            return result;
        }

        public User CreateUser(User user)
        {
            _entities.AddToUsers(user);
            _entities.SaveChanges();
            return user;
        }

        public void DeleteUser(User user)
        {
            _entities.Users.DeleteObject(user);
            _entities.SaveChanges();
        }

        public User EditUser(User user)
        {
            // Get original user object from database, no need to assig it to a variable
            GetUser(user.UserId);
            _entities.Users.ApplyCurrentValues(user);
            _entities.SaveChanges();
            return user;
        }

        public User GetUser(int id)
        {
            return _entities.Users.Single(p => p.UserId == id);
        }

        public IEnumerable<User> ListUsers()
        {
            return _entities.Users.ToList();
        }
    }
}