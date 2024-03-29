using System;
using System.Net.Http;
using System.Threading.Tasks;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Pokemon.Models.ApiClients;
using Pokemon.Models.Entities;

namespace Pokemon;

public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
    }

    private async void Login_OnClick(object? sender, RoutedEventArgs e)
    {
        if (TextBoxLogin.Text != null && TextBoxPassword.Text != null)
        {
           var httpClient = new HttpClient();
           var userApiClient = new UserApiClient(httpClient);
           var userActivityApiClient = new UserActivityApiClient(httpClient);
           
           var auth = await userApiClient.CheckUserPasswordAsync(TextBoxLogin.Text, TextBoxPassword.Text);
           
           if (auth != null)
           {
               StaticData.UserId = auth;
               
               var newActivity = new UserActivity
               {
                   UserId = (int)auth,
                   Activity = $"User {auth} log in!",
                   Timestamp = DateTime.Now
               };
               await userActivityApiClient.AddUserActivityAsync(newActivity);
               
               var newWindow = new PokeWindow();
               newWindow.Show();
               this.Close();
           }
           else
           {
               TextBlockAlert.Text = "Неверный логин или пароль!";
           }
        }
        else
        {
            TextBlockAlert.Text = "Поля не могут быть пустыми";
        }
    }

    private async void SignUp_OnClick(object? sender, RoutedEventArgs e)
    {
        var httpClient = new HttpClient();
        var userActivityApiClient = new UserActivityApiClient(httpClient);
        var newActivity = new UserActivity
        {
            UserId = 2,
            Activity = "Guest try to registrate",
            Timestamp = DateTime.Now
        };
        await userActivityApiClient.AddUserActivityAsync(newActivity);
        
        var newWindow = new SignUpPage();
        newWindow.Show();
        this.Close();
    }

    private async void Guest_OnClick(object? sender, RoutedEventArgs e)
    {
        var httpClient = new HttpClient();
        var userApiClient = new UserActivityApiClient(httpClient);
        var newActivity = new UserActivity
        {
            UserId = 2,
            Activity = "Guest open pockemons",
            Timestamp = DateTime.Now
        };
        await userApiClient.AddUserActivityAsync(newActivity);

        StaticData.UserId = 2;
        var newWindow = new PokeWindow();
        newWindow.Show();
        this.Close();
    }
}