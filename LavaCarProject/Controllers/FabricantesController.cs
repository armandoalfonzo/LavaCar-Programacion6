using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LavaCarProject.Models;
using Microsoft.Ajax.Utilities;

namespace LavaCarProject.Controllers
{
    public class FabricantesController : Controller
    {
        LavaCarEntities modeloBD = new LavaCarEntities();
        // GET: Fabricantes
        public ActionResult Fabricantes()
        {
            
            return View();
        }

        [HttpPost]

        public ActionResult RetornaFabricantes()
        {
            List<sp_RetornaFabricantes_Result> fabricantes = this.modeloBD.sp_RetornaFabricantes(null, "", null).ToList();
            return Json(new
            {
                resultado = fabricantes
            });
        }

        [HttpPost]
        public ActionResult RetornaPais()
        {
            List<sp_RetornaPais_Result> pais = this.modeloBD.sp_RetornaPais("").ToList();
            return Json(new
            {
                resultado = pais
            });
        }
        [HttpPost]
        public ActionResult InsertaFabricante(string pfabricante, int pid_pais)
        {
            int reg_afectados = 0;
            string mensaje = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Inserta_Fabricante(
                    pfabricante,
                    pid_pais
                   );
            }
            catch (Exception error)
            {

                mensaje = "Hubo un error " + error;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    mensaje = "Registro agregado";
                }
                else
                {
                    mensaje = "No se pudo insertar, verifique";
                }
            }

            return Json(new
            {
                resultado = mensaje
            });
        }

        public ActionResult ModificaFabricantes(int id_fabricante)
        {
            sp_RetornaFabricante_ID_Result modelovista = new sp_RetornaFabricante_ID_Result();
            modelovista = this.modeloBD.sp_RetornaFabricante_ID(id_fabricante).FirstOrDefault();
            return View (modelovista);
        }

        public void AgregaPais()
        {
            this.ViewBag.Listapais = this.modeloBD.sp_RetornaPais("").ToList();
        }

        [HttpPost]

        public ActionResult ModificarFabricantes(sp_RetornaFabricante_ID_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Modifica_Fabricante(
                    modelovista.id_fabricante,
                    modelovista.nombre_fabricante,
                    modelovista.id_pais);
            }
            catch (Exception error)
            {
                resultado = "Ocurrió un error " + error.Message;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    resultado = "Registro Modificado";
                }
                else
                {
                    resultado += "No se pudo modificar, verifique";
                }
            }
            Response.Write("<script language = javascript>alert('" + resultado + "');</script>");
            this.AgregaPais();
            return View();
        }

    }
}