using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class ChangePasswordViewModel
    {
        [Display(Name = "Old Password")]
        [Required]
        public string OldPassword { get; set; }

        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{6,24}$",
        ErrorMessage = "Please enter strong password")]
        [Display(Name = "New Password")]
        [Required]
        public string NewPassword { get; set; }

        [Compare("NewPassword", ErrorMessage = "New Password and Confirmation Password must match.")]
        [Display(Name = "Conform Password")]
        [Required]
        public string ConformPassword { get; set; }

        public string Error { get; set; }
    }
}