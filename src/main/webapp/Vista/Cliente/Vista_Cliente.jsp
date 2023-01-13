<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Modelo_Cliente"%>
<%@page import="Entidad.EntidadCliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<title>CLIENTES</title>
</head>
<script type="text/javascript">
	function ConfDelete() {
		var respuesta = confirm("¿Deseas eliminar al Cliente?");
		if (respuesta === true) {
			return true;
		} else {
			return false;
		}
	}
</script>
<body style="background: #F4F6F6">
	<div class="container">
		<img src="img/cli.jpg" class="img-fluid"
			style="width: 1500px; height: 300px"> <a href="home.jsp"
			class="text-dark font-italic bg-light"><i
			class="fa fa-angle-double-left mr-2 text-primary fa-fx"></i>Regresar</a><br>
		<br>
		<h2 style="text-align: center">Listado de Clientes</h2>
		<a href="ControladorCliente?op=2" class="btn btn-outline-info">
			Nuevo</a><br>
		<br>
		<table class="table table-hover" id="MiTabla">
			<thead class="thead-dark">
				<tr style="text-align: center">
					<th>ID</th>
					<th>TIPO/DOC</th>
					<th>N° / DOC</th>
					<th>NOMBRE</th>
					<th>DIRECCION</th>
					<th>DISTRITO</th>
					<th>ESTADO</th>
					<th colspan="2">ACCIONES</th>
				</tr>
			</thead>
			<tbody>
				<%
				Modelo_Cliente obj = new Modelo_Cliente();
				List<EntidadCliente> listado = obj.ListarCliente();

				//ITERADOR RECORRE LOS REGISTROS
				Iterator<EntidadCliente> it = listado.iterator();
				EntidadCliente cli;
				while (it.hasNext()) {
					cli = it.next();
				%>
				<tr>
					<th scope="row"><%=cli.getId()%></th>
					<td><%=cli.getTipodoc()%></td>
					<td><%=cli.getNrodoc()%></td>
					<td><%=cli.getNombre()%></td>
					<td><%=cli.getDirec()%></td>
					<td><%=cli.getNomdis()%></td>
					<td><%=cli.getEstado()%></td>
					<td><a class="btn btn-outline-info"
						href="ControladorCliente?op=3&id=<%=cli.getId()%>">Modificar</a></td>
					<td><a onclick="return ConfDelete()"
						class="btn btn-outline-danger"
						href="ControladorCliente?op=4&id=<%=cli.getId()%>">Eliminar</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>