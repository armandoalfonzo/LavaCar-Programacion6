using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LavaCarProject.Models;

namespace LavaCarProject.ViewModels
{
    public class Asignar_Vehiculos_ViewModel
    {
        public List<sp_RetornaCliente_Result> Clientes { get; set; }
        public int placa { get; set; }
        public int id_cliente { get; set; }
        public int id_vehiculo { get; set; }
    }
}