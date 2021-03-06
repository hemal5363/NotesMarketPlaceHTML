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
using Windows.Storage;

namespace Notes_MarketPlace.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        MarketPlaceEntities marketPlaceEntities = null;
        HomeRepository repository = null;

        public HomeController()
        {
            marketPlaceEntities = new MarketPlaceEntities();
            repository = new HomeRepository();
        }

        [AllowAnonymous]
        public ActionResult FAQ()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult ContactUs()
        {
            if(User.Identity.IsAuthenticated)
            {
                var id = Convert.ToInt32(User.Identity.Name);
                var result = marketPlaceEntities.Users.FirstOrDefault(u => u.ID == id);
                var newResult = new ContactUsForm()
                {
                    FullName = result.FirstName + " " + result.LastName,
                    Email = result.EmailID
                };
                return View(newResult);
            }
            return View();
        }

        [AllowAnonymous]
        public ActionResult SearchNote()
        {
            var notes = marketPlaceEntities.SellerNotes.Where(n => n.Status == 9 && n.IsActive == true).ToList();

            var result = new SearchNoteViewModel()
            {
                totalNotes = notes.Count(),
                sellerNotes = notes
            };

            return View(result);
        }

        [AllowAnonymous]
        public PartialViewResult FilterNote(string search, string univarsity, string course, int? type=0, int? category=0, int? country=0, int pageNumber = 1)
        {
            var notes = marketPlaceEntities.SellerNotes.Where(s => s.Status == 9 && s.IsActive == true).ToList();

            if (type != 0)
                notes = notes.Where(s => s.NoteType == type).ToList();
            if (category != 0)
                notes = notes.Where(s => s.Category == category).ToList();
            if (!string.IsNullOrEmpty(univarsity))
                notes = notes.Where(s => s.UniversityName.Contains(univarsity)).ToList();
            if (!string.IsNullOrEmpty(course))
                notes = notes.Where(s => s.Course.Contains(course)).ToList();
            if (country != 0)
                notes = notes.Where(s => s.Country == country).ToList();
            if (!string.IsNullOrEmpty(search))
                notes = notes.Where(s => s.Title.ToUpper().Contains(search) || s.Title.ToLower().Contains(search)).ToList();

            var skip = (pageNumber-1) * 9;

            var result = new SearchNoteViewModel()
            {
                activePageNumber = pageNumber,
                totalNotes = notes.Count(),
                sellerNotes = notes.Skip(skip).Take(9).ToList()
            };

            return PartialView("_FilterNotes", result);
        }

        [HttpPost]
        public ActionResult ContactUs(ContactUsForm form)
        {
            if (!ModelState.IsValid)
            {
                return View(form);
            }

            SendContactUsEmail(form);

            return View();
        }

        [NonAction]
        public void SendContactUsEmail(ContactUsForm form)
        {
            MarketPlaceEntities marketPlaceEntities = new MarketPlaceEntities();
            var toEmail = new MailAddress(marketPlaceEntities.SystemConfigurations.Where(s => s.Key == "Email").FirstOrDefault().Value);
            string subject = form.Subject + " - Query";

            string body = "Hello, <br /><br />" +
                   form.Comments + " <br /><br />" +
                   "Regards, <br />" +
                   form.FullName;

            AutoEmailSend.SendEmail(toEmail, subject, body);
        }

        public ActionResult SellNote()
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.SellerNotes.Where(n => n.SellerID == id && n.IsActive == true).ToList();

            return View(result);
        }

        public PartialViewResult SellNotePublishedNotesPartial(string search, int pageNumber = 1)
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.SellerNotes.Where(n => n.SellerID == id && n.IsActive == true).ToList();

            if (search != null)
                result = result.Where(s => s.Title.ToUpper().Contains(search) || s.Title.ToLower().Contains(search) || s.NoteCategory.Name.ToUpper().Contains(search) || s.NoteCategory.Name.ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_SellNotePublishedNotesPartial", result);
        }

        public PartialViewResult SellNoteInProgressNotesPartial(string search, int pageNumber = 1)
        {
            var id = Convert.ToInt32(User.Identity.Name);

            var result = marketPlaceEntities.SellerNotes.Where(n => n.SellerID == id && n.IsActive == true).ToList();

            if (search != null)
                result = result.Where(s => s.Title.ToUpper().Contains(search) || s.Title.ToLower().Contains(search) || s.NoteCategory.Name.ToUpper().Contains(search) || s.NoteCategory.Name.ToLower().Contains(search)).ToList();

            ViewBag.totalCount = result.Count();
            ViewBag.activePageNumber = pageNumber;

            var skip = (pageNumber - 1) * 5;

            result = result.Skip(skip).Take(5).ToList();

            return PartialView("_SellNoteInProgressNotesPartial", result);
        }

        public ActionResult AddNote()
        {
            var ViewModel = new AddNoteViewModel()
            {
                SellerNote = new SellerNoteModel()
            };
            return View(ViewModel);
        }

        [Route("Home/Edit/{id}")]
        public ActionResult AddNote(int id)
        {
            var result = marketPlaceEntities.SellerNotes.Where(n => n.ID == id).FirstOrDefault();

            var viewModel = new AddNoteViewModel()
            {
                SellerNote = DBToModel(result)
            };
            return View(viewModel);
        }

        [HttpPost]
        public ActionResult AddNote(AddNoteViewModel addNoteView)
        {
            if (!ModelState.IsValid)
            {
                return View(addNoteView);
            }

            var id = Convert.ToInt32(User.Identity.Name);

            if (addNoteView.SellerNote.ID == 0)
            {
                addNoteView.SellerNote.SellerID = id;
                addNoteView.SellerNote.Status = 6;
                if (addNoteView.SellerNote.SellingPrice == null)
                    addNoteView.SellerNote.SellingPrice = 0;
                addNoteView.SellerNote.CreatedBy = id;
                addNoteView.SellerNote.CreatedDate = DateTime.Now;
                addNoteView.SellerNote.IsActive = true;
            }
            addNoteView.SellerNote.ModifiedBy = id;
            addNoteView.SellerNote.ModifiedDate = DateTime.Now;

            string path = null;
            string fileName = null;
            string fullPath = null;

            if (addNoteView.SellerNote.ID == 0)
            { 
                repository.AddNote(addNoteView.SellerNote);

                var nid = marketPlaceEntities.SellerNotes.Max(n => n.ID);

                addNoteView.SellerNote.ID = nid;

                var triggerNote = marketPlaceEntities.SellerNotes.Where(n => n.ID == nid).FirstOrDefault();
                string trigger = "../Members/" + triggerNote.SellerID.ToString() + "/" + triggerNote.ID.ToString();

                if (addNoteView.SellerNote.DisplayPicture != null)
                {
                    path = Server.MapPath(trigger);
                    if(!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    fileName = Path.GetFileName(addNoteView.SellerNote.DisplayPicture.FileName);
                    fullPath = Path.Combine(path, fileName);

                    addNoteView.SellerNote.DisplayPicture.SaveAs(fullPath);

                    triggerNote.DisplayPicture = "../" + trigger + "/" + fileName;
                }

                if (addNoteView.SellerNote.NotesPreview != null)
                {
                    path = Server.MapPath(trigger);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    fileName = Path.GetFileName(addNoteView.SellerNote.NotesPreview.FileName);
                    fullPath = Path.Combine(path, fileName);

                    addNoteView.SellerNote.NotesPreview.SaveAs(fullPath);

                    triggerNote.NotesPreview = "../" + trigger + "/" + fileName;
                }

                trigger = trigger + "/Attachements";

                path = Server.MapPath(trigger);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                fileName = Path.GetFileName(addNoteView.SellerNotesAttachement.FilePath.FileName);
                fullPath = Path.Combine(path, fileName);

                addNoteView.SellerNotesAttachement.FilePath.SaveAs(fullPath);

                var triggerPdf = new SellerNotesAttachement();
                triggerPdf.NoteID = triggerNote.ID;
                triggerPdf.FileName = fileName;
                triggerPdf.FilePath = "../" + trigger + "/" + fileName;
                triggerPdf.CreatedDate = triggerNote.CreatedDate;
                triggerPdf.CreatedBy = triggerNote.SellerID;
                triggerPdf.ModifiedDate = triggerNote.ModifiedDate;
                triggerPdf.ModifiedBy = triggerNote.SellerID;
                triggerPdf.IsActive = true;

                repository.AddNoteTrigger(triggerNote, triggerPdf);
            }
            else
            {
                string trigger = "../Members/" + addNoteView.SellerNote.SellerID.ToString() + "/" + addNoteView.SellerNote.ID.ToString();

                if (addNoteView.SellerNote.DisplayPicture != null)
                {
                    path = Server.MapPath(trigger);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    fileName = Path.GetFileName(addNoteView.SellerNote.DisplayPicture.FileName);
                    fullPath = Path.Combine(path, fileName);

                    addNoteView.SellerNote.DisplayPicture.SaveAs(fullPath);

                    addNoteView.SellerNote.Picture = "../" + trigger + "/" + fileName;
                }

                if (addNoteView.SellerNote.NotesPreview != null)
                {
                    path = Server.MapPath(trigger);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    fileName = Path.GetFileName(addNoteView.SellerNote.NotesPreview.FileName);
                    fullPath = Path.Combine(path, fileName);

                    addNoteView.SellerNote.NotesPreview.SaveAs(fullPath);

                    addNoteView.SellerNote.Preview = "../" + trigger + "/" + fileName;
                }

                var triggerPdf = marketPlaceEntities.SellerNotesAttachements.FirstOrDefault(n => n.NoteID == addNoteView.SellerNote.ID);

                trigger = trigger + "/Attachements";

                path = Server.MapPath(trigger);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                fileName = Path.GetFileName(addNoteView.SellerNotesAttachement.FilePath.FileName);
                fullPath = Path.Combine(path, fileName);

                addNoteView.SellerNotesAttachement.FilePath.SaveAs(fullPath);

                triggerPdf.FileName = fileName;
                triggerPdf.FilePath = "../" + trigger + "/" + fileName;
                triggerPdf.ModifiedDate = addNoteView.SellerNote.ModifiedDate;
                triggerPdf.ModifiedBy = addNoteView.SellerNote.SellerID;

                repository.UpdateNote(addNoteView.SellerNote, triggerPdf);
            }
            return View(addNoteView);
        }

        public ActionResult Publish(int id)
        {
            var noteUpdate = marketPlaceEntities.SellerNotes.Where(n => n.ID == id).FirstOrDefault();

            noteUpdate.Status = 7;
            repository.UpdateStatus(noteUpdate);
            SendPublishNoteMailToAdmin(noteUpdate);

            return RedirectToAction("SellNote");
        }

        [NonAction]
        public void SendPublishNoteMailToAdmin(SellerNote sellerNote)
        {
            var toEmail = new MailAddress(marketPlaceEntities.SystemConfigurations.Where(s => s.Key == "Email").FirstOrDefault().Value);
            string subject = sellerNote.User.FirstName.ToString() + " sent his note for review";

            string body = "Hello Admins, <br /><br />" +
                   "We want to inform you that, " + sellerNote.User.FirstName + " sent his note <br />" +
                   sellerNote.Title.ToString() + " for review. Please look at the notes and take required actions. <br /><br />" +
                   "Regards, <br />" +
                   "Notes Marketplace";

            AutoEmailSend.SendEmail(toEmail, subject, body);
        }

        [NonAction]
        public SellerNoteModel DBToModel(SellerNote note)
        {
            var result = new SellerNoteModel()
            {
                ID = note.ID,
                SellerID = note.SellerID,
                Status = note.Status,
                ActionedBy = note.ActionedBy,
                AdminRemards = note.AdminRemards,
                PublishedDate = note.PublishedDate,
                Title = note.Title,
                Category = note.Category,
                Picture = note.DisplayPicture,
                NoteType = note.NoteType,
                NumberofPages = note.NumberofPages,
                Description = note.Description,
                Country = note.Country,
                Course = note.Course,
                CourseCode = note.CourseCode,
                Professor = note.Professor,
                IsPaid = note.IsPaid,
                SellingPrice = note.SellingPrice,
                Preview = note.NotesPreview,
                ModifiedDate = note.ModifiedDate,
                ModifiedBy = note.ModifiedBy
            };

            return result;
        }

        public ActionResult Delete(int id)
        {
            repository.DeleteNote(id);

            return RedirectToAction("SellNote");
        }

        [AllowAnonymous]
        public ActionResult NoteDetails(int id)
        {
            var result = marketPlaceEntities.SellerNotes.FirstOrDefault(n => n.ID == id);

            return View(result);
        }

        [Route("Home/NoteDownload/{id}")]
        [ActionName("NoteDetails")]
        public FileResult NoteDownload(int id)
        {
            var result = marketPlaceEntities.SellerNotesAttachements.FirstOrDefault(n => n.NoteID == id);

            var did = Convert.ToInt32(User.Identity.Name);


            repository.AddDownload(id, did, result.FilePath);


            var path = Server.MapPath(result.FilePath);
            var fullPath = Path.Combine(path);

            return File(fullPath, ".pdf", result.FileName);
        }

        public void NoteRequest(int id)
        {
            var did = Convert.ToInt32(User.Identity.Name);

            repository.AddRequest(id, did);

            var mailDetail = marketPlaceEntities.Downloads.Where(m => m.NoteID == id && m.Downloader == did).FirstOrDefault();

            SendRequestMailToSeller(mailDetail);

        }

        public void SendRequestMailToSeller(Download download)
        {
            var toEmail = new MailAddress(download.User.EmailID);
            string subject = download.User1.FirstName + " wants to purchase your notes";

            string body = "Hello " + download.User.FirstName + ", <br /><br />" +
                   "We would like to inform you that, " + download.User1.FirstName + " wants to purchase your notes. Please see <br />" +
                   "Buyer Requests tab and allow download access to Buyer if you have received the payment from him. <br /><br />" +
                   "Regards, <br />" +
                   "Notes Marketplace";

            AutoEmailSend.SendEmail(toEmail, subject, body);
        }
    }
}