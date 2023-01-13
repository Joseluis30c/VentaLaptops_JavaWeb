package Interface;

import java.util.List;

import Entidad.EntidadProducto;

public interface InterfaceProducto {
	//Listar
    public List ListarProducto();
    //Ingresar 
    public boolean IngresarProducto(EntidadProducto producto);
    //Modificar
    public boolean ModificarProducto(EntidadProducto producto);
    //Eliminar
    public boolean EliminarProducto(int idpro);
    //Buscar
    public EntidadProducto BuscarProducto(int idpro);
}
