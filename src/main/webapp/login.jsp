<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>		<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Inicio de Sesión</title>
	</head>
	<body>
	<script type="text/javascript">
		 window.onload = function() 
		 {
		     var mensaje = '<%= request.getParameter("error") %>';
		     if(mensaje==="El cambio de clave ha sido exitoso")
		    		alert(mensaje);
		     if(mensaje==="Datos incorrectos")
		    		alert(mensaje);
		     var mensaje2 = '<%= request.getParameter("ingreso") %>';
		     if(mensaje2==="correcto")
		    		alert("¡El ingreso ha sido correcto!");
		 };
	</script>
		<header>
			<div class='encabezado'>
				<h1>Alimentos <span>Solidarios</span></h1>
			</div>
			<div class='icono_back'>
				<a href="index.jsp">
					<i class="bi bi-arrow-left-square-fill"></i>
					Regresar
				</a>
			</div>
		</header>
		<div class='container_login'>
			<form action="verificar_login.jsp">
				<h1>Inicio de Sesión</h1>
				<div class="input-box">
					<input placeholder="Usuario: " type='text' required name='usuario'>
					<i class='bx bx-user' ></i>
				</div>
				<div class="input-box">
					<input placeholder="Contraseña: " type='password' required name='clave'>
					<i class='bx bx-lock-alt' ></i>
				</div>
				<div class="recordar">
					<label>
						<input type="checkbox">Recordar contraseña
					</label>
					<a href="#">Olvidé mi contraseña</a>
				</div>
				<button class="btn_login" type="submit">Iniciar Sesión</button>
				<div class="registro">
					<p>¿No tienes una cuenta?
						<a href="registro.jsp">Regístrate</a>
					</p>
				</div>
			</form>
		</div>	
	</body>
</html>