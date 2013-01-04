using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BAPSLansdaleAddressManager.Models;

namespace BAPSLansdaleAddressManager.Controllers
{
    public class AdminController : Controller
    {
        private IEventFlagService _eventFlagService;

        //
        // GET: /Admin/
        [Authorize]
        public ViewResult Index()
        {
            return View();
        }

        //
        // GET: /Admin/EventFlags

        [Authorize]
        public ActionResult EventFlags()
        {
            return View(_eventFlagService.ListEventFlags());
        }

        //
        // GET: /Admin/EventFlagDetails/5
        [Authorize]
        public ViewResult EventFlagDetails(int id)
        {
            return View(_eventFlagService.GetEventFlag(id));
        }


        //
        // GET: /Admin/EditEventFlag

        public ActionResult EditEventFlag(int id)
        {
            var eventFlag = _eventFlagService.GetEventFlag(id);
            return View(eventFlag);
        }

        //
        // POST: /Admin/EditEventFlag

        [HttpPost]
        public ActionResult EditEventFlag(EventFlag eventFlag)
        {
            // Validation logic
            _eventFlagService.ValidateEventFlag(eventFlag);
            if (!ModelState.IsValid)
                return View();

            try
            {
                _eventFlagService.EditEventFlag(eventFlag);
                return RedirectToAction("EventFlags", "Admin");
            }
            catch
            {
                return View();
            }
        }

        [Authorize]
        public ActionResult DeleteEventFlag(int id)
        {
            return View(_eventFlagService.GetEventFlag(id));
        }

        //
        // POST: /Admin/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            var eventFlag = _eventFlagService.GetEventFlag(id);
            _eventFlagService.DeleteEventFlag(eventFlag);
            return RedirectToAction("EventFlags", "Admin");
        }
    }
}
