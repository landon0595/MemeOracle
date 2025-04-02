using System.ComponentModel;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using SQLite;

namespace MemeOracle_SharedLibrary
{
    public class SharedMeme : INotifyPropertyChanged
    {
        [PrimaryKey, AutoIncrement]
        public int Id { get; set; } //Must be int
        public string Title { get; set; } = string.Empty;   
        public string Url { get; set; } = string.Empty;
        public string ImageUrl {  get; set; } = string.Empty;
        public long Created {  get; set; } = long.MinValue;

        //Star button reference
        public bool IsFavorited { get; set; } = false;
        //Heart button reference
        private bool _isLiked { get; set; } = false;
        public bool IsLiked
        {
            get => _isLiked;
            set
            {
                if(_isLiked != value)
                {
                    _isLiked = value;
                    OnPropertyChanged(nameof(IsLiked));
                }
            }
        }
        public event PropertyChangedEventHandler? PropertyChanged;

        protected void OnPropertyChanged(string name)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }

    public interface IMemeService
    {
        Task<List<SharedMeme>> GetMemesAsync(string timeFilter = "week");
        void SetAccessToken(string newToken);
    }
}
