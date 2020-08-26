$(function () {
    obtenerVehiculos();
});


function obtenerVehiculos() {
    var urlMetodo = '/Vehiculos/ReporteVehiculoxcliente'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#divClientesVehiculosCRUD").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    template: "#= nombre_cliente # #= apellido1 # #= apellido2 #",
                    title: 'Nombre'
                },
                {
                    field: 'nombre_marca',
                    title: 'Marca'
                },
                {
                    field: 'nombre_modelo',
                    title: 'Modelo'
                },
                {
                    field: 'placa',
                    title: 'Placa'
                },
                {
                   
                    title: 'Eliminar',
                    template: function (dataItem) {
                        return "<a href='/Vehiculos/EliminaVehiculoxClienteID?id_vehiculo_cliente=" + dataItem.id_vehiculo_cliente + "'>Eliminar</a>"
                    }
                },

            ],
        filterable: true,
        groupable: true
    });
}