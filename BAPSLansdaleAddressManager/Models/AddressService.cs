using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BAPSLansdaleAddressManager.Models.Validation;

namespace BAPSLansdaleAddressManager.Models
{
    public class AddressService : IAddressService
    {
        private IValidationDictionary _validationDictionary;
        private IAddressRepository _addressRepository;

        public AddressService(IValidationDictionary validationDictionary) 
            : this(validationDictionary, new AddressRepository())
        {}

        public AddressService(IValidationDictionary validationDictionary, IAddressRepository addressRepository)
        {
            _validationDictionary = validationDictionary;
            _addressRepository = addressRepository;
        }

        public bool ValidateAddress(Address address)
        {
            if (address.StreetNo.Trim().Length == 0)
                _validationDictionary.AddError("StreetNo", "Street number is required.");
            if (address.Address1.Trim().Length == 0)
                _validationDictionary.AddError("Street Name", "Street name is required.");
            if (address.CityId == 0)
                _validationDictionary.AddError("CityId", "City is required.");
            if (address.Zip.Trim().Length == 0)
                _validationDictionary.AddError("Zip", "Zip is required.");

            return _validationDictionary.IsValid;
        }

        public bool CreateAddress(Address address)
        {
            // Validation logic
            if (!ValidateAddress(address))
                return false;

            // Database logic
            try
            {
                _addressRepository.CreateAddress(address);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool DeleteAddress(Address address)
        {
            try
            {
                _addressRepository.DeleteAddress(address);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool EditAddress(Address address)
        {
            // Validation logic
            if (!ValidateAddress(address))
                return false;

            // Database logic
            try
            {
                _addressRepository.EditAddress(address);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public Address GetAddress(int id)
        {
            return _addressRepository.GetAddress(id);
        }

        public IEnumerable<Address> ListAddresses()
        {
            return _addressRepository.ListAddresses();
        }
    }
}