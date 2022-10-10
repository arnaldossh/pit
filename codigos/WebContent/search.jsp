<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.html"></jsp:include>

	<h2>Busca de Clientes</h2>

	<img src="images/looking-for2.jpg" width="200" height="200">
<br>
	<form action="searched.jsp" class="button">
		<label for="fname">Nome:</label>
		<input type="text" id="name" name="name">
	<input class="button button5" type="submit" value="Buscar">

	</form>


</body>
</html>