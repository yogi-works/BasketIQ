using BasketIQ.API.Interfaces.CompanyData;
using Microsoft.AspNetCore.Mvc;

namespace BasketIQ.API.Controllers.CompanyData
{
    [ApiController]
    [Route("api/[controller]")]

    public class ProjectController : Controller
    {
        private readonly IProjectInterface _projectService;

        public ProjectController(IProjectInterface projectService)
        {
            _projectService = projectService;
        }

        [HttpGet("details")]
        public IActionResult GetProjectDetails()
        {
            var abc = _projectService.GetProjectDetail();
            return Ok(abc);
        }
    }
}
