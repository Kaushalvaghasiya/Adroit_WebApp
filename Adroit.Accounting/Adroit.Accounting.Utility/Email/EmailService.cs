using Adroit.Accounting.Model;
using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.Extensions.Options;
using MimeKit;

namespace Adroit.Accounting.Utility
{
    public class EmailService : IEmailService
    {
        private readonly EmailSettings _emailSettings = null;
        public EmailService(IOptions<EmailSettings> options)
        {
            _emailSettings = options.Value;
        }

        public string SendEmail(string to, string title, string body, IList<string>? attachments = null, string cc = "")
        {
            MimeMessage emailMessage = new MimeMessage();

            MailboxAddress emailFrom = new MailboxAddress(_emailSettings.DisplayName, _emailSettings.FromEmail);
            emailMessage.From.Add(emailFrom);

            MailboxAddress emailTo = new MailboxAddress("", to);
            emailMessage.To.Add(emailTo);

            emailMessage.Subject = title;

            BodyBuilder emailBodyBuilder = new BodyBuilder();
            emailBodyBuilder.HtmlBody = body;
            emailMessage.Body = emailBodyBuilder.ToMessageBody();

            using (SmtpClient emailClient = new SmtpClient())
            {
                
                emailClient.Connect(_emailSettings.Host, _emailSettings.Port, SecureSocketOptions.StartTls);
                if (!string.IsNullOrWhiteSpace(_emailSettings.Username))
                {
                    emailClient.Authenticate(_emailSettings.Username, _emailSettings.Password);
                }

                string result = emailClient.Send(emailMessage);
                
                emailClient.Disconnect(true);
                emailClient.Dispose();

                return result;
            }
        }
    }
}