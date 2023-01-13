package Interface;

import java.util.List;

import Entidad.EntidadCliente;

public interface InterfaceCliente {
	//Listar
    public List ListarCliente();
    //Ingresar
    public boolean IngresarCliente(EntidadCliente cli);
    //Modificar
    public boolean ModificarCliente(EntidadCliente cli);
    //Eliminar
    public boolean EliminarCliente(int idcli);
    //Buscar
    public EntidadCliente BuscarCliente(int idcli);
}
