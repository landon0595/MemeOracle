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

        public async Task<List<SharedMeme>> GetMemesAsync()
        {
            Debug.WriteLine("Entering GetMemeAsync");
            if (string.IsNullOrEmpty(_accessToken))
            {
                throw new Exception("Access token is not yet set.");
            }

            //call reddit scrapper to fetch posts
            var postResponse = await _redditScraper.ScrapeSubreddits("memes", _accessToken);

            List<SharedMeme> memes = new List<SharedMeme>();

            if (postResponse?.Data?.Children != null)
            {
                foreach (var wrapper in postResponse.Data.Children)
                {
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
