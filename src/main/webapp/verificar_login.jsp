<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.seguridad.*'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Usuario usuario = new Usuario();
		String nlogin = request.getParameter("usuario");
		String nclave = request.getParameter("clave");
		HttpSession sesion = request.getSession();
		boolean respuesta = usuario.verificarUsuario(nlogin, nclave);
		if (respuesta) 
		{
			sesion.setAttribute("id", usuario.getId());
			sesion.setAttribute("usuario", usuario.getNombre());
			sesion.setAttribute("perfil", usuario.getPerfil());
			if(usuario.getPerfil()==2)
				response.sendRedirect("menu_donador.jsp"); 
			if(usuario.getPerfil()==1)
				response.sendRedirect("menu_admin.jsp"); 
		} 
		else 
		{
			%>
			<jsp:forward page="login.jsp">
				<jsp:param name="error"
					value="Datos incorrectos" />
			</jsp:forward>
			<script src='scripts/login.js'></script>
			<%
		}
	%>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.seguridad.*'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Usuario usuario = new Usuario();
		String nlogin = request.getParameter("usuario");
		String nclave = request.getParameter("clave");
		HttpSession sesion = request.getSession();
		boolean respuesta = usuario.verificarUsuario(nlogin, nclave);
		if (respuesta) 
		{
			sesion.setAttribute("usuario", usuario.getNombre());
			sesion.setAttribute("perfil", usuario.getPerfil());
			sesion.setAttribute("nombre", usuario.getNombre()); 
			if(usuario.getPerfil()==2)
				response.sendRedirect("menu_donador.jsp"); 
			if(usuario.getPerfil()==1)
				response.sendRedirect("menu_admin.jsp"); 
		} 
		else 
		{
			%>
			<jsp:forward page="login.jsp">
				<jsp:param name="error"
					value="Datos incorrectos" />
			</jsp:forward>
			<script src='scripts/login.js'></script>
			<%
		}
	%>
</body>
>>>>>>> a88634466ce084510872f8b5cf5d98fdefd08a4c
</html>