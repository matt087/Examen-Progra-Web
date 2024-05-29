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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Fundacion fun = new Fundacion();
		int id_fun = fun.getNewId();
		String nombre = request.getParameter("nombre");
		String telefono = request.getParameter("telef");
		String direccion = request.getParameter("direccion");
		String repre = request.getParameter("repre");
		String msg = fun.ingresarFundacion(id_fun, nombre, telefono, direccion, repre);
		 %>
			<jsp:forward page="registro_fundaciones.jsp">
			<jsp:param name="resultado" value="<%=msg%>" />
			</jsp:forward>
		<%
	%>
</body>
</html>