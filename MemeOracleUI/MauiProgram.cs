using MemeOracle_SharedLibrary;
using MemeFinder;
using MemeOracleUI.ViewModels;
using Microsoft.Extensions.Logging;
using MemeFinder.Wrapper;


namespace MemeOracleUI
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
            builder.Logging.AddDebug();
#endif
            builder.Services.AddSingleton<IMemeService, MemeServiceWrapper>();

            builder.Services.AddSingleton<MainViewModel>();
            
            builder.Services.AddSingleton<SharedMeme>();

            builder.Services.AddTransient<MainPage>();
            //Registration for NewPage
            builder.Services.AddTransient<NewPage1>();

            Routing.RegisterRoute("newpage1", typeof(NewPage1));

            return builder.Build();
        }
    }
}

