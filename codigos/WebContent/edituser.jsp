<%@page import="com.pit.dao.UserDao"%>

<jsp:useBean id="u" class="com.pit.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%
	int i = UserDao.update(u);
	response.sendRedirect("edituser-success.jsp");
%>
