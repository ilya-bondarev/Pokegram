using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Pokemon.Models.Entities;

namespace Pokemon.Models.ApiClients;

public class UserActivityApiClient : ApiClientBase
{
    public UserActivityApiClient(HttpClient httpClient) : base(httpClient) { }

    public async Task AddUserActivityAsync(UserActivity userActivity)
    {
        await PostAsync("/user_activity/add", userActivity);
    }

    public async Task<List<UserActivity>> GetActivitiesByUserIdAsync(int userId)
    {
        var responseString = await HttpClient.GetStringAsync($"{BaseUrl}/user_activity/user/{userId}");
        var activities = JsonConvert.DeserializeObject<List<UserActivity>>(responseString);

        return activities;
    }
}
