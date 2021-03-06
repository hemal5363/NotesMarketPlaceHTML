using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ProjectModels.Models
{
    public class SellerNotesAttachementModel
    {
        public int ID { get; set; }
        public int NoteID { get; set; }
        public string FileName { get; set; }

        [DisplayName("Upload Notes *")]
        [Required]
        public HttpPostedFileBase FilePath { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public bool IsActive { get; set; }

        public SellerNoteModel sellerNote { get; set; }
    }
}
