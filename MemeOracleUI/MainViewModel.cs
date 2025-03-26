using MemeOracle_SharedLibrary;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Diagnostics;
using MemeFinder.Wrapper;

//View Model for holding data
namespace MemeOracleUI.ViewModels
{
    //Interface for binding data
    public class MainViewModel : INotifyPropertyChanged
    {
        private readonly IMemeService _memeService;

        public MainViewModel(IMemeService memeService)
        {
            _memeService = memeService;
        }

        private string _accessToken = string.Empty;
        public string AccessToken
        {
            get => _accessToken;
            set
            {
                _accessToken = value;
                OnPropertyChanged();
            }
        }


        public void SetAccessToken(string validAccessToken)
        {
            Debug.WriteLine("Setting access token in viewmodel: " + validAccessToken);
            //Update propert for UI (for testing/display)
            AccessToken = validAccessToken;
            //Update the service's token with the refreshed token from ConfigManager
            _memeService.SetAccessToken(validAccessToken);
            //for testing access Token
            //Debug.WriteLine("Access token updated: " + validAccessToken);
        }


        //store list of memes that UI wil display
        public ObservableCollection<SharedMeme> Memes { get; } = new ObservableCollection<SharedMeme>();

        private bool _isLoading;
        public bool IsLoading
        {
            get => _isLoading;
            set { _isLoading = value; OnPropertyChanged(); }
        }

        //Asyncronously fetches meme data
        public async Task LoadMemesAsync()
        {
            IsLoading = true;
            try
            {
                var memes = await _memeService.GetMemesAsync();
                Memes.Clear();
                foreach (var meme in memes)
                {
                    Memes.Add(meme);
                }
            }
            finally
            {
                IsLoading = false;
            }
        }

        
        public event PropertyChangedEventHandler? PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
