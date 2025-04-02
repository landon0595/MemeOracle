using MemeOracle_SharedLibrary;
using MemeFinder.Services;
using MemeOracleUI.Database;
using MemeOracleUI.ViewModels;
using System.Diagnostics;
using MemeOracleUI.Helpers;

namespace MemeOracleUI;

public partial class SavedMemesPage : ContentPage
{
    private readonly SavedMemesViewModel _viewModel;
    public SavedMemesPage(SavedMemesViewModel viewModel)
    {
        InitializeComponent();
        _viewModel = viewModel;
        BindingContext = _viewModel;
    }

    //reload memes on page load
    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await _viewModel.LoadSavedMemesAsync();
    }
}