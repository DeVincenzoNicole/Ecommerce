<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilos.css" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg" id="navbar">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-brand"><img src="img/pies1.jpeg" width="50" height="50" alt=""/> Carrito de compras</span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="Controlador?accion=home"><i class="fas fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Controlador?accion=productos"> <i class="fas fa-shopping-bag"></i> Productos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Controlador?accion=productos">Seguir Comprando</a>
                </li>
              </ul>
                
              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Buscar">
                <button class="btnbuscar my-2 my-sm-0" type="submit">Buscar</button>
              </form>
                
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Iniciar sesión
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="#">Ingresar</a>
                          <a class="dropdown-item" href="#">Registrate</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Cerrar Sesión</a>
                        </div>
                    </li>
                </ul>
            </div>
      </nav>
        <div class="container mt-4">
            <div class="row">
                <div class="col-sm-8">
                    <div class="table-responsive-sm">
                    <!-- TABLA DETALLE DE COMPRA -->
                    <table id="tablacarrito" class="table table-hover text-center">
                        <thead>
                            <tr>
                                <th>Nº</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Imagen</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="ca" items="${carrito}">
                            <tr>
                                <td>${ca.getItem()}</td>
                                <td>${ca.getNombres()}</td>
                                <td>${ca.getDescripcion()}</td>
                                <td><img src="ControladorImg?id=${ca.getIdProducto()}" width="100" height="100"></td>                               
                                <td>${ca.getPrecioCompra()}</td>
                                <td>                          
                                    <input type="hidden" id="idprod" value="${ca.getIdProducto()}">
                                    <input type="number" id="cant" value="${ca.getCantidad()}" class="form-control text-center" min="1"> 
                                </td>
                                <td>${ca.getSubTotal()}</td>                                
                                <td>
                                    <!-- Input para guardar el ID del producto seleccionado para Eliminar-->
                                    <input type="hidden" id="idp" value="${ca.getIdProducto()}">
                                    <a href="#" id="btnEliminar">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>                      
                    </table>  
                    </div>
                </div>
                
                <div class="col-sm-4" id="tablaCompra">
                    <div class="card-header">
                        <h3>Generar Compra</h3>
                    </div>
                    <div class="card-body">
                        <label>Subtotal</label>
                        <input type="text" value="$ ${totApagar}0" readonly="" class="form-control">
                        <label> Descuento: </label>
                        <input type="text" value="$0.00" readonly="" class="form-control">
                        <label> Total a pagar: </label>
                        <input type="text" value="$ ${totApagar}0" readonly="" class="form-control">                    
                    </div>
                    <div class="card-footer">
                        <a href="#" id="RealizarPago" class="btn btn-info btn-block">Realizar Pago</a>
                        <a href="Controlador?accion=GenerarCompra"  id="GenerarCompra">Generar Compra</a>
                    </div>
                </div>   
            </div>
        </div>
        
        
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
