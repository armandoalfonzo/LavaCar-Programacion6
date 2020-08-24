using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LavaCarProject.Controllers
{
    public class ImagenesController : Controller
    {
        // GET: Imagenes
        public ActionResult Carusel()
        {
            return View();
        }
    }
}