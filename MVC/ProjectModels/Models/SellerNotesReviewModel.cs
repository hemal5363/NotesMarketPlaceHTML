using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectModels.Models
{
    public class SellerNotesReviewModel
    {
        public int ID { get; set; }
        public int NoteID { get; set; }
        public int ReviewedByID { get; set; }
        public int AgainstDownloadsID { get; set; }
        [Required]
        public decimal Ratings { get; set; }
        [Required]
        public string Comments { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public bool IsActive { get; set; }

        public DownloadModel Download { get; set; }
        public SellerNoteModel SellerNote { get; set; }
        public UserModel User { get; set; }
    }
}
