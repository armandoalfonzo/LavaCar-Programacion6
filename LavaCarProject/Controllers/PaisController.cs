using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LavaCarProject.Models;

namespace LavaCarProject.Controllers
{
    public class PaisController : Controller
    {

        LavaCarEntities modeloBD = new LavaCarEntities();
        // GET: Pais

 
        public ActionResult Pais()
        {
            return View();
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

        public ActionResult InsertaPais(string pnombrepais)
        {

            int reg_afectados = 0;
            string mensaje = "";

            try
            {
                reg_afectados = this.modeloBD.sp_InsertaPais(
                   pnombrepais);
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
                    mensaje += "No se pudo insertar, verifique";
                }
            }

            return Json(new
            {
                resultado = mensaje
            });
        }

        public ActionResult ModificaPais(int id_pais)
        {
            sp_RetornaPais_ID_Result modelovista = new sp_RetornaPais_ID_Result();
            modelovista = this.modeloBD.sp_RetornaPais_ID(id_pais).FirstOrDefault();
            return View(modelovista);
        }

        [HttpPost]

        public ActionResult ModificaPais(sp_RetornaPais_ID_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_ModificaPais(
                   modelovista.id_pais,
                   modelovista.nombre_pais);
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
            return View (modelovista);
        }

        public ActionResult EliminaPais(int id_pais )
        {
            sp_RetornaPais_ID_Result modelovista = new sp_RetornaPais_ID_Result();
            modelovista = this.modeloBD.sp_RetornaPais_ID(id_pais).FirstOrDefault();
            return View(modelovista);
        }
        [HttpPost]
        public ActionResult EliminaPais(sp_RetornaPais_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";
            try
            {
                reg_afectados = this.modeloBD.sp_EliminaPais(modelovista.id_pais);
            }
            catch (Exception error)
            {
                resultado = "Hubo un error" + error;
            }
            finally
            {
                if (reg_afectados > 0)
                { 
                    resultado = "Registro eliminado";
                }
                else
                { 
                
                resultado += "No se pudo eliminar, verifique";
                }
            }
            Response.Write("<script language = javascript>alert('" + resultado + "');</script>");
            return View(modeloBD);
            //return RedirectToAction("Pais");
        }

    }
}