using System;
using System.Net.Http;
using System.Threading.Tasks;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Interactivity;
using Pokemon.Models.ApiClients;

namespace Pokemon;

public partial class PokeWindow : Window
{
    private int _currentPage = 1;
    private int _totalPages = 1;

    public PokeWindow()
    {
        InitializeComponent();
        Loaded += MainWindow_Loaded;
        DataContext = this;

        AdminBtn.IsVisible = false;
        ProfileBtn.IsVisible = false;
    }

    private async void MainWindow_Loaded(object sender, EventArgs e)
    {
        await LoadPokemonPage(_currentPage);
        await LoadUserData();
    }

    private async Task LoadUserData()
    {
        var client = new UserApiClient(new HttpClient());
        var user = await client.GetUserAsync((int)StaticData.UserId);

        if (StaticData.UserId != 2)
        {
            UserName.Text = user.UserName;
            ProfileBtn.IsVisible = true;
            if (user.UserRole == 1) AdminBtn.IsVisible = true;
        }
    }

    private async Task LoadPokemonPage(int page)
    {
        var client = new PokemonApiClient(new HttpClient());
        var (pokemons, totalPages, totalPokemons) = await client.GetAllPokemonsAsync(page);
        _totalPages = totalPages;

        PokemonListBox.ItemsSource = pokemons;
        PageInfo.Text = $"Page {_currentPage} of {_totalPages}";
    }

    private async void PreviousButton_Click(object sender, RoutedEventArgs e)
    {
        if (_currentPage > 1)
        {
            _currentPage--;
            await LoadPokemonPage(_currentPage);
        }
    }

    private async void NextButton_Click(object sender, RoutedEventArgs e)
    {
        if (_currentPage < _totalPages)
        {
            _currentPage++;
            await LoadPokemonPage(_currentPage);
        }
    }

    private void PokemonListBox_OnDoubleTapped(object? sender, TappedEventArgs e)
    {
        if (sender is not StackPanel listBoxItem) return;

        StaticData.PokemonId = (int)listBoxItem.Tag;

        var pokeWindow = new SinglePokemonWindow();
        pokeWindow.Show();
    }

    private void ButtonOnClick_LogOut(object? sender, RoutedEventArgs e)
    {
        StaticData.PokemonId = 0;
        StaticData.UserId = 2;
        var newWindow = new MainWindow();
        newWindow.Show();
        Close();
    }

    private async void ButtonOnClick_Pokemon_Of_The_Day(object? sender, RoutedEventArgs e)
    {
        var client = new PokemonApiClient(new HttpClient());

        StaticData.PokemonId = await client.GetPokemonOfTheDay();
        StaticData.PopUpStatus = "Покемон дня:";
        var newWindow = new PopupWindow();
        newWindow.Show();
    }

    private async void ButtonOnClick_Pokemon_Of_The_Month(object? sender, RoutedEventArgs e)
    {
        var client = new PokemonApiClient(new HttpClient());

        StaticData.PokemonId = await client.GetPokemonOfTheMonth();
        StaticData.PopUpStatus = "Покемон месяца:";
        var newWindow = new PopupWindow();
        newWindow.Show();
    }

    private void ButtonOnClick_Profile(object? sender, RoutedEventArgs e)
    {
        var newWindow = new ProfileWindow();
        newWindow.Show();
        Close();
    }

    private void ButtonOnClick_Admin(object? sender, RoutedEventArgs e)
    {
        var newWindow = new AdminPanelWindow();
        newWindow.Show();
        Close();
    }
}