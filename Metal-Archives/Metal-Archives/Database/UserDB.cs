using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Metal_Archives.Models;

namespace Metal_Archives.Database
{
    public class UserDB : Database
    {
        public UserModel GetUser(string Username)
        {
            List<string> Columns = new List<string>();
            Columns.Add("Username");
            Columns.Add("Fullname");
            Columns.Add("Age");
            Columns.Add("gender");
            Columns.Add("Country");
            Columns.Add("Pass");
            UserModel User = (UserModel)ReadObjectWithCondition("tblUser", Columns, "Username", Username, "User");
            return User;
        }
    }
}