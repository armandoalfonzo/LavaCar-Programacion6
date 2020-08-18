using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LavaCarProject.Models;

namespace LavaCarProject.Controllers
{
    public class ClienteController : Controller
    {

        LavaCarEntities modeloBD = new LavaCarEntities();
        // GET: Cliente
        public ActionResult Cliente()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RetornaClientes()
        {
            List<sp_RetornaCliente_Result> clientes =
                this.modeloBD.sp_RetornaCliente("", "", "", null, null, null, null, "", null, "").ToList();
            return Json(new
            {
                resultado = clientes
                
            });
        }
        public ActionResult NuevoCliente()
        {
            this.RetornaProvincias();
            return View();
        }

        public ActionResult RetornaProvincias()
        {
            List<sp_RetornaProvincias_Result> provincias =
                this.modeloBD.sp_RetornaProvincias(null).ToList();
            return Json(provincias);
        }

        public ActionResult RetornaCantones(int id_provincia)
        {
            List<RetornaCantones_Result> cantones =
               this.modeloBD.RetornaCantones(null, id_provincia).ToList();
            return Json(cantones);
        }

        public ActionResult RetornaDistritos(int id_canton)
        {
            List<sp_RetornaDistritos_Result> distritos = this.modeloBD.sp_RetornaDistritos(null, id_canton).ToList();
            return Json(distritos);
        }



        [HttpPost]

        public ActionResult NuevoCliente(string pnombre, string papelli1,string papelli2, int pcedula, int pidprovincia,
            int pidcanton, int pid_distrito, string pdireccion, int ptelefono, string pemail)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_InsertaNuevoCliente(
                    pnombre,
                    papelli1,
                    papelli2,
                    pcedula,
                    pidprovincia,
                    pidcanton,
                    pid_distrito,
                    pdireccion,
                    ptelefono,
                    pemail);
            }
            catch (Exception error)
            {
                resultado = "Ocurrió un error " + error;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    resultado = "Dato insertado";
                }
                else
                {
                    resultado += "No se pudo insertar, verifique";
                }
            }
            this.RetornaProvincias();
            return Json(new { respuesta = resultado }
                );
        }


    }
}
