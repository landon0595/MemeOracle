using Newtonsoft.Json;
using RestSharp;

namespace MemeFinder
{
    public class RedditScraper
    {
        public async Task<PostResponse> ScrapeSubreddits(string subreddit, string accessToken, string timeFilter = "week")
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
                    request.AddParameter("t", timeFilter);//Parameter to fetch top posts for the past week

                    //execute the request
                    var response = await client.ExecuteAsync(request);

                    //(Duplicate)Debug: Print the raw JSON response
                    //var parsedJson = JsonConvert.DeserializeObject(response.Content);
                    //var formattedJson = JsonConvert.SerializeObject(parsedJson, Formatting.Indented);
                    //Console.WriteLine("Raw Json response");
                    //Console.WriteLine(formattedJson);

                    //Check if the response is successful
                    if (response.StatusCode != System.Net.HttpStatusCode.OK)
                    {
                        Console.WriteLine($"Error fetching posts: {response.StatusDescription}");
                        continue; //Skip to next subreddit in case of failure 
                    }
                    if (string.IsNullOrEmpty(response.Content))
                    {
                        Console.WriteLine("Response content is null or empty");
                        return new PostResponse();
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
                            return new PostResponse();
                        }
                        else
                        {
                            Console.WriteLine("Posts found, processing...");
                            Console.WriteLine();
                            DateTime now = DateTime.UtcNow;
                            DateTime oneWeekAgo = DateTime.UtcNow.AddDays(-7);
                            DateTime oneMonthAgo = DateTime.UtcNow.AddDays(-30);
                            DateTime oneYearAgo = DateTime.UtcNow.AddDays(-360);

                            //put posts into lists based on times
                            var posts = topPosts.Data.Children.Select(wrapper => wrapper.Data).ToList();

                            var weeklyPosts = posts.Where(post =>
                            {
                                DateTime postDate = DateTimeOffset.FromUnixTimeSeconds(post.Created).DateTime;
                                return postDate > oneWeekAgo;
                            }).ToList();

                            var monthlyPosts = posts.Where(post =>
                            {
                                DateTime postDate = DateTimeOffset.FromUnixTimeSeconds(post.Created).DateTime;
                                return postDate <= oneWeekAgo && postDate > oneMonthAgo;
                            }).ToList();

                            var yearlyPosts = posts.Where(post =>
                            {
                                DateTime postDate = DateTimeOffset.FromUnixTimeSeconds(post.Created).DateTime;
                                return postDate <= oneMonthAgo && postDate > oneYearAgo;
                            }).ToList();


                            Console.WriteLine("Weekly Post");
                            foreach (var weeklyPost in weeklyPosts)
                            {
                                Console.WriteLine($"Title: {weeklyPost.Title}");
                                Console.WriteLine($"URL: {weeklyPost.Url}");
                                Console.WriteLine($"ImageUrl: {weeklyPost.ImageUrl}");
                                Console.WriteLine(new string('-', 50));
                            }
                            Console.WriteLine("Monthly Post");
                            foreach (var monthlyPost in monthlyPosts)
                            {
                                Console.WriteLine($"Title: {monthlyPost.Title}");
                                Console.WriteLine($"URL: {monthlyPost.Url}");
                                Console.WriteLine($"ImageUrl: {monthlyPost.ImageUrl}");
                                Console.WriteLine(new string('-', 50));
                            }
                            Console.WriteLine("Yearly Post");
                            foreach (var yearlyPost in yearlyPosts)
                            {
                                Console.WriteLine($"Title: {yearlyPost.Title}");
                                Console.WriteLine($"URL: {yearlyPost.Url}");
                                Console.WriteLine($"ImageUrl: {yearlyPost.ImageUrl}");
                                Console.WriteLine(new string('-', 50));
                                //For testing = just 3 responses (Very top post)
                                //return new PostResponse();
                            }
                            Console.WriteLine($"Weekly posts count: {weeklyPosts.Count}");
                            Console.WriteLine($"Monthly posts count: {monthlyPosts.Count}");
                            Console.WriteLine($"Yearly posts count: {yearlyPosts.Count}");
                            return topPosts;
                        }
                    }
                }


                catch (Exception ex)
                {
                    //basic exception details
                    Console.WriteLine($"An error ocurred: {ex.Message}");
                    Console.WriteLine($"StackTrace: {ex.StackTrace}");

                    //Additional logging if it's an API related issue
                    if (ex is HttpRequestException httpRequestException)
                    {
                        Console.WriteLine("HttpRequestException occured while making the request.");
                        Console.WriteLine($"Error Message: {httpRequestException.Message}");
                        return new PostResponse();
                    }

                    //Handle specific exceptions (optional)
                    if (ex is JsonReaderException)
                    {
                        Console.WriteLine("There is an issue parsing the JSON response. Check the API response.");
                        return new PostResponse();
                    }

                    Console.WriteLine("\n");
                }
            }

            return new PostResponse();
        }
    }
}

