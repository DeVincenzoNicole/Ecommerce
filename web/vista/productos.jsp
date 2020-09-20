<%-- 
    Document   : productos
    Created on : 10-jul-2020, 19:39:19
    Author     : Nicole
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/estilos.css" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <!-- navBar -->
        <nav id="navbar" class="navbar navbar-expand-lg fixed-top">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-brand"><img src="img/pies1.jpeg" width="50" height="50" alt=""/> Productos</span>
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
                        <a class="nav-link" href="Controlador?accion=Carrito"><i class= "fas fa-cart-plus"> <label style="color: plum"> (${contador})</label> </i> Carrito de compras</a>
                    </li>
                </ul>
                <form class="form-inline" id="buscador">
                    <input class="form-control" type="search" placeholder="Buscar producto" aria-label="Buscar">
                    <button class="btnbuscar" type="submit">Buscar</button>
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
    </head>
    <div class="container mt-4">
        <div class="row" id="prods">
            <c:forEach var="p" items="${productos}">
                <div class="col-lg-4 col-sm-8" id="listaprod">
                    <div class="card-header text-center">
                        <div>
                            <h4>${p.getNombres()}</h4>
                            <i>$ ${p.getPrecio()}0</i>
                        </div>
                    </div>
                    <div class="card-body text-center" id="imgprod" >                 
                        <img src="ControladorImg?id=${p.getId()}" class="img-fluid">
                    </div>
                    <div class="card-footer text-center">
                        <label>${p.getDescripcion()}</label>
                        <div>
                            <a href="Controlador?accion=AgregaralCarrito&id=${p.getId()}" class="btn btn-outline-info" id="btncarrito" >Agregar al Carrito <i class= "fas fa-cart-plus"></i> </a>
                            <a href="Controlador?accion=Comprar&id=${p.getId()}" id="boton"> Comprar </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>    
    </div>    

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
