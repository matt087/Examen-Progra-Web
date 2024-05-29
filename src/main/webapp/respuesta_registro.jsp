<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.seguridad.*'%>
 <%
	String cedula = request.getParameter("cedula");
	String nombre = request.getParameter("nombre");
	String correo = request.getParameter("correo");
	String usr = request.getParameter("user");
	String contraseña = request.getParameter("psw1");
	String contraseña2 = request.getParameter("psw2");	
	String resultado="";
	
	Usuario user = new Usuario();
	int id = user.getUsuarios();
	user.setId(id);
	user.setCedula(cedula);
	user.setNombre(nombre);
	user.setCorreo(correo);
	user.setUser(usr);
	
	//validar cedulas no repetidas
	
	if(contraseña.equals(contraseña2))
	{
		user.setClave(contraseña);
		resultado = user.ingresarDonador();
		%>
			<jsp:forward page="login.jsp">
			<jsp:param name="ingreso" value="correcto" />
			</jsp:forward>
		<%
	}
	else
	{
		%>
			<jsp:forward page="registro.jsp">
			<jsp:param name="ingreso" value="Las contraseñas no coinciden" />
			</jsp:forward>
		<%
	}
	
	 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>