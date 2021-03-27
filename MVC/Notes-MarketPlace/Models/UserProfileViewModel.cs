using ProjectDB;
using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class UserProfileViewModel
    {
        public UserProfileViewModel()
        {
            MarketPlaceEntities marketPlaceEntities = new MarketPlaceEntities();

            GenderList = marketPlaceEntities.ReferenceDatas.Where(g => g.RefCategory == "Gender" && g.IsActive == true).ToList();
            PhoneCodeList = marketPlaceEntities.Countries.Select(p => p.CountryCode).ToList();
            CountriesList = marketPlaceEntities.Countries.Select(c => c.Name).ToList();
        }

        public UserProfileModel UserProfileModel { get; set; }
        public IEnumerable<ReferenceData> GenderList { get; set; }
        public IEnumerable<string> PhoneCodeList { get; set; }
        public IEnumerable<string> CountriesList { get; set; }

        [DisplayName("Email *")]
        public string Email { get; set; }

        [DisplayName("First Name *")]
        [Required]
        public string FirstName { get; set; }

        [DisplayName("Last Name *")]
        [Required]
        public string LastName { get; set; }
    }
}