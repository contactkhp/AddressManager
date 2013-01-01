using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BAPSLansdaleAddressManager.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Person/
        [Authorize]
        public ViewResult Index()
        {
            return View();
        }
    }
}
