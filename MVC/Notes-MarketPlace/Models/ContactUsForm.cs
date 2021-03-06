using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class ContactUsForm
    {
        [RegularExpression(@"[a-z A-Z]{2,}",
        ErrorMessage = "Please enter valid name.")]
        [DisplayName("Full Name *")]
        [Required]
        public string FullName { get; set; }

        [DisplayName("Email Address *")]
        [Required]
        public string Email { get; set; }

        [DisplayName("Subject *")]
        [Required]
        public string Subject { get; set; }

        [DisplayName("Comments / Question *")]
        [Required]
        public string Comments { get; set; }
    }
}