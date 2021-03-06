using Notes_MarketPlace.Models;
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

namespace Notes_MarketPlace.Controllers
{
    [Authorize]
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
                result = result.Where(s => s.NoteTitle.ToUpper().Contains(search) || s.NoteTitle.ToLower().Contains(search) || s.User1.EmailID.ToUpper().Contains(search) || s.User1.EmailID.ToLower().Contains(search) || s.NoteCategory.ToUpper().Contains(search) || s.NoteCategory.ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_BuyerRequestPartial", result);
        }

        [HttpPost]
        public ActionResult AllowedDownload(Download download)
        {
            var requestDT = marketPlaceEntities.Downloads.Where(u => u.ID == download.ID).FirstOrDefault();

            repository.SellerAllow(requestDT);
            SendAllowedDownloadEmail(requestDT);

            return RedirectToAction("BuyerRequest");
        }

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
    }
}