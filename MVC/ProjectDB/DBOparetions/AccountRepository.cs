using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDB.DBOparetions
{
    public class AccountRepository
    {
        public void AddUser(UserModel model)
        {
            using (var context = new MarketPlaceEntities())
            {
                User us = new User()
                {
                    ID = model.ID,
                    RoleID = model.RoleID,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    EmailID = model.EmailID,
                    Password = model.Password
                };

                context.Users.Add(us);

                context.SaveChanges();
            }
        }

        public void EmailVerification(User model)
        {
            using (var context = new MarketPlaceEntities())
            {
                var user = context.Users.Where(u => u.ID == model.ID).FirstOrDefault();

                user.IsEmailVerified = true;
                user.ModifiedDate = DateTime.Now;
                user.ModifiedBy = model.ID;

                context.SaveChanges();
            }
        }

        public void ChangePassword(int id, string password)
        {
            using (var context = new MarketPlaceEntities())
            {
                var user = context.Users.Where(u => u.ID == id).FirstOrDefault();

                user.Password = password;
                user.ModifiedDate = DateTime.Now;
                user.ModifiedBy = id;

                context.SaveChanges();
            }
        }

        public void AddUserProfile(UserProfileModel model, string fName, string lName)
        {
            using (var context = new MarketPlaceEntities())
            {
                var result = new UserProfile()
                {
                    UserID = model.UserID,
                    DOB = model.DOB,
                    Gender = model.Gender,
                    PhoneNumber_CountryCode = model.PhoneNumber_CountryCode,
                    PhoneNumber = model.PhoneNumber,
                    ProfilePicture = model.Picture,
                    AddressLine1 = model.AddressLine1,
                    AddressLine2 = model.AddressLine2,
                    City = model.City,
                    State = model.State,
                    ZipCode = model.ZipCode,
                    Country = model.Country,
                    University = model.University,
                    College = model.College,
                    CreatedDate = DateTime.Now,
                    CreatedBy = model.UserID,
                    ModifiedBy = model.UserID,
                    ModifiedDate = DateTime.Now
                };

                var user = context.Users.FirstOrDefault(u => u.ID == model.UserID);
                user.FirstName = fName;
                user.LastName = lName;
                user.ModifiedDate = DateTime.Now;

                context.UserProfiles.Add(result);
                context.SaveChanges();
            };
        }

        public void EditUserProfile(UserProfileModel model, string fName, string lName)
        {
            using(var context = new MarketPlaceEntities())
            {
                var profile = context.UserProfiles.FirstOrDefault(u => u.ID == model.ID);
                if(model.DOB != null)
                { 
                    profile.DOB = model.DOB;
                }
                profile.Gender = model.Gender;
                profile.PhoneNumber_CountryCode = model.PhoneNumber_CountryCode;
                profile.PhoneNumber = model.PhoneNumber;
                profile.ProfilePicture = model.Picture;
                profile.AddressLine1 = model.AddressLine1;
                profile.AddressLine2 = model.AddressLine2;
                profile.City = model.City;
                profile.State = model.State;
                profile.ZipCode = model.ZipCode;
                profile.Country = model.Country;
                profile.University = model.University;
                profile.College = model.College;
                profile.ModifiedBy = model.UserID;
                profile.ModifiedDate = DateTime.Now;

                var user = context.Users.FirstOrDefault(u => u.ID == model.UserID);
                user.FirstName = fName;
                user.LastName = lName;
                user.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void EditAdminProfile(int id, int uid, string fName, string lName, string sEmail, string pCode, string pNo, string picture)
        {
            using (var context = new MarketPlaceEntities())
            {
                var profile = context.UserProfiles.FirstOrDefault(u => u.ID == id);
                profile.User.FirstName = fName;
                profile.User.LastName = lName;
                profile.User.ModifiedBy = uid;
                profile.User.ModifiedDate = DateTime.Now;

                profile.SecondaryEmailAddress = sEmail;
                profile.PhoneNumber_CountryCode = pCode;
                profile.PhoneNumber = pNo;
                profile.ProfilePicture = picture;
                profile.ModifiedBy = uid;
                profile.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

    }
}
