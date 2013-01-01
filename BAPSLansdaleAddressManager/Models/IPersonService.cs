using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IPersonService
    {
        bool ValidatePerson(Person person);
        bool CreatePerson(Person person);
        bool DeletePerson(Person person);
        bool EditPerson(Person person);
        Person GetPerson(int id);
        IEnumerable<Person> ListPersons();
        IEnumerable<Person> GetPersons(string searchString);
    }
}