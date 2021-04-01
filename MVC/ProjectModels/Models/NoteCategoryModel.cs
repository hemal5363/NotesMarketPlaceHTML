using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectModels.Models
{
    public class NoteCategoryModel
    {
        public int ID { get; set; }

        [DisplayName("Category Name *")]
        [Required]
        public string Name { get; set; }

        [DisplayName("Description *")]
        [Required]
        public string Description { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public bool IsActive { get; set; }

        public UserModel User { get; set; }
    }
}
