<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  session='true' import='com.seguridad.*'%>

<%
	int perfil = 0, id = 0;
	String usuario = "";
	HttpSession sesion = request.getSession();
	 if (sesion.getAttribute("usuario") == null || (Integer)sesion.getAttribute("perfil") != 2) //Se verifica si existe la variable
	 {
		 %>
			<jsp:forward page="login.jsp">
			<jsp:param name="error" value="Debe registrarse en el sistema" />
			</jsp:forward>
		<%
	 }
	 else
	 {
		 usuario=(String)sesion.getAttribute("usuario"); 
		 perfil=(Integer)sesion.getAttribute("perfil");
		 id = (Integer)sesion.getAttribute("id");
	 }
	 Usuario us = new Usuario();
	 String per_name = us.setNombreId(perfil);
	 String [] info = us.getInfo(id);
%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Menú de Donador</title>
	</head>
	<body>
		<script type="text/javascript">
				    window.onload = function() 
				    {
				        var mensaje = '<%= request.getParameter("resultado") %>';
				        if(mensaje==="¡Donación Realizada!")
				       		alert(mensaje);
				        else if(mensaje==="¡Donación Incorrecta!")
				       		alert(mensaje);
				    };
		</script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<header>
			<div class='encabezado'>
				<h1>Alimentos <span>Solidarios</span></h1>
			</div>
			<div class='icono_back'>
				<a href="cerrar_sesion.jsp">
					<i class="bi bi-box-arrow-in-left"></i>
					Cerrar Sesión
				</a>
			</div>
		</header>
		<nav>
			<div class='barra_nav'>
				<a href='menu_donador.jsp'><i class="bi bi-house-fill"></i>Inicio</a>
				<a href='registro_donacion.jsp'><i class="bi bi-bag-plus-fill"></i>Realizar Donación</a>
				<a href='listado_donador.jsp'><i class="bi bi-book-fill"></i>Historial de Donaciones</a>
			</div>
		</nav>
		<main class='centrar_profile'>
			<section class ='profile'>
				<section class='vertical_img'>
					<img alt="" src="resources/cuenta-verificada.png">
					<p><b>Usuario:</b><br> <%=usuario %></p>
					<p><b>Tipo:</b><br> <%=per_name %></p>
				</section>
				<section class='vertical_info'>
					<h2>Información de la Cuenta</h2>
					<div class='info_text'>
						<p><b>Cédula de Identidad: </b><%=info[2] %></p>
					</div>
					<div class='info_text'>
						<p><b>Correo Electrónico: </b><%=info[4] %></p>
					</div>
					<div class='info_text'>
						<p><b>Contraseña: </b><%=us.passwordHidden(info[6].length()) %></p>
					</div>
					<div class='button_cambio'>
						<form action="cambio_clave2.jsp">
							<button type='submit'>Cambiar Contraseña</button>						
						</form>
					</div>
				</section>
			</section>
		</main>
		<footer>
			<p>Alimentos Solidarios | Todos los derechos reservados</p>
		</footer>
	</body>
	</html>