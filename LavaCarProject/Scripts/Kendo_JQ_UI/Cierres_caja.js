$(function () {
    obtenerClientes();
});

function obtenerClientes() {
    var urlMetodo = '/Caja/ReporteCierres'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#cierreskendo").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    field: "id_caja",
                    title: 'Número de caja'
                },
                {
                    field: 'hora_apertura',
                    title: 'Hora de Apertura',
                    type: 'date', format: '{0: dd-MM-yyyy HH:mm:ss}'
                },
                {
                    field: 'hora_cierre',
                    title: 'Hora de cierre',
                    type: 'date', format: '{0: dd-MM-yyyy HH:mm:ss}'
                },
                {
                    field: 'monto_apertura',
                    title: 'Monto de cierre'
                },
                {
                    field: 'monto_cierre_total',
                    title: 'Monto de cierre'
                },
                {
                    field: 'nombre_usuario_apertura',
                    title: 'Usuario apertura'
                   
                },
                {
                    field: 'nobre_usuario_cierre',
                    title: 'Usuario cierre'
                },
               
            ],
        filterable: true,
        groupable: true
    });
}