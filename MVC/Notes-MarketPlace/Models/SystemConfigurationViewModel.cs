using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class SystemConfigurationViewModel
    {
        [DisplayName("Support emails address *")]
        [Required]
        public string SupportEmail { get; set; }

        [DisplayName("Support phone number *")]
        [Required]
        public string SupportPhoneNumber { get; set; }

        [DisplayName("Email Address(es)(for various events system will send notifications to these users) *")]
        [Required]
        public string EmailAddress { get; set; }

        [DisplayName("Facebook URL")]
        public string FacebookURL { get; set; }

        [DisplayName("Twitter URL")]
        public string TwitterURL { get; set; }

        [DisplayName("Linkedin URL")]
        public string LinkedinURL { get; set; }

        [DisplayName("Default image for notes (if seller do not upload)")]
        public HttpPostedFileBase DefaultImageForNote { get; set; }

        [DisplayName("Default profile picture (if seller do not upload)")]
        public HttpPostedFileBase DefaultProfilePicture { get; set; }
    }
}