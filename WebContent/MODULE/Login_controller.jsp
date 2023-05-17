<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ page import="member.RegisterBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />

<%
	String loginid = (String)request.getParameter("id");
	String loginpw = (String)request.getParameter("pw");
	
	RegisterBean rb = regMgr.memberLogin(loginid);
	String loginadmin = rb.getMemberAdmin();
	
	if(loginid.equals(rb.getMemberId())) {
		if (loginpw.equals(rb.getMemberPw())) {
			if(rb.getMemberStop().equals("no")){
				if(request.getParameter("idSAVE") == null) {
					session.removeAttribute("LoginKeep");
				} else {
					session.setAttribute("LoginKeep", "check");
					session.setAttribute("LoginId", rb.getMemberId());
					session.setAttribute("LoginPw", rb.getMemberPw());
				}
				
				if(loginadmin.equals("yes")) {
					session.setAttribute("LoginState", "관리자");
				} else {
					session.setAttribute("LoginState", "True");
				}
				
				session.setAttribute("LoginInfo", rb);
				response.sendRedirect("../Index.jsp");
			} else if (rb.getMemberStop().equals("yes")) {%>
				<script>
					alert("계정이 정지되어있습니다.\n관리자에게 문의하세요.");
					history.back();
				</script>
			<%}
		} else { %>
			<script>
				alert("패스워드가 틀립니다.");
				history.back();
			</script>
		<% }
	} else { %>
		<script>
			alert("아이디 또는 패스워드가 틀립니다.");
			history.back();
		</script>
	<% }
%>