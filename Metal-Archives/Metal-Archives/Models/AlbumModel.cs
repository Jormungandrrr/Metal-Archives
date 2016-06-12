using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Metal_Archives.Models
{
    public class AlbumModel
    {
        public string Name { get; set; }
        public string Type { get; set; }
        public DateTime Release { get; set; }

        public AlbumModel(string name,string type, DateTime release)
        {
            this.Name = name;
            this.Type = type;
            this.Release = release;
        }

        public override string ToString()
        {
            return Name + " - " + Release.ToShortDateString();
        }
    }
}