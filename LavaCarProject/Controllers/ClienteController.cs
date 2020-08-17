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

        public ActionResult NuevoCliente(sp_RetornaCliente_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_InsertaNuevoCliente(
                    modelovista.nombre_cliente,
                    modelovista.apellido1,
                    modelovista.apellido2,
                    modelovista.cedula,
                    modelovista.id_provincia,
                    modelovista.id_canton,
                    modelovista.id_distrito,
                    modelovista.direccion,
                    modelovista.telefono,
                    modelovista.email);
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
            Response.Write("<script language = javascript>alert('" + resultado + "');</script>");
            this.RetornaProvincias();
            return View();
        }


    }
}
