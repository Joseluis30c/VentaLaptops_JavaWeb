package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entidad.EntidadProducto;
import Interface.InterfaceProducto;

public class Modelo_Producto implements InterfaceProducto{
	Connection con;
    Conexion cnx = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    EntidadProducto producto;
    @Override
    public List ListarProducto() {
       String sql = "call usp_ListadoProductos";
        ArrayList<EntidadProducto>lista = new ArrayList<>();
        try{
            con = cnx.getCon();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            //Valcar contenido de rs en la lista
            while(rs.next()){
                producto = new EntidadProducto();
                producto.setIdpro(rs.getInt("ID"));
                producto.setNompro(rs.getString("Producto"));
                producto.setNomarc(rs.getString("Marca"));
                producto.setPre(rs.getDouble("Precio"));
                producto.setImgpro(rs.getString("Imagen"));
                producto.setEstado(rs.getString("Estado"));
                
                lista.add(producto);
            }
        }catch(Exception e){
            
        }
        return lista;
    }

    @Override
    public boolean IngresarProducto(EntidadProducto producto) {
        String sql= "call usp_IngresaProducto('"+producto.getNompro()+"',"+producto.getMarca()+",'"+producto.getPre()+"','img/lap/"+producto.getImgpro()+"','"+producto.getEstado()+"')";
        try{
            con = cnx.getCon();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            return true;
        }catch(Exception e){
            return false;
        }
    }

    @Override
    public boolean ModificarProducto(EntidadProducto producto) {
        String sql= "call usp_ModificaProducto("+producto.getIdpro()+",'"+producto.getNompro()+"',"+producto.getMarca()+",'"+producto.getPre()+"','img/lap/"+producto.getImgpro()+"','"+producto.getEstado()+"')";
        try{
            con = cnx.getCon();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            return true;
        }catch(Exception e){
            return false;
        }
    }

    @Override
    public boolean EliminarProducto(int idpro) {
        String sql= "call usp_EliminarProducto("+idpro+")";
        try{
            con = cnx.getCon();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            return true;
        }catch(Exception e){
            return false;
        }
    }

    @Override
    public EntidadProducto BuscarProducto(int idpro) {
        String sql = "call usp_BuscarProducto("+idpro+")";
        try{
            con = cnx.getCon();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            //Valcar contenido de rs en la lista
            while(rs.next()){
                producto = new EntidadProducto();
                producto.setIdpro(rs.getInt("ID"));
                producto.setNompro(rs.getString("Producto"));
                producto.setNomarc(rs.getString("Marca"));
                producto.setPre(rs.getDouble("Precio"));
                producto.setImgpro(rs.getString("Imagen"));
                producto.setEstado(rs.getString("Estado"));
            }
        }catch(Exception e){
            
        }
        return producto;
    }
}
