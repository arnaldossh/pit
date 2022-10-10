<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
</head>
<body>

	<%@page import="com.pit.dao.UserDao,com.pit.bean.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="header.html"></jsp:include>
	
	<h1>Lista de Clientes</h1>

	<%
		List<User> list = UserDao.getAllRecords();
		request.setAttribute("list", list);
	%>

	<table border="1" width="90%">
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Senha</th>
			<th>E-mail</th>
			<th>Sexo</th>

			<th>Endereço</th>
			<th>Cep</th>
			<th>Fone</th>
			<th>CPF</th>
			<th>Nascimento</th>
			
			<th>Editar</th>
			<th>Deletar</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getId()}</td>
				<td>${u.getName()}</td>
				<td>${u.getPassword()}</td>
				<td>${u.getEmail()}</td>
				<td>${u.getSex()}</td>

				<td>${u.getAddress()}</td>
				<td>${u.getCep()}</td>
				<td>${u.getPhone()}</td>
				<td>${u.getCpf()}</td>
				<td>${u.getBirthdate()}</td>
				
				<td><a class="button button2" href="editform.jsp?id=${u.getId()}">Editar</a></td>
				<td><a class="button button3" href="deleteuser.jsp?id=${u.getId()}" onclick="return confirm('Confirma deleção do cliente?');">Remover</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
<!-- 	<a href="adduserform.jsp">Adicionar novo Cliente</a>
	<br>
	<a href="index.jsp">Página inicial</a>
 -->
	
	<a class="button" href="adduserform.jsp">Adicionar Cliente</a>
	<a class="button button5" href="search.jsp">Buscar Cliente</a>
</body>
</html>
