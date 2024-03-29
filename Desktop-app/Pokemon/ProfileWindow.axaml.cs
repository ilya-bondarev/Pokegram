using System.Net.Http;
using AsyncImageLoader;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using Pokemon.Models.ApiClients;

namespace Pokemon;

public partial class ProfileWindow : Window
{
    public ProfileWindow()
    {
        InitializeComponent();
        LoadUserData();
        LoadUserActivities();
    }

    private async void LoadUserActivities()
    {
        var client = new UserActivityApiClient(new HttpClient());
        var activities = await client.GetActivitiesByUserIdAsync((int)StaticData.UserId);

        UserActivityListBox.ItemsSource = activities;
    }
    private async void LoadUserData()
    {
        var userClient = new UserApiClient(new HttpClient());
        var user = await userClient.GetUserAsync((int)StaticData.UserId);

        var pokemonClient = new PokemonApiClient(new HttpClient());
        var pokemon = await pokemonClient.GetPokemonAsync(user.UserTotemPokemon);

        ImageLoader.SetSource(PokemonImage,pokemon.PokemonPhoto);
        UserName.Text = user.UserName;
        UserPokemon.Text = "Ваш покемон: " + pokemon.PokemonName;
        StaticData.PokemonId = user.UserTotemPokemon;
    }

    private void PokemonBtn(object? sender, RoutedEventArgs e)
    {
        StaticData.PopUpStatus = "Ваш тотемный покемон:";
        var window = new PopupWindow();
        window.Show();
    }

    private void ToPokemonList(object? sender, RoutedEventArgs e)
    {
        var window = new PokeWindow();
        window.Show();
        this.Close();
    }
}