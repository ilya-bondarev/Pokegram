using System;
using System.Text.Json.Serialization;

namespace Pokemon.Models.Entities;

public class UserActivity
{
    [JsonPropertyName("user_id")] public int UserId { get; set; }
    [JsonPropertyName("activity")] public string Activity { get; set; }
    [JsonPropertyName("timestamp")] public DateTime Timestamp { get; set; }
}