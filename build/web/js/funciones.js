$(document).ready(function (){
    
    // captura el id de la fila seleccionada y envía el parametro a la funcion eliminar
    $("tr #btnEliminar").click(function (){
        var idp = $(this).parent().find("#idp").val();
        swal({
            title: "Deseas eliminar este artículo?",
            text: "El artículo seleccionado se eliminará de su carrito de compras",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          })
          .then((willDelete) => {
            if (willDelete) {
              eliminar(idp);
              swal("El producto ha sido eliminado!", {
                icon: "success",
              }).then((willDelete)=>{
                  if(willDelete){
                      parent.location.href = "Controlador?accion=Carrito";
                  }
              });
            } else {
              swal("Producto no eliminado!");
            }
          }); 
    });

    // método para eliminar un registro dentro de Carrito de compras
    function eliminar(idp){
        var url="Controlador?accion=Eliminar";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp="+ idp,
            success: function (data, textStatus, jqXHR){
                // alert("Registro eliminado!");
            }
        });
    }

    // método para actualizar la cantidad del mismo producto seleccionado
    $("tr #cant").click(function (){
            var idp = $(this).parent().find("#idprod").val();
            var cant = $(this).parent().find("#cant").val();
            var url = "Controlador?accion=ActualizarCant";
            $.ajax({
                type: 'POST',
                url: url,
                data: "idp=" + idp + "&cant=" + cant,
                success: function (data, textStatus, jqXHR) {            
                location.href= "Controlador?accion=Carrito";
                }
            });        
        });


       //$("#GenerarCompra").click(function (){
              //      location.href= "Controlador?accion=GenerarCompra";

                        // swal({
                           // title: "Compra exitosa!",
                           // text: "Su compra ha sido exitosa!",
                           // icon: "success",
                           // button: "Regresar",
                         // });
                     
                    //  });
                          
        $("#RealizarPago").click(function (){
  
                         swal({
                            title: "Pago realizado",
                            icon: "success",
                            button: "Regresar",
                          });
                     
                      });       

});