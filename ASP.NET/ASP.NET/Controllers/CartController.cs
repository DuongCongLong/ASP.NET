﻿using ASP.NET.Context;
using ASP.NET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class CartController : Controller
    {
        WebsiteASP_NETEntities objWebsiteASP_NETEntities = new WebsiteASP_NETEntities();
        // GET: Cart
        public ActionResult Index()
        {
            return View((List<CartModel>)Session["cart"]);
        }

        public ActionResult AddToCart(int id, int quantity)
        {
            if (Session["cart"] == null)
            {
                List<CartModel> cart = new List<CartModel>();
                cart.Add(new CartModel { Product = objWebsiteASP_NETEntities.Products.Find(id), Quantity = quantity });
                Session["cart"] = cart;
                Session["count"] = 1;
            }
            else
            {
                List<CartModel> cart = (List<CartModel>)Session["cart"];
                //kiểm tra sản phẩm có tồn tại trong giỏ hàng chưa???
                int index = isExist(id);
                if (index != -1)
                {
                    //nếu sp tồn tại trong giỏ hàng thì cộng thêm số lượng
                    cart[index].Quantity += quantity;
                }
                else
                {
                    //nếu không tồn tại thì thêm sản phẩm vào giỏ hàng
                    cart.Add(new CartModel { Product = objWebsiteASP_NETEntities.Products.Find(id), Quantity = quantity });
                    //Tính lại số sản phẩm trong giỏ hàng
                    Session["count"] = Convert.ToInt32(Session["count"]) + 1;
                }
                Session["cart"] = cart;
            }
            return Json(new { Message = "Thành công", JsonRequestBehavior.AllowGet });
        }

        private int isExist(int id)
        {
            List<CartModel> cart = (List<CartModel>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
                if (cart[i].Product.Id.Equals(id))
                    return i;
            return -1;
        }

        //xóa sản phẩm khỏi giỏ hàng theo id
        public ActionResult Remove(int Id)
        {
            List<CartModel> cart = (List<CartModel>)Session["cart"];
            cart.RemoveAll(x => x.Product.Id == Id);  // Xóa sản phẩm khỏi giỏ hàng
            Session["cart"] = cart;
            Session["count"] = cart.Count;

            // Tính lại tổng giá trị
            decimal cartTotalPrice = cart.Sum(x => (decimal)((x.Product.Price ?? 0.0) * x.Quantity));  // Chuyển kiểu double? thành double rồi tính tổng

            // Trả về số lượng sản phẩm và tổng giá trị giỏ hàng mới
            return Json(new
            {
                success = true,
                cartTotalPrice = cartTotalPrice.ToString("N0"),
                cartItemCount = cart.Count
            }, JsonRequestBehavior.AllowGet);
        }


    }
}