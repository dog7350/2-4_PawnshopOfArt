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

	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	List<QnaBean> qaList = qaMgr.listQna();
%>

<% if(admin == null) { %>
	<script>
		alert('로그인 시 이용 가능합니다.');
		history.back();
	</script>
<% } else { %>
<section>
	<div id="OpenBoard_Container">
		<div class="OpenBoard_Content">
			<h1 style="margin-top:15px;">Q & A</h1>
			<div class="OpenBoard_Board">
				<input type="button" value="글 쓰기" onclick="location.href='Index.jsp?Module_PAGE=InsertQna.jsp'" style="float:right;"><br>
				<TABLE class="OpenBoard_Table" border="2">
					<thead bgcolor="#d5d5d5">
						<th width="40">번호</th>
						<th>제목</th>
						<th width="140">작성자</th>
						<th width="150">작성시간</th>
					</thead>
					<tbody>
						<% for(int i = 0; i < qaList.size(); i++) { 
							QnaBean qa = qaList.get(i);
						%>
							<tr>
								<td><%=qa.getQ_BoardNo()%></td>
								<td>
									<a href="Index.jsp?Module_PAGE=QnaContent.jsp&QAB_No=<%=qa.getQ_BoardNo()%>"  style="color:black;">
										<%=qa.getQ_BoardTitle()%>
									</a>
								</td>
								<td><%=qa.getQ_UserId() %></td>
								<td><%=dateformat.format(qa.getQ_Date()) %></td>
							</tr>
						<%} %>
					</tbody>
				</TABLE>
			</div>
		</div>
	</div>
</section>
<% } %>