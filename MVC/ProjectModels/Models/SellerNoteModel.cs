using ProjectModels.Validation;
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
    public class SellerNoteModel
    {
        public int ID { get; set; }
        public int SellerID { get; set; }
        public int Status { get; set; }
        public int? ActionedBy { get; set; }
        public string AdminRemarks { get; set; }
        public DateTime? PublishedDate { get; set; }

        [DisplayName("Title *")]
        [Required]
        public string Title { get; set; }

        [DisplayName("Category *")]
        [Required]
        public int Category { get; set; }

        [DisplayName("Display Picture")]
        public HttpPostedFileBase DisplayPicture { get; set; }

        [DisplayName("Type")]
        public int? NoteType { get; set; }

        [DisplayName("Number of Pages")]
        public int? NumberofPages { get; set; }

        [DisplayName("Description *")]
        [Required]
        public string Description { get; set; }

        [DisplayName("Institution Name")]
        public string UniversityName { get; set; }
        public int? Country { get; set; }

        [DisplayName("Course Name")]
        public string Course { get; set; }

        [DisplayName("Course Code")]
        public string CourseCode { get; set; }

        [DisplayName("Professor / Lecture")]
        public string Professor { get; set; }

        [DisplayName("Sell For *")]
        [Required]
        public bool IsPaid { get; set; }

        [DisplayName("Sell Price *")]
        [NotePriceValidation]
        public decimal? SellingPrice { get; set; }

        [DisplayName("Note Preview")]
        [NotePreviewValidation]
        public HttpPostedFileBase NotesPreview { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public bool IsActive { get; set; }

        public CountryModel country1 { get; set; }
        public NoteCategoryModel noteCategory { get; set; }
        public NoteTypeModel noteType1 { get; set; }
        public ReferenceDataModel ReferenceData { get; set; }
        public UserModel user { get; set; }
        public UserModel user1 { get; set; }

        public string Picture { get; set; }
        public string Preview { get; set; }
    }
}
