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
    
    public partial class vehiculos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public vehiculos()
        {
            this.vehiculos_x_cliente = new HashSet<vehiculos_x_cliente>();
        }
    
        public int id_vehiculo { get; set; }
        public int placa { get; set; }
        public int id_marca { get; set; }
        public int id_tipo_vehiculo { get; set; }
        public int id_modelo_vehiculo { get; set; }
        public short cantidad_puertas { get; set; }
        public short cantidad_ruedas { get; set; }
        public System.DateTime año_fabricacion { get; set; }
        public int id_fabricante_vehiculo { get; set; }
    
        public virtual fabricante fabricante { get; set; }
        public virtual tipo_vehiculo tipo_vehiculo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<vehiculos_x_cliente> vehiculos_x_cliente { get; set; }
    }
}