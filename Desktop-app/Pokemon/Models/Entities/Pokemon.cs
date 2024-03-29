using System.Collections.Generic;
using Newtonsoft.Json;

namespace Pokemon.Models.Entities;

public class Pokemon
{
    [JsonProperty("pokemon_id")]
    public int PokemonId { get; set; }

    [JsonProperty("pokemon_title")]
    public string PokemonTitle { get; set; }

    [JsonProperty("pokemon_photo")]
    public string PokemonPhoto { get; set; }

    [JsonProperty("pokemon_name")]
    public string PokemonName { get; set; }

    [JsonProperty("pokemon_number")]
    public int? PokemonNumber { get; set; }

    [JsonProperty("pokemon_type")]
    public int PokemonType { get; set; }

    [JsonProperty("pokemon_height")]
    public double PokemonHeight { get; set; }

    [JsonProperty("pokemon_weight")]
    public double PokemonWeight { get; set; }

    [JsonProperty("pokemon_xp_group")]
    public int PokemonXpGroup { get; set; }

    [JsonProperty("pokemon_abilities")]
    public string PokemonAbilities { get; set; }

    [JsonProperty("pokemon_breed_period")]
    public int PokemonBreedPeriod { get; set; }

    [JsonProperty("pokemon_sex_ratio")]
    public string PokemonSexRatio { get; set; }

    [JsonProperty("pokemon_total_amount")]
    public int PokemonTotalAmount { get; set; }

    [JsonProperty("pokemon_shine")]
    public bool PokemonShine { get; set; }

    [JsonProperty("pokemon_rarity")]
    public string PokemonRarity { get; set; }

    [JsonProperty("pokemon_health")]
    public int PokemonHealth { get; set; }

    [JsonProperty("pokemon_attack")]
    public int PokemonAttack { get; set; }

    [JsonProperty("pokemon_defence")]
    public int PokemonDefence { get; set; }

    [JsonProperty("pokemon_speed")]
    public int PokemonSpeed { get; set; }

    [JsonProperty("pokemon_special_attack")]
    public int PokemonSpecialAttack { get; set; }

    [JsonProperty("pokemon_special_defence")]
    public int PokemonSpecialDefence { get; set; }

    [JsonProperty("pokemon_summ")]
    public int PokemonSumm { get; set; }
}
public class PokemonData
{
    [JsonProperty("pokemons")]
    public List<Pokemon> Pokemons { get; set; }
    
    [JsonProperty("page")]
    public int Page { get; set; }

    [JsonProperty("page_size")]
    public int PageSize { get; set; }

    [JsonProperty("total_pages")]
    public int TotalPages { get; set; }

    [JsonProperty("total_pokemons")]
    public int TotalPokemons { get; set; }
}