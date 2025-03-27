using MemeOracle_SharedLibrary;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MemeFinder.Wrapper
{
    public class MemeServiceWrapper : IMemeService
    {
        
        //stores access token here
        private string _accessToken = string.Empty;

        public void SetAccessToken(string token)
        {
            _accessToken = token;
        }

        //for accessing RedditScrapper
        private readonly RedditScraper _redditScraper = new RedditScraper();

        public async Task<List<SharedMeme>> GetMemesAsync(string timeFilter = "week")
        {
            Debug.WriteLine("Entering GetMemeAsync");
            if (string.IsNullOrEmpty(_accessToken))
            {
                throw new Exception("Access token is not yet set.");
            }
            Debug.WriteLine($"Access token used: {_accessToken}");

            //call reddit scrapper to fetch posts
            var postResponse = await _redditScraper.ScrapeSubreddits("memes", _accessToken, timeFilter);

            Debug.WriteLine($"Scraper returned null: {postResponse == null}");
            var children = postResponse?.Data?.Children?.ToList();
            Debug.WriteLine($"Children count: {children?.Count ?? 0}");

            List<SharedMeme> memes = new List<SharedMeme>();

            if (postResponse?.Data?.Children != null)
            {
                foreach (var wrapper in postResponse.Data.Children)
                {
                    Debug.WriteLine($"Meme: {wrapper.Data.Title}");

                    memes.Add(new SharedMeme
                    {
                        Title = wrapper.Data.Title,
                        Url = wrapper.Data.Url,
                        ImageUrl = wrapper.Data.ImageUrl,
                        Created = wrapper.Data.Created,

                    });
                }
            }
            return memes;
        }
    }
}
