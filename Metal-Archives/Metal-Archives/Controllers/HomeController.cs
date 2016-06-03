﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Metal_Archives;
using Metal_Archives.Models;

namespace Metal_Archives.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Bands()
        {
            ViewBag.Message = "Bands.";
            DatabaseController DBC = new DatabaseController();
            List<BandModel> bands = new List<BandModel>();
            foreach (BandModel bm in DBC.GetAllBands())
            {
                bands.Add(bm);
            }
            return View(bands);
        }
        public ActionResult Labels()
        {
            ViewBag.Message = "Labels";

            return View();
        }
    }
}