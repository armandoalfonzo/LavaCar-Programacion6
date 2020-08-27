$(function () {
    obtenerVehiculos();
});


function obtenerVehiculos() {
    var urlMetodo = '/Cliente/Vista_Vehiculos_cliente'
    var parametros = {};
    var funcion = creaGridKendo;
    ejecutaAjax(urlMetodo, parametros, funcion);
}
function creaGridKendo(data) {
    $("#divReporteVehiculos").kendoGrid({
        dataSource: {
            data: data.resultado,
            pageSize: 10
        },
        pageable: true,
        columns:
            [
                {
                    template: "#= nombre_cliente # #= apellido1 # #= apellido2 #",
                    title: 'Nombre'
                },
                {
                    field: 'nombre_marca',
                    title: 'Marca'
                },
                {
                    field: 'nombre_modelo',
                    title: 'Modelo'
                },
                {
                    field: 'placa',
                    title: 'Placa'
                },
                

            ],
        filterable: true,
        groupable: true,
        toolbar: ["excel", "pdf"],
        excel: {
            fileName: "Vehículos_por_Cliente.xlsx",
            filterabel: true,
            allPages: true
        },
        pdf: {
            fileName: "Vehículos_por_Cliente.pdf",
            author: "Armando&André_Co",
            creator: "Armando&André_Co",
            date: new Date(),
        }
    });
}