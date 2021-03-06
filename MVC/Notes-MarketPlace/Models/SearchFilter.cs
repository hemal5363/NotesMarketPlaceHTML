using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class SearchFilter
    {
        public string searchBar { get; set; }
        public int type { get; set; }
        public int category { get; set; }
        public string univarsity { get; set; }
        public string course { get; set; }
        public int country { get; set; }
        public int reting { get; set; }
    }
}