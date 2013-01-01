using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using BAPSLansdaleAddressManager.Models.Validation;

namespace BAPSLansdaleAddressManager.Models
{
    public class PersonService : IPersonService
    {
        private IValidationDictionary _validationDictionary;
        private IPersonRepository _personRepository;

        public PersonService(IValidationDictionary validationDictionary) 
            : this(validationDictionary, new PersonRepository(), new CategoryRepository())
        {}


        public PersonService(IValidationDictionary validationDictionary, IPersonRepository personRepository, ICategoryRepository categoryRepository)
        {
            _validationDictionary = validationDictionary;
            _personRepository = personRepository;
        }

        public bool ValidatePerson(Person person)
        {
            if (person.FirstName.Trim().Length == 0)
                _validationDictionary.AddError("FirstName", "First name is required.");
            if (person.LastName.Trim().Length == 0)
                _validationDictionary.AddError("LastName", "Last name is required.");
            if (!string.IsNullOrEmpty(person.HomePhone) && !Regex.IsMatch(person.HomePhone, @"((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"))
                _validationDictionary.AddError("HomePhone", "Invalid phone number.");
            return _validationDictionary.IsValid;
        }

        public bool CreatePerson(Person person)
        {
            // Validation logic
            if (!ValidatePerson(person))
                return false;

            // Database logic
            try
            {
                _personRepository.CreatePerson(person);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool DeletePerson(Person person)
        {
            try
            {
                _personRepository.DeletePerson(person);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool EditPerson(Person person)
        {
            // Validation logic
            if (!ValidatePerson(person))
                return false;

            // Database logic
            try
            {
                _personRepository.EditPerson(person);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public Person GetPerson(int id)
        {
            return _personRepository.GetPerson(id);
        }

        public IEnumerable<Person> ListPersons()
        {
            return _personRepository.ListPersons();
        }

        public IEnumerable<Person> GetPersons(string searchString)
        {
            return _personRepository.GetPersons(searchString);
        }
    }
}