<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  session='true' import='com.seguridad.*' import='com.negocio.*'%>

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
	 Usuario us = new Usuario();
	 String per_name = us.setNombreId(perfil);
	 String [] info = us.getInfo(id);
%>
<%
	int valor = Integer.parseInt(request.getParameter("codigo"));
	String nombre_pro = request.getParameter("nombre");
	Fundacion fun = new Fundacion();
 	boolean eliminado = fun.eliminarFundacion(valor);
 	if(eliminado)
     	response.sendRedirect("registro_fundaciones.jsp?mensaje=eliminado");
 	else
    	response.sendRedirect("registro_fundaciones.jsp?mensaje=error");

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