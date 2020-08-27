$(function () {
    Validaciones();
    obtenerVehiculos();
    MostrarDialog();
    creareventos();
});


function obtenerVehiculos() {
    var urlMetodo = '/TipoVehiculo/ListaTipoVehiculo'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function creaGridKendo(data) {
    $("#divKendoGrid").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    field: "id_tipo_vehiculo",
                    title: 'Id Tipo de Vehiculo'
                },
                {
                    field: 'nombre_vehiculo',
                    title: 'Nombre Tipo Vehiculo'
                },
               
                {
                    title: "Modificar",
                    template: function (dataItem) {
                        return "<a href='/TipoVehiculo/ModificaTipoVehículo?id_tipo_vehiculo=" + dataItem.id_tipo_vehiculo + "'>Modificar</a>"
                    }
                },
                {
                    title: "Eliminar",
                    template: function (dataItem) {
                        return "<a href='/TipoVehiculo/EliminaTipoVehiculo?id_tipo_vehiculo=" + dataItem.id_tipo_vehiculo + "'>Eliminar</a>"
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
    $("#btninsertartipovh").on("click", function () {
        var formulario = $("#fmrnuevoTV");

        if (formulario.valid()) {

            InsertanuevoPais();
            $("#divInsertar").dialog("close");
        }
    });
}

function InsertanuevoPais() {
    var urlMetodo = '/TipoVehiculo/InsertaTipoVehiculo'
    var parametros = {
        pnombretipovh: $("#nombre_vehiculo").val()
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
    $("#fmrnuevoTV").validate({
        rules: {
            nombre_vehiculo: {
                required: true,
                maxlength: 50
            }
        }
    });
}
