using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public class EventFlagRepository : IEventFlagRepository
    {
        private BAPSLansdaleEntities _entities = new BAPSLansdaleEntities();

        public EventFlag CreateEventFlag(EventFlag eventFlag)
        {
            _entities.AddToEventFlags(eventFlag);
            _entities.SaveChanges();
            return eventFlag;
        }

        public void DeleteEventFlag(EventFlag eventFlag)
        {
            var originalPerson = GetEventFlag(eventFlag.EventFlagID);
            _entities.EventFlags.DeleteObject(eventFlag);
            _entities.SaveChanges();
        }

        public EventFlag EditEventFlag(EventFlag eventFlag)
        {
            // Get original person object from database, no need to assig it to a variable
            GetEventFlag(eventFlag.EventFlagID);
            _entities.EventFlags.ApplyCurrentValues(eventFlag);
            _entities.SaveChanges();
            return eventFlag;
        }

        public EventFlag GetEventFlag(int id)
        {
            return _entities.EventFlags.Single(p => p.EventFlagID == id);
        }

        public IEnumerable<EventFlag> ListEventFlags()
        {
            return _entities.EventFlags.ToList();
        }
    }
}