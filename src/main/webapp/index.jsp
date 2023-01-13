<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Iniciar Sesión | Registrarte</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.login, .image {
	min-height: 100vh;
}

.bg-image {
	background-image: url('img/login.jpg');
	background-size: cover;
	background-position: center center;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row no-gutter">
			<div class="col-md-6 d-none d-md-flex bg-image"></div>
			<div class="col-md-6 bg-light">
				<div class="login d-flex align-items-center py-5">
					<div class="container">
						<div class="row">
							<div class="col-lg-10 col-xl-7 mx-auto">

								<br /> <br />

								<h3 class="display-4">Iniciar Sesión</h3>
								<p class="text-muted mb-4">Bienvenido! Ventas de Laptops
									Online</p>
								<form action="controladorLogin">
									<div class="form-group mb-3">
										<input name="txtnom" type="text" placeholder="admin"
											class="form-control rounded-pill border-0 shadow-sm px-4">
									</div>
									<div class="form-group mb-3">
										<input name="txtcorreo" type="email"
											placeholder="admin@gmail.com"
											class="form-control rounded-pill border-0 shadow-sm px-4">
									</div>
									<input type="submit" name="accion" value="Entrar"
										class="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm">
									<div class="text-center d-flex justify-content-between mt-4">
										<a href="#" class="font-italic text-muted">¿Olvidaste tu
											Contraseña?</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>