$(function () {
    validaciones();


    estableceEventosChange();
    //cargaDropdownListProvincias();
});

function estableceEventosChange() {

    $("#id_provincia").change(function () {
        var provincia = $("#id_provincia").val();
        console.log($("#id_provincia").val() + 'cambio');
        cargaDropdownListCantones(provincia);
    });

    $("#id_canton").change(function () {
        var canton = $("#id_canton").val();
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

    var ddlProvincias = $("#id_provincia");
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

    var ddlcantones = $("#id_canton");
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

    var ddldistritos = $("#id_distrito");
    ddldistritos.empty();
    var nuevaOpcion = "<option value ''>Selecciones un Distrito</option>";
    ddldistritos.append(nuevaOpcion);

    $(data).each(function () {

        var distritoActual = this;
        opcionDistritos = "<option value='" + distritoActual.id_Distrito + "'>" + distritoActual.nombre + " </option>";
        ddldistritos.append(opcionDistritos);
    });
}

function validaciones() {
    $("#fmrmodificaclient").validate({
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