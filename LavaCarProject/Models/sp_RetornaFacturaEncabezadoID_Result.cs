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
    
    public partial class sp_RetornaFacturaEncabezadoID_Result
    {
        public int id_factura { get; set; }
        public System.DateTime fecha_factura { get; set; }
        public int id_cliente_factura { get; set; }
        public int vehiculo_id { get; set; }
        public Nullable<double> total_pagar { get; set; }
        public Nullable<double> total_sin_iv { get; set; }
        public bool estado_factura { get; set; }
        public int id_detalle_factura { get; set; }
        public int id_factura_encabezado { get; set; }
        public int id_cliente { get; set; }
        public int cedula { get; set; }
        public string nombre_cliente { get; set; }
        public string apellido1 { get; set; }
        public int id_vehiculo_cliente { get; set; }
        public int id_vehiculo { get; set; }
    }
}
