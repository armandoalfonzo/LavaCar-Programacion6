using LavaCarProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LavaCarProject.Controllers
{
    public class UsuarioController : Controller
    {
        LavaCarEntities model = new LavaCarEntities();
        // GET: Usuario
        public ActionResult LogIn()
        {
            return View();
        }

        public ActionResult LogOut()
        {
            this.Session.Add("logueado", null);
            this.Session.Add("datosUsuario", null);
            return RedirectToAction("LogIn", "Usuario");
        }

        [HttpPost]
        public ActionResult VerificarLogin ( RetornaUsuarioCorreoPwd_Result pModelo)
        {
            RetornaUsuarioCorreoPwd_Result usuarioBuscar = model.RetornaUsuarioCorreoPwd(pModelo.correo_usuario, pModelo.contraseña).FirstOrDefault();
            if(usuarioBuscar == null )
            {
                ModelState.AddModelError("", "Usuario o contraseña invalidos. por favor Verifique");
                return View("LogIn");
            }
            else
            {
                this.Session.Add("logueado", true);
                this.Session.Add("datosUsuario", usuarioBuscar);
                return RedirectToAction("Index", "Home");
            }
        }
    }
}