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
    using System.Collections.Generic;
    
    public partial class factura_detalle
    {
        public int id_detalle_factura { get; set; }
        public int id_factura_encabezado { get; set; }
        public int id_servicio { get; set; }
        public int cantidad { get; set; }
        public double precio_servicio { get; set; }
    
        public virtual factura_encabezado factura_encabezado { get; set; }
        public virtual tipo_servicio tipo_servicio { get; set; }
    }
}