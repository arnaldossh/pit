<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body>
	<%@page import="com.pit.dao.UserDao,com.pit.bean.User"%>
	<jsp:include page="header.html"></jsp:include>
	<%
		String id = request.getParameter("id");
		User u = UserDao.getRecordById(Integer.parseInt(id));
	%>
<%System.out.println("user:"+u); %>
	<h1>Alteração de Cliente</h1>
	<form action="edituser.jsp" method="post">
		<input type="hidden" name="id" value="<%=u.getId()%>" />
		<table style="width: 25%">
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" value="<%=u.getName()%>" required="required"/> *</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"
					value="<%=u.getPassword()%>"  required="required"/> *</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" value="<%=u.getEmail()%>"  required="required"/> *</td>
			</tr>
			<tr>
				<td>Sex:</td>
				<td><input type="radio" name="sex" value="Masculino" <%=u.getSex().equals("Masculino")?"checked":""%> />Masculino 
				    <input type="radio" name="sex" value="Feminino" <%=u.getSex().equals("Feminino")?"checked":""%>/>Feminino</td>
			</tr>

			<tr>
				<td>Endereço:</td>
				<td><input type="text" name="address" value="<%=u.getAddress()%>" required="required" /> *</td>
			</tr>
			<tr>
				<td>CEP:</td>
				<td><input type="number" name="cep" value="<%=u.getCep()%>" required="required"
					onkeypress="return event.charCode>=48 && event.charCode<=57" /> *</td>
			</tr>
			<tr>
				<td>Telefone:</td>
				<td><input type="number" name="phone" value="<%=u.getPhone()%>" required="required"
					onkeypress="return event.charCode>=48 && event.charCode<=57" /> *</td>
			</tr>
			<tr>
				<td>CPF:</td>
				<td><input type="number" name="cpf" required="required" value="<%=u.getCpf()%>" 
					onkeypress="return event.charCode>=48 && event.charCode<=57" /> *</td>
			</tr>
			<tr>
				<td>Nascimento:</td>
				<td><input type="date" name="birthdate" value="<%=u.getBirthdate()%>" 
					placeholder="DD/MM/YYYY" required
					pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" title="MM/DD/AAAA" /> *</td>
			</tr>


			<tr>
				<td colspan="2"><input class="button" type="submit" value="Alterar" />
				<a class="button button2" href="index.jsp">Sair</a>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
