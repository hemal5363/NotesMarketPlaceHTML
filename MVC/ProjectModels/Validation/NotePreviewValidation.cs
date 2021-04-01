using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectModels.Validation
{
    public class NotePreviewValidation : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var sellerNoteModel = (SellerNoteModel)validationContext.ObjectInstance;

            if (sellerNoteModel.IsPaid == false)
                return ValidationResult.Success;

            if (sellerNoteModel.NotesPreview == null)
                return new ValidationResult("The Note Preview fild is required.");

            return ValidationResult.Success;
        }
    }
}
