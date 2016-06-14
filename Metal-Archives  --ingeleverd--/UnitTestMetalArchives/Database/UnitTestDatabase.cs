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
    public class UnitTestDatabase
    {
        BandDB BDB = new BandDB();
        [TestMethod()]
        public void GetBandTest()
        {
            Assert.AreEqual("Burzum", BDB.GetBand("Burzum").Name);
            Assert.AreEqual("Kristian Vikernes", BDB.GetBand("Burzum").Members[0].FullName);
            Assert.AreEqual("Det som engang var", BDB.GetBand("Burzum").Albums[0].Name);
        }

        [TestMethod()]
        public void GetAllBandsTest()
        {
            Assert.IsTrue(BDB.GetAllBands().Count == 4);
        }
    }
}