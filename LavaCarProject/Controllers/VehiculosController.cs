using LavaCarProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlTypes;
using LavaCarProject.ViewModels;

namespace LavaCarProject.Controllers
{
    public class VehiculosController : Controller
    {
        LavaCarEntities modeloBD = new LavaCarEntities();
        // GET: Vehiculos
        public ActionResult Vehiculos()
        {
            List<sp_RetornaVehiculo_Result> vehiculos = this.modeloBD.sp_RetornaVehiculo(null).ToList();
       
            return View(vehiculos);
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

        public ActionResult RetornaMarcasLista()
        {
            return View();
        }

        [HttpPost]
        public ActionResult FabricantesListaMarcas()
        {
            List<sp_RetornaFabricantes_Result> fabricante = this.modeloBD.sp_RetornaFabricantes(null,"", null).ToList();
            return Json(new
            {
                resultado = fabricante
            });
        }
        [HttpPost]
        public ActionResult RetornaMarcas()
        {
            List<sp_RetornaListaMarca_Result> marcasvehiculos = this.modeloBD.sp_RetornaListaMarca(null,"",null).ToList();

            return Json(marcasvehiculos);
            //return Json(new
            //{
            //    resultado = marcasvehiculos
            //});
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

                
                if (this.modeloBD.sp_Veficia_Placa_Existente(pplaca).FirstOrDefault() > 0)
                {
                    mensaje = "Número de placa ya ingresada";
                }
                else
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
                    mensaje += "\n No se pudo insertar, verifique";
                }

            }
                return Json(new { resultado = mensaje }
                    );
        }

        public ActionResult ModificaVehiculo( int id_vehiculo)
        {
            sp_RetornaVehiculo_ID_Result modelovista = new sp_RetornaVehiculo_ID_Result();
            modelovista = this.modeloBD.sp_RetornaVehiculo_ID(id_vehiculo).FirstOrDefault();
            return View (modelovista);
        }


        [HttpPost]

        public ActionResult ModificaVehiculo(sp_RetornaVehiculo_ID_Result modeloVista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Modifica_Vehiculo(
                    modeloVista.id_vehiculo,
                    modeloVista.placa,
                    modeloVista.id_fabricante_vehiculo,
                    modeloVista.id_marca,
                    modeloVista.id_tipo_vehiculo,
                    modeloVista.id_modelo_vehiculo,
                    modeloVista.cantidad_puertas,
                    modeloVista.cantidad_ruedas,
                    modeloVista.año_fabricacion);
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

            return View(modeloVista);
        }
        public ActionResult EliminaVehiculo(int id_vehiculo)
        {
            List<sp_RetornaVehiculo_ID_Result> modeloVista = this.modeloBD.sp_RetornaVehiculo_ID(id_vehiculo).ToList();

            return View(modeloVista);
        }


        [HttpPost]

        public ActionResult EliminaVehiculo(sp_RetornaVehiculo_ID_Result modeloVista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_EliminarVehiculo(
                    modeloVista.id_vehiculo
                    );
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

            return View(modeloVista);
        }


        public ActionResult VehiculosLibres()
        {
            List<sp_Retorna_Vehiculos_sin_Cliente_Result> modeloVista = this.modeloBD.sp_Retorna_Vehiculos_sin_Cliente().ToList();
            return View(modeloVista);
        }

        [HttpPost]
        public ActionResult RetornaVehiculosLibres()
        {
            List<sp_Retorna_Vehiculos_sin_Cliente_Result> Vehlibres = this.modeloBD.sp_Retorna_Vehiculos_sin_Cliente().ToList();
            return Json
                ( new {
                    resultado = Vehlibres
                });
        }
        public ActionResult AsignarVehiculos(int id_vehiculo, int pplaca)
        {
            List<sp_RetornaCliente_Result> asignar = this.modeloBD.sp_RetornaCliente("", "", "", null, null, null, null, "", null, "").ToList();

            Asignar_Vehiculos_ViewModel model = new Asignar_Vehiculos_ViewModel()
            {
                Clientes = asignar,placa = pplaca,id_vehiculo= id_vehiculo
            };

            return View(model);

        }



        [HttpPost]
        public ActionResult AsignarVehiculos(Asignar_Vehiculos_ViewModel model)
        {
            int reg_afectados = 0;
            string resultado = "";
            try
            {
                reg_afectados = this.modeloBD.sp_Inserta_Vehiculos_x_Cliente(
                    model.id_vehiculo, model.id_cliente);
            }
            catch (Exception error)
            {

                resultado = "Ocurrió un error " + error;
            }
            finally
            {
                if (reg_afectados > 0)
                {
                    resultado = "Registro Asignado";
                }
                else
                {
                    resultado  += "No se pudo asignar, verifique";
                }
            }
            
            Response.Write("<script language = javascript>alert('" + resultado + "');</script>");
            return RedirectToAction("VehiculosLibres") ;
        }
        [HttpPost]
        public ActionResult ClientesAsignacion(int id_cliente)
        {
            List<sp_RetornaCliente_ID_Result> asignacion = this.modeloBD.sp_RetornaCliente_ID(id_cliente).ToList();
            return Json(asignacion);
        }

        public ActionResult RetornaVehiculoxcliente()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ReporteVehiculoxcliente()
        {
            List<sp_RetornaVehiculosxCliente_Result> vehiculos_cliente =
                this.modeloBD.sp_RetornaVehiculosxCliente(null, null, null).ToList();
            return Json(new
            {
                resultado = vehiculos_cliente
            });
        }

        [HttpPost]
        public ActionResult ReporteVehiculoxclienteById(int id_cliente)
        {
            List<sp_RetornaVehiculosxClientebyIdCliente_Result> vehiculos_cliente =
                this.modeloBD.sp_RetornaVehiculosxClientebyIdCliente(id_cliente).ToList();
            return Json(new
            {
                resultado = vehiculos_cliente
            });
        }
        public ActionResult EliminaVehiculoxClienteID (int id_vehiculo)
        {
            sp_RetornaVehiculo_ID_Result vhc = new sp_RetornaVehiculo_ID_Result();
               vhc = this.modeloBD.sp_RetornaVehiculo_ID(id_vehiculo).FirstOrDefault();
            return View(vhc);
        }
        [HttpPost]
        public ActionResult EliminaVehiculoxClienteID(sp_RetornaVehiculo_ID_Result vistamodelo)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Elimina_Vehiculos_x_Cliente(
                    vistamodelo.id_vehiculo);
            }
            catch (Exception error)
            {

                resultado = "Hubo un error"+ error;
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
            return View(vistamodelo);
        }
        void Cliente()
        {
            this.ViewBag.Cliente =
                this.modeloBD.sp_RetornaCliente_ID(null).ToList();
        }

        [HttpPost]
        public ActionResult InsetaMarca(string pnombremarca, int pid_fabricante)
        {
            int reg_afectados = 0;
            string mensaje = "";

            try
            {
                reg_afectados = this.modeloBD.sp_InsertaMarca(
                    pnombremarca,
                    pid_fabricante
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
                    mensaje += "No se pudo insertar, verifique";
                }
            }

            return Json(new
            {
                resultado = mensaje
            });
        }
    }
   
}