using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Metal_Archives.Models
{
    public class BandModel
    {
        public string Name { get; set; }
        public string Origin { get; set; }
        public string Place { get; set; }
        public string Country { get; set; }
        public string Status { get; set; }
        public DateTime Formed { get; set; }
        public string Description { get; set; }
        public DateTime yearsactive { get; set; }
        public string Genre { get; set; }
        public string Logo { get; set; }
        public List<AlbumModel> Albums = new List<AlbumModel>();
        public List<ArtistModel> Members = new List<ArtistModel>();
        public BandModel(string name, string country,string status,DateTime formed, string description, string logo)
        {
            this.Name = name;
            this.Status = status;
            this.Country = country;
            this.Formed = formed;
            this.Description = description;
            this.Logo = logo;
        }
    }
}