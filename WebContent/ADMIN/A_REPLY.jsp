<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="member.RegisterBean" %>
<%@ page import="member.BoardBean" %>
<%@ page import="member.AlbumBean" %>
<%@ page import="member.ReplyBean" %>
<%@ page import="member.A_ReplyBean" %>

<jsp:useBean class="member.BoardMgr" id="bodMgr" scope="session" />
<jsp:useBean class="member.AlbumMgr" id="albMgr" scope="session" />
<jsp:useBean class="member.ReplyMgr" id="repMgr" scope="session" />
<jsp:useBean class="member.A_ReplyMgr" id="arepMgr" scope="session" />

<%
	RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo");
	if(session.getAttribute("LoginState") == null) { %>
		<script>
			alert("로그인 후 이용하세요.");
			location.href="Index.jsp";
		</script>
	<%}
	if(lInfo.getMemberAdmin().equals("no")) { %>
		<script>
			alert("관리자가 아닙니다.");
			location.href="Index.jsp";
		</script>
	<%}
%>

<%
	String searchOption = (String)request.getParameter("select");
	String searchText = (String)request.getParameter("search");
	
	List<ReplyBean> rpList = repMgr.searchReplyList(searchOption, "%" + searchText + "%");
	
	List<A_ReplyBean> arpList = arepMgr.searchA_ReplyList(searchOption, "%" + searchText + "%");
	
	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<div class="ADMIN_Container">
	<div id="Left_OpenBoard">
		<h1 style="margin-top:15px;">자유 게시판 댓글</h1>
		<div class="ADMIN_OpenBoard_Board">
			<TABLE class="ADMIN_OpenBoard_Table" border="2">
				<thead bgcolor="#d5d5d5">
					<th width="60">글번호</th>
					<th>내용</th>
					<th width="140">작성자</th>
					<th width="150">작성시간</th>
					<th width="60">신고수</th>
					<th width="60">삭제</th>
				</thead>
				<tbody>
					<% for(int i = 0; i < rpList.size(); i++) { 
						ReplyBean rp = rpList.get(i);
						BoardBean rb = bodMgr.searchBoard(rp.getBoardNo());
					%>
						<tr>
							<td>
								<a href="MODULE/Board_controller.jsp?OPB_No=<%=rb.getBoardNo()%>&B_State=detail"  style="color:black;">
									<%=rb.getBoardNo() %>
								</a>
							</td>
							<td><%=rp.getReplyContent()%></td>
							<td><%=rp.getReplyId()%>
							<td><%=dateformat.format(rp.getReplyDate()) %></td>
							<td><%=rp.getReplyReport() %></td>
							<td>
								<form method=post action="MODULE/Reply_controller.jsp?R_State=adelete&bno=<%=rb.getBoardNo()%>&rno=<%=rp.getReplyNo()%>">
									<input type="submit" value="삭제" style="width:100%; heihgt:100%; border:none;">
								</form>
							</td>
						</tr>
					<%} %>
				</tbody>
			</TABLE>
		</div>
	</div>
	<div id="Right_AlbumBoard">
		<h1 style="margin-top:15px;">앨범 게시판 댓글</h1>
		<div class="ADMIN_OpenBoard_Board">
			<TABLE class="ADMIN_OpenBoard_Table" border="2">
				<thead bgcolor="#d5d5d5">
					<th width="60">글번호</th>
					<th>내용</th>
					<th width="140">작성자</th>
					<th width="150">작성시간</th>
					<th width="60">신고수</th>
					<th width="60">삭제</th>
				</thead>
				<tbody>
					<% for(int i = 0; i < arpList.size(); i++) { 
						A_ReplyBean arp = arpList.get(i);
						AlbumBean alb = albMgr.searchAlbum(arp.getAlbumNo());
					%>
						<tr>
							<td>
								<a href="MODULE/Album_controller.jsp?ALB_No=<%=alb.getAlbumNo()%>&A_State=detail"  style="color:black;">
									<%=alb.getAlbumNo() %>
								</a>
							</td>
							<td><%=arp.getA_ReplyContent()%></td>
							<td><%=arp.getA_ReplyId()%></td>
							<td><%=dateformat.format(arp.getA_ReplyDate()) %></td>
							<td><%=arp.getA_ReplyReport()%></td>
							<td>
								<form method=post action="MODULE/A_Reply_controller.jsp?R_State=adelete&bno=<%=alb.getAlbumNo()%>&rno=<%=arp.getA_ReplyNo()%>">
									<input type="submit" value="삭제" style="width:100%; heihgt:100%; border:none;">
								</form>
							</td>
						</tr>
					<%} %>
				</tbody>
			</TABLE>
		</div>
	</div>
</div>