using ProjectDB;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class AdminProfileViewModel
    {
        public AdminProfileViewModel()
        {
            MarketPlaceEntities market = new MarketPlaceEntities();

            PhoneCountryCode = market.Countries.Where(n => n.IsActive == true).Select(p => p.CountryCode).ToList();
        }

        public List<string> PhoneCountryCode { get; set; }

        public int ID { get; set; }

        public int UID { get; set; }

        [DisplayName("First Name *")]
        [Required]
        [RegularExpression(@"[a-zA-Z]{2,}",
        ErrorMessage = "Please enter valid name.")]
        public string FirstName { get; set; }

        [DisplayName("Last Name *")]
        [Required]
        [RegularExpression(@"[a-zA-Z]{2,}",
        ErrorMessage = "Please enter valid name.")]
        public string LastName { get; set; }

        [DisplayName("Email *")]
        public string Email { get; set; }

        [DisplayName("Secondary Email")]
        public string SecondaryEmail { get; set; }

        public string PhoneNumber_CountryCode { get; set; }

        [DisplayName("Phone Number")]
        [RegularExpression(@"[0-9]{10}",
        ErrorMessage = "Please enter valid Phone Number.")]
        public string PhoneNumber { get; set; }

        [DisplayName("Profile Picture")]
        public HttpPostedFileBase ProfilePicture { get; set; }

        public string Picture { get; set; }
    }
}