$(function () {
    EventosChange();
    $("#fmrnuevovehiculo").validate({
        rules: {
            txtMarca: {
                required: true,
                maxlength: 50
            },
            modelo: {
                required: true
            },
            cantpuertas: {
                required: true
            },
            cantruedas: {
                required: true
            },
            tipovehiculo: {
                required: true
            },
            placa: {
                required: true
            },
            aniofabric: {
                required: true
            },

        }
    });

});

function EventosChange() {

    $('#ddlmarca').change(function () {
        var marca = $("#id_marca_select").val();
        ddlmodelos(marca);
    });

}
function ddlmodelos(pIdMarca) {
    var urlMetodo = "/Vehiculos/RetornaModelos"
    var parametros = { id_marca: pIdMarca };
    var funcion = procesaddlmodelos;
    ejecutaAjax(urlMetodo, parametros, funcion);
}

function procesaddlmodelos(data){
    var ddlmodelos = $("#id_modelo_vehiculo");
    ddlmodelos.empty();//revisar este método
    var nuevaOpcion = "<option value ''>Seleccione un modelo</option>";
    ddlmodelos.append(nuevaOpcion);

    $(data).each(function () {
        var modeloActual = this;
        nuevaOpcion = "<option value ='" + modeloActual.id_modelo + "'>" + modeloActual.nombre_modelo + "</option>";
        ddlmodelos.append(nuevaOpcion);
    });
}