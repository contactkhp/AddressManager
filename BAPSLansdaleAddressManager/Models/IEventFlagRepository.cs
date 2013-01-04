using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IEventFlagRepository
    {
        EventFlag CreateEventFlag(EventFlag eventFlag);
        void DeleteEventFlag(EventFlag eventFlag);
        EventFlag EditEventFlag(EventFlag eventFlag);
        EventFlag GetEventFlag(int id);
        IEnumerable<EventFlag> ListEventFlags();
    }
}