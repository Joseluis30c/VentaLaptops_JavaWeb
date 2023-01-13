<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Entidad.EntidadCategoria"%>
<%@page import="Modelo.Modelo_Categoria"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro Producto</title>
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
	transform: translate(+10%, +6%);
}

body {
	background: url(img/cliente.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	margin: 0;
	height: 100vh;
}
</style>
<script>
	function previewImage(nb) {
		var reader = new FileReader();
		reader
				.readAsDataURL(document.getElementById('uploadImage' + nb).files[0]);
		reader.onload = function(e) {
			document.getElementById('uploadPreview' + nb).src = e.target.result;
		};
	}
</script>
</head>
<body>
	<div class="contenedor">
		<br>

		<form class="box" action="ControladorProducto" method="GET">

			<div class="row">
				<div class="col-md-7">
					<a href="ControladorProducto?op=1"
						class="text-dark font-italic bg-light"><i
						class="fa fa-angle-double-left mr-2 text-primary fa-fx"></i>Regresar</a><br>
					<h2>
						<b>Registro de Producto</b>
					</h2>
					<br> <label>NOMBRE PRODUCTO</label> <input type="text"
						id="txtNom" name="txtnom" placeholder="Nombre del Producto"
						class="form-control"> <label>PRECIO PRODUCTO</label> <input
						type="number" id="precio" name="txtprecio" class="form-control">
					<label>MARCA</label> <select id="idmar" name="txtmarca"
						class="form-control">
						<%
						Modelo_Categoria data = new Modelo_Categoria();
						List<EntidadCategoria> listado = data.ListarCategoria();

						Iterator<EntidadCategoria> itera = listado.iterator();
						EntidadCategoria cat;

						while (itera.hasNext()) {
							cat = itera.next();
						%>
						<option value="<%=cat.getIdcat()%>"><%=cat.getNomcat()%></option>
						<%
						}
						%>
					</select> <label>IMAGEN PRODUCTO</label><br> <input id="uploadImage1"
						type="file" name="fileImagen" onchange="previewImage(1);" /><br>
					<label>ESTADO</label> <select id="txtEst" name="txtestado"
						class="form-control">
						<option value="DISPONIBLE" selected>Disponible</option>
						<option value="AGOTADO">Agotado</option>
					</select> <input type="submit" name="op" value="Agregar">
				</div>
				<div class="col-md-4">
					<br> <br> <img border="5" id="uploadPreview1" width="500"
						height="400" src="img/preview.png">
				</div>
			</div>
		</form>
	</div>
</body>
</html>
