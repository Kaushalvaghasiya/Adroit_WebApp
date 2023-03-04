using System.Net.Mail;
using System.Net;

namespace Adroit.Accounting.Utility
{
    public static class EmailHelper
    {
        public static async Task SendEmail(string p_fromAddress, string p_fromPassword, string p_displayName, int p_port, string p_host, bool p_ssl, string emailId
            , string subject, string body, string attachmentFile)
        {
            try
            {
                var fromAddress = p_fromAddress;
                var fromPassword = p_fromPassword;
                var displayName = p_displayName;
                var port = p_port;
                var host = p_host;
                var ssl = p_ssl;

                var mail = new MailMessage
                {
                    IsBodyHtml = true,
                    Body = body,
                    From = new MailAddress(fromAddress, displayName)
                };

                mail.To.Add(emailId);
                mail.Subject = subject;

                if (!string.IsNullOrEmpty(attachmentFile))
                {
                    var attachment = new Attachment(attachmentFile);
                    mail.Attachments.Add(attachment);
                }

                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
                var cred = new NetworkCredential(fromAddress, fromPassword);
                var smtp = new SmtpClient(host, port)
                {
                    EnableSsl = ssl,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = cred
                };
                smtp.SendCompleted += new SendCompletedEventHandler(smtp_SendCompleted);
                smtp.Send(mail);
            }
            catch (Exception e)
            {
                //LogFile.AddException("SendEmail", e.Message);
            }
        }

        public static void smtp_SendCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {
            if (e.Cancelled == true || e.Error != null)
            {
                throw new Exception(e.Cancelled ? "EMail sedning was canceled." : "Error: " + e.Error.ToString());
            }
        }
    }
}