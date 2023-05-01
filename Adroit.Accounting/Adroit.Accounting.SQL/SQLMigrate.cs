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

            var tablePath = Path.Combine(scriptsPath, "DbScripts\\Tables");
            if (Directory.Exists(tablePath))
            {
                var upgradeConfig = DeployChanges.To
                    .SqlDatabase(builder.ConnectionString)
                    .WithScriptsFromFileSystem(tablePath)
                    .WithExecutionTimeout(TimeSpan.FromSeconds(timeoutHours * 3600));


                var upgrader = upgradeConfig.Build();

                var result = upgrader.PerformUpgrade();

                if (!result.Successful)
                {
                    Console.WriteLine($"Schema changes Exception: {result.Error.ToString()}");
                    throw result.Error;
                }
            }

            var dataPath = Path.Combine(scriptsPath, "DbScripts\\DataScript");
            if (Directory.Exists(dataPath))
            {
                var upgradeConfig = DeployChanges.To
                                .SqlDatabase(builder.ConnectionString)
                                .JournalTo(new NullJournal())
                                .WithScriptsFromFileSystem(dataPath)
                                .WithExecutionTimeout(TimeSpan.FromSeconds(timeoutHours * 3600));

                var upgrader = upgradeConfig.Build();

                var result = upgrader.PerformUpgrade();

                if (!result.Successful)
                {
                    Console.WriteLine($"Data Script Exception: {result.Error.ToString()}");
                    throw result.Error;
                }
            }


            // Execute Stored Procedure.
            var spPath = Path.Combine(scriptsPath, "DbScripts\\StoreProc");
            if (Directory.Exists(spPath))
            {
                var upgradeConfig = DeployChanges.To
                    .SqlDatabase(builder.ConnectionString)
                    .JournalTo(new NullJournal())
                    .WithScriptsFromFileSystem(spPath)
                    .WithExecutionTimeout(TimeSpan.FromSeconds(timeoutHours * 3600));

                var upgrader = upgradeConfig.Build();

                var result = upgrader.PerformUpgrade();

                if (!result.Successful)
                {
                    Console.WriteLine($"Stored Procedure Exception: {result.Error.ToString()}");
                    throw result.Error;
                }
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.WriteLine("");
            Console.ResetColor();
        }
    }
}
