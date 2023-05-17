<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.BoardBean" %>

<% request.getParameter("UTF-8"); %>

<jsp:useBean class="member.BoardMgr" id="bodMgr" scope="session" />

<%
	String admin = (String)session.getAttribute("LoginState");
	int no = Integer.parseInt((String)request.getParameter("OPB_No"));
	BoardBean rb = bodMgr.searchBoard(no);
	rb.setBoardContent(rb.getBoardContent().replace("<br>", "\r\n"));
%>

<section>
	<div id="OpenBoard_Container">
		<div class="OpenBoard_Content">
			<h1 style="margin-top:15px;">자유 게시판</h1>
			<div class="formdiv">
				<form id="boardform" method="post" action="MODULE/Board_controller.jsp?B_State=modify&OPB_No=<%=rb.getBoardNo()%>&ti=<%=rb.getBoardDate()%>">
					<% if(admin.equals("관리자")) {%>
							제목 : <input type="text" size="88" name="BoardTitle" value="<%=rb.getBoardTitle() %>">
							<select name="B_Notice" style="font-size:16pt;">
								<option>일반</option>
								<option>공지</option>
							</select>
						<%} else { %>
							제목 : <input type="text" size=95 name="BoardTitle" value="<%=rb.getBoardTitle() %>">
						<%} %>
					<textarea cols="104" rows="100" name="BoardContent"><%=rb.getBoardContent() %></textarea><br>
					<input type="button" value="취소" onclick="history.back()">
					<input type="submit" value="완료" onclick="return confirm('수정하시겠습니까?')">
				</form>
			</div>
		</div>
	</div>
</section>