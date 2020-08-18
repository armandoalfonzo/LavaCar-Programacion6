using LavaCarProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LavaCarProject.Models;
using System.Data.SqlTypes;

namespace LavaCarProject.Controllers
{
    public class VehiculosController : Controller
    {
        LavaCarEntities modeloBD = new LavaCarEntities();
        // GET: Vehiculos
        public ActionResult Vehiculos()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RetornaVehiculos()
        {
            List<sp_RetornaVehiculo_Result> vehiculos = this.modeloBD.sp_RetornaVehiculo(null).ToList();
            return Json(new
            {
                resultado = vehiculos
            });
        }
        [HttpPost]
        public ActionResult RetornaMarcas()
        {
            List<sp_RetornaListaMarca_Result> marcasvehiculos = this.modeloBD.sp_RetornaListaMarca(null,"",null).ToList();
            return Json(marcasvehiculos);
        }

        [HttpPost]
        public ActionResult RetornaModelos(int id_marca)
        {
            List<sp_RetornaModelo_Result> modelosvehiculos = this.modeloBD.sp_RetornaModelo("", null, id_marca).ToList();
            return Json(modelosvehiculos);
        }

        [HttpPost]
        public ActionResult RetornaTiposVehículo()
        {
            List<sp_RetornaTipoVehiculo_Result> tipovehiculo = this.modeloBD.sp_RetornaTipoVehiculo( null, "").ToList();
            return Json(tipovehiculo);
        }

        [HttpPost]
        public ActionResult InsertaNuevoVehículo(int pplaca, int pid_marca,int pid_tipo_vehiculo, int pid_modelo_vehiculo,
           short pcantidad_puertas,short pcantidad_ruedas, DateTime panio_fabricacion, int pid_fabricante_vehiculo)
        {
            int reg_afectados = 0;
            string mensaje = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Inserta_Vehiculo
                    (
                                    pplaca,
                                    pid_marca,
                                    pid_fabricante_vehiculo,
                                    pid_tipo_vehiculo,
                                    pid_modelo_vehiculo,
                                    pcantidad_puertas,
                                    pcantidad_ruedas,
                                    panio_fabricacion
                                    
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
                    mensaje = "Registro insertado";
                }
                else
                {
                    mensaje = "No se pudo insertar, verifique";
                }

            }
                return Json(new { resultado = mensaje }
                    );
        }
    }
}