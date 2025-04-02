using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Xml.Serialization;
using Microsoft.Extensions.Logging;

namespace MemeOracleUI
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await CopyVideoToLocalAsync();
            LoadVideoBackground();
        }

        private async Task CopyVideoToLocalAsync()
        {
            var assembly = typeof(App).Assembly;

            //test resource location -for testing-
            var resourceNames = assembly.GetManifestResourceNames();
            foreach (var name in resourceNames)
            {
                Console.WriteLine("Resource:" + name);
            }

            string localFilePath = Path.Combine(FileSystem.AppDataDirectory, "chillguy_anim.mp4");

            //after copying -testing-
            bool fileExists = File.Exists(localFilePath);
            Debug.WriteLine($"[DEBUG] Copied video? {fileExists} at path: {localFilePath}");

            if (!File.Exists(localFilePath))
            {
                using Stream? stream = assembly.GetManifestResourceStream("MemeOracleUI.Resources.Images.chillguy_anim.mp4");
                if (stream == null)
                {
                    throw new FileNotFoundException("Embedded resource not found: MemeOracleUI.Resources.Images.chillguy_anim.mp4");
                }   

                using FileStream fileStream = File.Create(localFilePath);
                await stream.CopyToAsync(fileStream);
            }
        }
//ChillGuy_anim location
        private void LoadVideoBackground()
        {
            string fileUrl = "https://localtest/chillguy_anim.mp4";
            

            var htmlSource = new HtmlWebViewSource
            {
                Html = $@"
            <html>
            <head>
                <meta name='viewport' content='initial-scale=1.0, user-scalable=no' />
                <style>
                  html, body {{
                    margin: 0; padding: 0; height: 100%; width: 100%;
                    overflow: hidden; background-color: black;
                  }}
                  video {{
                    object-fit: cover; width: 100%; height: 100%;
                  }}
                </style>
            </head>
            <body>
              <video autoplay loop muted playsinline controls style='width:100%;height:100%;object-fit:cover;'>
                <source src='{fileUrl}' type='video/mp4'>
                Your browser does not support the video tag.
              </video>
            </body>
            </html>"
            };
            VideoBackgroundWebView.Source = htmlSource;

            //VideoBackgroundWebView.Navigating += (s, e) => { e.Cancel = true; };
        }


            private async void Button_Clicked(object sender, EventArgs e)
            {
                await Shell.Current.GoToAsync("NewPage");
            }

            private void ExitButton_Clicked(object sender, EventArgs e)
            {
                Environment.Exit(0); //exit app
            }

            private async void SavedMemesButton_Clicked(object sender, EventArgs e)
            {
                await Shell.Current.GoToAsync("savedmemes");
            }
        }
    }
