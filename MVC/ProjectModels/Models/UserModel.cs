using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace ProjectModels.Models
{
    public class UserModel
    {
        public int ID { get; set; }
        public int RoleID { get; set; }

        [RegularExpression(@"[a-zA-Z]{2,}",
        ErrorMessage = "Please enter valid name.")]
        [Display(Name = "First Name")]
        [Required]
        public string FirstName { get; set; }

        [RegularExpression(@"[a-zA-Z]{2,}",
        ErrorMessage = "Please enter valid name.")]
        [Display(Name = "Last Name")]
        [Required]
        public string LastName { get; set; }

        [DisplayName("Email")]
        [Required]
        public string EmailID { get; set; }

        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{6,24}$",
        ErrorMessage = "Please enter strong password")]
        [Required]
        public string Password { get; set; }

        [Compare("Password", ErrorMessage = "Password and Confirmation Password must match.")]
        [Display(Name = "Conform Password")]
        [Required]
        public string ConformPassword { get; set; }
        public bool IsEmailVerified { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public bool IsActive { get; set; }

        public UserRoleModel UserRole { get; set; }

        public string Error { get; set; }
        public string Success { get; set; }
        public bool RememberMe { get; set; }
    }
}
