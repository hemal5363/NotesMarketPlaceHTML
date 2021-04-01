using ProjectDB;
using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class AddNoteViewModel
    {
        public AddNoteViewModel()
        {
            MarketPlaceEntities marketPlaceEntities = new MarketPlaceEntities();
            NoteCategorieList = marketPlaceEntities.NoteCategories.Where(n => n.IsActive == true).ToList();
            NoteTypesList = marketPlaceEntities.NoteTypes.Where(n => n.IsActive == true).ToList();
            CountriesList = marketPlaceEntities.Countries.Where(n => n.IsActive == true).ToList();
        }

        public SellerNoteModel SellerNote { get; set; }
        public IEnumerable<NoteCategory> NoteCategorieList { get; set; }
        public SellerNotesAttachementModel SellerNotesAttachement { get; set; }
        public IEnumerable<NoteType> NoteTypesList { get; set; }
        public IEnumerable<Country> CountriesList { get; set; }
    }
}