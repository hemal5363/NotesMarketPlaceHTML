using ProjectDB;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class AddAdminViewModel
    {
        public AddAdminViewModel()
        {
            MarketPlaceEntities market = new MarketPlaceEntities();

            PhoneCountryCode = market.Countries.Where(p => p.IsActive == true).Select(p => p.CountryCode).ToList();
        }

        public List<string> PhoneCountryCode { get; set; }

        public int SID { get; set; }

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
        [Required]
        public string Email { get; set; }

        [DisplayName("Country Code")]
        [Required]
        public string PhoneNumber_CountryCode { get; set; }

        [DisplayName("Phone Number")]
        [Required]
        [RegularExpression(@"[0-9]{10}",
        ErrorMessage = "Please enter valid Phone Number.")]
        public string PhoneNumber { get; set; }
    }
}