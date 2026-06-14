using BasketIQ.API.Interfaces.CompanyData;
using Microsoft.AspNetCore.Mvc;

namespace BasketIQ.API.Controllers.CompanyData
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProjectController : ControllerBase
    {
        private readonly IProjectInterface _projectService;

        public ProjectController(IProjectInterface projectService)
        {
            _projectService = projectService;
        }

        [HttpGet]

        public IActionResult GetAllProjects()
        {
            var result = _projectService.GetAllProjects();  
            return Ok(result);
        }

        [HttpGet("PrjectById")]
        public IActionResult GetProjectById(string id)
        {
            var result = _projectService.GetProjectById(id);  
            

            if (result == null)
                return NotFound($"Project with id {id} not found");

            return Ok(result);
        }
    }
}
