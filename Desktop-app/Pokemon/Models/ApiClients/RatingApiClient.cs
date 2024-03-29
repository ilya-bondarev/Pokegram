using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Pokemon.Models.Entities;

namespace Pokemon.Models.ApiClients;

public class RatingApiClient : ApiClientBase
{
    public RatingApiClient(HttpClient httpClient) : base(httpClient)
    {
    }

    public async Task AddRatingAsync(Rating rating)
    {
        await PostAsync("/rating/add", rating);
    }

    public async Task<List<Rating>> GetRatingsByPokemonIdAsync(int pokemonId)
    {
        return await GetAsync<List<Rating>>($"/rating/pokemon/{pokemonId}");
    }
}