package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entidad.login;
import Interface.validar;

public class person implements validar{
	 Connection con;
	    Conexion cn=new Conexion();
	    PreparedStatement ps;
	    ResultSet rs;
	    
	    @Override
	    public int validar(login log) {
	        int r=0;
	        String sql="Select * from usuario where nombre=? and correo=?";
	        try{
	            con= cn.getCon();
	            ps=con.prepareStatement(sql);
	            ps.setString(1, log.getNom());
	            ps.setString(2, log.getCorreo());
	            rs=ps.executeQuery();
	            while(rs.next()){
	                r=r+1;
	                log.setNom(rs.getString("nombre"));
	                log.setCorreo(rs.getString("correo"));
	            }
	            if(r==1){
	                return 1;
	            }else{
	                return 0;
	            }
	        }catch(Exception e){
	            return 0;
	        }
	    }
}
