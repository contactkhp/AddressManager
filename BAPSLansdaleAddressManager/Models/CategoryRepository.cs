using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public class CategoryRepository: ICategoryRepository
    {
        private BAPSLansdaleEntities _entities = new BAPSLansdaleEntities();

        public Category CreateCategory(Category category)
        {
            _entities.AddToCategories(category);
            _entities.SaveChanges();
            return category;
        }

        public void DeleteCategory(Category category)
        {
            var originalPerson = GetCategory(category.CategoryId);
            _entities.Categories.DeleteObject(category);
            _entities.SaveChanges();
        }

        public Category EditCategory(Category category)
        {
            // Get original person object from database, no need to assig it to a variable
            GetCategory(category.CategoryId);
            _entities.Categories.ApplyCurrentValues(category);
            _entities.SaveChanges();
            return category;
        }

        public Category GetCategory(int id)
        {
            return _entities.Categories.Single(p => p.CategoryId == id);
        }

        public IEnumerable<Category> ListCategories()
        {
            return _entities.Categories.ToList();
        }
    }
}