using ProjectDB;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class AdminIndexPublishedNotesViewModel
    {
        public IEnumerable<SellerNote> SellerNote { get; set; }

        [Required]
        public string Remarks { get; set; }
        public int id { get; set; }
        public int status { get; set; }
    }
}