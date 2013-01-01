using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public class AddressRepository : IAddressRepository
    {
        private BAPSLansdaleEntities _entities = new BAPSLansdaleEntities();

        public Address CreateAddress(Address address)
        {
            _entities.AddToAddresses(address);
            _entities.SaveChanges();
            return address;
        }

        public void DeleteAddress(Address address)
        {
            var originalPerson = GetAddress(address.AddressId);
            _entities.Addresses.DeleteObject(address);
            _entities.SaveChanges();
        }

        public Address EditAddress(Address address)
        {
            // Get original person object from database, no need to assig it to a variable
            GetAddress(address.AddressId);
            _entities.Addresses.ApplyCurrentValues(address);
            _entities.SaveChanges();
            return address;
        }

        public Address GetAddress(int id)
        {
            return _entities.Addresses.Single(p => p.AddressId == id);
        }

        public IEnumerable<Address> ListAddresses()
        {
            return _entities.Addresses.ToList();
        }
    }
}