using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDB.DBOparetions
{
    public class HomeRepository
    {
        public void AddNote(SellerNoteModel model)
        {
            using (var context = new MarketPlaceEntities())
            {
                SellerNote sn = new SellerNote()
                {
                    SellerID = model.SellerID,
                    Status = model.Status,
                    Title = model.Title,
                    Category = model.Category,
                    //DisplayPicture = "123",
                    NoteType = model.NoteType,
                    NumberofPages = model.NumberofPages,
                    Description = model.Description,
                    UniversityName = model.UniversityName,
                    Country = model.Country,
                    Course = model.Course,
                    CourseCode = model.CourseCode,
                    Professor = model.Professor,
                    IsPaid = model.IsPaid,
                    SellingPrice = model.SellingPrice,
                    //NotesPreview = "123",
                    CreatedBy = model.CreatedBy,
                    CreatedDate = model.CreatedDate,
                    ModifiedBy = model.ModifiedBy,
                    ModifiedDate = model.ModifiedDate,
                    IsActive = model.IsActive
                };

                context.SellerNotes.Add(sn);

                context.SaveChanges();
            }
        }

        public void AddNoteTrigger(SellerNote model, SellerNotesAttachement attachement)
        {
            using (var context = new MarketPlaceEntities())
            {
                var sellerNote = context.SellerNotes.FirstOrDefault(u => u.ID == model.ID);

                sellerNote.DisplayPicture = model.DisplayPicture;
                sellerNote.NotesPreview = model.NotesPreview;

                context.SellerNotesAttachements.Add(attachement);

                context.SaveChanges();

                //var sellerNotesAttachement = context.SellerNotesAttachements.Where(a => a.NoteID == attachement.NoteID && a.FilePath == attachement.FilePath).FirstOrDefault();
                //sellerNotesAttachement.FileName = sellerNotesAttachement.ID.ToString() + "_" + sellerNotesAttachement.CreatedDate.Value.ToString("hh:mm:ss") + ".pdf";
                //sellerNotesAttachement.FilePath = sellerNotesAttachement.FilePath + "/" + sellerNotesAttachement.FileName;

                //context.SaveChanges();
            }
        }

        public void UpdateStatus(SellerNote model)
        {
            using (var context = new MarketPlaceEntities())
            {
                var status = context.SellerNotes.FirstOrDefault(n => n.ID == model.ID);
                status.Status = model.Status;

                context.SaveChanges();
            }
        }

        public void UpdateNote(SellerNoteModel model, SellerNotesAttachement attachement)
        {
            using (var context = new MarketPlaceEntities())
            {
                var sellerNote = context.SellerNotes.FirstOrDefault(u => u.ID == model.ID);

                sellerNote.Title = model.Title;
                sellerNote.Category = model.Category;
                sellerNote.DisplayPicture = model.Picture;
                sellerNote.NoteType = model.NoteType;
                sellerNote.NumberofPages = model.NumberofPages;
                sellerNote.Description = model.Description;
                sellerNote.UniversityName = model.UniversityName;
                sellerNote.Country = model.Country;
                sellerNote.Course = model.Course;
                sellerNote.CourseCode = model.CourseCode;
                sellerNote.Professor = model.Professor;
                sellerNote.IsPaid = model.IsPaid;
                sellerNote.SellingPrice = model.SellingPrice;
                sellerNote.NotesPreview = model.Preview;
                sellerNote.ModifiedBy = model.ModifiedBy;
                sellerNote.ModifiedDate = model.ModifiedDate;

                context.SaveChanges();

                var sellerNotesAttachement = context.SellerNotesAttachements.FirstOrDefault(a => a.ID == attachement.ID);
                sellerNotesAttachement.FileName = attachement.FileName;
                sellerNotesAttachement.FilePath = attachement.FilePath;
                sellerNotesAttachement.ModifiedBy = attachement.ModifiedBy;
                sellerNotesAttachement.ModifiedDate = attachement.ModifiedDate;

                context.SaveChanges();
            }
        }

        public void DeleteNote(int id)
        {
            using (var context = new MarketPlaceEntities())
            {
                var note = context.SellerNotes.FirstOrDefault(n => n.ID == id);
                var attach = context.SellerNotesAttachements.FirstOrDefault(a => a.NoteID == id);

                if (attach != null)
                    context.SellerNotesAttachements.Remove(attach);
                context.SellerNotes.Remove(note);

                context.SaveChanges();
            }
        }

        public void AddDownload(int id, int did, string fPath)
        {
            using (var context = new MarketPlaceEntities())
            {
                var downNote = context.Downloads.FirstOrDefault(n => n.NoteID == id && n.Downloader == did);
                
                if (downNote == null)
                { 
                    var note = context.SellerNotes.FirstOrDefault(n => n.ID == id);

                    var down = new Download()
                    {
                        NoteID = note.ID,
                        Seller = note.SellerID,
                        Downloader = did,
                        IsSellerHasAllowedDownload = true,
                        AttachmentPath = fPath,
                        IsAttachmentDownloaded = true,
                        AttachmentDownloadedDate = DateTime.Now,
                        IsPaid = note.IsPaid,
                        PurchasedPrice = note.SellingPrice,
                        NoteTitle = note.Title,
                        NoteCategory = note.NoteCategory.Name,
                        CreatedDate = DateTime.Now,
                        CreatedBy = did,
                        ModifiedDate = DateTime.Now,
                        ModifiedBy = did
                    };

                    context.Downloads.Add(down);
                    context.SaveChanges();
                }
            }
        }

        public void AddRequest(int id, int did)
        {
            using (var context = new MarketPlaceEntities())
            {
                var downNote = context.Downloads.FirstOrDefault(n => n.NoteID == id && n.Downloader == did);

                if (downNote == null)
                {
                    var note = context.SellerNotes.FirstOrDefault(n => n.ID == id);

                    var down = new Download()
                    {
                        NoteID = note.ID,
                        Seller = note.SellerID,
                        Downloader = did,
                        IsSellerHasAllowedDownload = false,
                        IsAttachmentDownloaded = false,
                        IsPaid = note.IsPaid,
                        PurchasedPrice = note.SellingPrice,
                        NoteTitle = note.Title,
                        NoteCategory = note.NoteCategory.Name,
                        CreatedDate = DateTime.Now,
                        CreatedBy = did,
                        ModifiedDate = DateTime.Now,
                        ModifiedBy = did
                    };

                    context.Downloads.Add(down);
                    context.SaveChanges();
                }
            }
        }
    }
}
