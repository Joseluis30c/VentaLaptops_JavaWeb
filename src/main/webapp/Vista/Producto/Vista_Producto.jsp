<%@page import="java.util.Iterator"%>
<%@page import="Entidad.EntidadProducto"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Modelo_Producto"%>
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
<title>PRODUCTO</title>
</head>
<script type="text/javascript">
	function ConfDelete() {
		var respuesta = confirm("¿Deseas eliminar el Producto?");
		if (respuesta === true) {
			return true;
		} else {
			return false;
		}
	}
</script>
<body style="background: #F4F6F6">

	<div class="container">
		<img src="img/produ.jpg" class="img-fluid"
			style="width: 1500px; height: 300px"> <br> <a
			href="home.jsp" class="text-dark font-italic bg-light"><i
			class="fa fa-angle-double-left mr-2 text-primary fa-fx"></i>Regresar</a><br>
		<br>
		<h2 style="text-align: center">Listado de Productos</h2>
		<a href="ControladorProducto?op=2" class="btn btn-outline-info">
			Nuevo</a><br> <br>
		<table class="table" id="MiTabla">
			<thead class="thead-dark">
				<tr style="text-align: center">
					<th>ID</th>
					<th>NOMBRE PRODUCTO</th>
					<th>MARCA</th>
					<th>PRECIO</th>
					<th>ESTADO</th>
					<th colspan="2">ACCIONES</th>
				</tr>
			</thead>
			<tbody>
				<%
				Modelo_Producto obj = new Modelo_Producto();
				List<EntidadProducto> listado = obj.ListarProducto();

				//ITERADOR RECORRE LOS REGISTROS
				Iterator<EntidadProducto> it = listado.iterator();
				EntidadProducto producto;
				while (it.hasNext()) {
					producto = it.next();
				%>
				<tr>
					<th scope="row"><%=producto.getIdpro()%></th>
					<td><%=producto.getNompro()%></td>
					<td><%=producto.getNomarc()%></td>
					<td>S/.<%=producto.getPre()%></td>
					<td><%=producto.getEstado()%></td>
					<td><a class="btn btn-outline-info"
						href="ControladorProducto?op=3&id=<%=producto.getIdpro()%>">Modificar</a>
					</td>
					<td><a onclick="return ConfDelete()"
						class="btn btn-outline-danger"
						href="ControladorProducto?op=4&id=<%=producto.getIdpro()%>">Eliminar</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>