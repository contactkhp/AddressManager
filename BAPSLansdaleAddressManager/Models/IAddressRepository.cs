using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IAddressRepository
    {
        Address CreateAddress(Address address);
        void DeleteAddress(Address address);
        Address EditAddress(Address address);
        Address GetAddress(int id);
        IEnumerable<Address> ListAddresses();
    }
}