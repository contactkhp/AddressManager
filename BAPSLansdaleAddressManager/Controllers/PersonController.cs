using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BAPSLansdaleAddressManager.Models;
using System.Text.RegularExpressions;
using BAPSLansdaleAddressManager.Models.Validation;

namespace BAPSLansdaleAddressManager.Controllers
{ 
    public class PersonController : Controller
    {
        private IPersonService _personService;
        private ICategoryService _categoryService;
        private ICityNameService _cityNameService;
        
        public PersonController()
        {
            _personService = new PersonService(new ModelStateWrapper(ModelState));
            _categoryService = new CategoryService(new ModelStateWrapper(ModelState));
            _cityNameService = new CityNameService(new ModelStateWrapper(ModelState));
        }

        public PersonController(IPersonService personService, ICategoryService categoryService, ICityNameService cityNameService)
        {
            _personService = personService;
            _categoryService = categoryService;
            _cityNameService = cityNameService;
        }

        private class LocalGender
        {
            public string Gender { get; set; }
        }

        private static IEnumerable<LocalGender> GetGenders()
        {
            return new List<LocalGender> { new LocalGender { Gender = "M" }, new LocalGender { Gender = "F" } };
        }

        //
        // GET: /Person/
        [Authorize]
        public ViewResult Index()
        {
            return View(_personService.ListPersons());
        }

        //
        // GET: /Person/Details/5
        [Authorize]
        public ViewResult Details(int id)
        {
            return View(_personService.GetPerson(id));
        }

        //
        // GET: /Person/SearchIndex
        [Authorize]
        public ActionResult SearchIndex(string searchString)
        {
            if (!String.IsNullOrEmpty(searchString))
                return View(_personService.GetPersons(searchString));

            return View(_personService.ListPersons());
        }

        //
        // GET: /Person/Create
        [Authorize]
        public ActionResult Create()
        {
            ViewBag.Gender = new SelectList(GetGenders(), "Gender", "Gender");
            ViewBag.CategoryId = new SelectList(_categoryService.ListCategories(), "CategoryId", "CategoryName", 1);
            return View();
        } 

        //
        // POST: /Person/Create

        [HttpPost]
        public ActionResult Create([Bind(Exclude = "Id")] Person person)
        {
            // Validation logic
            _personService.ValidatePerson(person);
            if (!ModelState.IsValid)
                return View();

            try
            {
                _personService.CreatePerson(person);
                return RedirectToAction("Index", "Person");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Person/Edit/5

        [Authorize]
        public ActionResult Edit(int id)
        {
            var person = _personService.GetPerson(id);

            ViewBag.Gender = new SelectList(GetGenders(), "Gender", "Gender", person.Gender);
            ViewBag.CategoryId = new SelectList(_categoryService.ListCategories(), "CategoryId", "CategoryName", person.CategoryId);
            ViewBag.CityId = new SelectList(_cityNameService.ListCityNames(), "CityId", "CityName1", person.Address.CityId);
            return View(person);
        }

        //
        // POST: /Person/Edit/5

        [HttpPost]
        public ActionResult Edit(Person person)
        {
            // Validation logic
            _personService.ValidatePerson(person);
            if (!ModelState.IsValid)
                return View();

            try
            {
                _personService.EditPerson(person);
                return RedirectToAction("Index", "Person");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Person/Delete/5
        
        [Authorize]
        public ActionResult Delete(int id)
        {
            return View(_personService.GetPerson(id));
        }

        //
        // POST: /Person/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            var person = _personService.GetPerson(id);
            _personService.DeletePerson(person);
            return RedirectToAction("Index", "Person");
        }
    }
}