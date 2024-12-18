using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username, string password)
        {
            // Kiểm tra thông tin đăng nhập cứng
            if (username == "long" && password == "123456")
            {
                // Đăng nhập thành công, tạo session lưu thông tin người dùng
                Session["Username"] = username;
                TempData["Message"] = "Đăng nhập thành công!";
                return RedirectToAction("Index", "Home"); // Chuyển hướng đến trang chính
            }
            else
            {
                // Sai thông tin đăng nhập
                ViewBag.ErrorMessage = "Tên đăng nhập hoặc mật khẩu không đúng!";
            }
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        public ActionResult Logout()
        {
            // Xóa session khi người dùng đăng xuất
            Session.Clear();
            TempData["Message"] = "Bạn đã đăng xuất thành công!";
            return RedirectToAction("Login");
        }
    }
}
