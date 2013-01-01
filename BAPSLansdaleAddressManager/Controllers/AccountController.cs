using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using BAPSLansdaleAddressManager.Models;
using BAPSLansdaleAddressManager.Models.Validation;

namespace BAPSLansdaleAddressManager.Controllers
{
    public class AccountController : Controller
    {
        private IUserService _userService;
        private IRoleService _roleService;

        public AccountController()
        {
            _userService = new UserService(new ModelStateWrapper(ModelState));
            _roleService = new RoleService(new ModelStateWrapper(ModelState));
        }

        public AccountController(IUserService userService, IRoleService roleService)
        {
            _userService = userService;
            _roleService = roleService;
        }


        //
        // GET: /Account/LogOn

        public ActionResult Index()
        {
            return View();
        }
        

        //
        // GET: /Account/LogOn

        public ActionResult LogOn()
        {
            return View();
        }

        //
        // POST: /Account/LogOn

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (Membership.ValidateUser(model.UserName, model.Password))
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                    if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                        && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        var users = from u in _userService.ListUsers() where (u.UserName == model.UserName) select u;
                        if (users.Count() != 0)
                        {
                            var user = users.FirstOrDefault();
                            // If this is first LogOn from this user then force him to change password
                            if (user != null && user.NeedsPasswordChange)
                            {
                                return RedirectToAction("ChangePassword", "Account");
                            }
                            
                            return RedirectToAction("Index", "Person");
                        }
                        
                    }
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/LogOff

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Person");
        }

        //
        // GET: /Account/Register

        public ActionResult Register()
        {
            ViewBag.RoleId = new SelectList(_roleService.ListRoles(), "RoleId", "Name");
            return View();
        }

        //
        // POST: /Account/Register

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus;
                Membership.CreateUser(model.UserName, model.Password, model.Email, null, null, true, null, out createStatus);
                if (createStatus == MembershipCreateStatus.Success)
                {
                    var users = from u in _userService.ListUsers() where (u.UserName == model.UserName) select u;
                    if (users.Count() != 0)
                    {
                        var user = users.FirstOrDefault();
                        if (user != null)
                        {
                            user.RoleID = model.RoleId;
                            _userService.EditUser(user);
                        }
                    }
                    FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);
                    return RedirectToAction("Index", "Person");
                }
                else
                {
                    ModelState.AddModelError("", ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePassword

        [Authorize]
        public ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Account/ChangePassword

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                // ChangePassword will throw an exception rather
                // than return false in certain failure scenarios.
                bool changePasswordSucceeded;
                try
                {
                    var currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
                    changePasswordSucceeded = currentUser.ChangePassword(model.OldPassword, model.NewPassword);
                }
                catch (Exception)
                {
                    changePasswordSucceeded = false;
                }

                if (changePasswordSucceeded)
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePasswordSuccess

        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }

        //
        // GET: /Account/Users

        [Authorize]
        public ActionResult Users()
        {
            return View(_userService.ListUsers());
        }

        //
        // GET: /Account/UserDetails/5
        [Authorize]
        public ViewResult UserDetails(int id)
        {
            return View(_userService.GetUser(id));
        }


        //
        // GET: /Account/EditUser

        public ActionResult EditUser(int id)
        {
            var user = _userService.GetUser(id);
            ViewBag.RoleId = new SelectList(_roleService.ListRoles(), "RoleId", "Name", user.RoleID);
            return View(user);
        }

        //
        // POST: /Account/EditUser

        [HttpPost]
        public ActionResult EditUser(User user)
        {
            // Validation logic
            _userService.ValidateUser(user);
            if (!ModelState.IsValid)
                return View();

            try
            {
                _userService.EditUser(user);
                return RedirectToAction("Users", "Account");
            }
            catch
            {
                return View();
            }
        }

        [Authorize]
        public ActionResult DeleteUser(int id)
        {
            return View(_userService.GetUser(id));
        }

        //
        // POST: /Account/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            var user = _userService.GetUser(id);
            _userService.DeleteUser(user);
            return RedirectToAction("Users", "Account");
        }

        
        #region Status Codes
        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion
    }
}
