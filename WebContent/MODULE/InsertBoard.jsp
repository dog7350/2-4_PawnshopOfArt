<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String admin = (String)session.getAttribute("LoginState");
%>

<% if(admin == null) { %>
	<script>
		alert('로그인 시 이용 가능합니다.');
		history.back();
	</script>
<%} else {%>
	<section>
		<div id="OpenBoard_Container">
			<div class="OpenBoard_Content">
				<h1 style="margin-top:15px;">자유 게시판</h1>
				<div class="formdiv">
					<form id="boardform" method="post" action="MODULE/Board_controller.jsp?B_State=write">
						<% if(admin.equals("관리자")) {%>
							제목 : <input type="text" size="88" name="BoardTitle">
							<select name="B_Notice" style="font-size:16pt;">
								<option>일반</option>
								<option>공지</option>
							</select>
						<%} else { %>
							제목 : <input type="text" size=95 name="BoardTitle">
						<%} %>
						<textarea cols="104" rows="100" name="BoardContent"></textarea><br>
						<input type="button" value="취소" onclick="history.back()">
						<input type="submit" value="완료">
					</form>
				</div>
			</div>
		</div>
	</section>
<%} %>