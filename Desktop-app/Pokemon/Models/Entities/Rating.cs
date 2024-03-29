using System.Text.Json.Serialization;

namespace Pokemon.Models.Entities;

public class Rating
{
    [JsonPropertyName("pokemon_id")]
    public int PokemonId { get; set; }
    [JsonPropertyName("user_id")]
    public int UserId { get; set; }
    [JsonPropertyName("rating")]
    public int RatingValue { get; set; }
}