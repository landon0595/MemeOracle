using MemeOracle_SharedLibrary;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using MemeOracleUI.Database;

namespace MemeOracleUI
{
    public partial class SavedMemesViewModel : INotifyPropertyChanged
    {
        private readonly MemeDataBase _db;
        public ObservableCollection<SharedMeme> SavedMemes { get; } = new();

        public ICommand ToggleFavoriteCommand => new Command<SharedMeme>(ToggleFavorite);
        public ICommand DeleteMemeCommand => new Command<SharedMeme>(DeleteMeme);

        public SavedMemesViewModel(MemeDataBase db)
        {
            _db = db;
            _db.OnSavedMemesUpdated += SortSavedMemes;
            SortSavedMemes();
        }

        private void SortSavedMemes()
        {
            var sorted = SavedMemes.OrderByDescending(m => m.IsFavorited).ToList();
            SavedMemes.Clear();
            foreach (var meme in sorted)
                SavedMemes.Add(meme);
        }

        private async void ToggleFavorite(SharedMeme meme)
        {
            meme.IsFavorited = !meme.IsFavorited;
            await _db.UpdateMemeAsync(meme);
            SortSavedMemes(); //Refresh sort order
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

        public class TapToOpenUrlExtension : Behavior<Label>
        {
            protected override void OnAttachedTo(Label bindable)
            {
                base.OnAttachedTo(bindable);
                bindable.GestureRecognizers.Add(new TapGestureRecognizer
                {
                    Command = new Command(async () =>
                    {
                        if (bindable.BindingContext is SharedMeme meme)
                            await Launcher.Default.OpenAsync(meme.Url);
                    })
                });
            }
        }
    }
}



