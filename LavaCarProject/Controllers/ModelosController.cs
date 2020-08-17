using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LavaCarProject.Models;

namespace LavaCarProject.Controllers
{
    public class ModelosController : Controller
    {

        LavaCarEntities modeloBD = new LavaCarEntities();
        // GET: Modelos
        public ActionResult Modelos()
        {

            return View();
           
        }

        [HttpPost]
        public ActionResult RetonaModelos()
        {
            List<sp_RetornaModelo_Result> modelos =
                this.modeloBD.sp_RetornaModelo("", null, null).ToList();
            return Json(new
            {
                resultado = modelos
            });
        }
    }
}