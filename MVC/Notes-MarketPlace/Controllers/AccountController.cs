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

                user.success = "Your account has been successfully created.";
            }
            return View(user);
        }

        [NonAction]
        public void SendVerificationEmailLink(User user)
        {
            var verifyUrl = "/Account/Verification/" + user.ID.ToString();
            var link = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, verifyUrl);

            
            var toEmail = new MailAddress(user.EmailID);
            string subject = "Email verification form Notes-MarketPlace";

            string body = "Hello " + user.FirstName + ", <br /><br />" +
                   "Thank you for signing up with us.Please click on below link to verify your email address and to do login. <br /><br />" +
                   "<a href='" + link + "'>" + link + "</a> <br /><br />" +
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
            else if (userEmail.UserRole.Name == "Admin")
            {
                Session["Admin"] = userEmail.ID;
                user.Error = "This is Admin";
                return View(user);
            }

            FormsAuthentication.SetAuthCookie(userEmail.ID.ToString(), true);

            return RedirectToAction("SellNote", "Home");
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return View("Login");
        }

        [HttpGet]
        public ActionResult Verification(int ID)
        {
            var userEmail = marketPlaceEntities.Users.Where(u => u.ID == ID).FirstOrDefault();

            return View(userEmail);
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
            repository.ChangePassword(userEmail);

            SendTempPasswordEmail(userEmail);

            return RedirectToAction("Login");
        }

        [NonAction]
        private string CreateRandomPassword(int length = 8)
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
    }
}