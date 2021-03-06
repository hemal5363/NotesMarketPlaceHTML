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

        public void ChangePassword(User model)
        {
            using (var context = new MarketPlaceEntities())
            {
                var user = context.Users.Where(u => u.ID == model.ID).FirstOrDefault();

                user.Password = model.Password;
                user.ModifiedDate = DateTime.Now;
                user.ModifiedBy = model.ID;

                context.SaveChanges();
            }
        }
    }
}
