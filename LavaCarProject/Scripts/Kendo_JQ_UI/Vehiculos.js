$(function () {
    //obtenerVehiculos();
    MostrarDialog();
    obtenerMarcas();
    estableceEventosChange();
    obtenerTiposVehiculos();
    crearDatePicker();
    creaEventos();
});



function obtenerVehiculos() {
    var urlMetodo = '/Vehiculos/RetornaVehiculos'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#divMarcas").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    field: 'nombre_marca',
                    title: 'Nombre'
                },
                {
                    field: 'nombre_modelo',
                    title: 'Modelo'
                },
                {
                    field: 'placa',
                    title: 'Placa'
                },
                {
                    field: 'nombre_vehiculo',
                    title: 'Tipo de Vehículo'
                },
                {
                    field: 'cantidad_puertas',
                    title: 'Cantidad de puertas'
                },
                {
                    field: 'cantidad_ruedas',
                    title: 'Cantidad de ruedas'
                },
                {
                    field: 'nombre_fabricante',
                    title: 'Compañía Fabricante'
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
    var urlMetodo = '/Vehiculos/RetornaMarcas'
    var parametros = {};
    var funcion = crearAutoComplete;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function crearAutoComplete(data) {
    var datosAutoComplete = $.map(data, function (item) {
        return {
            label: item.nombre_marca,
            id_marca: item.id_marca,
            id_fabricante : item.id_fabricante
        }
    })
    $("#txtMarca").autocomplete({
        source: datosAutoComplete,
        select: function (event, ui) {
            $("#id_marca_select").val(ui.item.id_marca)
            $("#id_fabricante_select").val(ui.item.id_fabricante)
        }

    });
};



function estableceEventosChange() {

    $("#txtMarca").change(function () {
        var modelo = $("#id_marca_select").val();
        obtenerModelos(modelo);
    });

}

function obtenerModelos(pIdMarca) {
    var urlMetodo = '/Vehiculos/RetornaModelos'
    var parametros = { id_marca : pIdMarca };
    var funcion = procesarResultadoModelos;
    ejecutaAjax(urlMetodo, parametros, funcion);
}



function procesarResultadoModelos(data) {

    var ddlmodelos = $("#modelo");
    ddlmodelos.empty();

    var nuevaOpcion = "<option value ''>Seleccione un modelo</option>";
    ddlmodelos.append(nuevaOpcion);

    $(data).each(function () {

        var modeloActual = this;
        nuevaOpcion = "<option value ='" + modeloActual.id_modelo + "'>" + modeloActual.nombre_modelo + "</option>";
        ddlmodelos.append(nuevaOpcion);

    });
}

function obtenerTiposVehiculos() {
    var urlMetodo = '/Vehiculos/RetornaTiposVehículo'
    var parametros = {};
    var funcion = procesarTiposVehiculo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function procesarTiposVehiculo(data) {

    var ddltipovehiculo = $("#tipovehiculo");
    ddltipovehiculo.empty();
    var nuevaOpcion = "<option value ''>Seleccione un tipo de Vehículo</option>";
    ddltipovehiculo.append(nuevaOpcion);

    $(data).each(function () {

        var tipoActual = this;
        nuevaOpcion = "<option value ='" + tipoActual.id_tipo_vehiculo + "'>" + tipoActual.nombre_vehiculo + "</option>";
        ddltipovehiculo.append(nuevaOpcion);
    });
}

function crearDatePicker() {
    $("#aniofabric").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "c-50 : c+1",
        dateFormat: "dd/mm/yy"
    });
}


function creaEventos() {
    $("#btninsertar").on("click", function () {
        var formulario = $("#fmrnuevovehiculo");
        //formulario.validate();

        //if (formulario.valid()) {
        //    InsertaRegistro();
        //}
        InsertaNuevoVehiculos();
    });
}

function InsertaNuevoVehiculos() {
    var urlMetodo = '/Vehiculos/InsertaNuevoVehículo'
    var parametros = {
        pplaca: $("#placa").val(),
        pid_marca: $("#id_marca_select").val(),
        pid_tipo_vehiculo: $("#tipovehiculo").val(),
        pid_modelo_vehiculo: $("#modelo").val(),
        pcantidad_puertas: $("#cantpuertas").val(),
        pcantidad_ruedas: $("#cantruedas").val(),
        panio_fabricacion: $("#aniofabric").val(),
        pid_fabricante_vehiculo: $("#id_fabricante_select").val()
    };
    var funcion = procesarInsert;
    ejecutaAjax(urlMetodo, parametros, funcion);
}


function procesarInsert(data) {

    var resultadoFuncion = data.resultado;
    alert(resultadoFuncion);
    location.reload();

}

