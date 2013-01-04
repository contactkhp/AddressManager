using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BAPSLansdaleAddressManager.Models.Validation;

namespace BAPSLansdaleAddressManager.Models
{
    public class EventFlagService : IEventFlagService
    {
        private IValidationDictionary _validationDictionary;
        private IEventFlagRepository _eventFlagRepository;

        public EventFlagService(IValidationDictionary validationDictionary)
            : this(validationDictionary, new EventFlagRepository())
        { }

        public EventFlagService(IValidationDictionary validationDictionary, IEventFlagRepository eventFlagRepository)
        {
            _validationDictionary = validationDictionary;
            _eventFlagRepository = eventFlagRepository;
        }

        public bool ValidateEventFlag(EventFlag eventFlag)
        {
            if (eventFlag.FlagName.Trim().Length == 0)
                _validationDictionary.AddError("FlagName", "Flag name is required.");
            if (eventFlag.FlagYear == 0)
                _validationDictionary.AddError("FlagYear", "Flag year is required.");
            return _validationDictionary.IsValid;
        }


        public bool CreateEventFlag(EventFlag eventFlag)
        {
            // Validation logic
            if (!ValidateEventFlag(eventFlag))
                return false;

            // Database logic
            try
            {
                _eventFlagRepository.CreateEventFlag(eventFlag);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool DeleteEventFlag(EventFlag eventFlag)
        {
            try
            {
                _eventFlagRepository.DeleteEventFlag(eventFlag);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool EditEventFlag(EventFlag eventFlag)
        {
            // Validation logic
            if (!ValidateEventFlag(eventFlag))
                return false;

            // Database logic
            try
            {
                _eventFlagRepository.EditEventFlag(eventFlag);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public EventFlag GetEventFlag(int id)
        {
            return _eventFlagRepository.GetEventFlag(id);
        }

        public IEnumerable<EventFlag> ListEventFlags()
        {
            return _eventFlagRepository.ListEventFlags();
        }
    }
}