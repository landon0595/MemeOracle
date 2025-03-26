using MemeOracle_SharedLibrary;
using Newtonsoft.Json;
using System.Reflection.Metadata.Ecma335;

namespace MemeFinder
{
    public class PostData
    {
        //Title
        [JsonProperty("title")]
        public string Title { get; set; } = string.Empty;
        //Url
        [JsonProperty("url")]
        public string Url { get; set; } = string.Empty;

        //Image properties
        [JsonProperty("preview")]
        public PreviewData Preview { get; set; } = new PreviewData();
        [JsonIgnore]
        public string ImageUrl
        {
            get
            {
                return Preview?.Images != null && Preview.Images.Count > 0
                    ? Preview.Images[0].Source.Url
                    : string.Empty;
            }
        }

        public class PreviewData
        {
            [JsonProperty("images")]
            public List<ImageData> Images { get; set; } = new List<ImageData>();
            [JsonProperty("enabled")]
            public bool Enabled { get; set; }
        }

        public class ImageData
        {
            //source
            [JsonProperty("source")]
            public ImageSource Source { get; set; } = new ImageSource();
            //resolutions
            [JsonProperty("resolutions")]
            public List<ImageSource> Resolutions { get; set; } = new List<ImageSource>();
        }

        public class ImageSource
        {
            [JsonProperty("url")]
            public string Url { get; set; } = string.Empty;
            [JsonProperty("width")]
            public int Width { get; set; }
            [JsonProperty("height")]
            public int Height { get; set; }
        }

        //Date
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