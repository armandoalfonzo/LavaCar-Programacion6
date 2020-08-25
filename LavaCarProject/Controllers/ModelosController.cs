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

        [HttpPost]
        public ActionResult InsertaModelo(string pnombremodelo, int pmarcaid)
        {
            int reg_afectados = 0;
            string mensaje = "";

            try
            {
                reg_afectados = this.modeloBD.InsertaNuevoModelo(
                    pnombremodelo, pmarcaid);
            }
            catch (Exception error)
            {
                mensaje = "Hubo un error " + error;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    mensaje = "Registro insertado";
                }
                else
                {
                    mensaje += "No se pudo insertar, verifique";
                }
            }

            return Json(new { resultado = mensaje }
                      );
        }

        public ActionResult ModificaModelo (int id_modelo)
        {
            sp_RetornaModelo_ID_Result modelovista =  new sp_RetornaModelo_ID_Result();
            modelovista = this.modeloBD.sp_RetornaModelo_ID(id_modelo).FirstOrDefault();
            return View(modelovista);
        }

        [HttpPost]
        public ActionResult ModificaModelo (sp_RetornaModelo_ID_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_ModificaModelo(
                    modelovista.id_modelo, 
                    modelovista.nombre_modelo,
                    modelovista.id_marca_modelo);
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

            return View(modelovista);
        }

        public ActionResult EliminaModelo(int id_modelo)
        {
            sp_RetornaModelo_ID_Result modelovista = new sp_RetornaModelo_ID_Result();
            modelovista = this.modeloBD.sp_RetornaModelo_ID(id_modelo).FirstOrDefault();
            return View(modelovista);
        }
        [HttpPost]

        public ActionResult EliminaModelo(sp_RetornaModelo_ID_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Elimina_Modelo(
                    modelovista.id_modelo);
            }
            catch (Exception error)
            {
                resultado = "Ocurrió un error " + error.Message;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    resultado = "Registro Eliminado";
                }
                else
                {
                    resultado += "No se pudo eliminar, verifique";
                }
            }
            Response.Write("<script language = javascript>alert('" + resultado + "');</script>");
            return View(modelovista);

        }

        [HttpPost]
        public ActionResult RetornaMarcas()
        {
            List<sp_RetornaListaMarca_Result> marcasvehiculos = this.modeloBD.sp_RetornaListaMarca(null, "", null).ToList();
            return Json(marcasvehiculos);
        }

    }
}