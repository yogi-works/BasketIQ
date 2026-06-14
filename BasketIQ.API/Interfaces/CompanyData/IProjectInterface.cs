using BasketIQ.API.Models.CompanyData;

namespace BasketIQ.API.Interfaces.CompanyData
{
    public interface IProjectInterface
    {
        List<Project> GetAllProjects();
        Project GetProjectById(string id);
    }
}