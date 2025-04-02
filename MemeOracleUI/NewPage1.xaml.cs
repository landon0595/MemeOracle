using MemeFinder;
using MemeFinder.Configuration;
using MemeFinder.Services;
using MemeFinder.Wrapper;
using MemeOracle_SharedLibrary;
using MemeOracleUI.Database;
using MemeOracleUI.Utility;
using MemeOracleUI.ViewModels;
using System.Diagnostics;

namespace MemeOracleUI;

public partial class NewPage1 : ContentPage
{
    private MainViewModel _viewModel;
    public NewPage1(MainViewModel vm, MemeDataBase db)
    {
        InitializeComponent();
        _viewModel = vm;
        BindingContext = _viewModel;
        _db = db;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        //call backend to refresh/get latest token
        var token = await AuthService.RefreshAccessToken();
        Console.WriteLine($"Retrieved token from backend '{token}'");

        //Then update view model with refreshed token
        if (BindingContext is MainViewModel vm)
        {
            vm.SetAccessToken(token);
            await vm.LoadMemesAsync();
        }
    }

    private void ResetButton_Clicked(object sender, EventArgs e)
    {
        _viewModel.Memes.Clear(); //remove any existing memes
        _viewModel.IsInSelectionMode = false; 
        Debug.WriteLine("Memes cleared.");
    }

    private async void HomeButton_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("//MainPage");
    }

    private readonly MemeDataBase _db;
    private async void OnHeartClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is SharedMeme meme)
        {
            //toggle the liked state
            meme.IsLiked = !meme.IsLiked;

            //trigger animation
            await button.ScaleTo(1.3, 100, Easing.CubicOut);
            await button.ScaleTo(1.0, 100, Easing.CubicIn);

            //save or update post in database
            if (meme.IsLiked)
            { 
                await _db.SaveMemeAsync(meme);
                Debug.WriteLine($"Saved meme. New Id: {meme.Id}");
            }
            else
            {
            await _db.DeleteMemeAsync(meme);
            }
    
            //Debug log
            Debug.WriteLine($"{(meme.IsLiked ? "❤️ Liked" : "🤍 unliked")}: {meme.Title}");

        }
        else
        {
            Debug.WriteLine("Meme not found in binding context.");
        }
    }

    private async void LoadWeeklyMemes_Clicked(object sender, EventArgs e)
    {
        Debug.WriteLine("[UI] 'Past 7 days' button clicked.");
        Debug.WriteLine("Loading memes from button...");
        await _viewModel.LoadMemesAsync("week");
        Debug.WriteLine($"[UI] Memes loaded: {_viewModel.Memes.Count}");
        //For testing button functionality
        //await DisplayAlert("Button Clicked", "The button event is firing.", "ok");
    }
    private async void LoadMonthlyMemes_Clicked(Object sender, EventArgs e)
    {
        await _viewModel.LoadMemesAsync("month");
    }
    private async void LoadYearlyMemes_Clicked(Object sender, EventArgs e)
    {
        await _viewModel.LoadMemesAsync("year");
    }
}