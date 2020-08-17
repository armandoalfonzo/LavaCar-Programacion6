$(function () {
    obtenerRegistrosPersonas();
});


function obtenerRegistrosPersonas() {

    var urlMetodo = '/Personas/Pais'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#divKendoGridPais").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 2
        },
        pageable: true,
        columns:
            [
                {
                    field: 'id_pais',
                    title: 'Identificador de País'
                },
                {
                    field: 'nombre_pais',
                    title: 'Nombre del País'

            ]

    });
}