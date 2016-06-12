using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Metal_Archives.Models
{
    public class UserModel
    {
        public string Username { get; set; }
        public string FullName { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string Country { get; set; }
        public int Points { get; set; }
        public string Rank { get; set; }
        public string Password { get; set; }

        public UserModel(string username, string fullname, int age, string gender, string country, string password)
        {
            this.Username = username;
            this.FullName = fullname;
            this.Age = age;
            this.Gender = gender;
            this.Country = country;
            this.Password = password;
        }

        public override string ToString()
        {
            return Username + " - " + FullName ;
        }
    }
}