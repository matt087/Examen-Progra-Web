<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session='true'%>
<%
	HttpSession sesionOk = request.getSession();
	sesionOk.invalidate();
	response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session='true'%>
<%
	HttpSession sesionOk = request.getSession();
	sesionOk.invalidate();
	response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
>>>>>>> a88634466ce084510872f8b5cf5d98fdefd08a4c
</html>