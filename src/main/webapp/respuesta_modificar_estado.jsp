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
	boolean res=false;
	int cod_donacion = Integer.parseInt(request.getParameter("codigo"));
	Donacion don = new Donacion();
	don.setAllInfo(cod_donacion);
	String beneficiado = request.getParameter("nombre_ben");
	int estado_don = Integer.valueOf(request.getParameter("cmbEstado"));
	res = don.editarInfo(beneficiado, estado_don);
	if(estado_don == 3)
	{
		res = res && don.editarFecha();
	}
	if(estado_don == 2)
	{
		res = res && don.editarFecha2();

	}
	if(res)
     	response.sendRedirect("actualizar_info.jsp?mensaje=actualizado");
	else
        response.sendRedirect("actualizar_info.jsp?mensaje=error_act");

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