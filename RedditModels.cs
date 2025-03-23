using Newtonsoft.Json;


namespace MemeFinder
{
    public class PostData
    {
        [JsonProperty("title")]
        public string Title { get; set; } = string.Empty;
        [JsonProperty("url")]
        public string Url { get; set; } = string.Empty;
        [JsonProperty("created")]
        public long Created { get; set; } = long.MinValue;
    }
    public class PostDataWrapper
    {
        [JsonProperty("data")]
        public PostData Data { get; set; } = new PostData();
    }
    public class PostResponse
    {
        [JsonProperty("data")]
        public DataContainer Data { get; set; } = new DataContainer();
    }

    public class DataContainer
    {
        [JsonProperty("children")]
        public PostDataWrapper[] Children { get; set; } = Array.Empty<PostDataWrapper>();
        public string After { get; set; } = string.Empty;
    }
}