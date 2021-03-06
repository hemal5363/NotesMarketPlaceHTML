using ProjectDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class SearchNoteViewModel
    {
        public SearchNoteViewModel()
        {
            MarketPlaceEntities marketPlaceEntities = new MarketPlaceEntities();

            types = marketPlaceEntities.NoteTypes.ToList();
            categories = marketPlaceEntities.NoteCategories.ToList();
            countries = marketPlaceEntities.Countries.ToList();
            retings = new List<int>();
            retings.Add(1);
            retings.Add(2);
            retings.Add(3);
            retings.Add(4);
            retings.Add(5);
            universitys = marketPlaceEntities.SellerNotes.Where(s => s.UniversityName != null).Select(u => u.UniversityName).Distinct();
            courses = marketPlaceEntities.SellerNotes.Where(s => s.Course != null).Select(c => c.Course).Distinct();
        }

        public IEnumerable<SellerNote> sellerNotes { get; set; }
        public IEnumerable<NoteType> types { get; set; }
        public IEnumerable<NoteCategory> categories { get; set; }
        public IEnumerable<string> universitys { get; set; }
        public IEnumerable<string> courses { get; set; }
        public IEnumerable<Country> countries { get; set; }
        public IList<int> retings { get; set; }
        public SearchFilter searchFilter { get; set; }
        public int totalNotes { get; set; }
        public int activePageNumber { get; set; }
    }
}