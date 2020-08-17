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
            List<sp_RetornaPais_Result> modelovista = new List<sp_RetornaPais_Result>();
            modelovista = this.modeloBD.sp_RetornaPais("").ToList();
            return View(modelovista);
        }

        public ActionResult ModificaPais(int id_pais)
        {
            sp_RetornaPais_ID_Result modelovista = new sp_RetornaPais_ID_Result();
            modelovista = this.modeloBD.sp_RetornaPais_ID(id_pais).FirstOrDefault();
            return View(modelovista);
        }

        [HttpPost]

        public ActionResult ModificaPais(sp_RetornaPais_Result modelovista)
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

                    resultado = "Registro eliminado";
                else
                    resultado = "No se pudo eliminar, verifique";
            }
            Response.Write("<script language = javascript>alert('" + resultado + "');</script>");
            return View(modelovista);
        }

    }
}