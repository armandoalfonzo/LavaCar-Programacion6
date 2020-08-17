using LavaCarProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LavaCarProject.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            bool sesionIniciada =false;
            if (Session["logueado"] != null)
            {
                sesionIniciada = (bool)Session["logueado"];
            }
            if (sesionIniciada)
            {
                RetornaUsuarioCorreoPwd_Result modelo = (RetornaUsuarioCorreoPwd_Result)Session["datosUsuario"];
                return View(modelo);
            }
            return RedirectToAction("login", "usuario");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}