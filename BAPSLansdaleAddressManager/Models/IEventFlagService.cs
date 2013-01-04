using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface IEventFlagService
    {
        bool ValidateEventFlag(EventFlag eventFlag);
        bool CreateEventFlag(EventFlag eventFlag);
        bool DeleteEventFlag(EventFlag eventFlag);
        bool EditEventFlag(EventFlag eventFlag);
        EventFlag GetEventFlag(int id);
        IEnumerable<EventFlag> ListEventFlags();
    }
}