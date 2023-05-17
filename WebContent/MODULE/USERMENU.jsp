<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.RegisterBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo");
	String profile = null; String lid = null; int cash = 0;
		
	String state = (String)session.getAttribute("LoginState");
	String idkep = (String)session.getAttribute("LoginKeep");
	String id = (String)session.getAttribute("LoginId");
	String pw = (String)session.getAttribute("LoginPw");
	
	String idStr = null; String pwStr = null; String idk = null;
	
	if(idkep == null) {
		idStr = ""; pwStr = ""; idk = "";
	} else {
		idStr = id; pwStr = pw; idk = "checked";
	}
	
	if(state == null) {
%>
<div id="UserMenu">
	<a href="Index.jsp"><img id="UserMenuLogo" src="IMG/Logo.png" alt="예술의 전당포"></a><br>
	<form method=post action="MODULE/Login_controller.jsp">
		<input type="text" size="15" name="id" placeholder="ID" value=<%=idStr %>><br>
		<input type="password" size="15" name="pw" placeholder="PW" value=<%=pwStr %>><br>
		<input type="submit" id="Login_Btn" value=""><br>
		<input type="checkbox" name="idSAVE" <%=idk %>>아이디 저장<br>
		<a href="Index.jsp?Module_PAGE=JOIN.jsp"><input type="button" id="Join_Btn"></a><br>
		<input type="button" id="IDPW_Search"><br>
	</form>
</div>
<% } else if(state.equals("관리자")) {
	if(lInfo == null) { %>
		<script>
			location.href="MODULE/Logout_controller.jsp";
		</script>
	<% } else {
		profile = lInfo.getMemberProfile();
		lid = lInfo.getMemberId();
		cash = lInfo.getMemberCash();
	}
%>
<div id="UserMenu">
	<a href="Index.jsp"><img id="UserMenuLogo" src="IMG/Logo.png" alt="예술의 전당포"></a><br>
	<form method=post action="#">
		<img src="DATA-FILE/<%=profile%>" width="140" height="140">
		<p style="font-weight:bold;"><%=lid%>님</p>
		<p>보유 캐시 : <%=cash%></p>
		<a href="Index.jsp?Admin_PAGE=A_MAIN.jsp" style="color:black;">관리자페이지</a><br>
		<a href="Index.jsp?Module_PAGE=MyPage_MAIN.jsp" style="color:black;">마이페이지</a><br>
		<a href="MODULE/Logout_controller.jsp" style="color:black;">로그아웃</a>
	</form>
</div>
<%}	else {
	if(lInfo == null) { %>
		<script>
			location.href="MODULE/Logout_controller.jsp";
		</script>
	<% } else {
		profile = lInfo.getMemberProfile();
		lid = lInfo.getMemberId();
		cash = lInfo.getMemberCash();
	}
%>
<div id="UserMenu">
	<a href="Index.jsp"><img id="UserMenuLogo" src="IMG/Logo.png" alt="예술의 전당포"></a><br>
	<form method=post action="#">
		<img src="DATA-FILE/<%=profile%>" width="140" height="140">
		<p style="font-weight:bold;"><%=lid%>님</p>
		<p>보유 캐시 : <%=cash%></p>
		<a href="Index.jsp?Module_PAGE=MyPage_MAIN.jsp" style="color:black;">마이페이지</a><br>
		<a href="MODULE/Logout_controller.jsp" style="color:black;">로그아웃</a>
	</form>
</div>
<% } %>