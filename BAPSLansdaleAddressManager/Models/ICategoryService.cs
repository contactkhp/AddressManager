using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAPSLansdaleAddressManager.Models
{
    public interface ICategoryService
    {
        bool ValidateCategory(Category category);
        bool CreateCategory(Category category);
        bool DeleteCategory(Category category);
        bool EditCategory(Category category);
        Category GetCategory(int id);
        IEnumerable<Category> ListCategories();
    }
}