<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  session='true' import='com.seguridad.*' import='com.negocio.*' 
    import='java.util.List' import='java.util.ArrayList'%>

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
%>
<%
	Alimento al = new Alimento();
	Donacion don = new Donacion();
	Fundacion fun = new Fundacion();
	int id_fun = Integer.valueOf(request.getParameter("id_fundacion"));
	int productos_disponibles = al.countAlimentos(id_fun) ;
	ArrayList<Integer> listadoProductosCantidad = new ArrayList<Integer>();
	ArrayList<Integer> listadoId = new ArrayList<Integer>();
	ArrayList<String> listadoProductos = new ArrayList<String>();
	List<Boolean> funciona = new  ArrayList<Boolean>();
	int auxiliar = 0;
	for(int i=0; i<productos_disponibles; i++)
	{
		if(Integer.valueOf(request.getParameter("cantidad_producto"+(i+1)))!=0)
		{
			String aux = "cantidad_producto"+(i+1);
			listadoProductosCantidad.add(Integer.valueOf(request.getParameter("cantidad_producto"+(i+1))));
			listadoId.add(i+1);
			auxiliar++;
		}
	}
	
	for(int n:listadoId)
	{
		listadoProductos.add(request.getParameter("valorCelda"+(n)));
	}
	for(int j=0; j<auxiliar; j++)
	{
		int id_donacion = don.getNewIdDonacion();
		boolean f = don.ingresarDonacion(id_donacion, id, Integer.valueOf(listadoProductos.get(j)), listadoProductosCantidad.get(j));
		fun.editarStock(listadoProductosCantidad.get(j), Integer.valueOf(listadoProductos.get(j)));
		funciona.add(f);
	}
	boolean resultado=true;
	for(boolean x:funciona)
	{
		resultado=resultado&&x;
	}
	String msg="";
	if(resultado)
		msg="¡Donación Realizada!";
	else
		msg="¡Donación Incorrecta!";
	 %>
		<jsp:forward page="menu_donador.jsp">
		<jsp:param name="resultado" value="<%=msg%>" />
		</jsp:forward>
	<%
	
	
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