using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IAddressService
    {
        bool ValidateAddress(Address address);
        bool CreateAddress(Address address);
        bool DeleteAddress(Address address);
        bool EditAddress(Address address);
        Address GetAddress(int id);
        IEnumerable<Address> ListAddresses();
    }
}