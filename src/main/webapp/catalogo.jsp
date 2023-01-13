<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entidad.EntidadProducto"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Modelo_Producto"%>
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
<title>Catálogo</title>
</head>
<body style="background: #F4F6F6">
	<div class="container">
		<img src="img/catalogo.jpg" class="img-fluid"
			style="width: 1500px; height: 300px"> <a href="home.jsp"
			class="text-dark font-italic bg-light"><i
			class="fa fa-angle-double-left mr-2 text-primary fa-fx"></i>Regresar</a><br>
		<br>
		<div class="dropdown-divider"></div>
		<h2 style="text-align: center">Catálogo de Productos</h2>
		<br>
		<div class="dropdown-divider"></div>
	</div>
	<div class="container" style="margin-top: 15px">
		<%
		Modelo_Producto produ = new Modelo_Producto();
		List<EntidadProducto> listado = produ.ListarProducto();

		Iterator<EntidadProducto> itera = listado.iterator();
		EntidadProducto pro;
		while (itera.hasNext()) {
			pro = itera.next();
		%>
		<div class="container py-3">
			<div class="card">
				<div class="row " style="text-align: left">
					<div class="col-md-7 px-6">
						<div class="card-block px-3">
							<br>
							<p style="color: #A6AFAF" class="card-text"><%=pro.getNomarc()%></p>
							<h4 class="card-title">
								<%=pro.getNompro()%>
							</h4>

							<p class="card-text" style="color: red; font-size: 20px">
								S/.<%=pro.getPre()%></p>
							<p class="card-text">
								<i class="fa fa-check"></i> Retiro en tienda
							</p>
							<p class="card-text">
								<i class="fa fa-check"></i> Despacho a Domicilio
							</p>
						</div>
						<div class="col-md-6">
							<br> <a style="text-align: center" href="#"
								class="btn btn-primary btn-lg btn-block"><i
								class="fa fa-shopping-cart"></i> Agregar a la bolsa</a>
						</div>
					</div>
					<div class="col-md-5" style="text-align: center">
						<img class="img-fluid" width="300" height="300"
							src="<%=pro.getImgpro()%>">
					</div>
				</div>
			</div>
		</div>

		<%
		}
		%>
	</div>

</body>
</html>