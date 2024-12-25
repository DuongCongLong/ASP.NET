using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        WebsiteASP_NETEntities objWebsiteASP_NETEntities = new WebsiteASP_NETEntities();
        // GET: Admin/Product
        public ActionResult Index()
        {
            var lstProduct = objWebsiteASP_NETEntities.Products.ToList();
            return View(lstProduct);
        }
        public ActionResult Details(int Id)
        {
            var objProduct = objWebsiteASP_NETEntities.Products.Where(n => n.Id ==Id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpGet]
        public ActionResult Create()
        {
            // Lấy danh sách danh mục từ cơ sở dữ liệu
            var categories = objWebsiteASP_NETEntities.Categories.ToList();

            // Tạo SelectList và gán vào ViewBag
            ViewBag.CategoryId = new SelectList(categories, "Id", "Name");

            // Lấy danh sách thương hiệu từ cơ sở dữ liệu
            var brands = objWebsiteASP_NETEntities.Brands.ToList();

            // Gán SelectList vào ViewBag
            ViewBag.BrandId = new SelectList(brands, "Id", "Name");

            return View();
        }

        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (objProduct.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + extension + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss"));
                    objProduct.Avatar = fileName;
                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
                }
                objWebsiteASP_NETEntities.Products.Add(objProduct);
                objWebsiteASP_NETEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)

            {
                return RedirectToAction("Index");
            }

        }
        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objProduct = objWebsiteASP_NETEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objWebsiteASP_NETEntities.Products.Where(n => n.Id == objPro.Id).FirstOrDefault();

            objWebsiteASP_NETEntities.Products.Remove(objProduct);
            objWebsiteASP_NETEntities.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}