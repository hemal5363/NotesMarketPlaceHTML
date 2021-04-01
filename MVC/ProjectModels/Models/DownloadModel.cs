using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectModels.Models
{
    public class DownloadModel
    {
        public int ID { get; set; }
        public int NoteID { get; set; }
        public int Seller { get; set; }
        public int Downloader { get; set; }
        public bool IsSellerHasAllowedDownload { get; set; }
        public string AttachmentPath { get; set; }
        public bool IsAttachmentDownloaded { get; set; }
        public DateTime? AttachmentDownloadedDate { get; set; }
        public bool IsPaid { get; set; }
        public decimal? PurchasedPrice { get; set; }
        public string NoteTitle { get; set; }
        public string NoteCategory { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public SellerNoteModel sellerNote { get; set; }
        public UserModel user { get; set; }
        public UserModel user1 { get; set; }
    }
}
