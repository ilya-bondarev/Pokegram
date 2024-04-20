using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Pokemon.Models.Entities;

namespace Pokemon.Models.ApiClients;

public class PokemonApiClient : ApiClientBase
{
    public PokemonApiClient(HttpClient httpClient) : base(httpClient)
    {
    }

    public async Task<Entities.Pokemon> GetPokemonAsync(int pokemonId)
    {
        var responseString = await HttpClient.GetStringAsync($"{BaseUrl}/pokemon/{pokemonId}");
        var pokemon = JsonConvert.DeserializeObject<Entities.Pokemon>(responseString);
        return pokemon;
    }


    public async Task<(List<Entities.Pokemon> Pokemons, int TotalPages, int TotalPokemons)> GetAllPokemonsAsync(
        int page = 1, int pageSize = 30)
    {
        var responseString = await HttpClient.GetStringAsync($"{BaseUrl}/pokemon?page={page}&pageSize={pageSize}");
        var pokemonData = JsonConvert.DeserializeObject<PokemonData>(responseString);

        var pokemons = pokemonData.Pokemons;
        var totalPages = pokemonData.TotalPages;
        var totalPokemons = pokemonData.TotalPokemons;

        return (pokemons, totalPages, totalPokemons);
    }

    public async Task<int> GetPokemonOfTheDay()
    {
        var responseString = await HttpClient.GetStringAsync(
            $"{BaseUrl}/pokemon/of_day");
        var pokemonId = JsonConvert.DeserializeObject<int>(responseString);
        return pokemonId;
    }

    public async Task<int> GetPokemonOfTheMonth()
    {
        var responseString = await HttpClient.GetStringAsync(
            $"{BaseUrl}/pokemon/of_month");
        var pokemonId = JsonConvert.DeserializeObject<int>(responseString);
        return pokemonId;
    }
}