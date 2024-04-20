using Newtonsoft.Json;

namespace Pokemon.Models.Entities;

public class User
{
    [JsonProperty("user_id")] public int UserId { get; set; }
    [JsonProperty("user_name")] public string UserName { get; set; }
    [JsonProperty("user_totem_pokemon")] public int UserTotemPokemon { get; set; }
    [JsonProperty("user_password")] public string UserPassword { get; set; }
    [JsonProperty("user_role")] public int UserRole { get; set; }
}