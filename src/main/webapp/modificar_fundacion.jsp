<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  session='true' import='com.negocio.*'%>

	<%
		int perfil = 0, id = 0;
		String usuario = "";
		HttpSession sesion = request.getSession();
		 if (sesion.getAttribute("usuario") == null || (Integer)sesion.getAttribute("perfil") != 1) //Se verifica si existe la variable
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
	<%
		String valor = request.getParameter("codigo");
		String nombre_pro = request.getParameter("nombre");
		int cod = Integer.parseInt(valor);
		Fundacion fun = new Fundacion();
		fun.modificarFundacion(cod);
	%>

<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Modificación de Fundación</title>
	</head>
	<body>
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
				<a href='menu_admin.jsp'><i class="bi bi-house-fill"></i>Inicio</a>
				<a href='registro_fundaciones.jsp'><i class="bi bi-building-fill-add"></i>Registrar Fundaciones</a>
				<a href='actualizar_info.jsp'><i class="bi bi-clipboard-plus-fill"></i>Actualizar Información</a>
			</div>
		</nav>
		<main class='centrar_profile'>
				<form action="respuesta_modificar_fundacion.jsp?codigo=<%=cod%>" method="post" class='formu'>
			        <fieldset>
			            <h2>Modificación de Fundación</h2>
			            	<label class="label">Nombre: </label>
			                <input type="text" name="nombre" class="input_izq" required>
			            
			               <label class="label">Teléfono: </label>
							<input type="tel" name="telef" class="input_izq" pattern="[0-9]{10}" title="Ingrese un número de teléfono válido de 10 dígitos" required maxlength="10">
			                
			                <label class="label">Dirección: </label>
			                <input type="text" name="direccion" class="input_izq" required>
			                
			                <label class="label">Representante Legal: </label>
			                <input type="text" name="repre" class="input_izq" required>
			                
			            <div class="envio2">
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