using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Notes_MarketPlace.Models
{
    public class AutoEmailSend
    {
        public static void SendEmail(MailAddress toEmail, string subject, string body)
        {
            var fromEmail = new MailAddress("hemalparmar2017@gmail.com", "Notes-MarketPlace");
            var fromEmailPassword = "#";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromEmail.Address, fromEmailPassword)
            };

            using (var massege = new MailMessage(fromEmail, toEmail)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
                smtp.Send(massege);
        }
    }
}
