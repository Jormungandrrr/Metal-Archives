using Microsoft.VisualStudio.TestTools.UnitTesting;
using Metal_Archives.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Metal_Archives.Models;

namespace Metal_Archives.Database.Tests
{
    [TestClass()]
    public class UserDBTests
    {
        UserDB UDB = new UserDB();
        [TestMethod()]
        public void GetUserTest()
        {
            Assert.AreEqual(UDB.GetUser("KaasIsDeBaas").FullName, "Eva Kaas");
            Assert.AreEqual(UDB.GetUser("KaasIsDeBaas").Age, 20);
            Assert.AreEqual(UDB.GetUser("KaasIsDeBaas").Country, "Norway");
            Assert.AreEqual(UDB.GetUser("KaasIsDeBaas").Username, "KaasIsDeBaas");
        }

        [TestMethod()]
        public void ValidateLoginTest()
        {
            LoginViewModel lvm = new LoginViewModel();
            lvm.Username = "KaasIsDeBaas";
            lvm.Password = "Password123";
            Assert.IsTrue(UDB.ValidateLogin(lvm));
        }

        [TestMethod()]
        public void InValidateLoginTest()
        {
            LoginViewModel lvm = new LoginViewModel();
            lvm.Username = "KaasIsDeBaas";
            lvm.Password = "";
            Assert.IsFalse(UDB.ValidateLogin(lvm));
            lvm.Username = "";
            lvm.Password = "Password123";
        }
    }
}