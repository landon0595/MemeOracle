using MemeOracle_SharedLibrary;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Diagnostics;
using MemeFinder.Wrapper;
using System.Windows.Input;
using MemeOracleUI.Database;

//View Model for holding data
namespace MemeOracleUI.ViewModels
{
    //Interface for binding data
    public class MainViewModel : INotifyPropertyChanged
    {
        private readonly IMemeService _memeService;
        
        private readonly MemeDataBase _db;

        public MainViewModel(IMemeService memeService, MemeDataBase db)
        {
            _memeService = memeService;
            _db = db;
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
       
        public ICommand ToggleLikeCommand => new Command<SharedMeme>(async (meme) => await ToggleLike(meme));

        private async Task ToggleLike(SharedMeme meme)
        {
            meme.IsLiked = !meme.IsLiked;

            if (meme.IsLiked)
                await _db.SaveMemeAsync(meme);
            else
                await _db.DeleteMemeAsync(meme);

            //TODO: Save or remove from local database here...
            Debug.WriteLine($"{(meme.IsLiked ? "❤️ Liked" : "🤍 Unliked")}: {meme.Title}");
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

        private bool _isInSelectionMode = true;
        public bool IsInSelectionMode
        {
            get => _isInSelectionMode;
            set
            {
                _isInSelectionMode = value;
                OnPropertyChanged();
            }
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
        public async Task LoadMemesAsync(string timeFilter = "week")
        {
            IsLoading = true;
            IsInSelectionMode = false;
            try
            {
                var memes = await _memeService.GetMemesAsync(timeFilter);
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
