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
    public class UserProfileModel
    {
        public int ID { get; set; }
        public int UserID { get; set; }

        [DisplayName("Date Of Birth")]
        public DateTime? DOB { get; set; }
        public int? Gender { get; set; }
        public string SecondaryEmailAddress { get; set; }

        [DisplayName("Country Code")]
        [Required]
        public string PhoneNumber_CountryCode { get; set; }

        [DisplayName("Phone Number *")]
        [RegularExpression(@"[0-9]{10}",
        ErrorMessage = "Please enter valid Phone Number.")]
        [Required]
        public string PhoneNumber { get; set; }

        [DisplayName("Profile Picture")]
        public HttpPostedFileBase ProfilePicture { get; set; }

        [DisplayName("Address Line 1 *")]
        [Required]
        public string AddressLine1 { get; set; }

        [DisplayName("Address Line 2 *")]
        [Required]
        public string AddressLine2 { get; set; }

        [DisplayName("City *")]
        [Required]
        public string City { get; set; }

        [DisplayName("State *")]
        [Required]
        public string State { get; set; }

        [DisplayName("ZipCode *")]
        [Required]
        public string ZipCode { get; set; }

        [DisplayName("Country *")]
        [Required]
        public string Country { get; set; }
        public string University { get; set; }
        public string College { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public ReferenceDataModel ReferenceData { get; set; }
        public UserModel User { get; set; }

        public string Picture { get; set; }
    }
}
