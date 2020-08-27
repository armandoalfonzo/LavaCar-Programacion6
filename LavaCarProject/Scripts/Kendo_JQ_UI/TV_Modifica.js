$(function () {
    Validaciones();

});

function Validaciones() {
    $("#frmmodificatipoVH").validate({
        rules: {
            nombre_vehiculo: {
                required: true,
                maxlength: 50
            }
        }
    });
}
