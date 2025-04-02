using MemeOracle_SharedLibrary;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using MemeOracleUI.Database;
using System.Linq;
using Microsoft.Maui.Controls; //for command and behavior

namespace MemeOracleUI
{
    public partial class SavedMemesViewModel : INotifyPropertyChanged
    {
        private readonly MemeDataBase _db;
        public ObservableCollection<SharedMeme> SavedMemes { get; } = new();

        //invoked by the UI buttons
        public ICommand ToggleFavoriteCommand => new Command<SharedMeme>(async (meme) =>
        {
            meme.IsFavorited = !meme.IsFavorited;
            await _db.UpdateMemeAsync(meme);
            await LoadSavedMemesAsync(); //Refresh sort order (fav memes at top)
        });

        public ICommand DeleteMemeCommand => new Command<SharedMeme>(DeleteMeme);

         //Populates the daved memes collection on page

        public SavedMemesViewModel(MemeDataBase db)
        {
            _db = db;
            //when database updates, reload saved memes
            _db.OnSavedMemesUpdated += async () => await LoadSavedMemesAsync();
            Task.Run(() => LoadSavedMemesAsync());
        }

        public async Task LoadSavedMemesAsync()
        {
            var memesFromDb = await _db.GetMemesAsync();
            //sort favored memes to show on top of database
            var sortedMemes = memesFromDb.OrderByDescending(m => m.IsFavorited).ToList();
            SavedMemes.Clear();
            foreach (var meme in sortedMemes)
            {
                SavedMemes.Add(meme);
            }
        }

        private void SortSavedMemes()
        {
            var sorted = SavedMemes.OrderByDescending(m => m.IsFavorited).ToList();
            SavedMemes.Clear();
            foreach (var meme in sorted)
                SavedMemes.Add(meme);
        }

        private async void DeleteMeme(SharedMeme meme)
        {
            await _db.DeleteMemeAsync(meme);
            SavedMemes.Remove(meme);
        }

        public event PropertyChangedEventHandler? PropertyChanged;

        public void OnPropertyChanged([CallerMemberName] string propertName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertName));
        }
    }
}



