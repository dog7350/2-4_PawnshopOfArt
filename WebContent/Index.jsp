<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
    
<%
	String AP = request.getParameter("Admin_PAGE");
	String MP = request.getParameter("Module_PAGE");
	if(MP == null) MP="MAIN.jsp";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1">
		
		<link type="text/css" rel="stylesheet" href="CSS\top.css?after">
		<link type="text/css" rel="stylesheet" href="CSS\usermenu.css?after">
		<link type="text/css" rel="stylesheet" href="CSS\main.css?after">
		<link type="text/css" rel="stylesheet" href="CSS\footer.css?after">
		
		<link type="text/css" rel="stylesheet" href="CSS\join.css?after">
		<link type="text/css" rel="stylesheet" href="CSS\openboard.css?after">
		<link type="text/css" rel="stylesheet" href="CSS\openboard_insert.css?after">
		<link type="text/css" rel="stylesheet" href="CSS\albumboard.css?after">
		
		<link type="text/css" rel="stylesheet" href="CSS\MyPage_main.css?after">
		
		<link type="text/css" rel="stylesheet" href="CSS\ADMIN_main.css?after">
		<link type="text/css" rel="stylesheet" href="CSS\ADMIN_memberdb.css?after">
		
		<script src="JS\jquerymin.js"></script>
		<script src="JS\ImgChange.js"></script>
		<script src="JS\RollingBanner.js"></script>
		<title>예술의 전당포</title>
	</head>
	
	
	<body>
		<div id="Top">
			<jsp:include page="MODULE/USERMENU.jsp" flush="false" />
			
			<div id="TopBody">
				<%if(AP == null) {%>
					<jsp:include page="MODULE/TOP.jsp" flush="false" />
				<%} else { %>
					<jsp:include page="ADMIN/A_TOP.jsp" flush="false" />
				<%} %>

				<%if(AP == null) { %>
				<jsp:include page='<%="MODULE/" + MP %>' flush="false" />
				<%} else { %>
				<jsp:include page='<%="ADMIN/" + AP %>' flush="false" />
				<%} %>
			</div>
		</div>
		
		<jsp:include page="MODULE/BOTTOM.jsp" flush="false" />
	</body>
</html>