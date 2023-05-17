<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.RegisterBean" %>
<%@ page import="member.RegisterMgr" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String id = request.getParameter("id");
	String admin = request.getParameter("admin");
	String stop = request.getParameter("stop");
	
	RegisterMgr rm = new RegisterMgr();
	
	if(stop == null) {
		if(admin.equals("yes")) {%>
			<script>
				alert("관리자는 강퇴할 수 없습니다.");
				history.back();
			</script>
		<%} else {
			if(rm.memberDelete(id) == 0) { %>
				<script>
					alert("강퇴 실패");
					history.back();
				</script>
			<%} else { %>
				<script>
					alert("강퇴 성공");
					location.href="Index.jsp?Admin_PAGE=A_MEMBERDB.jsp";
				</script>
			<%}
		}
	} else {
		if(admin.equals("yes")) {%>
			<script>
				alert("관리자는 정지할 수 없습니다.");
				history.back();
			</script>
		<%} else {
			if(rm.memberStop(id, stop) == 0) { %>
				<script>
					alert("정지 실패");
					history.back();
				</script>
			<%} else { %>
				<script>
					<%if(stop.equals("no")) {%>
						alert("정지 성공");
					<%} else {%>
						alert("정지 해제");
					<%} %>
					location.href="Index.jsp?Admin_PAGE=A_MEMBERDB.jsp";
				</script>
			<%}
		}
	}
%>