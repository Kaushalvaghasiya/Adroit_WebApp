namespace Adroit.Accounting.Utility
{
    public class RandomNumber
    {
        public static string SixDigigNumber()
        {
            Random generator = new Random();
            String r = generator.Next(0, 1000000).ToString("D6");
            return r;
        }
    }
}
