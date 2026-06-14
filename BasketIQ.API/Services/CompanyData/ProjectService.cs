using BasketIQ.API.Interfaces.CompanyData;

namespace BasketIQ.API.Services.CompanyData
{
    public class ProjectService : IProjectInterface
    {
        public object GetProjectDetail()
        {
            return new
            {
                Id = 1,
                Name = "Project 1",
                Description = "This is a sample project.",
                StartDate = DateTime.Now,
                EndDate = DateTime.Now.AddMonths(6)
            };
        }
    }
}
