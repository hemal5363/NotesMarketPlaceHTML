using Notes_MarketPlace.Models;
using ProjectDB;
using ProjectDB.DBOparetions;
using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace Notes_MarketPlace.Controllers
{
    [Authorize(Roles = "Super Admin,Admin")]
    public class AdminController : Controller
    {
        MarketPlaceEntities marketPlaceEntities = null;
        AdminRepository repository = null;

        public AdminController()
        {
            marketPlaceEntities = new MarketPlaceEntities();
            repository = new AdminRepository();
        }

        public ActionResult DeleteReview(int id, int nid)
        {
            repository.RemoveReview(id);
            return RedirectToAction("NoteDetails/" + nid.ToString(), "Home");
        }

        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult IndexPublishedNotesPartial(string search, string month, int pageNumber = 1)
        {
            var result = marketPlaceEntities.SellerNotes.Where(n => n.Status == 9 && n.IsActive == true).ToList();

            if (search != null)
                result = result.Where(s => s.Title.ToUpper().Contains(search) || s.Title.ToLower().Contains(search) || s.NoteCategory.Name.ToUpper().Contains(search) || s.NoteCategory.Name.ToLower().Contains(search) || s.User.FirstName.ToUpper().Contains(search) || s.User.FirstName.ToLower().Contains(search) || s.User.LastName.ToUpper().Contains(search) || s.User.LastName.ToLower().Contains(search) || s.SellingPrice.ToString().ToUpper().Contains(search) || s.SellingPrice.ToString().ToLower().Contains(search) || s.PublishedDate.ToString().ToUpper().Contains(search) || s.PublishedDate.ToString().ToLower().Contains(search)).ToList();
            if (!string.IsNullOrEmpty(month))
                result = result.Where(s => s.PublishedDate.Value.ToString("MMMM") == month).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            var resultView = new AdminIndexPublishedNotesViewModel()
            {
                SellerNote = result
            };

            return PartialView("_IndexPublishedNotesPartial", resultView);
        }

        public FileResult NoteDownload(int id)
        {
            var result = marketPlaceEntities.SellerNotesAttachements.FirstOrDefault(n => n.NoteID == id);

            string path = Server.MapPath(result.FilePath);
            string fullPath = Path.Combine(path);
            string fName = result.SellerNote.Title + ".pdf";

            return File(fullPath, ".pdf", fName);
        }

        [HttpPost]
        public ActionResult AddUnpublish(AdminIndexPublishedNotesViewModel model)
        {
            if (ModelState.IsValid)
            {
                var id = Convert.ToInt32(User.Identity.Name);
                if (model.status == 10)
                {
                    repository.AddUnpublish(model.id, id, model.Remarks, model.status);
                    return RedirectToAction("NoteUnderReview");
                }
                else
                {
                    repository.AddUnpublish(model.id, id, model.Remarks, 11);
                    SendRemovedNoteMail(marketPlaceEntities.SellerNotes.FirstOrDefault(s => s.ID == model.id));
                }
            }
            return RedirectToAction("Index");
        }

        [NonAction]
        public void SendRemovedNoteMail(SellerNote note)
        {
            var toEmail = new MailAddress(note.User.EmailID);
            string subject = "Sorry! We need to remove your notes from our portal.";

            string body = "Hello " + note.User.FirstName + ", <br /><br />" +
                   "We want to inform you that, your note " + note.Title + " has been removed from the portal. <br />" +
                   "Please find our remarks as below - <br />" +
                   note.AdminRemarks + " <br /><br />" +
                   "Regards, <br />" +
                   "Notes Marketplace";

            AutoEmailSend.SendEmail(toEmail, subject, body);
        }

        public ActionResult NoteUnderReview(string sellerName)
        {
            var result = marketPlaceEntities.SellerNotes.Where(r => r.Status == 7 || r.Status == 8 && r.IsActive == true).ToList();
            ViewBag.sellerName = sellerName;

            return View(result);
        }

        public PartialViewResult NoteUnderReviewPartial(string search, string seller, int pageNumber = 1)
        {
            var result = marketPlaceEntities.SellerNotes.Where(r => r.Status == 7 || r.Status == 8 && r.IsActive == true).ToList();

            if (search != null)
                result = result.Where(s => s.Title.ToUpper().Contains(search) || s.Title.ToLower().Contains(search) || s.NoteCategory.Name.ToUpper().Contains(search) || s.NoteCategory.Name.ToLower().Contains(search) || s.User.FirstName.ToUpper().Contains(search) || s.User.FirstName.ToLower().Contains(search) || s.User.LastName.ToUpper().Contains(search) || s.User.LastName.ToLower().Contains(search) || s.CreatedDate.ToString().ToUpper().Contains(search) || s.CreatedDate.ToString().ToLower().Contains(search)).ToList();
            if (!string.IsNullOrEmpty(seller))
                result = result.Where(s => s.User.FirstName == seller).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            var resultView = new AdminIndexPublishedNotesViewModel()
            {
                SellerNote = result,
                status = 10
            };

            return PartialView("_NoteUnderReviewPartial", resultView);
        }

        public ActionResult ChangerStatus(int id, int status)
        {
            var aid = Convert.ToInt32(User.Identity.Name);
            repository.ChangeStatus(id, aid, status);

            return RedirectToAction("NoteUnderReview");
        }

        public ActionResult PublishedNotes(string sellerName)
        {
            var result = marketPlaceEntities.SellerNotes.Where(r => r.Status == 9 && r.IsActive == true).ToList();
            ViewBag.sellerName = sellerName;

            return View(result);
        }

        public PartialViewResult PublishedNotesPartial(string search, string seller, int pageNumber = 1)
        {
            var result = marketPlaceEntities.SellerNotes.Where(n => n.Status == 9 && n.IsActive == true).ToList();

            if (search != null)
                result = result.Where(s => s.Title.ToUpper().Contains(search) || s.Title.ToLower().Contains(search) || s.NoteCategory.Name.ToUpper().Contains(search) || s.NoteCategory.Name.ToLower().Contains(search) || s.User.FirstName.ToUpper().Contains(search) || s.User.FirstName.ToLower().Contains(search) || s.User.LastName.ToUpper().Contains(search) || s.User.LastName.ToLower().Contains(search) || s.SellingPrice.ToString().ToUpper().Contains(search) || s.SellingPrice.ToString().ToLower().Contains(search) || s.PublishedDate.ToString().ToUpper().Contains(search) || s.PublishedDate.ToString().ToLower().Contains(search)).ToList();
            if (!string.IsNullOrEmpty(seller))
                result = result.Where(s => s.User.FirstName == seller).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            var resultView = new AdminIndexPublishedNotesViewModel()
            {
                SellerNote = result
            };

            return PartialView("_PublishedNotesPartial", resultView);
        }

        public ActionResult DownloadedNote(string noteName, string buyerName)
        {
            var result = marketPlaceEntities.Downloads.Where(r => r.IsAttachmentDownloaded == true).ToList();
            ViewBag.noteName = noteName;
            ViewBag.buyerName = buyerName;

            return View(result);
        }

        public PartialViewResult DownloadedNotesPartial(string search, string note, string seller, string buyer, int pageNumber = 1)
        {
            var result = marketPlaceEntities.Downloads.Where(r => r.IsAttachmentDownloaded == true).ToList();

            if (search != null)
                result = result.Where(s => s.NoteTitle.ToUpper().Contains(search) || s.NoteTitle.ToLower().Contains(search) || s.NoteCategory.ToUpper().Contains(search) || s.NoteCategory.ToLower().Contains(search) || s.User.FirstName.ToUpper().Contains(search) || s.User.FirstName.ToLower().Contains(search) || s.User.LastName.ToUpper().Contains(search) || s.User.LastName.ToLower().Contains(search) || s.User1.FirstName.ToUpper().Contains(search) || s.User1.FirstName.ToLower().Contains(search) || s.User1.LastName.ToUpper().Contains(search) || s.User1.LastName.ToLower().Contains(search) || s.PurchasedPrice.ToString().ToUpper().Contains(search) || s.PurchasedPrice.ToString().ToLower().Contains(search) || s.AttachmentDownloadedDate.ToString().ToUpper().Contains(search) || s.AttachmentDownloadedDate.ToString().ToLower().Contains(search)).ToList();
            if (!string.IsNullOrEmpty(note))
                result = result.Where(s => s.NoteTitle == note).ToList();
            if (!string.IsNullOrEmpty(seller))
                result = result.Where(s => s.User.FirstName == seller).ToList();
            if (!string.IsNullOrEmpty(buyer))
                result = result.Where(s => s.User1.FirstName == buyer).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_DownloadedNotesPartial", result);
        }

        public ActionResult RejectedNotes()
        {
            var result = marketPlaceEntities.SellerNotes.Where(r => r.Status == 10 && r.IsActive == true).ToList();
            return View(result);
        }

        public PartialViewResult RejectedNotesPartial(string search, string seller, int pageNumber = 1)
        {
            var result = marketPlaceEntities.SellerNotes.Where(n => n.Status == 10 && n.IsActive == true).ToList();

            if (search != null)
                result = result.Where(s => s.Title.ToUpper().Contains(search) || s.Title.ToLower().Contains(search) || s.NoteCategory.Name.ToUpper().Contains(search) || s.NoteCategory.Name.ToLower().Contains(search) || s.User.FirstName.ToUpper().Contains(search) || s.User.FirstName.ToLower().Contains(search) || s.User.LastName.ToUpper().Contains(search) || s.User.LastName.ToLower().Contains(search) || s.SellingPrice.ToString().ToUpper().Contains(search) || s.SellingPrice.ToString().ToLower().Contains(search) || s.PublishedDate.ToString().ToUpper().Contains(search) || s.PublishedDate.ToString().ToLower().Contains(search)).ToList();
            if (!string.IsNullOrEmpty(seller))
                result = result.Where(s => s.User.FirstName == seller).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_RejectedNotesPartial", result);
        }

        public ActionResult Members()
        {
            var result = marketPlaceEntities.Users.Where(r => r.RoleID == 1 && r.IsActive == true).ToList();
            return View(result);
        }

        public PartialViewResult MembersPartial(string search, int pageNumber = 1)
        {
            var result = marketPlaceEntities.Users.Where(r => r.RoleID == 1 && r.IsActive == true).ToList();

            if (search != null)
                result = result.Where(s => s.FirstName.ToUpper().Contains(search) || s.FirstName.ToLower().Contains(search) || s.LastName.ToUpper().Contains(search) || s.LastName.ToLower().Contains(search) || s.EmailID.ToString().ToUpper().Contains(search) || s.EmailID.ToString().ToLower().Contains(search) || s.CreatedDate.ToString().ToUpper().Contains(search) || s.CreatedDate.ToString().ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_MembersPartial", result);
        }

        public ActionResult DeactiveateUser(int id)
        {
            var aid = Convert.ToInt32(User.Identity.Name);
            repository.DeactiveateUserAccount(id, aid);

            return RedirectToAction("Members");
        }

        public ActionResult MemberDetails(int id)
        {
            var result = marketPlaceEntities.Users.FirstOrDefault(r => r.ID == id);

            return View(result);
        }

        public PartialViewResult MemberDetailsPartial(int id, int pageNumber = 1)
        {
            var result = marketPlaceEntities.SellerNotes.Where(n => n.SellerID == id && n.Status != 6).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_MemberDetailsPartial", result);
        }

        public ActionResult SpamReports()
        {
            var result = marketPlaceEntities.SellerNotesReportedIssues.ToList();

            return View(result);
        }

        public PartialViewResult SpamReportsPartial(string search, int pageNumber = 1)
        {
            var result = marketPlaceEntities.SellerNotesReportedIssues.ToList();

            if (search != null)
                result = result.Where(s => s.User.FirstName.ToUpper().Contains(search) || s.User.FirstName.ToLower().Contains(search) || s.User.LastName.ToUpper().Contains(search) || s.User.LastName.ToLower().Contains(search) || s.SellerNote.Title.ToString().ToUpper().Contains(search) || s.SellerNote.Title.ToString().ToLower().Contains(search) || s.SellerNote.NoteCategory.Name.ToString().ToUpper().Contains(search) || s.SellerNote.NoteCategory.Name.ToString().ToLower().Contains(search) || s.CreatedDate.ToString().ToUpper().Contains(search) || s.CreatedDate.ToString().ToLower().Contains(search) || s.Remarks.ToString().ToUpper().Contains(search) || s.Remarks.ToString().ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_SpamReportsPartial", result);
        }

        public ActionResult DeleteSpamReport(int id)
        {
            repository.RemoveSpamReports(id);

            return RedirectToAction("SpamReports");
        }

        [Authorize(Roles = "Super Admin")]
        public ActionResult ManageSystemConfiguration()
        {
            var result = new SystemConfigurationViewModel();

            result.SupportEmail = marketPlaceEntities.SystemConfigurations.FirstOrDefault(s => s.Key == "Support emails").Value;

            result.SupportPhoneNumber = marketPlaceEntities.SystemConfigurations.FirstOrDefault(s => s.Key == "Support phone number").Value;

            result.EmailAddress = marketPlaceEntities.SystemConfigurations.FirstOrDefault(s => s.Key == "Email Address").Value;

            result.FacebookURL = marketPlaceEntities.SystemConfigurations.FirstOrDefault(s => s.Key == "Facebook").Value;

            result.TwitterURL = marketPlaceEntities.SystemConfigurations.FirstOrDefault(s => s.Key == "Twitter").Value;

            result.LinkedinURL = marketPlaceEntities.SystemConfigurations.FirstOrDefault(s => s.Key == "Linkedin").Value;

            return View(result);
        }

        [Authorize(Roles = "Super Admin")]
        [HttpPost]
        public ActionResult ManageSystemConfiguration(SystemConfigurationViewModel model)
        {
            if(!ModelState.IsValid)
            {
                return View(model);
            }

            var id = Convert.ToInt32(User.Identity.Name);

            List<SystemConfiguration> systems = new List<SystemConfiguration>();

            SystemConfiguration system = new SystemConfiguration();

            system.ModifiedDate = DateTime.Now;
            system.ModifiedBy = id;

            system.Key = "Support emails";
            system.Value = model.SupportEmail;
            repository.EditSystemConfiguration(system);

            system.Key = "Support phone number";
            system.Value = model.SupportPhoneNumber;
            repository.EditSystemConfiguration(system);

            system.Key = "Email Address";
            system.Value = model.EmailAddress;
            repository.EditSystemConfiguration(system);

            system.Key = "Facebook";
            system.Value = model.FacebookURL;
            repository.EditSystemConfiguration(system);

            system.Key = "Twitter";
            system.Value = model.TwitterURL;
            systems.Add(system);
            repository.EditSystemConfiguration(system);

            system.Key = "Linkedin";
            system.Value = model.LinkedinURL;
            repository.EditSystemConfiguration(system);

            if (model.DefaultImageForNote != null)
            {
                string trigger = "/Members/SystemConfiguration";

                var path = Server.MapPath(trigger);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                var fileName = Path.GetFileName(model.DefaultImageForNote.FileName);
                var fullPath = Path.Combine(path, fileName);

                model.DefaultImageForNote.SaveAs(fullPath);

                system.Key = "Image";
                system.Value = trigger + "/" + fileName;
                repository.EditSystemConfiguration(system);
            }

            if (model.DefaultProfilePicture != null)
            {
                string trigger = "/Members/SystemConfiguration";

                var path = Server.MapPath(trigger);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                var fileName = Path.GetFileName(model.DefaultProfilePicture.FileName);
                var fullPath = Path.Combine(path, fileName);

                model.DefaultProfilePicture.SaveAs(fullPath);

                system.Key = "Picture";
                system.Value = trigger + "/" + fileName;
                repository.EditSystemConfiguration(system);
            }

            return RedirectToAction("Index");
        }

        [Authorize(Roles = "Super Admin")]
        public ActionResult ManageAdministrator()
        {
            var result = marketPlaceEntities.Users.Where(r => r.RoleID == 2).ToList();

            return View(result);
        }

        [Authorize(Roles = "Super Admin")]
        public PartialViewResult ManageAdministratorPartial(string search, int pageNumber = 1)
        {
            var result = marketPlaceEntities.Users.Where(r => r.RoleID == 2).ToList();

            if (search != null)
                result = result.Where(s => s.FirstName.ToUpper().Contains(search) || s.FirstName.ToLower().Contains(search) || s.LastName.ToUpper().Contains(search) || s.LastName.ToLower().Contains(search) || s.EmailID.ToUpper().Contains(search) || s.EmailID.ToLower().Contains(search) || s.CreatedDate.ToString().ToUpper().Contains(search) || s.CreatedDate.ToString().ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_ManageAdministratorPartial", result);
        }

        [Authorize(Roles = "Super Admin")]
        public ActionResult AddAdministrator()
        {
            var id = Convert.ToInt32(User.Identity.Name);
            var result = new AddAdminViewModel()
            {
                SID = id
            };
            return View(result);
        }

        [Authorize(Roles = "Super Admin")]
        [HttpPost]
        public ActionResult AddAdministrator(AddAdminViewModel model)
        {
            if(!ModelState.IsValid)
            {
                return View(model);
            }

            var account = new AccountController();

            if (model.UID == 0)
            { 
                var tPassword = account.CreateRandomPassword();

                repository.AddAdmin(model.SID, model.FirstName, model.LastName, model.Email, tPassword, model.PhoneNumber_CountryCode, model.PhoneNumber);

                var admin = marketPlaceEntities.Users.FirstOrDefault(a => a.EmailID == model.Email);

                account.SendTempPasswordEmail(admin);
            }
            else
            {
                repository.EditAdmin(model.SID, model.UID, model.FirstName, model.LastName, model.Email, model.PhoneNumber_CountryCode, model.PhoneNumber);
            }

            return RedirectToAction("ManageAdministrator");
        }

        [Authorize(Roles = "Super Admin")]
        public ActionResult EditAdministrator(int id)
        {
            var sid = Convert.ToInt32(User.Identity.Name);

            var admin = marketPlaceEntities.Users.FirstOrDefault(a => a.ID == id);

            var result = new AddAdminViewModel()
            {
                SID = sid,
                UID = admin.ID,
                FirstName = admin.FirstName,
                LastName = admin.LastName,
                Email = admin.EmailID,
                PhoneNumber_CountryCode = admin.UserProfiles.FirstOrDefault().PhoneNumber_CountryCode,
                PhoneNumber = admin.UserProfiles.FirstOrDefault().PhoneNumber
            };

            return View("AddAdministrator", result);
        }

        [Authorize(Roles = "Super Admin")]
        public ActionResult DeleteAdministrator(int id)
        {
            var sid = Convert.ToInt32(User.Identity.Name);

            repository.Inactive(id, sid);

            return RedirectToAction("ManageAdministrator");
        }

        public ActionResult ManageCategory()
        {
            var result = marketPlaceEntities.NoteCategories.ToList();

            return View(result);
        }

        public PartialViewResult ManageCategoryPartial(string search, int pageNumber = 1)
        {
            var result = marketPlaceEntities.NoteCategories.ToList();

            if (search != null)
                result = result.Where(s => s.Name.ToUpper().Contains(search) || s.Name.ToLower().Contains(search) || s.Description.ToUpper().Contains(search) || s.Description.ToLower().Contains(search) || s.CreatedDate.ToString().ToUpper().Contains(search) || s.CreatedDate.ToString().ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_ManageCategoryPartial", result);
        }

        public ActionResult AddCategory()
        {
            var result = new NoteCategoryModel();
            
            return View(result);
        }

        [HttpPost]
        public ActionResult AddCategory(NoteCategoryModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var id = Convert.ToInt32(User.Identity.Name);

            model.ModifiedBy = id;

            if (model.ID == 0)
            {
                model.CreatedBy = id;
                repository.AddCategory(model);
            }
            else
            {
                repository.EditCategory(model);
            }

            return RedirectToAction("ManageCategory");
        }

        public ActionResult EditCategory(int id)
        {
            var category = marketPlaceEntities.NoteCategories.FirstOrDefault(a => a.ID == id);

            var result = new NoteCategoryModel()
            {
                Name = category.Name,
                Description = category.Description,
                CreatedDate = category.CreatedDate,
                ModifiedBy = category.ModifiedBy,
                IsActive = category.IsActive
            };

            return View("AddCategory", result);
        }

        public ActionResult DeleteCategory(int id)
        {
            var sid = Convert.ToInt32(User.Identity.Name);

            repository.InactiveCategory(id, sid);

            return RedirectToAction("ManageCategory");
        }

        public ActionResult ManageType()
        {
            var result = marketPlaceEntities.NoteTypes.ToList();

            return View(result);
        }

        public PartialViewResult ManageTypePartial(string search, int pageNumber = 1)
        {
            var result = marketPlaceEntities.NoteTypes.ToList();

            if (search != null)
                result = result.Where(s => s.Name.ToUpper().Contains(search) || s.Name.ToLower().Contains(search) || s.Description.ToUpper().Contains(search) || s.Description.ToLower().Contains(search) || s.CreatedDate.ToString().ToUpper().Contains(search) || s.CreatedDate.ToString().ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_ManageTypePartial", result);
        }

        public ActionResult AddType()
        {
            var result = new NoteTypeModel();

            return View(result);
        }

        [HttpPost]
        public ActionResult AddType(NoteTypeModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var id = Convert.ToInt32(User.Identity.Name);

            model.ModifiedBy = id;

            if (model.ID == 0)
            {
                model.CreatedBy = id;
                repository.AddType(model);
            }
            else
            {
                repository.EditType(model);
            }

            return RedirectToAction("ManageType");
        }

        public ActionResult EditType(int id)
        {
            var type = marketPlaceEntities.NoteTypes.FirstOrDefault(a => a.ID == id);

            var result = new NoteTypeModel()
            {
                Name = type.Name,
                Description = type.Description,
                CreatedDate = type.CreatedDate,
                ModifiedBy = type.ModifiedBy,
                IsActive = type.IsActive
            };

            return View("AddType", result);
        }

        public ActionResult DeleteType(int id)
        {
            var sid = Convert.ToInt32(User.Identity.Name);

            repository.InactiveType(id, sid);

            return RedirectToAction("ManageType");
        }

        public ActionResult ManageCountry()
        {
            var result = marketPlaceEntities.Countries.ToList();

            return View(result);
        }

        public PartialViewResult ManageCountryPartial(string search, int pageNumber = 1)
        {
            var result = marketPlaceEntities.Countries.ToList();

            if (search != null)
                result = result.Where(s => s.Name.ToUpper().Contains(search) || s.Name.ToLower().Contains(search) || s.CountryCode.ToUpper().Contains(search) || s.CountryCode.ToLower().Contains(search) || s.CreatedDate.ToString().ToUpper().Contains(search) || s.CreatedDate.ToString().ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_ManageCountryPartial", result);
        }

        public ActionResult AddCountry()
        {
            var result = new CountryModel();

            return View(result);
        }

        [HttpPost]
        public ActionResult AddCountry(CountryModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var id = Convert.ToInt32(User.Identity.Name);

            model.ModifiedBy = id;

            if (model.ID == 0)
            {
                model.CreatedBy = id;
                repository.AddCountry(model);
            }
            else
            {
                repository.EditCountry(model);
            }

            return RedirectToAction("ManageCountry");
        }

        public ActionResult EditCountry(int id)
        {
            var country = marketPlaceEntities.Countries.FirstOrDefault(a => a.ID == id);

            var result = new CountryModel()
            {
                Name = country.Name,
                CountryCode = country.CountryCode,
                CreatedDate = country.CreatedDate,
                ModifiedBy = country.ModifiedBy,
                IsActive = country.IsActive
            };

            return View("AddCountry", result);
        }

        public ActionResult DeleteCountry(int id)
        {
            var sid = Convert.ToInt32(User.Identity.Name);

            repository.InactiveCountry(id, sid);

            return RedirectToAction("ManageCountry");
        }
    }
}