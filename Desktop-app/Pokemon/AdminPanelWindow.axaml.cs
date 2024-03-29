using System.Net.Http;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using Pokemon.Models.ApiClients;

namespace Pokemon;

public partial class AdminPanelWindow : Window
{
    private int userId;
    public AdminPanelWindow()
    {
        InitializeComponent();
        Upload();
    }
    private async void Upload()
    {
        var clientActivity = new UserActivityApiClient(new HttpClient());
        var activities = await clientActivity.GetActivitiesByUserIdAsync(userId);

        var clientUser = new UserApiClient(new HttpClient());
        var users = await clientUser.GetAllUsersAsync();

        UserListBox.ItemsSource = users;
        UserActivityListBox.ItemsSource = activities;
    }
    private void PokemonBtn(object? sender, RoutedEventArgs routedEventArgs)
    {
        var window = new PokeWindow();
        window.Show();
        this.Close();
    }

    private void UserPokemonBtn_OnClick(object? sender, RoutedEventArgs e)
    {
        if (sender is not Button button) return;
        var pokemonId = (int)button.Tag;

        StaticData.PokemonId = pokemonId;
        var window = new SinglePokemonWindow();
        window.Show();
    }

    private async void UserDeleteBtn_OnClick(object? sender, RoutedEventArgs e)
    {
        if (sender is not Button button) return;
        var userId = (int)button.Tag;
        
        var client = new UserApiClient(new HttpClient());
        await client.DeleteUserAsync(userId);
        Upload();
    }

    private void InputElement_OnDoubleTapped(object? sender, TappedEventArgs e)
    {
        if (sender is not StackPanel userList) return;
        userId = (int)userList.Tag;
        Upload();
    }
}