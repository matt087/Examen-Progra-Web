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
		<title>Registro de Usuarios</title>
	</head>
	<body>
	<script type="text/javascript">
		 window.onload = function() 
		 {
		     var mensaje = '<%= request.getParameter("ingreso") %>';
		     if(mensaje==="Las contraseñas no coinciden")
		    		alert(mensaje);
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
		<main class='centrar_profile_2'>
			<form id="registro" action="respuesta_registro.jsp" method="post" class='formu'>
		        <fieldset>
		            <h2>Registro de Usuarios</h2>
		            	<label class="label">Cédula: </label>
						<input type="text" name="cedula" class="input_izq" pattern="[0-9]{10}" required maxlength="10">
		            
		                <label class="label">Nombres: </label>
		                <input type="text" name="nombre" class="input_izq" required>
		                
		                <label class="label">Correo: </label>
		                <input type="text" name="correo" class="input_izq" required>
		                
		                <label class="label">Nombre de Usuario: </label>
		                <input type="text" name="user" class="input_izq" required>
		                
		                <label class="label">Ingrese la contraseña: </label>
		                <input type="password" name="psw1" class="input_izq" required>
		                
		                <label class="label">Repita la contraseña: </label>
		                <input type=password name="psw2" class="input_izq" required>
		                
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
