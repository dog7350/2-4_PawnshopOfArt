<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.RegisterBean" %>

<%
	if(session.getAttribute("LoginKeep") == null) {
		session.removeAttribute("LoginState");
		session.removeAttribute("LoginKeep");
		session.removeAttribute("LoginInfo");
		session.removeAttribute("LoginId");
		session.removeAttribute("LoginPw");
	} else {
		session.removeAttribute("LoginState");
		session.removeAttribute("LoginInfo");
	}

	response.sendRedirect("../Index.jsp");
%>