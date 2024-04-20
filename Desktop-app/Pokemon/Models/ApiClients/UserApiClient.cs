using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Pokemon.Models.Entities;

namespace Pokemon.Models.ApiClients;

public class UserApiClient : ApiClientBase
{
    public UserApiClient(HttpClient httpClient) : base(httpClient)
    {
    }

    public async Task<List<User>> GetAllUsersAsync()
    {
        var responseString = await HttpClient.GetStringAsync($"{BaseUrl}/user");
        var users = JsonConvert.DeserializeObject<List<User>>(responseString);


        return users;
    }

    public async Task<User> GetUserAsync(int userId)
    {
        var responseString = await HttpClient.GetStringAsync($"{BaseUrl}/user/{userId}");
        var user = JsonConvert.DeserializeObject<User>(responseString);


        return user;
    }

    public async Task AddUserAsync(User newUser)
    {
        var json = JsonConvert.SerializeObject(newUser);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await HttpClient.PostAsync($"{BaseUrl}/user/add", content);
        if (!response.IsSuccessStatusCode) throw new Exception("User already exist or missing data");
    }

    public async Task DeleteUserAsync(int userId)
    {
        await DeleteAsync($"/user/delete/{userId}");
    }

    public async Task<int?> CheckUserPasswordAsync(string userName, string password)
    {
        var responseString = await HttpClient.GetStringAsync(
            $"{BaseUrl}/user/checkpassword?user_name={userName}&user_password={password}");
        var userId = JsonConvert.DeserializeObject<int?>(responseString);
        return userId;
    }
}