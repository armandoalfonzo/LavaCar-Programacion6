$(function () {
    obtenerClientes();
    MostrarDialog();
});



function obtenerClientes() {
    var urlMetodo = '/Cliente/RetornaClientes'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#divClientes").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    field: 'nombre_cliente',
                    title: 'Nombre'
                },
                {
                    field: 'cedula',
                    title: 'Cédula'
                },
                {
                    field: 'Provincia',
                    title: 'Provincia'
                },
                {
                    field: 'Cantón',
                    title: 'Cantón'
                },
                {
                    field: 'Distrito',
                    title: 'Distrito'
                },
                {
                    field: 'direccion',
                    title: 'Dirección'
                },
                {
                    field: 'telefono',
                    title: 'Teléfono'
                },
                {
                    field: 'email',
                    title: 'Correo Electrónico'
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