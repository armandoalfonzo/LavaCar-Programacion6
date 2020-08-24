using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LavaCarProject.Models;
using Microsoft.Win32;

namespace LavaCarProject.Controllers
{
    public class ClienteController : Controller
    {

        LavaCarEntities modeloBD = new LavaCarEntities();
        // GET: Cliente
        public ActionResult Cliente()
        {
            List<sp_RetornaCliente_Result> clientes = this.modeloBD.sp_RetornaCliente("", "", "", null, null, null, null, "", null, "").ToList();
            return View(clientes);
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

        void AgregaProvincia()
        {
            this.ViewBag.ListaProvincias =
                this.modeloBD.sp_RetornaProvincias("").ToList();
        }
        void AgregaCanton()
        {
            this.ViewBag.ListaCantones =
                this.modeloBD.RetornaCantones("",null).ToList();
        }
        void AgregaDistrito()
        {
            this.ViewBag.ListaDistritos =
                this.modeloBD.sp_RetornaDistritos("",null).ToList();
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
                
                if (this.modeloBD.sp_Verifica_Cliente_Existente(pcedula).FirstOrDefault() > 0)
                {
                    resultado = "Número de cédula ya ingresada";
                }
                else
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
                    resultado += "\n No se pudo insertar, verifique";
                }
            }
            this.AgregaProvincia();
            return Json(new { respuesta = resultado }
                );
        }

        public ActionResult EliminarCliente(int id_cliente)
        {
            sp_RetornaCliente_ID_Result modelovista = new sp_RetornaCliente_ID_Result();
            modelovista = this.modeloBD.sp_RetornaCliente_ID(id_cliente).FirstOrDefault();
            this.AgregaProvincia();
            AgregaCanton();
            AgregaDistrito();
            return View(modelovista);
        }
        [HttpPost]

        public ActionResult EliminarCliente(sp_RetornaCliente_ID_Result modeloVista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_EliminaCliente(
                    modeloVista.id_cliente);
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
            this.AgregaProvincia();
            AgregaCanton();
            AgregaDistrito();
            return View(modeloVista);
        }

        public ActionResult ModificaCliente(int id_cliente)
        {
            sp_RetornaCliente_ID_Result modelovista = new sp_RetornaCliente_ID_Result();
            modelovista = this.modeloBD.sp_RetornaCliente_ID(id_cliente).FirstOrDefault();
            this.AgregaProvincia();
            AgregaCanton();
            AgregaDistrito();
            return View(modelovista);
        }
        [HttpPost]

        public ActionResult ModificaCliente(sp_RetornaCliente_ID_Result modeloVista)
        {
            int reg_afectados = 0;
            string resultado = "";

            try
            {
                reg_afectados = this.modeloBD.sp_ModificaCliente(
                    modeloVista.id_cliente,
                    modeloVista.nombre_cliente,
                    modeloVista.apellido1,
                    modeloVista.apellido2,
                    modeloVista.cedula,
                    modeloVista.id_provincia,
                    modeloVista.id_canton,
                    modeloVista.id_distrito,
                    modeloVista.direccion,
                    modeloVista.telefono,
                    modeloVista.email);
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
            this.AgregaProvincia();
            AgregaCanton();
            AgregaDistrito();
            return View(modeloVista);
        }

    }
}
