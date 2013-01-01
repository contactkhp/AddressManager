using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IPersonRepository
    {
        Person CreatePerson(Person person);
        void DeletePerson(Person person);
        Person EditPerson(Person person);
        Person GetPerson(int id);
        IEnumerable<Person> ListPersons();
        IEnumerable<Person> GetPersons(string searchString);
    }
}