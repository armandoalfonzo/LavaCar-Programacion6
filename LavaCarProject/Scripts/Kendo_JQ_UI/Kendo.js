$(function () {
    validaciones();
    obtenerClientes();
    MostrarDialog();
    estableceEventosChange();
    cargaDropdownListProvincias();
    creaEventos();
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
                    template: "#= nombre_cliente # #= apellido1 # #= apellido2 #",
                    title: 'Nombre Completo'
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
                {
                    title: "Modificar",
                    template: function (dataItem) {
                        return "<a href='/Cliente/ModificaCliente?id_cliente=" + dataItem.id_cliente + "'>Modificar</a>"
                    }
                },
                {
                    title: "Eliminar",
                    template: function (dataItem) {
                        return "<a href='/Cliente/EliminarCliente?id_cliente=" + dataItem.id_cliente + "'>Eliminar</a>"
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

function estableceEventosChange() {

    $("#provincia").change(function () {
        var provincia = $("#provincia").val();
        cargaDropdownListCantones(provincia);
    });

    $("#canton").change(function () {
        var canton = $("#canton").val();
        cargaDropdownListDistritos(canton);
    });
}

function cargaDropdownListProvincias() {
    var urlMetodo = '/Cliente/RetornaProvincias'
    var parametros = {};
    var funcion = procesarResultadoProvincias;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function procesarResultadoProvincias(data) {

    var ddlProvincias = $("#provincia");
    ddlProvincias.empty();
    var nuevaOpcion = "<option value ''>Seleccione una Provincia</option>";
    ddlProvincias.append(nuevaOpcion);

    $(data).each(function () {

        var provinciaActual = this;
        nuevaOpcion = "<option value ='" + provinciaActual.id_Provincia + "'>" + provinciaActual.nombre + "</option>";
        ddlProvincias.append(nuevaOpcion);
    });
}
function cargaDropdownListCantones(pIdProvincia) {
    var urlMetodo = '/Cliente/RetornaCantones'
    var parametros = {
        id_provincia: pIdProvincia
    };
    var funcion = procesarResultadoCanton;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function procesarResultadoCanton(data) {

    var ddlcantones = $("#canton");
    ddlcantones.empty();
    var nuevaOpcion = "<option value ''>Seleccione un Cantón</option>";
    ddlcantones.append(nuevaOpcion);

    $(data).each(function () {

        var cantonActual = this;
        nuevaOpcion = "<option value ='" + cantonActual.id_Canton + "'>" + cantonActual.nombre + "</option>";
        ddlcantones.append(nuevaOpcion);

    });
}


function cargaDropdownListDistritos(pidCanton) {
    var urlMetodo = '/Cliente/RetornaDistritos'
    var parametros = {
        id_canton: pidCanton
    };
    var funcion = procesarResultadoDistrito;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function procesarResultadoDistrito(data) {

    var ddldistritos = $("#distrito");
    ddldistritos.empty();
    var nuevaOpcion = "<option value ''>Selecciones un Distrito</option>";
    ddldistritos.append(nuevaOpcion);

    $(data).each(function () {

        var distritoActual = this;
        opcionDistritos = "<option value='" + distritoActual.id_Distrito + "'>" + distritoActual.nombre + " </option>";
        ddldistritos.append(opcionDistritos);
    });
}

function creaEventos() {
    $("#btninsertar").on("click", function () {
        var formulario = $("#fmrnuevocliente");
        formulario.validate();

        if (formulario.valid()) {
            InsertaNuevoCliente();
            $("#divInsertar").dialog("close");
        }

    });
}

function InsertaNuevoCliente() {
    var urlMetodo = '/Cliente/NuevoCliente'
    var parametros = {
        pnombre: $("#nombre").val(),
        papelli1: $("#primerapellido").val(),
        papelli2: $("#segundoapellido").val(),
        pcedula: $("#cedula").val(),
        pidprovincia: $("#provincia").val(),
        pidcanton: $("#canton").val(),
        pid_distrito: $("#distrito").val(),
        pdireccion: $("#direccion").val(),
        ptelefono: $("#telefono").val(),
        pemail: $("#email").val()
    };
    var funcion = procesarInsert;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

///se encarga de llamar al controlador y procesar el resultado para insertar
function procesarInsert(data) {

    var resultadoFuncion = data.respuesta;
    alert(resultadoFuncion);
    location.reload();

}

function validaciones() {
    $("#fmrnuevocliente").validate({
        rules: {
            nombre: {
                required: true,
                maxlength: 50
            },
            primerapellido: {
                required: true,
                maxlength: 50
            },
            segundoapellido: {
                required: true,
                maxlength: 50
            },
            telefono: {
                required: true,
                maxlength: 50
            },
            cedula: {
                required: true,
                maxlength: 50
            },
            provincia: {
                required: true,
                maxlength: 50
            },
            canton: {
                required: true,
                maxlength: 50
            },
            distrito: {
                required: true,
                maxlength: 50
            },
            direccion: {
                required: true,
                maxlength: 50
            },
            email: {
                required: true,
                maxlength: 50,
                email: true
            }
        }
    });
}