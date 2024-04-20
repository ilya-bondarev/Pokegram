using System.Net.Http;
using AsyncImageLoader;
using Avalonia.Controls;
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

        ImageLoader.SetSource(Image, pokemon.PokemonPhoto);
        PokemonName.Text = "Name: " + pokemon.PokemonName;
        PokemonHeight.Text = "Height: " + pokemon.PokemonHeight + " m";
        PokemonWeight.Text = "Weight: " + pokemon.PokemonWeight + " kg";
        PokemonAbilities.Text = "Abilities: " + pokemon.PokemonAbilities;
        PokemonBreedPeriod.Text = "Breed Period: " + pokemon.PokemonBreedPeriod + " d";
        PokemonSexRatio.Text = pokemon.PokemonSexRatio;
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