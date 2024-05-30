<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
		<link href='css/stylesheet.css' rel='stylesheet' type='text/css'>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Alimentos Solidarios</title>
	</head>
	<body>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<header>
			<div class='encabezado'>
				<h1>Alimentos <span>Solidarios</span></h1>
			</div>
			<div class='icono_back'>
				<a href="login.jsp">
					<i class="bi bi-person-circle"></i>
					Iniciar Sesión
				</a>
			</div>
		</header>
		<main  class='centrar_vertical_2'>
			<section class='info_empresa'>
		            <h2>Acerca de Nosotros</h2>
		            <p>Alimentos Solidarios es una iniciativa sin fines de lucro que busca combatir el hambre y mejorar la calidad de vida de las personas más necesitadas. A través de nuestras campañas y programas de distribución, trabajamos incansablemente para asegurar que nadie en nuestra comunidad pase hambre.</p>
		            <p>Únete a nosotros en nuestra misión y descubre cómo puedes contribuir a un cambio positivo.</p>
	        </section>
	        <img class='imagen_main' alt="" src="resources/comida.jpg">
	        <div class='horizontal_v'>
	        	<section class='info_empresa2'>
		            <h2>Visión</h2>
		            <p>Nuestra visión es erradicar el hambre y la malnutrición en nuestras comunidades, promoviendo la solidaridad y el apoyo mutuo entre todos los ciudadanos.</p>
    		        <img alt="" src="resources/nino.jpg">
		        </section>
		        <section class='info_empresa2'>
		            <h2>Misión</h2>
		            <p>Nuestra misión es proporcionar alimentos saludables y nutritivos a personas en situación de vulnerabilidad, a través de la recolección de donaciones y la colaboración con diferentes organizaciones y voluntarios.</p>
     	        	<img alt="" src="resources/ninos.jpg">
		        </section>
	        </div>
			 <div class="donation-box">
		        <p class="donation-message">
		            Tu donación puede cambiar vidas. <br>
		            ¡Contribuye hoy y haz la diferencia!
		        </p>
		        <div class="donate-button">
		        	<a href='login.jsp'>¡Dona Ya!</a>
		        </div>
		    </div>
		</main>
		<footer>
			<p>Alimentos Solidarios | Todos los derechos reservados</p>
		</footer>
	</body>
</html>