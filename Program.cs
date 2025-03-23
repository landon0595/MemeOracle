using DotNetEnv;
using MemeFinder;
using Newtonsoft.Json;
using RestSharp;
using System.Text;
using static System.Net.WebRequestMethods;

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
        await RefreshAccessToken(clientId, clientSecret, refreshToken);

        if (!string.IsNullOrEmpty(accessToken))
        {

            //use the refreshed token to scrape data
            await RedditScraper.ScrapeSubreddits(accessToken);
        }
        else
        {
            Console.WriteLine("Failed to refresh the access Token");
        }
    }
    public class TokenResponse
    {
        [JsonProperty("access_token")]
        public required string AccessToken { get; set; } = string.Empty;
    }
    //Method the refresh the access token using the refresh token
    static async Task RefreshAccessToken(string clientId, string clientSecret, string refreshToken)
    {
        try
        {
            //load environmental variables
            ConfigManager.LoadEnvVariables();

            var options = new RestClientOptions("https://www.reddit.com/api/v1/access_token")
            {
                ThrowOnAnyError = true,
                Timeout = TimeSpan.FromMilliseconds(5000) //optional timeout in milliseconds
            };

            var client = new RestClient(options);
            var request = new RestRequest("", Method.Post);

            //encode clientId and clientSecret in Base64
            string credentials = Convert.ToBase64String(Encoding.ASCII.GetBytes($"{clientId}:{clientSecret}"));
            request.AddHeader("Authorization", $"Basic {credentials}");

            //Add parmeters to the request
            request.AddParameter("grant_type", "refresh_token", ParameterType.GetOrPost);
            request.AddParameter("refresh_token", refreshToken, ParameterType.GetOrPost);

            //For testing purposes (DONT KEEP IN CODE) Prints refresh token
            //Console.WriteLine($"Refresh Token: {refreshToken}");

            //set headers
            request.AddHeader("User-Agent", "MemeOracle/1.0 by SprayEcstatic4700");

            //execute the request to refresh the token
            var response = await client.ExecuteAsync(request);

            if (response.IsSuccessful)
            {
                if (!string.IsNullOrEmpty(response.Content))
                {
                    try
                    {
                        TokenResponse? jsonResponse = JsonConvert.DeserializeObject<TokenResponse>(response.Content);

                        if (jsonResponse != null && !string.IsNullOrEmpty(jsonResponse.AccessToken))
                        {
                            accessToken = jsonResponse.AccessToken;
                            Console.WriteLine("Access Token refreshed successfully");
                        }
                        else
                        {
                            // Log the error with status code and content
                            Console.WriteLine($"Failed to refresh the access token. Status code: {response.StatusCode}");
                        }
                    }

                    catch (JsonException)
                    {
                        Console.WriteLine($"Error parsing JSON does not contain a valid access token");
                    }
                }
            }
            else
            {
                Console.WriteLine($"An error has occured while refreshing the access token: {response.StatusCode}");
                Console.WriteLine("Response content is null or empty");
            }
        }
        finally
        {
            Console.WriteLine("Successful communication with Reddit API");
            Console.WriteLine();            
        }
    }
}













