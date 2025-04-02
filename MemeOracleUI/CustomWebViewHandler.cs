//For testing
#if WINDOWS
using Microsoft.Maui.Handlers;
using Microsoft.UI.Xaml.Controls; // For WebView2
using Microsoft.Web.WebView2.Core; // For CoreWebView2Environment
using System.Diagnostics;
using System.Threading.Tasks;
using System;

namespace MemeOracleUI.Platforms.Windows
{
    public class CustomWebViewHandler : WebViewHandler
    {
        protected override void ConnectHandler(WebView2 platformView)
        {
            base.ConnectHandler(platformView);

            InitializeWebView2Async(platformView);
        }

        private async void InitializeWebView2Async(WebView2 platformView)
        {
            try
            {
                //Create Environment
                var env = await CoreWebView2Environment.CreateAsync();
                await platformView.EnsureCoreWebView2Async(env);

                // Open DevTools - Uncomment to access devTools
                //platformView.CoreWebView2.OpenDevToolsWindow();
                //Debug.WriteLine("WebView2 DevTools opened successfully.");

                //Map a local folder
                string localFolder = FileSystem.AppDataDirectory;
                platformView.CoreWebView2.SetVirtualHostNameToFolderMapping(
                    "localtest",
                    localFolder,
                    CoreWebView2HostResourceAccessKind.Allow
                );
                Debug.WriteLine($"Set virtual host 'localtest' -> {localFolder}");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Failed to initialize WebView2 or open DevTools: {ex.Message}");
            }
        }
    }
}
#endif