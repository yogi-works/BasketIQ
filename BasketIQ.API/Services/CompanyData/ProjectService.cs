using BasketIQ.API.Interfaces.CompanyData;
using BasketIQ.API.Models.CompanyData;
using System.Text.Json;
namespace BasketIQ.API.Services.CompanyData
{
    public class ProjectService : IProjectInterface

    {
        private List<Project> LoadProjects()
        {
            var filePath = Path.Combine(Directory.GetCurrentDirectory(), "Json", "company-data.json");
            var jsonString = File.ReadAllText(filePath);

            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            };

            var data = JsonSerializer.Deserialize<RootData>(jsonString, options);
            return data.Projects;
        }

        // Get all projects
        public List<Project> GetAllProjects()
        {
            return LoadProjects();
        }

        // Get single project by id e.g PRJ-901
        public Project GetProjectById(string id)
        {
            var projects = LoadProjects();
            return projects.FirstOrDefault(p => p.Id == id);
        }
    } }
