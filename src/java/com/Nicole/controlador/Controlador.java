
package com.Nicole.controlador;

import com.Nicole.modelo.Carrito;
import com.Nicole.modelo.Cliente;
import com.Nicole.modelo.Compras;
import com.Nicole.modelo.Producto;
import com.Nicole.modeloBD.ComprasBD;
import com.Nicole.modeloBD.ProductoBD;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Controlador extends HttpServlet {

    ProductoBD pbd = new ProductoBD();
    Producto p = new Producto();
    List<Producto> productos = new ArrayList();
    List<Carrito> listaCarrito = new ArrayList();
    int item, idp;
    double totApagar = 0.0;
    int cant = 1;
    Carrito ca;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        productos = pbd.listar();
        
        switch (accion) {
            case "productos":
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("vista/productos.jsp").forward(request, response);
            break;
                
            case "AgregaralCarrito":
                int pos = 0;
                cant = 1;
                idp = Integer.parseInt(request.getParameter("id"));
                p = pbd.listarId(idp);
                if (listaCarrito.size() >0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if(idp == listaCarrito.get(i).getIdProducto()){
                            pos = i;
                        }
                    }
                    if (idp == listaCarrito.get(pos).getIdProducto()){
                        cant = listaCarrito.get(pos).getCantidad() + cant;
                        double subtotal = listaCarrito.get(pos).getPrecioCompra() * cant;
                        listaCarrito.get(pos).setCantidad(cant);
                        listaCarrito.get(pos).setSubTotal(subtotal);
                    } else {
                        item = item+1;
                        ca = new Carrito();
                        ca.setItem(item);
                        ca.setIdProducto(p.getId());
                        ca.setNombres(p.getNombres());
                        ca.setDescripcion(p.getDescripcion());
                        ca.setPrecioCompra(p.getPrecio());
                        ca.setCantidad(cant);
                        ca.setSubTotal(cant*p.getPrecio());
                        listaCarrito.add(ca);
                    }
                } else {
                item = item+1;
                ca = new Carrito();
                ca.setItem(item);
                ca.setIdProducto(p.getId());
                ca.setNombres(p.getNombres());
                ca.setDescripcion(p.getDescripcion());
                ca.setPrecioCompra(p.getPrecio());
                ca.setCantidad(cant);
                ca.setSubTotal(cant*p.getPrecio());
                listaCarrito.add(ca);
                }
                // con request envío los datos correspondientes
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=productos").forward(request,response);
                    break;
                    
            case "Carrito":
                totApagar = 0.0;
                request.setAttribute("carrito", listaCarrito);
                // sumatoria de las columnas Subtotal
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totApagar = totApagar + listaCarrito.get(i).getSubTotal();             
                }
                request.setAttribute("totApagar", totApagar);
                request.getRequestDispatcher("vista/carrito.jsp").forward(request, response);
            break;
            
            case "Eliminar":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdProducto() == idproducto) {
                        listaCarrito.remove(i);
                    }
                }
                
                break;
            
            case "ActualizarCant":
                int idprod = Integer.parseInt(request.getParameter("idp"));
                cant = Integer.parseInt(request.getParameter("cant"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdProducto()== idprod){
                        listaCarrito.get(i).setCantidad(cant);
                        double subtot = listaCarrito.get(i).getPrecioCompra()*cant;
                        listaCarrito.get(i).setSubTotal(subtot);
                    }
                }
                
                break;
                
            case "Comprar":
                idp = Integer.parseInt(request.getParameter("id"));
                p = pbd.listarId(idp);
                item = item+1;
                ca = new Carrito();
                ca.setItem(item);
                ca.setIdProducto(p.getId());
                ca.setNombres(p.getNombres());
                ca.setDescripcion(p.getDescripcion());
                ca.setPrecioCompra(p.getPrecio());
                ca.setCantidad(cant);
                ca.setSubTotal(cant*p.getPrecio());
                listaCarrito.add(ca);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totApagar = totApagar + listaCarrito.get(i).getSubTotal();             
                }
                request.setAttribute("totApagar", totApagar);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("vista/carrito.jsp").forward(request, response);
            
            case "GenerarCompra":
                Cliente cliente = new Cliente();
                cliente.setId(1);
                ComprasBD cbd = new ComprasBD();
                Compras compra = new Compras(cliente, 1, "07/6/2020", totApagar, "Guardado", listaCarrito);
                int res = cbd.GenerarCompra(compra);
                if (res!=0 && totApagar>0) {                   
                    request.getRequestDispatcher("vista/mensaje.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("vista/error.jsp").forward(request, response);
                }
                break;
            default:
                
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
