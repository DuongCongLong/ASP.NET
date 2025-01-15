using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        WebsiteASP_NETEntities objWebsiteASP_NETEntities = new WebsiteASP_NETEntities();
        public ActionResult ProductDetail(int Id)
        {
            // Lấy sản phẩm theo Id
            var objProduct = objWebsiteASP_NETEntities.Products.Where(n => n.Id == Id).FirstOrDefault();

            if (objProduct == null)
            {
                return HttpNotFound();  // Nếu không tìm thấy sản phẩm, trả về lỗi 404
            }

            // Lấy danh mục của sản phẩm
            var category = objWebsiteASP_NETEntities.Categories.Where(c => c.Id == objProduct.CategoryId).FirstOrDefault();

            // Truyền dữ liệu vào ViewBag
            ViewBag.CategoryName = category?.Name ?? "Danh mục không tồn tại";  // Nếu không có danh mục, hiển thị thông báo mặc định
            ViewBag.ProductName = objProduct.Name;

            return View(objProduct);
        }

    }
}