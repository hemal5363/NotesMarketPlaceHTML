using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDB.DBOparetions
{
    public class TransactionRepository
    {
        public void SellerAllow(Download download)
        {
            using (var context = new MarketPlaceEntities())
            {
                var downloadDB = context.Downloads.Where(u => u.ID == download.ID).FirstOrDefault();

                downloadDB.IsSellerHasAllowedDownload = true;
                downloadDB.ModifiedDate = DateTime.Now;
                downloadDB.ModifiedBy = download.Seller;

                context.SaveChanges();
            }
        }
    }
}
