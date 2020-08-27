using LavaCarProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LavaCarProject.ViewModels
{
    public class CrearFacturaViewModel
    {
        public int id_cliente { get; set; }
        public int id_vehiculo{ get; set; }
        public List<FacturaDetalle> Detalles { get; set; }

        public List<sp_retorna_TODOS_tiposervicios_Result> Servicios { get; set; }
    }
}