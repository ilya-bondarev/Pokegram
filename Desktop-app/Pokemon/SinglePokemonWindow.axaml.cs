using System.Net.Http;
using AsyncImageLoader;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using Pokemon.Models.ApiClients;

namespace Pokemon;

public partial class SinglePokemonWindow : Window
{
    public SinglePokemonWindow()
    {
        InitializeComponent();
        InitializeAsync();

    }

    private async void InitializeAsync()
    {
        var client = new PokemonApiClient(new HttpClient());
        var pokemon = await client.GetPokemonAsync(StaticData.PokemonId);
        
        PokemonId.Text = "Id: " + pokemon.PokemonId;
        ImageLoader.SetSource(Image,pokemon.PokemonPhoto);
        PokemonTitle.Text = "Title: " + pokemon.PokemonTitle;
        PokemonName.Text = "Name: " + pokemon.PokemonName;
        PokemonType.Text = "Type: " + pokemon.PokemonType;
        PokemonHeight.Text = "Height: " + pokemon.PokemonHeight + " m";
        PokemonWeight.Text = "Weight: " + pokemon.PokemonWeight + " kg";
        PokemonXpGroup.Text = "XP Group: " + pokemon.PokemonXpGroup;
        PokemonAbilities.Text = "Abilities: " + pokemon.PokemonAbilities;
        PokemonBreedPeriod.Text = "Breed Period: " + pokemon.PokemonBreedPeriod;
        PokemonSexRatio.Text = "Sex Ratio: " + pokemon.PokemonSexRatio;
        PokemonTotalAmount.Text = "Total Amount: " + pokemon.PokemonTotalAmount;
        PokemonShine.Text = "Shine: " + (pokemon.PokemonShine ? "Yes" : "No");
        PokemonRarity.Text = "Rarity: " + pokemon.PokemonRarity;
        PokemonHealth.Text = "Health: " + pokemon.PokemonHealth;
        PokemonAttack.Text = "Attack: " + pokemon.PokemonAttack;
        PokemonDefence.Text = "Defence: " + pokemon.PokemonDefence;
        PokemonSpeed.Text = "Speed: " + pokemon.PokemonSpeed;
        PokemonSpecialAttack.Text = "Special Attack: " + pokemon.PokemonSpecialAttack;
        PokemonSpecialDefence.Text = "Special Defence: " + pokemon.PokemonSpecialDefence;
        PokemonSumm.Text = "Summ: " + pokemon.PokemonSumm;
    }
}