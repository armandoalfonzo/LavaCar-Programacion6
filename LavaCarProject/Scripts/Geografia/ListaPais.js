﻿$(function () {
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
                    //title: "Company",
                    //template: "#= nombre_cliente # #= apellido1 # #= apellido2 #",
                    
                }
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

function creareventos() {
    $("#btninsertar").on("click", function () {
        var formulario = $("fmrnuevoPais");
        InsertanuevoPais();
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