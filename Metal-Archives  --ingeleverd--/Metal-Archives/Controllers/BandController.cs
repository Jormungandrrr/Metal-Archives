using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Metal_Archives;
using Metal_Archives.Models;
using Metal_Archives.Database;

namespace Metal_Archives.Controllers
{
    public class BandController : Controller
    {
        // GET: Band
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Band(string bandname)
        {
            BandDB DBC = new BandDB();
            BandModel band = DBC.GetBand(bandname);
            return View(band);
        }
    }
}