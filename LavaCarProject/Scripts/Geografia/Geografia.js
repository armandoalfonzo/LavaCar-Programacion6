$(function () {
    eventos();
    ddlprovinciaslista();
}
);

function eventos() {
    $("#provincia").change(function () {
        var provincia = $("#provincia").val();
        ddlcantonlista(provincia);
    });
    $("#canton").change(function () {
        var canton = $("#canton").val();
        ddldistritolista(canton);
    });
}
function ddlprovinciaslista() {
    var url = '/Cliente/RetornaProvincias';
    var parametros = {};
    $.ajax({
        url: url,
        dataType: 'json',
        type: 'post',
        contentType: 'application/json',
        data: JSON.stringify(parametros),
        success: function (data, textStatus, jQxhr) {
            procesarResultadoProvincias(data);
        },
        error: function (jQxhr, textStatus, errorThrown) {
            alert(errorThrown);
        },
    });
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

    var url = '/Cliente/RetornaCantones';
    var parametros = {
        id_provincia: pIdProvincia
    };
    $.ajax({
        url: url,
        dataType: 'json',
        type: 'post',
        contentType: 'application/json',
        data: JSON.stringify(parametros),
        success: function (data, textStatus, jQxhr) {
            procesarResultadoCantones(data);
        },
        error: function (jQxhr, textStatus, errorThrown) {
            alert(errorThrown);
        },
    });
}


function procesarResultadoCantones(data) {

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

function ddldistritolista(pid_Canton) {
    var url = '/Cliente/RetornaDistritos';

    var valores = {
        id_canton: pid_Canton
    };

    $.ajax({
        url: url,
        dataType: 'json',
        type: 'post',
        contentType: 'application/json',
        data: JSON.stringify(valores),
        success: function (data, textStatus, jQxhr) {
            ddlcantonlista(data);
        },

        error: function (jQxhr, textStatus, errorThrown) {
            alert(errorThrown);
        },
    })
}
function ddlcantonlista(data) {
    var ddldistritos = $("#distrito");
    ddldistritos.empty();

    var opcionDistritos = "<option value=''> Selecciones un Distrito</option>";
    ddldistritos.append(opcionDistritos);
    $(data).each(function () {

        var distritoActual = this;
        opcionDistritos = "<option value='" + distritoActual.id_Distrito + "'>" + distritoActual.nombre + " </option>";
        ddldistritos.append(opcionDistritos);
    });
}