namespace Adroit.Accounting.Web.Models
{
    public class EmailSetup
    {
        public string DisplayName { get; set; }
        public string EmailUsername { get; set; }
        public string EmailPassword { get; set; }
        public string ServerHost { get; set; }
        public int? ServerPort { get; set; }
        public bool IsEnableSSL { get; set; }
    }
}
