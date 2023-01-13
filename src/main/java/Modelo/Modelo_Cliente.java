package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entidad.EntidadCliente;
import Interface.InterfaceCliente;

public class Modelo_Cliente implements InterfaceCliente{
	Conexion cnx = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    EntidadCliente cli;
    @Override
    public List ListarCliente() {
        String sql = "call usp_ListadoClientes";
        ArrayList<EntidadCliente>lista = new ArrayList<>();
        try{
            con = cnx.getCon();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            //Valcar contenido de rs en la lista
            while(rs.next()){
                cli = new EntidadCliente();
                cli.setId(rs.getInt("ID"));
                cli.setTipodoc(rs.getString("Documento"));
                cli.setNrodoc(rs.getString("N°Documento"));
                cli.setNombre(rs.getString("Nombre"));
                cli.setDirec(rs.getString("Direccion"));
                cli.setNomdis(rs.getString("Distrito"));
                cli.setEstado(rs.getString("Estado"));
                
                lista.add(cli);
            }
        }catch(Exception e){
            
        }
        return lista;
    }

    @Override
    public boolean IngresarCliente(EntidadCliente cli) {
        String sql = "call usp_IngresarCliente('"+cli.getTipodoc()+"','"+cli.getNrodoc()+"','"+cli.getNombre()+"','"+cli.getDirec()+"',"+cli.getIddis()+",'"+cli.getEstado()+"')";
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
    public boolean ModificarCliente(EntidadCliente cli) {
        String sql = "call usp_ModificarCliente("+cli.getId()+",'"+cli.getTipodoc()+"','"+cli.getNrodoc()+"','"+cli.getNombre()+"','"+cli.getDirec()+"',"+cli.getIddis()+",'"+cli.getEstado()+"')";
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
    public boolean EliminarCliente(int idcli) {
        String sql = "call usp_EliminarCliente("+idcli+")";
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
    public EntidadCliente BuscarCliente(int idcli) {
        String sql = "call usp_BuscarCliente("+idcli+")";
        try{
            con = cnx.getCon();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                cli = new EntidadCliente();
                cli.setId(rs.getInt("ID"));
                cli.setTipodoc(rs.getString("Documento"));
                cli.setNrodoc(rs.getString("N°Documento"));
                cli.setNombre(rs.getString("Cliente"));
                cli.setDirec(rs.getString("Direccion"));
                cli.setNomdis(rs.getString("Distrito"));
                cli.setEstado(rs.getString("Estado"));
            }
        }catch(Exception e){
            
        }
        return cli;
    }
    
}
