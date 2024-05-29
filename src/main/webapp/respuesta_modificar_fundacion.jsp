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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int cod = Integer.parseInt(request.getParameter("codigo"));
	String nombre = request.getParameter("nombre");
	String telef = request.getParameter("telef");
	String direccion = request.getParameter("direccion");
	String repre = request.getParameter("repre");
	Fundacion fun = new Fundacion(cod,nombre,telef,direccion,repre);
	boolean actualizado = fun.editarInfo(fun);
	if(actualizado)
     	response.sendRedirect("registro_fundaciones.jsp?mensaje=actualizado");
	else
        response.sendRedirect("registro_fundaciones.jsp?mensaje=error_act");
%>
</body>
</html>