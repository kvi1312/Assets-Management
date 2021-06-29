using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AssetManagement.Models;

namespace AssetManagement.Controllers
{
    public class LoginController : Controller
    {
        private ASSET_MANAGEMENTEntities db = new ASSET_MANAGEMENTEntities();

        // GET: Login
        public ActionResult Index()
        {
            var aSSETs = db.ASSETs.Include(a => a.ASSET_TYPE);
            return View(aSSETs.ToList());
        }

        // GET: Login/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ASSET aSSET = db.ASSETs.Find(id);
            if (aSSET == null)
            {
                return HttpNotFound();
            }
            return View(aSSET);
        }

        // GET: Login/Create
        public ActionResult Create()
        {
            ViewBag.AT_ID = new SelectList(db.ASSET_TYPE, "AT_ID", "AT_NAME");
            return View();
        }

        //[HttpPost]
        public ActionResult Login(AssetManagement.Models.USER userModel)
        {
            using (ASSET_MANAGEMENTEntities db = new ASSET_MANAGEMENTEntities())
            {
                var userDetails = db.USERs.Where(x => x.U_USERNAME == userModel.U_USERNAME && x.U_PASSWORD == userModel.U_PASSWORD).FirstOrDefault();
                if (userDetails == null)
                {
                    userModel.LoginErrorMessage = "SAI TÊN ĐĂNG NHẬP HOẶC MẬT KHẨU";
                    return View("Login",userModel);
                }
                else
                {
                    Session["U_ID"] = userDetails.U_ID;
                    Session["U_USERNAME"] = userDetails.U_USERNAME;
                    return RedirectToAction("Index", "Home");
                }
            }
          
        }
        public ActionResult LogOut()
        {
            int U_ID = (int)Session["U_ID"];
            Session.Abandon();
            return RedirectToAction("Login","Login");
            
        }


        // POST: Login/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AS_ID,AT_ID,AS_NAME,AS_STATUS,AS_PURCHASE_DATE,AS_PROVIDER,AS_DESCRIPTION,AS_VALUE,AS_FLAG")] ASSET aSSET)
        {
            if (ModelState.IsValid)
            {
                db.ASSETs.Add(aSSET);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AT_ID = new SelectList(db.ASSET_TYPE, "AT_ID", "AT_NAME", aSSET.AT_ID);
            return View(aSSET);
        }

        // GET: Login/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ASSET aSSET = db.ASSETs.Find(id);
            if (aSSET == null)
            {
                return HttpNotFound();
            }
            ViewBag.AT_ID = new SelectList(db.ASSET_TYPE, "AT_ID", "AT_NAME", aSSET.AT_ID);
            return View(aSSET);
        }

        // POST: Login/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AS_ID,AT_ID,AS_NAME,AS_STATUS,AS_PURCHASE_DATE,AS_PROVIDER,AS_DESCRIPTION,AS_VALUE,AS_FLAG")] ASSET aSSET)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aSSET).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AT_ID = new SelectList(db.ASSET_TYPE, "AT_ID", "AT_NAME", aSSET.AT_ID);
            return View(aSSET);
        }

        // GET: Login/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ASSET aSSET = db.ASSETs.Find(id);
            if (aSSET == null)
            {
                return HttpNotFound();
            }
            return View(aSSET);
        }

        // POST: Login/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ASSET aSSET = db.ASSETs.Find(id);
            db.ASSETs.Remove(aSSET);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
