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
    $("#divClientesVehiculos").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    field: "#= nombre_cliente # #= apellido1 # #= apellido2 #",
                    title: 'Nombre'
                },
                {
                    field: 'nombre_marca',
                    title: 'Modelo'
                },
                {
                    field: 'nombre_modelo',
                    title: 'Placa'
                },
                {
                    field: 'placa',
                    title: 'Tipo de Vehículo'
                },

            ],
        filterable: true
    });
}