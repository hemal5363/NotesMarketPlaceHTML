
using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDB.DBOparetions
{
    public class AdminRepository
    {
        public void AddUnpublish(int id, int aid, string remark, int status)
        {
            using (var context = new MarketPlaceEntities())
            {
                var note = context.SellerNotes.FirstOrDefault(n => n.ID == id);
                note.Status = status;
                note.AdminRemarks = remark;
                note.ActionedBy = aid;
                note.PublishedDate = DateTime.Now;
                note.ModifiedBy = aid;
                note.ModifiedDate = DateTime.Now;
                if(status != 10)
                { 
                    note.IsActive = false;
                }

                context.SaveChanges();
            };
        }

        public void ChangeStatus(int id, int aid, int status)
        {
            using (var context = new MarketPlaceEntities())
            {
                var note = context.SellerNotes.FirstOrDefault(n => n.ID == id);
                note.Status = status;
                note.ActionedBy = aid;
                note.PublishedDate = DateTime.Now;
                note.ModifiedBy = aid;
                note.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void RemoveReview(int id)
        {
            using (var context = new MarketPlaceEntities())
            {
                var review = context.SellerNotesReviews.FirstOrDefault(r => r.ID == id);

                context.SellerNotesReviews.Remove(review);
                context.SaveChanges();
            };
        }

        public void DeactiveateUserAccount(int id, int aid)
        {
            using (var context = new MarketPlaceEntities())
            {
                var user = context.Users.FirstOrDefault(u => u.ID == id);
                user.IsActive = false;
                user.ModifiedDate = DateTime.Now;
                user.ModifiedBy = aid;

                var notes = context.SellerNotes.Where(n => n.SellerID == id).ToList();
                foreach(var note in notes)
                {
                    note.Status = 11;
                    user.ModifiedDate = DateTime.Now;
                    user.ModifiedBy = aid;
                    note.IsActive = false;
                }

                context.SaveChanges();
            };
        }

        public void RemoveSpamReports(int id)
        {
            using (var context = new MarketPlaceEntities())
            {
                var review = context.SellerNotesReportedIssues.FirstOrDefault(r => r.ID == id);

                context.SellerNotesReportedIssues.Remove(review);
                context.SaveChanges();
            };
        }

        public void AddAdmin(int sId, string fName, string lName, string sEmail, string password, string pCode, string pNo)
        {
            using (var context = new MarketPlaceEntities())
            {
                var admin = new User()
                {
                    RoleID = 2,
                    FirstName = fName,
                    LastName = lName,
                    EmailID = sEmail,
                    Password = password,
                    IsEmailVerified = true,
                    CreatedDate = DateTime.Now,
                    CreatedBy = sId,
                    ModifiedDate = DateTime.Now,
                    ModifiedBy = sId                    
                };

                context.Users.Add(admin);
                context.SaveChanges();

                admin = context.Users.FirstOrDefault(a => a.EmailID == sEmail);

                var adminDetails = new UserProfile()
                {
                    UserID = admin.ID,
                    PhoneNumber_CountryCode = pCode,
                    PhoneNumber = pNo,
                    CreatedDate = DateTime.Now,
                    CreatedBy = sId,
                    ModifiedDate = DateTime.Now,
                    ModifiedBy = sId
                };

                context.UserProfiles.Add(adminDetails);
                context.SaveChanges();
            };
        }

        public void EditAdmin(int sId, int uId, string fName, string lName, string sEmail, string pCode, string pNo)
        {
            using (var context = new MarketPlaceEntities())
            {
                var adminProfiles = context.UserProfiles.FirstOrDefault(a => a.UserID == uId);

                adminProfiles.User.FirstName = fName;
                adminProfiles.User.LastName = lName;
                adminProfiles.User.EmailID = sEmail;
                adminProfiles.User.ModifiedBy = sId;
                adminProfiles.User.ModifiedDate = DateTime.Now;

                adminProfiles.PhoneNumber_CountryCode = pCode;
                adminProfiles.PhoneNumber = pNo;
                adminProfiles.ModifiedBy = sId;
                adminProfiles.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void Inactive(int id, int sId)
        {
            using (var context = new MarketPlaceEntities())
            {
                var admin = context.Users.FirstOrDefault(a => a.ID == id);

                admin.IsActive = false;
                admin.ModifiedBy = sId;
                admin.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void AddCategory(NoteCategoryModel model)
        {
            using (var context = new MarketPlaceEntities())
            {
                var category = new NoteCategory()
                { 
                    Name = model.Name,
                    Description = model.Description,
                    CreatedBy = model.CreatedBy,
                    CreatedDate = DateTime.Now,
                    ModifiedBy = model.ModifiedBy,
                    ModifiedDate = DateTime.Now,
                    IsActive = true
                };

                context.NoteCategories.Add(category);
                context.SaveChanges();
            };
        }

        public void EditCategory(NoteCategoryModel model)
        {
            using (var context = new MarketPlaceEntities())
            {
                var category = context.NoteCategories.FirstOrDefault(c => c.ID == model.ID);

                category.Name = model.Name;
                category.Description = model.Description;
                category.ModifiedBy = model.ModifiedBy;
                category.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void InactiveCategory(int id, int sId)
        {
            using (var context = new MarketPlaceEntities())
            {
                var category = context.NoteCategories.FirstOrDefault(a => a.ID == id);

                category.IsActive = false;
                category.ModifiedBy = sId;
                category.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void AddType(NoteTypeModel model)
        {
            using (var context = new MarketPlaceEntities())
            {
                var type = new NoteType()
                {
                    Name = model.Name,
                    Description = model.Description,
                    CreatedBy = model.CreatedBy,
                    CreatedDate = DateTime.Now,
                    ModifiedBy = model.ModifiedBy,
                    ModifiedDate = DateTime.Now,
                    IsActive = true
                };

                context.NoteTypes.Add(type);
                context.SaveChanges();
            };
        }

        public void EditType(NoteTypeModel model)
        {
            using (var context = new MarketPlaceEntities())
            {
                var type = context.NoteTypes.FirstOrDefault(c => c.ID == model.ID);

                type.Name = model.Name;
                type.Description = model.Description;
                type.ModifiedBy = model.ModifiedBy;
                type.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void InactiveType(int id, int sId)
        {
            using (var context = new MarketPlaceEntities())
            {
                var type = context.NoteTypes.FirstOrDefault(a => a.ID == id);

                type.IsActive = false;
                type.ModifiedBy = sId;
                type.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void AddCountry(CountryModel model)
        {
            using (var context = new MarketPlaceEntities())
            {
                var country = new Country()
                {
                    Name = model.Name,
                    CountryCode = model.CountryCode,
                    CreatedBy = model.CreatedBy,
                    CreatedDate = DateTime.Now,
                    ModifiedBy = model.ModifiedBy,
                    ModifiedDate = DateTime.Now,
                    IsActive = true
                };

                context.Countries.Add(country);
                context.SaveChanges();
            };
        }

        public void EditCountry(CountryModel model)
        {
            using (var context = new MarketPlaceEntities())
            {
                var country = context.Countries.FirstOrDefault(c => c.ID == model.ID);

                country.Name = model.Name;
                country.CountryCode = model.CountryCode;
                country.ModifiedBy = model.ModifiedBy;
                country.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void InactiveCountry(int id, int sId)
        {
            using (var context = new MarketPlaceEntities())
            {
                var country = context.Countries.FirstOrDefault(a => a.ID == id);

                country.IsActive = false;
                country.ModifiedBy = sId;
                country.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            };
        }

        public void EditSystemConfiguration(SystemConfiguration configuration)
        {
            using (var context = new MarketPlaceEntities())
            {
                var system = context.SystemConfigurations.FirstOrDefault(s => s.Key == configuration.Key);

                system.Value = configuration.Value;
                system.ModifiedBy = configuration.ModifiedBy;
                system.ModifiedDate = configuration.ModifiedDate;

                context.SaveChanges();
            };
        }

    }
}
