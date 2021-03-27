using ProjectDB;
using ProjectModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class MyDownloadViewModel
    {
        public List<Download> Downloads { get; set; }
        public SellerNotesReviewModel SellerNotesReviewModel { get; set; }
        public SellerNotesReportedIssueModel SellerNotesReportedIssueModel { get; set; }
        public int id { get; set; }
    }
}