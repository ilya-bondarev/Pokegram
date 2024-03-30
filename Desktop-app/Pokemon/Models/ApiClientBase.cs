using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace Pokemon.Models;

public class ApiClientBase
{
    protected readonly HttpClient HttpClient;
    protected readonly string BaseUrl = "http://77.222.37.106:5000";

    public ApiClientBase(HttpClient httpClient)
    {
        HttpClient = httpClient;
    }

    protected async Task<T> GetAsync<T>(string uri)
    {
        var response = await HttpClient.GetAsync($"{BaseUrl}{uri}");
        response.EnsureSuccessStatusCode();
        var content = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<T>(content, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
    }

    protected async Task PostAsync<T>(string uri, T data)
    {
        var content = new StringContent(JsonSerializer.Serialize(data), Encoding.UTF8, "application/json");
        var response = await HttpClient.PostAsync($"{BaseUrl}{uri}", content);
        response.EnsureSuccessStatusCode();
    }

    protected async Task DeleteAsync(string uri)
    {
        var response = await HttpClient.DeleteAsync($"{BaseUrl}{uri}");
        response.EnsureSuccessStatusCode();
    }
}
