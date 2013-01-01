using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public class CityNameRepository : ICityNameRepository
    {
        private BAPSLansdaleEntities _entities = new BAPSLansdaleEntities();

        public CityName CreateCityName(CityName cityName)
        {
            _entities.AddToCityNames(cityName);
            _entities.SaveChanges();
            return cityName;
        }

        public void DeleteCityName(CityName cityName)
        {
            var originalPerson = GetCityName(cityName.CityId);
            _entities.CityNames.DeleteObject(cityName);
            _entities.SaveChanges();
        }

        public CityName EditCityName(CityName cityName)
        {
            // Get original person object from database, no need to assig it to a variable
            GetCityName(cityName.CityId);
            _entities.CityNames.ApplyCurrentValues(cityName);
            _entities.SaveChanges();
            return cityName;
        }

        public CityName GetCityName(int id)
        {
            return _entities.CityNames.Single(p => p.CityId == id);
        }

        public IEnumerable<CityName> ListCityNames()
        {
            return _entities.CityNames.ToList();
        }
    }
}