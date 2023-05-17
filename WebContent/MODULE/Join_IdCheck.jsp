<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ page import="member.RegisterBean" %>

<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String id = (String)request.getParameter("id");

	RegisterBean rb = regMgr.memberLogin(id);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 중복 확인</title>
	</head>
	
	<body>
		<% if(id.equals(rb.getMemberId())) { %>
			중복인데예?
		<% } else { %>
			<script>
				window.opener.document.getElementById("mid").disabled = true;
				window.opener.document.getElementById("midc_btn").disabled = true;
				window.opener.document.getElementById("mid_check").value = "true";
				window.opener.document.getElementById("memid").value = "<%=id%>";
			</script>
			중복이 아닌데예?
		<% } %>
	</body>
</html>