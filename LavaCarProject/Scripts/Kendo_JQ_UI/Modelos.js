$(function () {
    obtenerModelos();
    MostrarDialog();
});



function obtenerModelos() {
    var urlMetodo = '/Modelos/RetonaModelos'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#divModelos").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    field: 'nombre_marca',
                    title: 'Nombre marca'
                },
                {
                    field: 'nombre_modelo',
                    title: 'Modelo'
                },
                {
                    field: 'nombre_fabricante',
                    title: 'Fabricante'
                },
                
            ],
        filterable: true
    });
}

function MostrarDialog() {

    crearDialog();
    $("#btMostrarDialog").click(function () {
        $("#divInsertar").dialog("open");
    });

    $("#btninsertar").click(function () {
        $("#divInsertar").dialog("close");
    });
}

function crearDialog() {
    $("#divInsertar").dialog({
        autoOpen: false,
        height: 650,
        widht: 750,
        modal: true,
        tittle: "Mensaje de confirmación",
        resizable: false,
        close: function (event, ui) { $('#wrap').show(); },
        open: function (event, ui) {
            $('.ui-widget-overlay').bind('click', function () {
                $("#divInsertar").dialog('close');
            });
        }
    });
}