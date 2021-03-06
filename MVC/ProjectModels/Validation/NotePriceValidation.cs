using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectModels.Validation
{
    public class NotePriceValidation : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var sellerNoteModel = (SellerNoteModel)validationContext.ObjectInstance;

            if (sellerNoteModel.IsPaid == false)
                return ValidationResult.Success;

            if (sellerNoteModel.SellingPrice == null)
                return new ValidationResult("The Sell Price * fild is required.");

            return ValidationResult.Success;
        }
    }
}
