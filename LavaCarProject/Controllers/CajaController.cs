using LavaCarProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace LavaCarProject.Controllers
{
    public class CajaController : Controller
    {
        #region Propiedades

        LavaCarEntities modeloBD = new LavaCarEntities();

        #endregion

        #region GETS
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// obtiene los parametros desde la base de datos
        /// </summary>
        /// <returns>returna un modelo de tipo sp_retorna_parametro_Result</returns>
        public ActionResult Parametros()
        {
            sp_retorna_parametro_Result fabricantes =
               this.modeloBD.sp_retorna_parametro().FirstOrDefault();
            return View(fabricantes);
        }

        /// <summary>
        /// obtiene las facturas desde la base de datos
        /// </summary>
        /// <returns>returna un modelo de tipo List<sp_retorna_parametro_Result></returns>
        public ActionResult Facturas()
        {
            sp_retorna_parametro_Result fabricantes =
               this.modeloBD.sp_retorna_parametro().FirstOrDefault();
            return View(fabricantes);
        }
        #endregion

        #region POSTS
        /// <summary>
        /// Se encarga de insertar los parametros una vez validados
        /// </summary>
        /// <param name="model">recibe un modelo de tipo sp_retorna_parametro_Result</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ParametrosInsert(sp_retorna_parametro_Result model)
        {
            int reg_afectados = 0;
            string mensaje = "";

            try
            {
                reg_afectados = this.modeloBD.sp_Inserta_parametro(
                    model.nombre, model.correo_apertura, model.correo_cierre, model.monto_minimo
                   );
            }
            catch (Exception error)
            {

                mensaje = "Hubo un error " + error;
            }
            finally
            {
                if (reg_afectados <= 0)
                {
                    mensaje = "No se pudo insertar, verifique";
                    ViewData["ErrorMessage"] = mensaje;
                }
            }

            return RedirectToAction("Parametros");
        }

        /// <summary>
        /// Se encarga de Actualizar los parametros una vez validados
        /// </summary>
        /// <param name="model">recibe un modelo de tipo sp_retorna_parametro_Result</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ParametrosUpdate(sp_retorna_parametro_Result model)
        {
            int reg_afectados = 0;
            string mensaje = "";

            try
            {
                reg_afectados = this.modeloBD.sp_update_parametro(
                    model.nombre, model.correo_apertura, model.correo_cierre, model.monto_minimo
                   );
            }
            catch (Exception error)
            {

                mensaje = "Hubo un error " + error;
            }
            finally
            {
                if (reg_afectados <= 0)
                {
                    mensaje = "No se pudo Actualizar, verifique";
                    ViewBag.Error = mensaje;
                }
            }

            return RedirectToAction("Parametros");
        }

        /// <summary>
        /// Se encarga de la apertura de la caja chica una vez calidada
        /// </summary>
        /// <param name="montoApertura">recibe int que sera el monto de apertura de caja</param>
        /// <returns>returna un mensaje que nos dira si se pudo o no abrir la caja</returns>
        [HttpPost]
        public ActionResult AbrirCaja(int montoApertura)
        {
            int reg_afectados = 0;
            string mensaje = "";
            RetornaUsuarioCorreoPwd_Result usuarioBuscar = (RetornaUsuarioCorreoPwd_Result)Session["datosUsuario"];

            try
            {
                sp_retorna_parametro_Result parametros =
               this.modeloBD.sp_retorna_parametro().FirstOrDefault();
                if (parametros != null && parametros.monto_minimo > 0)
                {
                    if (parametros.monto_minimo <= montoApertura)
                    {
                        if (modeloBD.sp_Retorna_Fecha_Apertura().FirstOrDefault()?.ToString("M/d/yyyy") != DateTime.Now.ToString("M/d/yyyy"))
                        {
                            reg_afectados = this.modeloBD.sp_AperturaCaja(montoApertura, usuarioBuscar.id_Usuario);
                            if (reg_afectados > 0)
                            {
                                mensaje = "La caja se abrio exitosamente";
                                if (EnviarCorreo(parametros.correo_apertura, "Apertura Caja", $"la caja fue abierta con el monto de {montoApertura}"))
                                {
                                    mensaje += "\n se envio un correo con los detalles";
                                }
                                else
                                {
                                    mensaje += "\n no se pudo enviar el correo";
                                }
                            }
                            else
                            {
                                mensaje = "No se pudo Abrir la caja";
                            }
                        }
                        else
                        {
                            mensaje = "La caja ya ha sido abierta el dia de hoy";
                        }
                    }
                    else
                    {
                        mensaje = "El monto de apertura tiene que ser mayor o igual al monto minimo establecido en los parametros";
                    }

                }
                else
                {
                    mensaje = "los Parametros no han sido establecidos";
                }

            }
            catch (Exception error)
            {

                mensaje = "No se pudo Abrir la caja";
            }

            return Json(mensaje);
        }

        #endregion

        #region Metodos Extras
        /// <summary>
        /// Envia un correo Electronico 
        /// </summary>
        /// <param name="para">correo destino donde sera enviado</param>
        /// <param name="asunto">asunto del correo</param>
        /// <param name="mensaje">mensaje del correo</param>
        /// <returns>returna true si lo envio false si no</returns>
        public bool EnviarCorreo(string para, string asunto, string mensaje)
        {
            bool wasSend = false;
            try
            {

                SmtpClient client = new SmtpClient();
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("labtrackingca@gmail.com", "labtrackingpassword");
                MailMessage mm = new MailMessage("labtrackingca@gmail.com", para, asunto, mensaje);
                mm.BodyEncoding = UTF8Encoding.UTF8;
                mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

                client.Send(mm);
                wasSend = true;

            }
            catch (Exception error)
            {
                var x = error;
                wasSend = false;
            }
            return wasSend;
        }
        #endregion

        public ActionResult Cierres()
        {
            return View();
        }

        [HttpPost]

        public ActionResult ReporteCierres()
        {
            List<sp_cierre_cajas_Result> cierres =
                this.modeloBD.sp_cierre_cajas().ToList();
            return Json(
                new { 
                    resultado = cierres
                });
        }
    }

   
}