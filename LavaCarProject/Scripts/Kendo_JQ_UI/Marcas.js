$(function () {
    funcionparakendo();
    MostrarDialog();
    CargaDDLFabricantes();
});


function funcionparakendo() {

    var urlMetodo = '/Vehiculos/RetornaMarcas'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#divKendoMarcas").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    field: 'nombre_marca', width: "200px",
                    title: 'Marca'
                },
                {
                    field: 'nombre_fabricante', width: "200px",
                    title: 'Fabricante'
                },
                {
                    title: "Modificar",
                    template: function (dataItem) {
                        return "<a href='/Cliente/ModificaCliente?id_marca=" + dataItem.id_marca + "'>Modificar</a>"
                    }
                },
                {
                    title: "Eliminar",
                    template: function (dataItem) {
                        return "<a href='/Personas/PersonaElimina?id_marca=" + dataItem.id_marca + "'>Eliminar</a>"
                    }

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

function CargaDDLFabricantes() {

    var urlMetodo = '/Vehiculos/FabricantesListaMarcas'
    var parametros = {};
    var funcion = procesarResultadoFabricantes;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function procesarResultadoFabricantes(data) {

    var ddlmarca = $("#fabricante");
    ddlmarca.empty();
    var nuevaOpcion = "<option value ''>Seleccione un Fabricante</option>";
    ddlmarca.append(nuevaOpcion);

    $(data).each(function () {

        var marcaActual = this;
        nuevaOpcion = "<option value ='" + marcaActual.id_fabricante + "'>" + marcaActual.nombre_fabricante + "</option>";
        ddlmarca.append(nuevaOpcion);
    });
}

function InsertaMarca() {
    var urlMetodo = '/Vehiculos/InsetaMarca'
    var parametros = {
        pnombremarca: $("#nombremarca").val(),
        pid_fabricante: $('#fabricante').val()
    };
    var funcion = procesarInsert;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function procesarInsert(data) {
    var resultadoFuncion = data.resultado;
    alert(resultadoFuncion);
    location.reload();
}