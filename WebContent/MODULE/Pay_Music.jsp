<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.AlbumBean" %>
<%@ page import="member.RegisterBean" %>

<% request.getParameter("UTF-8"); %>

<jsp:useBean class="member.AlbumMgr" id="albMgr" scope="session" />
<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />

<%
	String admin = (String)session.getAttribute("LoginState");
	RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo");
	int no = Integer.parseInt((String)request.getParameter("ALB_No"));
	
	AlbumBean alb = albMgr.searchAlbum(no);
	
	if(admin == null) { %>
	<script>
		alert('로그인 시 이용 가능합니다.');
		history.back();
	</script>
	<% } else {
		if(lInfo.getMemberCash() < alb.getAlbumPrice()) { %>
			<script>
				alert("캐시가 모자랍니다.");
				history.back();
			</script>
		<% } else { %>
			<script type="text/javascript">
				url = "Payment.jsp?ALB_No=<%=no%>";
				window.open(url, "Payment", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=100");
				alert("결제 완료");
				location.href="MyPage_controller.jsp?st=cash&pay=minus&cs=<%=alb.getAlbumPrice()%>";
			</script>
		<% }
	}
%>