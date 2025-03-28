﻿using MemeOracle_SharedLibrary;
using MemeFinder;
using MemeOracleUI.ViewModels;
using Microsoft.Extensions.Logging;
using MemeFinder.Wrapper;
using MemeOracleUI.Database;
using MemeOracleUI.Utility;


namespace MemeOracleUI
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder.UseMauiApp<App>();

            builder
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
            builder.Logging.AddDebug();
#endif
            builder.Services.AddSingleton<IMemeService, MemeServiceWrapper>();         
            
            //Pages
            builder.Services.AddTransient<MainPage>();
            builder.Services.AddTransient<NewPage1>();
            builder.Services.AddTransient<SavedMemesPage>();

            //inject meme database
            builder.Services.AddSingleton<MainViewModel>(provider =>
            {
                var memeService = provider.GetRequiredService<IMemeService>();
                var db = provider.GetRequiredService<MemeDataBase>();
                return new MainViewModel(memeService, db);
            });
            builder.Services.AddSingleton<SavedMemesViewModel>();

            //SQLite setup
            string dbPath = Path.Combine(FileSystem.AppDataDirectory, "memes.db");
            var database = new MemeDataBase(dbPath);
            Task.Run(() => database.InitAsync()); //No blocking
            builder.Services.AddSingleton(database);

            builder.Services.AddSingleton<SavedMemesViewModel>();
            Routing.RegisterRoute("savedmemes", typeof(SavedMemesPage));

            //Routing
            Routing.RegisterRoute("newpage1", typeof(NewPage1));

            return builder.Build();
        }
    }
}

