using MemeFinder.Configuration;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using static MemeFinder.Program;


namespace MemeFinder.Services
{
    public class AuthService
    {
        
        //Method the refresh the access token using the refresh token
        public static async Task<string> RefreshAccessToken()
        {
            try
            {
                ConfigManager.LoadEnvVariables();
                //Hardcode credentials - FOR TESTING ONLY - DELETE WHEN DONE
                string clientId = " ";
                string clientSecret = " ";
                string refreshToken = " ";

                //load credentials from ConfigManager - DO NOT KEEP HARDCODED
                //string clientId = ConfigManager.clientId; 
                //string clientSecret = ConfigManager.clientSecret;
                //string refreshToken = ConfigManager.refreshToken;

                Debug.WriteLine($"clientId: {clientId}");
                Debug.WriteLine($"clientSecret: {clientSecret}");
                Debug.WriteLine($"refreshToken: {refreshToken}");

                if (string.IsNullOrEmpty( clientId ) ||
                    string.IsNullOrEmpty( clientSecret ) ||
                    string.IsNullOrEmpty( refreshToken )) 
                    {
                    Debug.WriteLine("One or more required environment variables are missing.");
                    return string.Empty;
                    }

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
                //Console.WriteLine($"Client Secret: {clientSecret}");
                //Console.WriteLine($"Client Id: {clientId}");
                //Console.WriteLine($"Access Token: {accessToken}");

                //set headers
                request.AddHeader("User-Agent", "MemeOracle/1.0 by SprayEcstatic4700");

                //execute the request to refresh the token
                var response = await client.ExecuteAsync(request);
                Debug.WriteLine($"Response Status: {response.StatusCode}");
                Debug.WriteLine($"Response Content: {response.Content}");

                string token = string.Empty;
                if (response.IsSuccessful && !string.IsNullOrEmpty(response.Content))
                {
                    var tokenResponse = JsonConvert.DeserializeObject<TokenResponse>(response.Content);
                    token = tokenResponse?.AccessToken ?? string.Empty;
                }
                else
                {
                    Debug.WriteLine("Token refresh failed. Response: " + response.Content);
                }
                return token;
            }

            catch (JsonException jsonEx)
            {
                Console.WriteLine($"Error parsing JSON: {jsonEx.Message}");
                return string.Empty;
            }
                catch (Exception ex) 
            {
                Console.WriteLine($"An error has occured while refreshing the access token: {ex.Message}");
                return string.Empty;
            }
            
            finally
            {
                Console.WriteLine("Successful communication with Reddit API");
                Console.WriteLine();
            }
        }
    }
    public class TokenResponse
    {
        [JsonProperty("access_token")]
        public required string AccessToken { get; set; } = string.Empty;
    }
}
