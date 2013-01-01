using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface ICityNameService
    {
        bool ValidateCityName(CityName cityName);
        bool CreateCityName(CityName cityName);
        bool DeleteCityName(CityName cityName);
        bool EditCityName(CityName cityName);
        CityName GetCityName(int id);
        IEnumerable<CityName> ListCityNames();
    }
}