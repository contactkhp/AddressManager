using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BAPSLansdaleAddressManager.Models.Validation;

namespace BAPSLansdaleAddressManager.Models
{
    public class CityNameService : ICityNameService
    {
        private IValidationDictionary _validationDictionary;
        private ICityNameRepository _cityNameRepository;

        public CityNameService(IValidationDictionary validationDictionary) 
            : this(validationDictionary, new CityNameRepository())
        {}

        public CityNameService(IValidationDictionary validationDictionary, ICityNameRepository cityNameRepository)
        {
            _validationDictionary = validationDictionary;
            _cityNameRepository = cityNameRepository;
        }

        public bool ValidateCityName(CityName cityName)
        {
            if (cityName.CityName1.Trim().Length == 0)
                _validationDictionary.AddError("CityName", "City name is required.");
            if (cityName.State.Trim().Length == 0)
                _validationDictionary.AddError("State", "State is required.");
            return _validationDictionary.IsValid;
        }

        public bool CreateCityName(CityName cityName)
        {
            // Validation logic
            if (!ValidateCityName(cityName))
                return false;

            // Database logic
            try
            {
                _cityNameRepository.CreateCityName(cityName);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool DeleteCityName(CityName cityName)
        {
            try
            {
                _cityNameRepository.DeleteCityName(cityName);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool EditCityName(CityName cityName)
        {
            // Validation logic
            if (!ValidateCityName(cityName))
                return false;

            // Database logic
            try
            {
                _cityNameRepository.EditCityName(cityName);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public CityName GetCityName(int id)
        {
            return _cityNameRepository.GetCityName(id);
        }

        public IEnumerable<CityName> ListCityNames()
        {
            return _cityNameRepository.ListCityNames();
        }
    }
}