<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="member.BoardBean" %>
<%@ page import="member.RegisterBean" %>
<%@ page import="member.ReplyBean" %>

<% request.getParameter("UTF-8"); %>

<jsp:useBean class="member.BoardMgr" id="bodMgr" scope="session" />
<jsp:useBean class="member.ReplyMgr" id="repMgr" scope="session" />

<%
	String admin = (String)session.getAttribute("LoginState");
	RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo");
	int no = Integer.parseInt((String)request.getParameter("OPB_No"));
	BoardBean rb = bodMgr.searchBoard(no);
	rb.setBoardContent(rb.getBoardContent().replace("\r\n", "<br>"));

	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	List<ReplyBean> rpList = repMgr.listReply(rb.getBoardNo());
	String replyState = (String)request.getParameter("R_State");
%>

<% if(admin == null) { %>
	<script>
		alert('로그인 시 이용 가능합니다.');
		history.back();
	</script>
<%} else {
	String inq = (String)request.getParameter("inq");
	if(inq == null) { }
	else if(inq.equals("up")) {
		bodMgr.updateBoard(no, rb.getBoardInquiry() + 1, rb.getBoardReport(), rb.getBoardDate());
	}
%>
<section>
	<div id="OpenBoard_Container">
		<div class="OpenBoard_Content">
			<div class="Board_Top">
				<div id="Board_C_Id">작성자 : <%=rb.getBoardId() %></div> | 
				<div id="Board_C_Time">작성 시간 : <%=dateformat.format(rb.getBoardDate()) %></div> | 
				<div id="Board_C_Inquiry">조회수 : <%=rb.getBoardInquiry() %></div> |
				<div id="Board_C_Report">신고수 : <%=rb.getBoardReport() %></div> 
				<% if(admin.equals("관리자") || rb.getBoardId().equals(lInfo.getMemberId())) { %>
						<input type="button" value="수정" onclick="location.href='Index.jsp?Module_PAGE=ModifyBoard.jsp?OPB_No=<%=rb.getBoardNo()%>'">
						<input type="button" value="삭제" onclick="location.href='MODULE/Board_controller.jsp?B_State=delete&OPB_No=<%=rb.getBoardNo()%>'"> | 
				<%	} %>
				<input type="button" value="신고" onclick="location.href='MODULE/Board_controller.jsp?B_State=report&OPB_No=<%=rb.getBoardNo()%>&inq=<%=rb.getBoardInquiry()%>&rep=<%=rb.getBoardReport()%>&ti=<%=rb.getBoardDate()%>'"><br>
				<div id="Board_C_Title">제목 : <%=rb.getBoardTitle() %></div>
			</div>
			
			<div class="Board_Body">
				<div id="Board_C_Content"><%=rb.getBoardContent() %></div>
			</div>
			
			<% if(replyState == null) { %>
				<form class="ReplyForm" method="post" action="MODULE/Reply_controller.jsp?R_State=write&bno=<%=rb.getBoardNo()%>">
					<textarea cols="145" rows="3" name="ReplyContent" style="margin-right:15px; resize:none;"></textarea>
					<input type="submit" value="작성" style="position:absolute; width:50px; height:48px; font-size:15pt;">
				</form>
			<% } else {
				int r_no = Integer.parseInt((String)request.getParameter("R_No"));
				ReplyBean rep = repMgr.selectReply(rb.getBoardNo(), r_no);
				rep.setReplyContent(rep.getReplyContent().replace("<br>", "\r\n"));
			%>
				<form class="ReplyForm" method="post" action="MODULE/Reply_controller.jsp?R_State=modify&bno=<%=rb.getBoardNo()%>&rno=<%=rep.getReplyNo() %>&ti=<%=rep.getReplyDate()%>">
					<textarea cols="145" rows="3" name="ReplyContent" style="margin-right:15px; resize:none;"><%=rep.getReplyContent() %></textarea>
					<input type="submit" value="수정" style="position:absolute; width:50px; height:48px; font-size:15pt;">
				</form>
			<% } %>
			
			<% for(int i = 0; i < rpList.size(); i++) { 
					ReplyBean rep = rpList.get(i);
					rep.setReplyContent(rep.getReplyContent().replace("\r\n", "<br>"));
			%>
				<div class="Reply_Body">
					<div class="Reply_head">
						<span style="font-weight:bold;">작성자 : <%=rep.getReplyId() %></span>
						<span style="disply:inline-block; color:gray; font-size:9pt;"><%=dateformat.format(rep.getReplyDate()) %></span>
					</div>
					<div class="Reply_btn">
						<% if(admin.equals("관리자") || rep.getReplyId().equals(lInfo.getMemberId())) { %>
							<input type="button" value="수정" onclick="location.href='Index.jsp?Module_PAGE=OpenBoardContent.jsp&OPB_No=<%=rb.getBoardNo() %>&R_State=modify&R_No=<%=rep.getReplyNo() %>'">
							<input type="button" value="삭제" onclick="location.href='MODULE/Reply_controller.jsp?R_State=delete&bno=<%=rb.getBoardNo()%>&rno=<%=rep.getReplyNo()%>'"> | 
						<% } %>
						<input type="button" value="신고" onclick="location.href='MODULE/Reply_controller.jsp?R_State=report&bno=<%=rb.getBoardNo()%>&rno=<%=rep.getReplyNo()%>&ti=<%=rep.getReplyDate()%>&rp=<%=rep.getReplyReport()%>'">
					</div>
					
					<div class="Reply_content">
						<%=rep.getReplyContent() %>
					</div>
				</div>
			<%} %>
		</div>
	</div>
</section>
<%} %>