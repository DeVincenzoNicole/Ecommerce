
package com.Nicole.modeloBD;

import com.Nicole.config.conexion;
import com.Nicole.modelo.Carrito;
import com.Nicole.modelo.Compras;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ComprasBD {
    
    Connection con;
    conexion cn = new conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    public int GenerarCompra(Compras compra){
        int idcompras;
        String sql = "insert into compras(idCliente, idPago, FechaCompra, Monto, Estado) values (?,?,?,?,?)";
        try {
            con = cn.conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, compra.getCliente().getId());
            ps.setInt(2, compra.getIdpago());
            ps.setString(3, compra.getFecha());
            ps.setDouble(4, compra.getMonto());
            ps.setString(5, compra.getEstado());         
            r = ps.executeUpdate();
            
            sql = "Select @@IDENTITY AS idCompras";
            rs = ps.executeQuery(sql);
            rs.next();
            idcompras = rs.getInt("idCompras");
            rs.close();
            
            for (Carrito detalle : compra.getDetallecompras()) {
                sql = "insert into detalle_compras(idProducto, idCompras, Cantidad, PrecioCompra) values (?,?,?,?)";
                ps=con.prepareStatement(sql);
                ps.setInt(1, detalle.getIdProducto());
                ps.setInt(2, idcompras);
                ps.setInt(3, detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecioCompra());
                r = ps.executeUpdate();
            }
                       
        } catch (SQLException ex) {
            Logger.getLogger(ComprasBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
}
