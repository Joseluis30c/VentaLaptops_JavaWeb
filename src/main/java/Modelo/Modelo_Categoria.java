package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entidad.EntidadCategoria;
import Interface.InterfaceCategoria;

public class Modelo_Categoria implements InterfaceCategoria{
	Conexion cnx = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    EntidadCategoria cat;
    @Override
    public List ListarCategoria() {
        String sql = "call usp_ListadoMarca";
        ArrayList<EntidadCategoria>lista = new ArrayList<>();
        try{
            con = cnx.getCon();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            //Valcar contenido de rs en la lista
            while(rs.next()){
                cat = new EntidadCategoria();
                cat.setIdcat(rs.getInt("id_marca"));
                cat.setNomcat(rs.getString("nom_marca"));
                lista.add(cat);
            }
        }catch(Exception e){
            
        }
        return lista;
    } 
}
