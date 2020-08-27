$(function () {
    //funcionparakendo();

});

function funcionparakendo() {

    var urlMetodo = '/Vehiculos/RetornaVehiculosLibres'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#divVehiculosLibres").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    field: 'placa', width: "200px",
                    title: 'Placa'
                },
                {
                    field: 'nombre_marca', width: "200px",
                    title: 'Marca'
                },
                {
                    field: 'nombre_modelo', width: "200px",
                    title: 'Modelo'
                },
                {
                    field: 'nombre_vehiculo', width: "200px",
                    title: 'Tipo de Vehículo'
                },
                {
                    field: 'año_fabricacion', width: '200px',
                    title: 'Año',
                    type: 'date', format :'{0:yyyy}'
                },
                {
                    title: "Asignar",
                    template: function (dataItem) {
                        return "<a href='/Vehiculos/AsignarVehiculos?id_vehiculo=" + dataItem.id_vehiculo + "?pplaca="+ dataItem.placa + "'>Asignar</a>"
                    }
                }
                
            ],
        filterable: true
    });
}