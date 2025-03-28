using System.Runtime.CompilerServices;
using System.Xml.Serialization;

namespace MemeOracleUI
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync("NewPage");
        }

        private void ExitButton_Clicked(object sender, EventArgs e)
        {
            Environment.Exit(0); //exit app
        }

        private async void  SavedMemesButton_Clicked(object sender, EventArgs e)
        {
           await Shell.Current.GoToAsync("savedmemes");
        }
    }
}
