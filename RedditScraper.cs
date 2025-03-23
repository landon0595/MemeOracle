using Newtonsoft.Json;
using RestSharp;


namespace MemeFinder
{
    public class RedditScraper
    {
        public static async Task ScrapeSubreddits(string accessToken)
        {
            // Create RestClientOptions for authenticating API requests
            string url = "https://oauth.reddit.com/";
            RestClientOptions clientOptions = new RestClientOptions(url)
            {
                ThrowOnAnyError = true, //ensure errors throw exceptions
                Timeout = TimeSpan.FromMilliseconds(5000) //Optional timeout
            };

            RestClient client = new RestClient(clientOptions);
            //List of subreddits to scrape
            List<string> subreddits = new List<string> { "memecoinmoonshots", "dankmemes" };

            foreach (var subredditName in subreddits)
            {
                try
                {
                    Console.WriteLine($"Scraping top posts from r/{subredditName}:");
                    Console.WriteLine();

                    //Fetch top posts from this week
                    var request = new RestRequest($"r/{subredditName}/top", Method.Get);
                    request.AddHeader("Authorization", $"Bearer {accessToken}");
                    request.AddParameter("t", "week");//Parameter to fetch top posts for the past week

                    //execute the request
                    var response = await client.ExecuteAsync(request);

                    //Check if the response is successful
                    if (response.StatusCode != System.Net.HttpStatusCode.OK)
                    {
                        Console.WriteLine($"Error fetching posts: {response.StatusDescription}");
                        continue; //Skip to next subreddit in case of failure 
                    }
                    if (string.IsNullOrEmpty(response.Content))
                    {
                        Console.WriteLine("Response content is null or empty");
                        return;
                    }
                    else
                    {
                        //For testing: print raw JSON (first 200 character)
                        //string previewContent = response.Content.Length > 200 ? response.Content.Substring(0, 200) : response.Content;
                        //Console.WriteLine("Raw JSON Response (Preview): ");
                        //Console.WriteLine(previewContent);

                        //For Testing: Print formatted as Json
                        //string formattedJson = JsonConvert.SerializeObject(JsonConvert.DeserializeObject(response.Content), Formatting.Indented);
                        //Console.WriteLine("formatted JSON Response: ");
                        //Console.WriteLine(formattedJson);

                        //Deserialize topPosts
                        PostResponse? topPosts = JsonConvert.DeserializeObject<PostResponse>(response.Content);


                        if (topPosts == null || topPosts.Data == null || topPosts.Data.Children == null || topPosts.Data.Children.Length == 0)
                        {
                            Console.WriteLine("No posts found or there was an error fetching posts ");
                            Console.WriteLine();
                        }
                        else
                        {
                            Console.WriteLine("Posts found, processing...");
                            Console.WriteLine();
                            DateTime oneWeekAgo = DateTime.UtcNow.AddDays(-7);

                            foreach (PostDataWrapper postWrapper in topPosts.Data.Children)
                            {
                                var post = postWrapper.Data;
                                DateTime postDate = DateTimeOffset.FromUnixTimeSeconds(post.Created).DateTime;

                                if (postDate > oneWeekAgo)
                                {
                                    Console.WriteLine($"Title: {post.Title}");
                                    Console.WriteLine($"URL: {post.Url}");
                                    Console.WriteLine(new String('-', 50));
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    //basic exception details
                    Console.WriteLine($"An error ocurred: {ex.Message}");
                    Console.WriteLine($"StackTrace: {ex.StackTrace}");

                    //Additional logging if it's an API related issue
                    if (ex is System.Net.Http.HttpRequestException httpRequestException)
                    {
                        Console.WriteLine("HttpRequestException occured while making the request.");
                        Console.WriteLine($"Error Message: {httpRequestException.Message}");
                    }

                    //Handle specific exceptions (optional)
                    if (ex is Newtonsoft.Json.JsonReaderException)
                    {
                        Console.WriteLine("There is an issue parsing the JSON response. Check the API response.");
                    }

                    Console.WriteLine("\n");
                }
            }
        }
    }
}

    