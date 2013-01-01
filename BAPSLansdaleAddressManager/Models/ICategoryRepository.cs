using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface ICategoryRepository
    {
        Category CreateCategory(Category category);
        void DeleteCategory(Category category);
        Category EditCategory(Category category);
        Category GetCategory(int id);
        IEnumerable<Category> ListCategories();
    }
}