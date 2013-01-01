using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using BAPSLansdaleAddressManager.Models;

namespace BAPSLansdaleAddressManager.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Home/

        [Authorize]
        public ActionResult About()
        {
            return View();
        }
    }
}