//------------------------------------------------------------------------------

//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.

//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.

// </auto-generated>
//------------------------------------------------------------------------------

namespace LavaCarProject.Models
{
    using System;
    
    public partial class Retorna_Cierres_Caja_Result
    {
        public int id_caja { get; set; }
        public System.DateTime hora_apertura { get; set; }
        public Nullable<System.DateTime> hora_cierre { get; set; }
        public double monto_apertura { get; set; }
        public Nullable<double> monto_cierre_total { get; set; }
        public int id_usuario_apertura { get; set; }
        public Nullable<int> id_usuario_cierre { get; set; }
    }
}
