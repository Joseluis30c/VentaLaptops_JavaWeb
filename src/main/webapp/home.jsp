<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Online</title>
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<script>
	$(function() {
		//Barra muestra el menu
		$('#sidebarCollapse').on('click', function() {
			$('#sidebar, #content').toggleClass('active');
		});
	});
</script>
<script type="text/javascript">
	$('.carousel').carousel({
		interval : 500,
	});
</script>
<style>
.vertical-nav {
	min-width: 19rem;
	width: 18rem;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
	transition: all 0.4s;
}

.page-content {
	width: calc(100% - 17rem);
	margin-left: 17rem;
	transition: all 0.4s;
}

#sidebar.active {
	margin-left: -17rem;
}

#content.active {
	width: 100%;
	margin: 0;
}

@media ( max-width : 768px) {
	#sidebar {
		margin-left: -17rem;
	}
	#sidebar.active {
		margin-left: 0;
	}
	#content {
		width: 100%;
		margin: 0;
	}
	#content.active {
		margin-left: 17rem;
		width: calc(100% - 17rem);
	}
}

body {
	background: #F4F6F6;
}

.separator {
	margin: 3rem 0;
	border-bottom: 1px dashed #fff;
}

.text-uppercase {
	letter-spacing: 0.1em;
}

.text-gray {
	color: #aaa;
}

.carousel, .carousel-inner>.item>img {
	height: 530px;
}
</style>
<body>
	<div class="vertical-nav bg-white" id="sidebar">
		<div class="py-4 px-3 mb-4 bg-light">
			<div class="media d-flex align-items-center">
				<img src="img/logo.jpg" width="65"
					class="mr-3 rounded-circle img-thumbnail shadow-sm">
				<div class="media-body">
					<h4 class="m-0">Jose Luis</h4>
					<p class="font-weight-light text-muted mb-0">Tienda Online</p>
				</div>
			</div>
		</div>
		<p
			class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Principal</p>
		<ul class="nav flex-column bg-white mb-0">
			<li class="nav-item"><a href="#"
				class="nav-link text-dark font-italic bg-light"> <i
					class="fa fa-th-large mr-3 text-primary fa-fw"></i> Home
			</a></li>
			<p
				class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Lista</p>

			<li class="nav-item"><a href="ControladorCliente?op=1"
				class="nav-link text-dark font-italic"> <i
					class="fa fa-user mr-3 text-primary "></i> Clientes
			</a></li>
			<li class="nav-item"><a href="ControladorProducto?op=1"
				class="nav-link text-dark font-italic"> <i
					class="fa fa-laptop mr-3 text-primary fa-fw"></i> Productos
			</a></li>
		</ul>
		<p
			class="text-gray font-weight-bold text-uppercase px-3 small py-4 mb-0">Mostrar</p>
		<ul class="nav flex-column bg-white mb-0">
			<li class="nav-item"><a href="catalogo.jsp"
				class="nav-link text-dark font-italic"> <i
					class="fa fa-laptop mr-3 text-primary fa-fw"></i> Laptops
			</a></li>
		</ul>
	</div>
	<!-- Contenido-->
	<div class="page-content p-5" id="content">
		<div class="col-md-2">
			<button id="sidebarCollapse" type="button"
				class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
				<i class="fa fa-bars mr-2"></i><small
					class="text-uppercase font-weight-bold">Menú</small>
			</button>
		</div>
		<div class="col-md-8"></div>
		<div class="col-md-2">
			<div class="dropdown">
				<a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar
					Sesion</a>
				<div class="dropdown-menu text-center">
					<a><img src="img/icon.png" height="80" width="80"></a><br>
					<a>${nom}</a><br> <a>${correo}</a>
					<div class="dropdown-divider"></div>
					<a href="controladorLogin?accion=Salir" class="dropdown-item">Salir</a>
				</div>
			</div>
			<br>
		</div>
		<div class="container">
			<h2 style="text-align: center" class="display-4 text-black">Venta
				de Laptops Online</h2>
			<p class="lead text-black mb-0">Encuentra tu Laptop Ideal Aquí.
				Compra productos de proveedores verificados a precios de fábrica.</p>
			<br>
		</div>
		<div class="container" style="text-align: center">
			<p>
			<div class="col-md-6">
				<a class="btn btn-info btn-lg btn-block" data-toggle="collapse"
					href="#mision" role="button" aria-expanded="false"
					aria-controls="collapseExample"> Misión </a>
			</div>
			<div class="col-md-6">
				<a class="btn btn-info btn-lg btn-block" data-toggle="collapse"
					href="#vision" role="button" aria-expanded="false"
					aria-controls="collapseExample"> Visión </a>
			</div>
			</p>
			<div class="collapse" id="mision">
				<div class="lead text-black mb-0" class="card card-body">
					<br>
					<br>
					<br> Ser la empresa lider en la comercializacion de equipos de
					computo, ya que el cliente es lo mas importante de la empresa, por
					lo tanto debe tratarse de la mejor manera posible, ser en el futuro
					la empresa mas reconocida con las mejores marcas de Laptops.
				</div>
			</div>
			<br>
			<br>
			<div class="dropdown-divider"></div>
			<div class="collapse" id="vision">
				<div class="lead text-black mb-0" class="card card-body">
					<br>
					<br> Ofrecer un servicio de calidad a nuestros clientes de
					acuerdo a los requerimientos planeados. ser la empresa lider en la
					venta de laptops con las mejores marcas del mercado , para lo cual
					trabajaremos con estandares de calidad bien ejecutados para que los
					clientes nos prefieran.
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="justify-content-center" id="myCarouselCustom"
				class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="item active">
						<img src="img/carru.jpg" width="1100" alt="">
					</div>
					<div class="item">
						<img src="img/carru3.jpg" width="1100" alt="">
					</div>
					<div class="item">
						<img src="img/carru2.jpg" width="1100" alt="">
					</div>
					<div class="item">
						<img src="img/carru4.jpg" width="1100" alt="">
					</div>
				</div>
			</div>
			<footer class="lead text-black mb-0" style="text-align: center">
				<br> Derechos reservados - 2021 | Desarrollado por: Jose Luis.
			</footer>
		</div>
</body>
</html>