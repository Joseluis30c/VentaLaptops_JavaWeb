package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entidad.EntidadDistrito;
import Interface.InterfaceDistrito;

public class Modelo_Distrito implements InterfaceDistrito{
	Conexion cnx = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    EntidadDistrito dis;
    @Override
    public List ListarDistrito() {
        String sql = "call usp_ListadoDistritos";
        ArrayList<EntidadDistrito>lista = new ArrayList<>();
        try{
            con = cnx.getCon();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            //Valcar contenido de rs en la lista
            while(rs.next()){
                dis = new EntidadDistrito();
                dis.setId(rs.getInt("id_dis"));
                dis.setNomdis(rs.getString("nom_dis"));
                lista.add(dis);
            }
        }catch(Exception e){
            
        }
        return lista;
    }
}
