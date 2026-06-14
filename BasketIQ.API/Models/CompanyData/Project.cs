namespace BasketIQ.API.Models.CompanyData
    {
        public class Project
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public string Status { get; set; }
            public double Budget { get; set; }
            public List<string> Technologies_Used { get; set; }
        }

        public class RootData
        {
            public List<Project> Projects { get; set; }
        }
    }

