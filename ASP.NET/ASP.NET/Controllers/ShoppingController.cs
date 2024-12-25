using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ASP.NET.Models;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class ShoppingController : Controller
    {
        // GET: Shopping
        public ActionResult Cart()
        {
            return View();
        }
    }
}