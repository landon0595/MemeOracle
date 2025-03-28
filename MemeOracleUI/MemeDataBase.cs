using Reddit.Inputs;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MemeOracle_SharedLibrary;

namespace MemeOracleUI.Database
{
    public class MemeDataBase
    {
        private readonly SQLiteAsyncConnection _db;

        public MemeDataBase(string dbPath)
        {
            _db = new SQLiteAsyncConnection(dbPath);
        }

        public async Task InitAsync()
        {
            await _db.CreateTableAsync<SharedMeme>();
        }

        public Task<List<SharedMeme>> GetMemesAsync()
        {
            return _db.Table<SharedMeme>().ToListAsync();
        }

        public event Action? OnSavedMemesUpdated;


        public async Task<int> SaveMemeAsync(SharedMeme meme)
        {
            await InitAsync();
            var result = await _db.InsertOrReplaceAsync(meme);
            OnSavedMemesUpdated?.Invoke();
            return result; 
        }

        public async Task<int> DeleteMemeAsync(SharedMeme meme)
        {
            await InitAsync();
            var result = await _db.DeleteAsync(meme);
            OnSavedMemesUpdated?.Invoke();
            return result;
        }

        public Task<int> UpdateMemeAsync(SharedMeme meme)
        {
            return _db.UpdateAsync(meme);
        }
    }
}
