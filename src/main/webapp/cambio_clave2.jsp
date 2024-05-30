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
	%>

<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Menú de Administrador</title>
	</head>
	<body>
		<script type="text/javascript">
		    window.onload = function() 
		    {
		        var mensaje = '<%= request.getParameter("error") %>';
		        if(mensaje==="La contraseña actual es incorrecta")
		       		alert(mensaje);
		        else if(mensaje==="Las contraseñas no coinciden")
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
				<a><i class="bi bi-book-fill"></i>Historial de Donaciones</a>
			</div>
		</nav>
		<main class='centrar_profile'>
				<form id="registro" action="respuesta_cambio2.jsp" method="post" class='formu'>
			        <fieldset>
			            <h2>Cambio de Clave</h2>
			            	<label class="label">Ingrese la clave actual: </label>
			                <input type="password" name="clave_a" class="input_izq" required>
			            
			                <label class="label">Ingrese la nueva clave: </label>
			                <input type="password" name="clave_1" class="input_izq" required>
			                
			                <label class="label">Repita la nueva clave: </label>
			                <input type="password" name="clave_2" class="input_izq" required>
			            <div class="envio">
			                <input type="submit" class="boton" value="Enviar">
			                <input type="reset" class="boton">
			            </div>     
			        </fieldset>
			     </form> 
		</main>
		<footer>
			<p>Alimentos Solidarios | Todos los derechos reservados</p>
		</footer>
	</body>
</html>