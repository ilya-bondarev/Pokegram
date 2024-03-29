using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using MessageBox.Avalonia;
using Pokemon.Models.ApiClients;
using Pokemon.Models.Entities;

namespace Pokemon;

public partial class SignUpPage : Window
{
    public SignUpPage()
    {
        InitializeComponent();
    }
    
    class PokemonNameSelector
    {
        private static readonly Dictionary<(int, int, int), int> NameLookup = new Dictionary<(int, int, int), int>
        {
            { (1, 1, 1), 255 },
            { (1, 1, 2), 3 },
            { (1, 1, 3), 231 },
            { (1, 2, 1), 237 },
            { (1, 2, 2), 364 },
            { (1, 2, 3), 380 },
            { (1, 3, 1), 381 },
            { (1, 3, 2), 324 },
            { (1, 3, 3), 269 },
            { (2, 1, 1), 373 },
            { (2, 1, 2), 284 },
            { (2, 1, 3), 282 },
            { (2, 2, 1), 678 },
            { (2, 2, 2), 888 },
            { (2, 2, 3), 361 },
            { (2, 3, 1), 379 },
            { (2, 3, 2), 289 },
            { (2, 3, 3), 361 },
            { (3, 1, 1), 362 },
            { (3, 1, 2), 364 },
            { (3, 1, 3), 365 },
            { (3, 2, 1), 366 },
            { (3, 2, 2), 427 },
            { (3, 2, 3), 426 },
            { (3, 3, 1), 930 },
            { (3, 3, 2), 298 },
            { (3, 3, 3), 478 }
        };

        public static int GetId(int a, int b, int c)
        {
            if (NameLookup.TryGetValue((a, b, c), out int id))
            {
                return id;
            }
            return 255;
        }
    }
    private async void SignUp_Click(object? sender, RoutedEventArgs e)
    {
        int a = 0, b = 0, c = 0;
            // Вопрос 1
            if (AFirst.IsChecked == true) a = 1;
            else if (ASecond.IsChecked == true) a = 2;
            else if (AThird.IsChecked == true) a = 3;

            // Вопрос 2
            if (BFirst.IsChecked == true) b = 1;
            else if (BSecond.IsChecked == true) b = 2;
            else if (BThird.IsChecked == true) b = 3;

            // Вопрос 3
            if (CFirst.IsChecked == true) c = 1;
            else if (CSecond.IsChecked == true) c = 2;
            else if (CThird.IsChecked == true) c = 3;

            if (a == 0 || b == 0 || c == 0 
                || string.IsNullOrWhiteSpace(LoginTextBox.Text) 
                || string.IsNullOrWhiteSpace(PasswordTextBox.Text))
                Attention.Text = "Необходимо заполнить все поля и пройти тест";
            else
            {
                try
                {
                    var httpClient = new HttpClient();
                    var userApiClient = new UserApiClient(httpClient);
                    var userActivityApiClient = new UserActivityApiClient(httpClient);
                    
                    
                    var newUser = new User
                    {
                        UserName = LoginTextBox.Text,
                        UserPassword = PasswordTextBox.Text,
                        UserTotemPokemon = PokemonNameSelector.GetId(a,b,c),
                        UserRole = 2 // Обычный пользователь
                    };
                    await userApiClient.AddUserAsync(newUser);
                    
                    
                    var id = await userApiClient.CheckUserPasswordAsync(LoginTextBox.Text, PasswordTextBox.Text);
                    var newActivity = new UserActivity
                    {
                        UserId = (int)id,
                        Activity = "User " + id + " just registrated!",
                        Timestamp = DateTime.Now
                    };
                    await userActivityApiClient.AddUserActivityAsync(newActivity);


                    StaticData.PokemonId = PokemonNameSelector.GetId(a, b, c);
                    StaticData.UserId = id;
                    StaticData.PopUpStatus = "Добро пожаловать! Ваш покемон:";
                    var newWindow = new PokeWindow();
                    newWindow.Show();
                    
                    var popupWindow = new PopupWindow();
                    popupWindow.Show();
                    this.Close();
                }
                catch (Exception ex)
                {
                    Attention.Text = "Ошибка при регистрации. Попробуйте еще раз.";
                }
            }
    }
}