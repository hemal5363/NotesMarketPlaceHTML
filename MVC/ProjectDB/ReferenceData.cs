//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectDB
{
    using System;
    using System.Collections.Generic;
    
    public partial class ReferenceData
    {
        public ReferenceData()
        {
            this.SellerNotes = new HashSet<SellerNote>();
            this.UserProfiles = new HashSet<UserProfile>();
        }
    
        public int ID { get; set; }
        public string Value { get; set; }
        public string Datavalue { get; set; }
        public string RefCategory { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public bool IsActive { get; set; }
    
        public virtual ICollection<SellerNote> SellerNotes { get; set; }
        public virtual ICollection<UserProfile> UserProfiles { get; set; }
    }
}
