using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LavaCarProject.ViewModels
{
    public class FacturaDetalle
    {
        public int IdServicio { get; set; }
        public int Cantidad { get; set; }
        public int Precio { get; set; }
    }
}