//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LavaCarProject.Models
{
    using System;
    
    public partial class sp_RetornaFacturas_Result
    {
        public int id_cliente { get; set; }
        public string nombre_cliente { get; set; }
        public string apellido1 { get; set; }
        public int cedula { get; set; }
        public int placa { get; set; }
        public Nullable<double> total_sin_iv { get; set; }
        public Nullable<double> total_pagar { get; set; }
        public System.DateTime fecha_factura { get; set; }
        public bool estado_factura { get; set; }
        public int id_factura { get; set; }
    }
}