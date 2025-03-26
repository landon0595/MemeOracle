using MemeOracleUI.ViewModels;
using MemeFinder;
using MemeFinder.Services;
using MemeFinder.Configuration;
using MemeFinder.Wrapper;
using MemeOracleUI.Utility;

namespace MemeOracleUI;

public partial class NewPage1 : ContentPage
{
    private MainViewModel _viewModel;
    public NewPage1(MainViewModel vm)
    {
        InitializeComponent();
        _viewModel = vm;
        BindingContext = _viewModel;
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
        }
    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("NewPage");
    }

    private async void BackButton_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("//MainPage");
    }

    private async void LoadWeeklyMemes_Clicked(object sender, EventArgs e)
    {
        if (BindingContext is MainViewModel vm)
        {
            await vm.LoadMemesAsync();
        }

        //For testing button functionality
        //await DisplayAlert("Button Clicked", "The button event is firing.", "ok");
    }
}