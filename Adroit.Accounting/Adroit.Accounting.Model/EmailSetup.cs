namespace Adroit.Accounting.Model
{
    public class EmailSettings
    {
        public string DisplayName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Host { get; set; }
        public int Port { get; set; }
        public bool SSL { get; set; }
        public string FromEmail { get; set; }
    }
}
