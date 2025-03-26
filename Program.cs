using DotNetEnv;
using MemeFinder;
using MemeOracle_SharedLibrary;
using Newtonsoft.Json;
using RestSharp;
using System.Text;
using static System.Net.WebRequestMethods;
using MemeFinder.Services;
using MemeFinder.Configuration;


namespace MemeFinder;
class Program
{

    public static string accessToken = string.Empty;
    public static async Task Main(string[] args)
    {

        //load environmental variables
        ConfigManager.LoadEnvVariables();

        string clientId = ConfigManager.clientId;
        string clientSecret = ConfigManager.clientSecret;
        string refreshToken = ConfigManager.refreshToken;


        //debug if tokens are being accessed
        if (string.IsNullOrEmpty(clientId))
        {
            Console.WriteLine("CLIENT_ID is missing!");
        }
        if (string.IsNullOrEmpty(clientSecret))
        {
            Console.WriteLine("CLIENT_SECRET is missing!");
        }
        if (string.IsNullOrEmpty(refreshToken))
        {
            Console.WriteLine("REFRESH_TOKEN is missing!");
        }
        //Authenticate using Reddit API credentials and refresh the access token
        await AuthService.RefreshAccessToken();

        if (!string.IsNullOrEmpty(accessToken))
        {
            var scraper = new RedditScraper();
            //use the refreshed token to scrape data
            await scraper.ScrapeSubreddits("memecoinmoonshots+dankmemes", accessToken);
        }
        else
        {
            Console.WriteLine("Failed to refresh the access Token");
        }
    }
}
    












