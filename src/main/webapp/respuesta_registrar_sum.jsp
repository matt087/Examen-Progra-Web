<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  session='true' import='com.negocio.*'%>

	<%
		int perfil = 0, id = 0, id_fund=0;
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
			 id_fund =  (Integer)sesion.getAttribute("fundacion");

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
		Alimento al = new Alimento();
		String nombre = request.getParameter("nombre");
		int id_alimento = al.getNewId();
		int id_fun_al = al.getNewIdRelacion();
		boolean ingreso = al.ingresarAlimento(id_alimento, nombre);
		boolean ingreso2 = al.ingresarAlimentoxFundacion(id_fun_al, id_alimento, id_fund);
		String msg="";
		if(ingreso&&ingreso2)
			msg="¡Inserción Correcta!";
		else
			msg="¡Inserción Incorrecta!";

		 %>
			<jsp:forward page="actualizar_suministros.jsp">
			<jsp:param name="resultado" value="<%=msg%>" />
			</jsp:forward>
		<%
	%>
</body>
</html>