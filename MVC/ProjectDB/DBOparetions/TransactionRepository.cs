using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDB.DBOparetions
{
    public class TransactionRepository
    {
        public void SellerAllow(Download download)
        {
            using (var context = new MarketPlaceEntities())
            {
                var downloadDB = context.Downloads.FirstOrDefault(u => u.ID == download.ID);
                var getAttachementPath = context.SellerNotesAttachements.FirstOrDefault(n => n.NoteID == download.NoteID);

                downloadDB.IsSellerHasAllowedDownload = true;
                downloadDB.AttachmentPath = getAttachementPath.FilePath;
                downloadDB.IsAttachmentDownloaded = true;
                downloadDB.AttachmentDownloadedDate = DateTime.Now;
                downloadDB.ModifiedDate = DateTime.Now;
                downloadDB.ModifiedBy = download.Seller;

                context.SaveChanges();
            }
        }

        public void AddReview(int id, decimal rating, string comment)
        {
            using (var context = new MarketPlaceEntities())
            {
                var note = context.Downloads.FirstOrDefault(n => n.ID == id);
                var review = new SellerNotesReview()
                {
                    NoteID = note.NoteID,
                    ReviewedByID = note.Downloader,
                    AgainstDownloadsID = id,
                    Ratings = rating,
                    Comments = comment,
                    CreatedDate = DateTime.Now,
                    CreatedBy = note.Downloader,
                    ModifiedDate = DateTime.Now,
                    ModifiedBy = note.Downloader,
                    IsActive = true
                };

                context.SellerNotesReviews.Add(review);
                context.SaveChanges();
            }
        }

        public void EditReview(int id, decimal rating, string comment)
        {
            using (var context = new MarketPlaceEntities())
            {
                var review = context.SellerNotesReviews.FirstOrDefault(n => n.AgainstDownloadsID == id);
                review.Ratings = rating;
                review.Comments = comment;
                review.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            }
        }

        public void AddRemarks(int id, string remark)
        {
            using (var context = new MarketPlaceEntities())
            {
                var note = context.Downloads.FirstOrDefault(n => n.ID == id);
                var issue = new SellerNotesReportedIssue()
                {
                    NoteID = note.NoteID,
                    ReportedByID = note.Downloader,
                    AgainstDownloadsID = id,
                    Remarks = remark,
                    CreatedDate = DateTime.Now,
                    CreatedBy = note.Downloader,
                    ModifiedDate = DateTime.Now,
                    ModifiedBy = note.Downloader
                };

                context.SellerNotesReportedIssues.Add(issue);
                context.SaveChanges();
            }
        }

        public void EditRemarks(int id, string remark)
        {
            using (var context = new MarketPlaceEntities())
            {
                var issue = context.SellerNotesReportedIssues.FirstOrDefault(n => n.AgainstDownloadsID == id);
                issue.Remarks = remark;
                issue.ModifiedDate = DateTime.Now;

                context.SaveChanges();
            }
        }
    }
}
