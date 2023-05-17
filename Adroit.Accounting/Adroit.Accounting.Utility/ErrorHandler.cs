namespace Adroit.Accounting.Utility
{
    public class ErrorHandler
    {
        public static string GetError(Exception ex)
        {
            string error = "";
            if (null != ex.InnerException)
            {
                error = GetError(ex.InnerException);
            }
            else
            {
                error = ex.Message;
            }
            return error;
        }
    }
}