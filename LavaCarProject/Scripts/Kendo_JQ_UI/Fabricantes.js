$(function () {
    obtenerRegistrosFabricantes();
    MostrarDialog();
    cargaDropdownListPais();
    creareventos();
    creaGridKendo();
});

function obtenerRegistrosFabricantes() {

    var urlMetodo = '/Fabricantes/RetornaFabricantes'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function creaGridKendo(data) {
    $("#divKendoGridFabricante").kendoGrid({
            dataSource: {
                data: data.resultado,
                pageSize: 10
            },
            pageable: true,
        columns:
            [
                {
                    field: 'id_fabricante', width: "200px",
                    title: 'ID'
                },
                {
                    field: 'nombre_fabricante', width: "200px",
                    title: 'Nombre del Fabricante'
                },
                {
                    field: 'nombre_pais', width: "200px",
                    title: 'Nombre del País'
                },
                {
                    title: "Modificar",
                    template: function (dataItem) {
                        return "<a href='/Fabricantes/ModificaFabricantes?id_fabricante=" + dataItem.id_fabricante + "'>Modificar</a>"
                    }
                },
                {
                    title: "Eliminar",
                    template: function (dataItem) {
                        return "<a href='/Fabricantes/EliminarFabricante?id_fabricante=" + dataItem.id_fabricante + "'>Modificar</a>"
                    }
                }
            ],
        filterable : true
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

function cargaDropdownListPais() {
    var urlMetodo = '/Fabricantes/RetornaPais'
    var parametros = {};
    var funcion = procesarResultadoPais;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function procesarResultadoPais(data) {

    var ddlpais = $("#pais");
    ddlpais.empty();
    var nuevaOpcion = "<option value ''>Seleccione un País</option>";
    ddlpais.append(nuevaOpcion);

    $(data).each(function () {

        var paisActual = this;
        nuevaOpcion = "<option value ='" + paisActual.id_pais + "'>" + paisActual.nombre_pais + "</option>";
        ddlpais.append(nuevaOpcion);
    });
}

function creareventos() {
    $("#btninsertar").on("click", function () {
        var formulario = $("fmrnuevoFabri");
        InsertanuevoFabricante();
    });
}
function InsertanuevoFabricante() {
    var urlMetodo = '/Fabricantes/InsertaFabricante'
    var parametros = {
        pfabricante: $("#nomfabricante").val(),
        pid_pais: $("#pais").val()
    };
    var funcion = procesarInsert;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function procesarInsert(data) {
    var resultadoFuncion = data.resultado;
    alert(resultadoFuncion);
    location.reload();
}