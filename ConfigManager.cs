using DotNetEnv;

namespace MemeFinder
{
    public class ConfigManager
    {
        public static void LoadEnvVariables()
        {
            Env.TraversePath().Load();
        }

        //static API keys
        public static string clientId => Environment.GetEnvironmentVariable("CLIENT_ID") ?? string.Empty;
        public static string clientSecret => Environment.GetEnvironmentVariable("CLIENT_SECRET") ?? string.Empty;
        public static string refreshToken => Environment.GetEnvironmentVariable("REFRESH_TOKEN") ?? string.Empty;

        //Refreshed access token (not in .env)
        private static string? _accessToken;
        public static string accessToken
        {
            get => _accessToken ?? string.Empty;
            set => _accessToken = value;
        }
    }
}
