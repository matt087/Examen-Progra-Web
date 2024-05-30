<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  session='true' import='com.seguridad.*' import='com.negocio.*'%>

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
	 int id_fun = Integer.valueOf(request.getParameter("cmbFundaciones"));
%>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Registro de Donaciones</title>
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
				<a href='menu_donador.jsp'><i class="bi bi-house-fill"></i>Inicio</a>
				<a href='registro_donacion.jsp'><i class="bi bi-bag-plus-fill"></i>Realizar Donación</a>
				<a href='listado_donador.jsp'><i class="bi bi-book-fill"></i>Historial de Donaciones</a>
			</div>
		</nav>
		<main class='centrar_vertical'>
			<form id="registro_fundaciones" action="respuesta_registro_donacion_final.jsp?id_fundacion=<%=id_fun%>" method="post" class='centrado_form'>
		        <fieldset>
		            <h2>Registro de Donaciones</h2>
		            	<label class="label2">Productos a Donar: </label>
						<%
							Alimento al = new Alimento();
							out.print(al.getAlimentosId(id_fun));
						%>		            
       		        <div class="envio_c">
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