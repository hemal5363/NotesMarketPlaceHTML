using ProjectDB;
using ProjectDB.DBOparetions;
using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Notes_MarketPlace.Models;
using System.IO;
using System.Drawing;

namespace Notes_MarketPlace.Controllers
{
    public class AccountController : Controller
    {
        AccountRepository repository = null;
        MarketPlaceEntities marketPlaceEntities = null;

        public AccountController()
        {   
            repository = new AccountRepository();
            marketPlaceEntities = new MarketPlaceEntities();
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(UserModel user)
        {
            if (ModelState.IsValid)
            {
                var userDB = marketPlaceEntities.Users.Where(u => u.EmailID == user.EmailID).FirstOrDefault();

                if (userDB != null)
                {
                    user.Error = "You are alredy registered.";
                    return View(user);
                }

                user.RoleID = 1;
                repository.AddUser(user);

                var userEmail = marketPlaceEntities.Users.Where(u => u.EmailID == user.EmailID).FirstOrDefault();
                SendVerificationEmailLink(userEmail);

                user.Success = "Your account has been successfully created.";
            }
            return View(user);
        }

        [NonAction]
        public void SendVerificationEmailLink(User user)
        {
            var toEmail = new MailAddress(user.EmailID);
            string subject = "Email verification form Notes-MarketPlace";

            string body = 
                   "<div id='email-verification-page' style='background-color: #fff; height: 100%;'>" +
                        "<div id='email-verification' style='background-color: #f4f4f4;padding: 30px;width: 550px;'>" +
                            "<form action='https://localhost:44315/Account/Verification' method='post'>" +
                                "<input data-val='true' data-val-number='The field ID must be a number.' data-val-required='The ID field is required.' id='ID' name='ID' type='hidden' value='" + user.ID.ToString() + "'>" +
                                "<table>" +
                                    "<tr>" +
                                        "<td>" +
                                            "<div id='email-verification-logo' style='margin-bottom: 50px;'>" +
                                            "<img src='https://i.imgur.com/Fa4vPqE.png' />" +
                                            "</div>" +
                                        "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<td>" +
                                            "<div id='email-verification-heading' style='margin-bottom: 30px; color: #6255a5; line-height: 30px; font-weight: 600; font-size: 26px;'>" +
                                                "<h1> Email Verification </h1>" +
                                            "</div>" +
                                        "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<td>" +
                                            "<div id='email-verification-text' style='margin-bottom: 50px;'>" +
                                                "<h4 style='color: #333;margin-bottom: 20px;line-height: 22px;font-weight: 600;font-size: 18px;'> Dear " + user.FirstName + " </h4>" +
                                                "<p style='margin-bottom: 10px;color: #333;line-height: 20px;font-weight: 400;font-size: 16px;'> Thanks for signing</p>" +
                                                "<p style='margin-bottom: 10px;color: #333;line-height: 20px;font-weight: 400;font-size: 16px;'> Simply click below for email verification. </p>" +
                                            "</div>" +
                                        "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<td>" +
                                            "<div id='email-btn'>" +
                                                "<button type='submit' style='width: 540px;height: 50px;border-radius: 3px;font-weight: 600;font-size: 18px;color: #fff;background-color: #6255a5;text-transform: uppercase;display: inline-block;text-align: center;vertical-align: middle;'>Verify email address</button>" +
                                            "</div>" +
                                        "</td>" +
                                    "</tr>" +
                                "</table>" +
                            "</form>" +
                        "</div>" +
                    "</div> <br /><br />" +
                    "Regards, <br />" +
                   "Notes Marketplace <br /><br />";

            AutoEmailSend.SendEmail(toEmail, subject, body);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(UserModel user)
        {
            var userEmail = marketPlaceEntities.Users.Where(u => u.EmailID == user.EmailID).FirstOrDefault();

            if (userEmail == null)
            {
                user.Error = "Your Email Id is not register.";
                return View(user);
            }
            else if (userEmail.Password != user.Password)
            {
                user.Error = "The password that you've entered is incorrect.";
                return View(user);
            }
            else if (userEmail.IsEmailVerified == false)
            {
                user.Error = "Your Email Id is not verified, Please verified first.";
                return View(user);
            }
            else if (userEmail.IsActive == false)
            {
                user.Error = "Your account has deactivated.";
                return View(user);
            }
            else if (userEmail.UserRole.Name == "Admin" || userEmail.UserRole.Name == "Super Admin")
            {
                FormsAuthentication.SetAuthCookie(userEmail.ID.ToString(), user.RememberMe);
                return RedirectToAction("Index", "Admin");
            }

            FormsAuthentication.SetAuthCookie(userEmail.ID.ToString(), user.RememberMe);
            var check = marketPlaceEntities.UserProfiles.FirstOrDefault(u => u.UserID == userEmail.ID);
            if(check == null)
            {
                return RedirectToAction("UserProfile");
            }
            return RedirectToAction("SearchNote", "Home");
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return View("Login");
        }

        [HttpPost]
        public ActionResult Verification(User user)
        {
            repository.EmailVerification(user);

            return RedirectToAction("Login");
        }

        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(UserModel user)
        {
            var userEmail = marketPlaceEntities.Users.Where(u => u.EmailID == user.EmailID).FirstOrDefault();

            if (userEmail == null)
            {
                user.Error = "Your Email Id is not register.";
                return View(user);
            }

            userEmail.Password = CreateRandomPassword();
            repository.ChangePassword(userEmail.ID, userEmail.Password);

            SendTempPasswordEmail(userEmail);

            return RedirectToAction("Login");
        }

        [NonAction]
        public string CreateRandomPassword(int length = 8)
        {
            // Create a string of characters, numbers, special characters that allowed in the password  
            string validChars = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*?_-";
            Random random = new Random();

            // Select one random character at a time from the string  
            // and create an array of chars  
            char[] chars = new char[length];
            for (int i = 0; i < length; i++)
            {
                chars[i] = validChars[random.Next(0, validChars.Length)];
            }
            return new string(chars);
        }

        [NonAction]
        public void SendTempPasswordEmail(User user)
        {
            var toEmail = new MailAddress(user.EmailID);
            string subject = "New Temporary Password has been created for you";

            string body = "Hello, <br /><br />" +
                   "We have generated a new password for you <br />" +
                   "Password : " + user.Password + "<br /><br />" +
                   "Regards, <br />" +
                   "Notes Marketplace";

            AutoEmailSend.SendEmail(toEmail, subject, body);
        }

        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordViewModel changePassword)
        {
            if (!ModelState.IsValid)
            {
                return View(changePassword);
            }

            var id = Convert.ToInt32(User.Identity.Name);

            var user = marketPlaceEntities.Users.FirstOrDefault(u => u.ID == id);

            if (user.Password != changePassword.OldPassword)
            {
                changePassword.Error = "Your Old Password is Incorect.";

                return View(changePassword);
            }

            repository.ChangePassword(id, changePassword.NewPassword);

            return RedirectToAction("Login");
        }

        [Authorize(Roles = "Member")]
        public ActionResult UserProfile()
        {
            var id = Convert.ToInt32(User.Identity.Name);
            var user = marketPlaceEntities.Users.FirstOrDefault(u => u.ID == id);

            UserProfileModel ViewModel = new UserProfileModel();

            var result = marketPlaceEntities.UserProfiles.FirstOrDefault(u => u.UserID == id);
            if(result != null)
            {
                ViewModel = DBToModel(result);
            }
            else
            {
                ViewModel.UserID = id;
            }

            var ViewResult = new UserProfileViewModel()
            {
                UserProfileModel = ViewModel,
                Email = user.EmailID,
                FirstName = user.FirstName,
                LastName = user.LastName
            };

            return View(ViewResult);
        }

        [NonAction]
        public UserProfileModel DBToModel(UserProfile profile)
        {
            var result = new UserProfileModel()
            {
                ID = profile.ID,
                UserID = profile.UserID,
                DOB = profile.DOB,
                Gender = profile.Gender,
                SecondaryEmailAddress = profile.SecondaryEmailAddress,
                Picture = profile.ProfilePicture,
                PhoneNumber_CountryCode = profile.PhoneNumber_CountryCode,
                PhoneNumber = profile.PhoneNumber,
                AddressLine1 = profile.AddressLine1,
                AddressLine2 = profile.AddressLine2,
                City = profile.City,
                State = profile.State,
                ZipCode = profile.ZipCode,
                Country = profile.Country,
                University = profile.University,
                College = profile.College,
            };

            return result;
        }

        [Authorize(Roles = "Member")]
        [HttpPost]
        public ActionResult UserProfile(UserProfileViewModel model)
        {
            if(!ModelState.IsValid)
            {
                return View(model);
            }

            if(model.UserProfileModel.ProfilePicture != null)
            {
                string trigger = "/Members/" + model.UserProfileModel.UserID.ToString();

                var path = Server.MapPath(trigger);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                var fileName = "DP_" + DateTime.Now.ToString("hh-mm-ss") + ".jpg";
                var fullPath = Path.Combine(path, fileName);

                model.UserProfileModel.ProfilePicture.SaveAs(fullPath);

                model.UserProfileModel.Picture = trigger + "/" + fileName;
            }

            if(model.UserProfileModel.ID == 0)
            {
                var id = Convert.ToInt32(User.Identity.Name);
                model.UserProfileModel.UserID = id;
                repository.AddUserProfile(model.UserProfileModel, model.FirstName, model.LastName);
            }
            else
            {
                repository.EditUserProfile(model.UserProfileModel, model.FirstName, model.LastName);
            }

            return RedirectToAction("SearchNote", "Home");
        }

        [Authorize(Roles = "Super Admin,Admin")]
        public ActionResult AdminProfile()
        {
            var id = Convert.ToInt32(User.Identity.Name);
            var user = marketPlaceEntities.UserProfiles.FirstOrDefault(u => u.UserID == id);

            AdminProfileViewModel ViewResult = new AdminProfileViewModel()
            {
                ID = user.ID,
                UID = user.UserID,
                Picture = user.ProfilePicture,
                FirstName = user.User.FirstName,
                LastName = user.User.LastName,
                Email = user.User.EmailID,
                SecondaryEmail = user.SecondaryEmailAddress,
                PhoneNumber_CountryCode = user.PhoneNumber_CountryCode,
                PhoneNumber = user.PhoneNumber
            };

            return View(ViewResult);
        }

        [Authorize(Roles = "Super Admin,Admin")]
        [HttpPost]
        public ActionResult AdminProfile(AdminProfileViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            if (model.ProfilePicture != null)
            {
                string trigger = "/Members/" + model.UID.ToString();

                var path = Server.MapPath(trigger);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                var fileName = "DP_" + DateTime.Now.ToString("hh-mm-ss") + ".jpg";
                var fullPath = Path.Combine(path, fileName);

                model.ProfilePicture.SaveAs(fullPath);

                model.Picture = trigger + "/" + fileName;
            }

            repository.EditAdminProfile(model.ID, model.UID, model.FirstName, model.LastName, model.SecondaryEmail, model.PhoneNumber_CountryCode, model.PhoneNumber, model.Picture);

            return RedirectToAction("Index", "Admin");
        }
    }
}