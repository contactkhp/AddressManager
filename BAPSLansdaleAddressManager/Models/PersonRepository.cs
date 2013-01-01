using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public class PersonRepository: IPersonRepository
    {
        private BAPSLansdaleEntities _entities = new BAPSLansdaleEntities();

        public Person CreatePerson(Person person)
        {
            _entities.AddToPersons(person);
            _entities.SaveChanges();
            return person;
        }

        public void DeletePerson(Person person)
        {
            var originalPerson = GetPerson(person.PersonID);
            _entities.Persons.DeleteObject(person);
            _entities.SaveChanges();
        }

        public Person EditPerson(Person person)
        {
            // Get original person object from database, no need to assig it to a variable
            GetPerson(person.PersonID);
            _entities.Persons.ApplyCurrentValues(person);
            _entities.SaveChanges();
            return person;
        }

        public Person GetPerson(int id)
        {
            return _entities.Persons.Single(p => p.PersonID == id);
        }

        public IEnumerable<Person> ListPersons()
        {
            return _entities.Persons.ToList();
        }

        public IEnumerable<Person> GetPersons(string searchString)
        {
            return _entities.Persons.Where(p => 
                (p.FirstName.Contains(searchString)) || (p.LastName.Contains(searchString)) ||
                (p.Address.StreetNo.Contains(searchString))|| (p.Address.Address1.Contains(searchString))
                );
        }
    }
}