using Microsoft.VisualStudio.TestTools.UnitTesting;
using Metal_Archives.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Metal_Archives.Models.Tests
{
    [TestClass()]
    public class AlbumModelTests
    {
        [TestMethod()]
        public void ToStringTest()
        {
            AlbumModel album = new AlbumModel("AlbumTest", "Test", Convert.ToDateTime("12-6-2016"));
            Assert.AreEqual(album.ToString(), "AlbumTest - 12-6-2016");
        }
    }
}