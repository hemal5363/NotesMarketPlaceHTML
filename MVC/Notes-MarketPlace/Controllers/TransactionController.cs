using Notes_MarketPlace.Models;
using ProjectDB;
using ProjectDB.DBOparetions;
using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Notes_MarketPlace.Controllers
{
    [Authorize(Roles = "Member")]
    public class TransactionController : Controller
    {
        MarketPlaceEntities marketPlaceEntities = null;
        TransactionRepository repository = null;

        public TransactionController()
        {
            marketPlaceEntities = new MarketPlaceEntities();
            repository = new TransactionRepository();
        }

        public ActionResult BuyerRequest()
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.Downloads.Where(n => n.Seller == id && n.IsSellerHasAllowedDownload == false).ToList();

            return View(result);
        }

        public PartialViewResult BuyerRequestPartial(string search, int pageNumber = 1)
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.Downloads.Where(n => n.Seller == id && n.IsSellerHasAllowedDownload == false).ToList();

            if (search != null)
                result = result.Where(s => s.NoteTitle.ToUpper().Contains(search) || s.NoteTitle.ToLower().Contains(search) || s.NoteCategory.ToUpper().Contains(search) || s.NoteCategory.ToLower().Contains(search) || s.User1.FirstName.ToUpper().Contains(search) || s.User1.FirstName.ToLower().Contains(search) || s.User1.LastName.ToUpper().Contains(search) || s.User1.LastName.ToLower().Contains(search) || s.User1.UserProfiles.FirstOrDefault().PhoneNumber.ToUpper().Contains(search) || s.User1.UserProfiles.FirstOrDefault().PhoneNumber.ToLower().Contains(search) || s.PurchasedPrice.ToString().ToUpper().Contains(search) || s.PurchasedPrice.ToString().ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 10;

            result = result.Skip(skip).Take(10).ToList();

            return PartialView("_BuyerRequestPartial", result);
        }

        public ActionResult AllowedDownload(int id)
        {
            var requestDT = marketPlaceEntities.Downloads.FirstOrDefault(u => u.ID == id);

            repository.SellerAllow(requestDT);
            SendAllowedDownloadEmail(requestDT);

            return RedirectToAction("BuyerRequest");
        }

        [NonAction]
        public void SendAllowedDownloadEmail(Download download)
        {
            var toEmail = new MailAddress(download.User1.EmailID);
            string subject = download.User.FirstName + " Allows you to download a note";

            string body = "Hello " + download.User1.FirstName + ", <br /><br />" +
                   "We would like to inform you that, " + download.User.FirstName + " Allows you to download a note. <br />" +
                   "Please login and see My Download tabs to download particular note. <br /><br />" +
                   "Regards, <br />" +
                   "Notes Marketplace";

            AutoEmailSend.SendEmail(toEmail, subject, body);
        }

        public ActionResult MyDownloads()
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.Downloads.Where(n => n.Seller == id && n.IsSellerHasAllowedDownload == true).ToList();

            return View(result);
        }

        public PartialViewResult MyDownloadsPartial(string search, int pageNumber = 1)
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.Downloads.Where(n => n.Downloader == id && n.IsSellerHasAllowedDownload == true).ToList();

            if (search != null)
                result = result.Where(s => s.NoteTitle.ToUpper().Contains(search) || s.NoteTitle.ToLower().Contains(search) || s.NoteCategory.ToUpper().Contains(search) || s.NoteCategory.ToLower().Contains(search) || s.User.FirstName.ToUpper().Contains(search) || s.User.FirstName.ToLower().Contains(search) || s.User.LastName.ToUpper().Contains(search) || s.User.LastName.ToLower().Contains(search) || s.PurchasedPrice.ToString().ToUpper().Contains(search) || s.PurchasedPrice.ToString().ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 10;

            result = result.Skip(skip).Take(10).ToList();

            var viewResult = new MyDownloadViewModel()
            {
                Downloads = result,
                SellerNotesReviewModel = new SellerNotesReviewModel(),
                SellerNotesReportedIssueModel = new SellerNotesReportedIssueModel()
            };

            return PartialView("_MyDownloadsPartial", viewResult);
        }

        public FileResult NoteDownload(int id, string type)
        {
            var result = marketPlaceEntities.Downloads.FirstOrDefault(n => n.ID == id);

            if (type == "Rejected")
            {
                result = new Download();
                var result1 = marketPlaceEntities.SellerNotesAttachements.FirstOrDefault(n => n.NoteID == id);
                result.AttachmentPath = result1.FilePath;
                result.NoteTitle = result1.SellerNote.Title;
            }
            string path = Server.MapPath(result.AttachmentPath);
            string fullPath = Path.Combine(path);
            string fName = result.NoteTitle + ".pdf";

            return File(fullPath, ".pdf", fName);
        }

        public ActionResult AddRating(MyDownloadViewModel myDownloadViewModel)
        {
            if(ModelState.IsValid)
            {
                var model = marketPlaceEntities.SellerNotesReviews.FirstOrDefault(m => m.AgainstDownloadsID == myDownloadViewModel.id);
                if(model == null)
                { 
                    repository.AddReview(myDownloadViewModel.id, myDownloadViewModel.SellerNotesReviewModel.Ratings, myDownloadViewModel.SellerNotesReviewModel.Comments);
                }
                else
                {
                    repository.EditReview(myDownloadViewModel.id, myDownloadViewModel.SellerNotesReviewModel.Ratings, myDownloadViewModel.SellerNotesReviewModel.Comments);
                }
            }

            return RedirectToAction("MyDownloads");
        }

        public ActionResult AddReport(MyDownloadViewModel myDownloadViewModel)
        {
            var model = marketPlaceEntities.SellerNotesReportedIssues.FirstOrDefault(m => m.AgainstDownloadsID == myDownloadViewModel.id);
            if (model == null)
            {
                repository.AddRemarks(myDownloadViewModel.id, myDownloadViewModel.SellerNotesReportedIssueModel.Remarks);
            }
            else
            {
                repository.EditRemarks(myDownloadViewModel.id, myDownloadViewModel.SellerNotesReportedIssueModel.Remarks);
            }

            var result = marketPlaceEntities.Downloads.FirstOrDefault(r => r.ID == myDownloadViewModel.id);
            SendDownloaderReportsASpam(result);

            return RedirectToAction("MyDownloads");
        }

        [NonAction]
        public void SendDownloaderReportsASpam(Download download)
        {
            var toEmail = new MailAddress(marketPlaceEntities.SystemConfigurations.Where(s => s.Key == "Email Address").FirstOrDefault().Value);
            string subject = download.User1.FirstName + " Reported an issue for " + download.NoteTitle;

            string body = "Hello Admins, <br /><br />" +
                   "We want to inform you that, " + download.User1.FirstName + " Reported an issue for " + download.User.FirstName + "’s Note with <br />" +
                   "title " + download.NoteTitle + ". Please look at the notes and take required actions. <br /><br />" +
                   "Regards, <br />" +
                   "Notes Marketplace";

            AutoEmailSend.SendEmail(toEmail, subject, body);
        }

        public ActionResult MySoldNotes()
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.Downloads.Where(n => n.Seller == id && n.IsSellerHasAllowedDownload == true).ToList();

            return View(result);
        }

        public PartialViewResult MySoldNotesPartial(string search, int pageNumber = 1)
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.Downloads.Where(n => n.Seller == id && n.IsSellerHasAllowedDownload == true).ToList();

            if (search != null)
                result = result.Where(s => s.NoteTitle.ToUpper().Contains(search) || s.NoteTitle.ToLower().Contains(search) || s.NoteCategory.ToUpper().Contains(search) || s.NoteCategory.ToLower().Contains(search) || s.User1.FirstName.ToUpper().Contains(search) || s.User1.FirstName.ToLower().Contains(search) || s.User1.LastName.ToUpper().Contains(search) || s.User1.LastName.ToLower().Contains(search) || s.PurchasedPrice.ToString().ToUpper().Contains(search) || s.PurchasedPrice.ToString().ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 10;

            result = result.Skip(skip).Take(10).ToList();

            return PartialView("_MySoldNotesPartial", result);
        }

        public ActionResult MyRejectedNotes()
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.SellerNotes.Where(n => n.SellerID == id && n.Status == 10).ToList();

            return View(result);
        }

        public PartialViewResult MyRejectedNotesPartial(string search, int pageNumber = 1)
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.SellerNotes.Where(n => n.SellerID == id && n.Status == 10).ToList();

            if (search != null)
                result = result.Where(s => s.Title.ToUpper().Contains(search) || s.Title.ToLower().Contains(search) || s.NoteCategory.Name.ToUpper().Contains(search) || s.NoteCategory.Name.ToLower().Contains(search) || s.AdminRemarks.ToUpper().Contains(search) || s.AdminRemarks.ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 10;

            result = result.Skip(skip).Take(10).ToList();

            return PartialView("_MyRejectedNotesPartial", result);
        }
    }
}