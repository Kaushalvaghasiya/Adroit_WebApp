
namespace Adroit.Accounting.Utility
{
    public interface IEmailService
    {
        string SendEmail(string to, string title, string body, IList<string>? attachments = null, string cc = "");
    }
}
