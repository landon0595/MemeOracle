using System.Diagnostics;

namespace MemeOracle_SharedLibrary
{
    public class SharedMeme
    {
        public string Title { get; set; } = string.Empty;   
        public string Url { get; set; } = string.Empty;
        public string ImageUrl {  get; set; } = string.Empty;
        public long Created {  get; set; } = long.MinValue;
    }

    public interface IMemeService
    {
        Task<List<SharedMeme>> GetMemesAsync();
        void SetAccessToken(string newToken);
    }
}
