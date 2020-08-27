using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
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
        void RetornaFabricanteslista()
        {
            this.ViewBag.ListaFabricantes =
                this.modeloBD.sp_RetornaFabricantes(null,"",null).ToList();
        }
        void RetornaMarcaslista()
        {
            this.ViewBag.ListaMarcas = 
                this.modeloBD.sp_RetornaListaMarca(null, "", null).ToList();
        }
        public ActionResult ModificaModelo (int id_modelo)
        {
            sp_RetornaModelo_ID_Result modelovista =  new sp_RetornaModelo_ID_Result();
            modelovista = this.modeloBD.sp_RetornaModelo_ID(id_modelo).FirstOrDefault();
            RetornaFabricanteslista();
            RetornaMarcaslista();
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

                resultado = "Ocurrió un error " + error;
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
            RetornaFabricanteslista();
            RetornaMarcaslista();
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
        public ActionResult Marcas()
        {

            return View();

        }

        [HttpPost]
        public ActionResult RetornaMarcas()
        {
            List<sp_RetornaListaMarca_Result> marcasvehiculos = this.modeloBD.sp_RetornaListaMarca(null, "", null).ToList();
            return Json(new
            {
                resultado = marcasvehiculos
            });
        }
        public ActionResult InsertaMarca(string pnombremarca, int pidfabricante)
        {
            int reg_afectados = 0;
            string mensaje = "";
            try
            {
                reg_afectados = this.modeloBD.sp_InsertaMarca(
                    pnombremarca, pidfabricante);
            }
            catch (Exception error)
            {

                mensaje = "Hubo un error" + error;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    mensaje = "Registro insertado";
                }
                else
                {
                    mensaje += "No se pudo insertar, verifique.";
                }
            }
            
            return Json(new { resultado = mensaje }
                     );
        }

        public ActionResult ModificaMarca( int id_marca)
        {
            sp_RetornaMarca_ID_Result modelovista = new sp_RetornaMarca_ID_Result();
            modelovista = this.modeloBD.sp_RetornaMarca_ID(id_marca).FirstOrDefault();
            return View(modelovista);
        }
        [HttpPost]
        public ActionResult ModificaMarca (sp_RetornaMarca_ID_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";
            try
            {
                reg_afectados = this.modeloBD.sp_ModificaMarca(modelovista.id_marca,modelovista.nombre_marca,modelovista.id_fabricante);
            }
            catch (Exception error)
            {

                resultado = "Hubo un error, " + error;
            }
            finally
            {
                if (reg_afectados>0)
                {
                    resultado = "Registro modificado";
                }
                else
                {
                    resultado += "No se pudo modificar, verifique";
                }
            }
            Response.Write("<script language = javascript>alert('" + resultado + "');</script>");

            return View(modelovista);
        }
        public ActionResult EliminaMarca(int id_marca)
        {
            sp_RetornaMarca_ID_Result modelovista = new sp_RetornaMarca_ID_Result();
            modelovista = this.modeloBD.sp_RetornaMarca_ID(id_marca).FirstOrDefault();
            return View(modelovista);
        }
        [HttpPost]
        public ActionResult EliminaMarca (sp_RetornaMarca_ID_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";
            try
            {
                reg_afectados = this.modeloBD.sp_EliminaMarca(modelovista.id_marca);
            }
            catch (Exception error)
            {

                resultado = "Hubo un error " + error;
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
    }
}