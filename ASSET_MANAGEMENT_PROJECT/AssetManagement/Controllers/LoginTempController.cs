﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using AssetManagement.Models;
using System.Web.Mvc;
using System.IO;
using SRVTextToImage;

namespace AssetManagement.Controllers
{
    public class LoginTempController : Controller
    {
        private ASSET_MANAGEMENTEntities db = new ASSET_MANAGEMENTEntities();
       
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult LoginV1()
        {
            return View();
        }

        // This action for get Captcha Image
        [HttpGet]
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")] // This is for output cache false
        public FileResult GetCaptchaImage()
        {
            CaptchaRandomImage CI = new CaptchaRandomImage();
            this.Session["CaptchaImageText"] = CI.GetRandomString(5); // here 5 means I want to get 5 char long captcha
            //CI.GenerateImage(this.Session["CaptchaImageText"].ToString(), 300, 75);
            // Or We can use another one for get custom color Captcha Image 
            CI.GenerateImage(this.Session["CaptchaImageText"].ToString(), 300, 75, Color.DarkGray, Color.White);
            MemoryStream stream = new MemoryStream();
            CI.Image.Save(stream, ImageFormat.Png);
            stream.Seek(0, SeekOrigin.Begin);
            return new FileStreamResult(stream, "image/png");
        }

    }
}
