using System.Net.Http;
using AsyncImageLoader;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using Pokemon.Models.ApiClients;

namespace Pokemon;

public partial class PopupWindow : Window
{
    private int pokemonId;
    public PopupWindow()
    {
        InitializeComponent();
        InitializeAsync();
    }
    
    private async void InitializeAsync()
    {
        var client = new PokemonApiClient(new HttpClient());
        var pokemon = await client.GetPokemonAsync(StaticData.PokemonId);

        Status.Text = StaticData.PopUpStatus;
        ImageLoader.SetSource(Image,pokemon.PokemonPhoto);
        Title.Text = pokemon.PokemonTitle;
        pokemonId = pokemon.PokemonId;
    }

    private void Button_OnClick(object? sender, RoutedEventArgs e)
    {
        StaticData.PokemonId = pokemonId;
        var pokeWindow = new SinglePokemonWindow();
        pokeWindow.Show();
        this.Close();
    }
}