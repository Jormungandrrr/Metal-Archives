using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Metal_Archives.Models;
using Metal_Archives.Database;

namespace Metal_Archives.Controllers
{
    public class AddController : Controller
    {
        // GET: Add
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddBand()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddBand(BandModel Band)
        {
            if (ModelState.IsValid)
            {
                BandDB BDB = new BandDB();
                BDB.InsertBand(Band);
                return RedirectToAction("Index", "Home");
            }
            return View(Band);
        }
    }
}