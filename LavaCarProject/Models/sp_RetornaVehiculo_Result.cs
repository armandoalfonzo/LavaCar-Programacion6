//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LavaCarProject.Models
{
    using System;
    
    public partial class sp_RetornaVehiculo_Result
    {
        public int id_vehiculo { get; set; }
        public int placa { get; set; }
        public int id_marca { get; set; }
        public string nombre_marca { get; set; }
        public int id_tipo_vehiculo { get; set; }
        public string nombre_vehiculo { get; set; }
        public int id_modelo_vehiculo { get; set; }
        public string nombre_modelo { get; set; }
        public short cantidad_puertas { get; set; }
        public short cantidad_ruedas { get; set; }
        public System.DateTime año_fabricacion { get; set; }
        public int id_fabricante_vehiculo { get; set; }
        public string nombre_fabricante { get; set; }
    }
}