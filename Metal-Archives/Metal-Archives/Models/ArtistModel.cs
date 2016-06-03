using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Metal_Archives.Models
{
    public class ArtistModel
    {
        public string StageName { get; set; }
        public string FullName { get; set; }
        public int Age { get; set; }
        public DateTime BirthDate { get; set; }
        public string Origin { get; set; }
        public string Gender { get; set; }
        public DateTime Death { get; set; }
        public string DiedOf { get; set; }
        public string Biography { get; set; }
        public string Trivia { get; set; }

        public ArtistModel(string stagename,string fullname, int age, DateTime birthdate, string origin, string biography, string trivia)
        {
            this.StageName = stagename;
            this.FullName = fullname;
            this.Age = age;
            this.BirthDate = birthdate;
            this.Origin = origin;
            this.Biography = biography;
            this.Trivia = trivia;
        }
    }
}