using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface ICityNameRepository
    {
        CityName CreateCityName(CityName cityName);
        void DeleteCityName(CityName cityName);
        CityName EditCityName(CityName cityName);
        CityName GetCityName(int id);
        IEnumerable<CityName> ListCityNames();
    }
}