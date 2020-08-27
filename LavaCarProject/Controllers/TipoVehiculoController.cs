using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;
using LavaCarProject.Models;
namespace LavaCarProject.Controllers
{
    public class TipoVehiculoController : Controller
    {
        LavaCarEntities modeloBD = new LavaCarEntities();
        // GET: TipoVehiculo
        public ActionResult TipoVehiculo()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ListaTipoVehiculo()
        {

            List<sp_RetornaTipoVehiculo_Result> tipovehiculo =
                this.modeloBD.sp_RetornaTipoVehiculo(null, "").ToList();
            return Json(new
            {
                resultado = tipovehiculo
            });
        }

        [HttpPost]

        public ActionResult InsertaTipoVehiculo (string pnombretipovh)
        {
            int reg_afectados = 0;
            string mensaje = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Inserta_TipoVehiculo
                    (pnombretipovh);
            }
            catch (Exception error)
            {

                mensaje = "Hubo un error al insertar " + error;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    mensaje = "Servicio insertado";
                }
                else
                {
                    mensaje += "No se pudo insertar, verifique";
                }
            }
            return Json(
                new
                {
                    resultado = mensaje
                });
        }

        public ActionResult ModificaTipoVehículo (int id_tipo_vehiculo)
        {
            sp_RetornaTipoVehiculo_ID_Result modelovista = this.modeloBD.sp_RetornaTipoVehiculo_ID
                (id_tipo_vehiculo).FirstOrDefault();
            return View(modelovista);
        }
        [HttpPost]
         public ActionResult ModificaTipoVehículo (sp_RetornaTipoVehiculo_ID_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Modifica_TipoVehiculo(modelovista.nombre_vehiculo,
                    modelovista.id_tipo_vehiculo);
            }
            catch (Exception error)
            {

                resultado = "Hubo un error al modificar" + error;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    resultado = "Registro modificado";
                }
                else
                {
                    resultado += "No se pudo modificar, verifique.";
                }
            }
            Response.Write("<script language = javascript>alert('" + resultado + "');</script>");
            return View(modelovista);
        }

        public ActionResult EliminaTipoVehiculo(int id_tipo_vehiculo)
        {
            sp_RetornaTipoVehiculo_ID_Result modelovista = this.modeloBD.sp_RetornaTipoVehiculo_ID
                (id_tipo_vehiculo).FirstOrDefault();
            return View(modelovista);
        }
        [HttpPost]
        public ActionResult EliminaTipoVehiculo(sp_RetornaTipoVehiculo_ID_Result modelovista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Elimina_TipoVehiculo
                    (modelovista.id_tipo_vehiculo
                   );
            }
            catch (Exception error)
            {

                resultado = "Hubo un error al eliminar" + error;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    resultado = "Registro eliminado";
                }
                else
                {
                    resultado += "No se pudo eliminar, verifique.";
                }
            }
            Response.Write("<script language = javascript>alert('" + resultado + "');</script>");
            return View(modelovista);
        }
    }
}