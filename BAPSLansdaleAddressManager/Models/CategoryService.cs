using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BAPSLansdaleAddressManager.Models.Validation;

namespace BAPSLansdaleAddressManager.Models
{
    public class CategoryService : ICategoryService
    {
        private IValidationDictionary _validationDictionary;
        private ICategoryRepository _categoryRepository;
        
        public CategoryService(IValidationDictionary validationDictionary) 
            : this(validationDictionary, new CategoryRepository())
        {}

        public CategoryService(IValidationDictionary validationDictionary, ICategoryRepository categoryRepository)
        {
            _validationDictionary = validationDictionary;
            _categoryRepository = categoryRepository;
        }

        public bool ValidateCategory(Category category)
        {
            if (category.CategoryName.Trim().Length == 0)
                _validationDictionary.AddError("CategoryName", "Category name is required.");
            return _validationDictionary.IsValid;
        }

        public bool CreateCategory(Category category)
        {
            // Validation logic
            if (!ValidateCategory(category))
                return false;

            // Database logic
            try
            {
                _categoryRepository.CreateCategory(category);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool DeleteCategory(Category category)
        {
            try
            {
                _categoryRepository.DeleteCategory(category);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool EditCategory(Category category)
        {
            // Validation logic
            if (!ValidateCategory(category))
                return false;

            // Database logic
            try
            {
                _categoryRepository.EditCategory(category);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public Category GetCategory(int id)
        {
            return _categoryRepository.GetCategory(id);
        }

        public IEnumerable<Category> ListCategories()
        {
            return _categoryRepository.ListCategories();
        }
    }
}