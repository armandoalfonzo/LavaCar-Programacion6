$(function () {
    Validaciones()
    obtenerRegistrosPersonas();
    MostrarDialog();
    creareventos();
});


function obtenerRegistrosPersonas() {

    var urlMetodo = '/Pais/RetornaPais'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#divKendoGridPais").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    field: 'id_pais', width: "200px",
                    title: 'Identificador de País'
                },
                {
                    field: 'nombre_pais', width: "200px",
                    title: 'Nombre del País'
                },
                {
                    title: "Modificar",
                    template: function (dataItem) {
                        return "<a href='/Pais/ModificaPais?id_Pais=" + dataItem.id_pais + "'>Modificar</a>"
                    }
                },
                {
                    title: "Eliminar",
                    template: function (dataItem) {
                        return "<a href='/Pais/EliminaPais?id_Pais=" + dataItem.id_pais + "'>Eliminar</a>"
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

function creareventos() {
    $("#btninsertarpais").on("click", function () {
        var formulario = $("#fmrnuevoPais");
        
        if (formulario.valid()) {

            InsertanuevoPais();
            $("#divInsertar").dialog("close");
        }
    });
}
function InsertanuevoPais(){
    var urlMetodo = '/Pais/InsertaPais'
    var parametros = {
        pnombrepais: $("#pais").val()
    };
    var funcion = procesarInsert;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function procesarInsert(data) {
    var resultadoFuncion = data.resultado;
    alert(resultadoFuncion);
    location.reload();
}
function Validaciones() {
    $("#fmrnuevoPais").validate({
        rules: {
            pais: {
                required: true,
                maxlength: 50
            }
        }
    });
}