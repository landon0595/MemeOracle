using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Maui.Controls;
using System;
using MemeOracle_SharedLibrary;

namespace MemeOracleUI.Helpers
{
    //behavior for opening url
    public class TapToOpenUrlExtention : Behavior<Label>
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
