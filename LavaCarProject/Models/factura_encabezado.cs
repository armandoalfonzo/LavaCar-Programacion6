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
    using System.Collections.Generic;
    
    public partial class factura_encabezado
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public factura_encabezado()
        {
            this.factura_detalle = new HashSet<factura_detalle>();
        }
    
        public int id_factura { get; set; }
        public System.DateTime fecha_factura { get; set; }
        public int id_cliente_factura { get; set; }
        public int vehiculo_id { get; set; }
        public Nullable<double> total_pagar { get; set; }
        public Nullable<double> total_sin_iv { get; set; }
        public bool estado_factura { get; set; }
    
        public virtual cliente cliente { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<factura_detalle> factura_detalle { get; set; }
        public virtual vehiculo vehiculo { get; set; }
    }
}