$(function () {
    obtenerModelos();
    obtenerMarcas()
    MostrarDialog();
    $("#fmrnuevomodelo").validate({
        rules: {
            nombre: {
                required: true,
                maxlength: 50
            },
            txtMarca: {
                required: true
            }
        }
    });
    creareventos();
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
                {
                    title: "Modificar",
                    template: function (dataItem) {
                        return "<a href='/Modelos/ModificaModelo?id_modelo=" + dataItem.id_modelo + "'>Modificar</a>"
                    }
                },
                {
                    title: "Eliminar",
                    template: function (dataItem) {
                        return "<a href='/Modelos/EliminaModelo?id_modelo=" + dataItem.id_modelo + "'>Eliminar</a>"
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

function obtenerMarcas() {
    var urlMetodo = '/Modelos/RetornaMarcas'
    var parametros = {};
    var funcion = crearAutoComplete;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function crearAutoComplete(data) {
    var datosAutoComplete = $.map(data.resultado, function (item) {
        return {
            label: item.nombre_marca,
            id_marca: item.id_marca,
            id_fabricante: item.id_fabricante
        }
    })
    $("#txtmarca").autocomplete({
        source: datosAutoComplete,
        select: function (event, ui) {
            $("#id_marca_select").val(ui.item.id_marca)
            $("#id_fabricante_select").val(ui.item.id_fabricante)
        }

    });
};
function creareventos() {
    $("#btninsertarmodelo").on("click", function () {
        console.log('click');
        var formulario = $("#fmrnuevomodelo");
        formulario.validate();

        if (formulario.valid()) {
            InsertanuevoModelo();
        }
    });
}
function InsertanuevoModelo() {
    var urlMetodo = '/Modelos/InsertaModelo'
    var parametros = {
        pnombremodelo: $("#nombre").val(),
        pmarcaid: $("#id_marca_select").val()
    };
    var funcion = procesarInsert;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function procesarInsert(data) {
    var resultadoFuncion = data.resultado;
    alert(resultadoFuncion);
    location.reload();
}