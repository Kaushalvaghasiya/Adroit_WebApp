using DbUp;
using DbUp.Helpers;
using System.Data.SqlClient;
using System.Reflection;

namespace Adroit.Accounting.SQL
{
    public static class SQLMigrate
    {
        private static string GetSqlScriptPath()
        {
            string codeBase = Assembly.GetExecutingAssembly().Location;// Assembly.GetExecutingAssembly().CodeBase;
            UriBuilder uri = new UriBuilder(codeBase);
            string path = Uri.UnescapeDataString(uri.Path);
            return Path.GetDirectoryName(path);
        }

        public static void ExecuteSQL(string connectionString)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectionString);
            builder.MultipleActiveResultSets = false;

            var timeoutHours = 3;

            var scriptsPath = GetSqlScriptPath();

            var upgradeConfig = DeployChanges.To
                .SqlDatabase(builder.ConnectionString)
                .WithScriptsFromFileSystem(Path.Combine(scriptsPath, "DbScripts\\Tables"))
                .WithExecutionTimeout(TimeSpan.FromSeconds(timeoutHours * 3600));


            var upgrader = upgradeConfig.Build();

            var result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.WriteLine($"Schema changes Exception: {result.Error.ToString()}");
                throw result.Error;
            }

            //
            upgradeConfig = DeployChanges.To
                            .SqlDatabase(builder.ConnectionString)
                            .JournalTo(new NullJournal())
                            .WithScriptsFromFileSystem(Path.Combine(scriptsPath, "DbScripts\\DataScript"))
                            .WithExecutionTimeout(TimeSpan.FromSeconds(timeoutHours * 3600));

            upgrader = upgradeConfig.Build();

            result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.WriteLine($"Data Script Exception: {result.Error.ToString()}");
                throw result.Error;
            }


            // Execute Stored Procedure.

            upgradeConfig = DeployChanges.To
                .SqlDatabase(builder.ConnectionString)
                .JournalTo(new NullJournal())
                .WithScriptsFromFileSystem(Path.Combine(scriptsPath, "DbScripts\\StoreProc"))
                .WithExecutionTimeout(TimeSpan.FromSeconds(timeoutHours * 3600));

            upgrader = upgradeConfig.Build();

            result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.WriteLine($"Stored Procedure Exception: {result.Error.ToString()}");
                throw result.Error;
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.WriteLine("");
            Console.ResetColor();
        }
    }
}
