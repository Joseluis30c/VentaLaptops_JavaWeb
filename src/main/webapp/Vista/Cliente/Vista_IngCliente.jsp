<%@page import="java.util.Iterator"%>
<%@page import="Entidad.EntidadDistrito"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Modelo_Distrito"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrar Cliente</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<style>
.box {
	position: absolute;
}

.box input[type="text"], .box input[type="number"] {
	border: 2px solid #3498db;
	padding: 10px 10px;
	width: 250px;
	outline: none;
	color: black;
}

.box input[type="submit"] {
	background: #2ecc71;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #2ecc71;
	padding: 14px 40px;
	outline: none;
	color: white;
	border-radius: 24px;
}

.img {
	width: 0%;
	height: 0%;
}

.row {
	transform: translate(+8%, +1%);
}

body {
	background: url(img/cliente.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	margin: 0;
	height: 100vh;
}
</style>
</head>
<body>
	<div class="container">
		<br>
		<form class="box" name="FrmIng" action="ControladorCliente"
			method="GET">
			<div class="row">
				<div class="col-md-12">
					<a href="ControladorCliente?op=1"
						class="text-dark font-italic bg-light"><i
						class="fa fa-angle-double-left mr-2 text-primary fa-fx"></i>Regresar</a><br>
					<h2>Registro de Cliente</h2>
					<br> <label>TIPO DOCUMENTO</label> <select id="txtTipo"
						name="txtTipo" class="form-control">
						<option value="1">RUC</option>
						<option value="2">DNI</option>
					</select> <label>Nº DOCUMENTO</label> <input type="text" id="txtNro"
						name="txtNro" class="form-control" placeholder="ej: 123456789">
					<label>NOMBRE CLIENTE</label> <input type="text" id="txtNom"
						name="txtNom" class="form-control" placeholder="Ingrese su nombre">
					<label>DIRECCION</label> <input type="text" id="txtDir"
						name="txtDir" class="form-control"
						placeholder="Dirección de residencia"> <label>DISTRITO</label>
					<select id="idDis" name="txtDis" class="form-control">
						<%
						Modelo_Distrito data = new Modelo_Distrito();
						List<EntidadDistrito> listado = data.ListarDistrito();

						Iterator<EntidadDistrito> itera = listado.iterator();
						EntidadDistrito dis;

						while (itera.hasNext()) {
							dis = itera.next();
						%>
						<option value="<%=dis.getId()%>"><%=dis.getNomdis()%></option>
						<%
						}
						%>
					</select> <label>ESTADO</label> <select id="txtEst" name="txtEst"
						class="form-control">
						<option value="A">Activo</option>
						<option value="D">Desactivado</option>
					</select> <input type="submit" name="op" value="Agregar">
				</div>
			</div>
		</form>
	</div>
</body>
</html>