<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="member.RegisterBean" %>
<%@ page import="member.QnaBean" %>

<% request.getParameter("UTF-8"); %>

<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />
<jsp:useBean class="member.QnaMgr" id="qaMgr" scope="session" />

<%
	String admin = (String)session.getAttribute("LoginState");
	RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo");
	
	int b_no = Integer.parseInt((String)request.getParameter("QAB_No"));

	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	QnaBean qa = qaMgr.searchQna(b_no);
	List<QnaBean> qaList = qaMgr.listQna(b_no);
%>

<% if(admin == null) { %>
	<script>
		alert('로그인 시 이용 가능합니다.');
		history.back();
	</script>
<% } else if(admin.equals("관리자") || lInfo.getMemberId().equals(qa.getQ_UserId())) { %>
<section>
	<div id="OpenBoard_Container">
		<div class="OpenBoard_Content">
			<div class="Board_Top">
				<div id="Board_C_Id">작성자 : <%=qa.getQ_UserId()%></div> | 
				<div id="Board_C_Time">작성 시간 : <%=dateformat.format(qa.getQ_Date()) %></div>
				<% if(admin.equals("관리자")) { %>
						<input type="button" value="삭제" onclick="location.href='MODULE/Qna_controller.jsp?Q_State=delete&qno=<%=qa.getQ_BoardNo()%>'"> 
				<%	} %>
				<br>
				<div id="Board_C_Title">제목 : <%=qa.getQ_BoardTitle()%></div>
			</div>
			
			<div class="Board_Body">
				<div id="Board_C_Content"><%=qa.getQ_Content() %></div>
			</div>
			
			<form class="ReplyForm" method="post" action="MODULE/Qna_controller.jsp?Q_State=answer&qno=<%=qa.getQ_BoardNo()%>">
				<textarea cols="145" rows="3" name="AnswerContent" style="margin-right:15px; resize:none;"></textarea>
				<input type="submit" value="작성" style="position:absolute; width:50px; height:48px; font-size:15pt;">
			</form>
			
			<div class="AnswerDiv">
				<div class="Answer">
					<% for(int i = 0; i < qaList.size(); i++) {
						QnaBean an_q = qaList.get(i);
						if(an_q.getQ_UserId().equals("admin")) {
					%>
							<div class="ADMIN_A">
								<span style="font-size:9pt; color:gray;">(<%=an_q.getQ_Date()%>)</span>
								<span style="font-weight:bold;">관리자</span> : <%=an_q.getQ_Content()%>
							</div><br>
						<% } else { %>
							<div class="USER_A">
								<%=an_q.getQ_Content()%> : <span style="font-weight:bold;"><%=an_q.getQ_UserId()%></span>
								<span style="font-size:9pt; color:gray;">(<%=an_q.getQ_Date()%>)</span>
							</div><br>
						<% } %>
					<% } %>
				</div>
			</div>
		</div>
	</div>
</section>
<% } else { %>
	<script>
		alert('관리자나 작성자만 확인 가능합니다.');
		history.back();
	</script>
<% } %>