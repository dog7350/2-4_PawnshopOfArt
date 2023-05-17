<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="member.RegisterBean" %>
<%@ page import="member.BoardBean" %>
<%@ page import="member.AlbumBean" %>

<% request.getParameter("UTF-8"); %>

<jsp:useBean class="member.BoardMgr" id="bodMgr" scope="session" />
<jsp:useBean class="member.AlbumMgr" id="albMgr" scope="session" />

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
	
	List<BoardBean> NOList = bodMgr.searchBoardList("yes", searchOption, "%" + searchText + "%");
	List<BoardBean> rbList = bodMgr.searchBoardList("no", searchOption, "%" + searchText + "%");
	
	List<AlbumBean> nalb = albMgr.searchAlbumList("yes", searchOption, "%" + searchText + "%");
	List<AlbumBean> alb = albMgr.searchAlbumList("no", searchOption, "%" + searchText + "%");
	
	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<div class="ADMIN_Container">
	<div id="Left_OpenBoard">
		<h1 style="margin-top:15px;">자유 게시판</h1>
		<div class="ADMIN_OpenBoard_Board">
			<TABLE class="ADMIN_OpenBoard_Table" border="2">
				<thead bgcolor="#d5d5d5">
					<th width="40">번호</th>
					<th>제목</th>
					<th width="140">작성자</th>
					<th width="150">작성시간</th>
					<th width="60">신고수</th>
					<th width="60">삭제</th>
				</thead>
				<tbody>
					<% for(int i = 0; i < NOList.size(); i++) { 
						BoardBean nrb = NOList.get(i);
					%>
						<tr>
							<td style="color:red; font-weight:bold;">공지</td>
							<td>
								<a href="MODULE/Board_controller.jsp?OPB_No=<%=nrb.getBoardNo()%>&B_State=detail" style="color:red; font-weight:bold;">
									<%=nrb.getBoardTitle() %>
								</a>
							</td>
							<td><%=nrb.getBoardId() %></td>
							<td><%=dateformat.format(nrb.getBoardDate()) %></td>
							<td><%=nrb.getBoardReport() %></td>
							<td>
								<form method=post action="MODULE/Board_controller.jsp?OPB_No=<%=nrb.getBoardNo()%>&B_State=adelete">
									<input type="submit" value="삭제" style="width:100%; heihgt:100%; border:none;">
								</form>
							</td>
						</tr>
					<%} %>
						
					<% for(int i = 0; i < rbList.size(); i++) { 
						BoardBean rb = rbList.get(i);
					%>
						<tr>
							<td><%=rb.getBoardNo() %></td>
							<td>
								<a href="MODULE/Board_controller.jsp?OPB_No=<%=rb.getBoardNo()%>&B_State=detail"  style="color:black;">
									<%=rb.getBoardTitle() %>
								</a>
							</td>
							<td><%=rb.getBoardId() %></td>
							<td><%=dateformat.format(rb.getBoardDate()) %></td>
							<td><%=rb.getBoardReport() %></td>
							<td>
								<form method=post action="MODULE/Board_controller.jsp?OPB_No=<%=rb.getBoardNo()%>&B_State=adelete">
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
		<h1 style="margin-top:15px;">앨범 게시판</h1>
		<div class="ADMIN_OpenBoard_Board">
			<TABLE class="ADMIN_OpenBoard_Table" border="2">
				<thead bgcolor="#d5d5d5">
					<th width="40">번호</th>
					<th>제목</th>
					<th width="140">작성자</th>
					<th width="150">작성시간</th>
					<th width="60">장르</th>
					<th width="80">아티스트</th>
					<th width="60">조회수</th>
					<th width="60">신고수</th>
				</thead>
				<tbody>
					<% for(int i = 0; i < nalb.size(); i++) { 
						AlbumBean nab = nalb.get(i);
					%>
						<tr>
							<td style="color:red; font-weight:bold;">공지</td>
							<td>
								<a href="MODULE/Album_controller.jsp?ALB_No=<%=nab.getAlbumNo()%>&A_State=detail" style="color:red; font-weight:bold;">
									<%=nab.getAlbumTitle() %>
								</a>
							</td>
							<td><%=nab.getAlbumId() %></td>
							<td><%=dateformat.format(nab.getAlbumDate()) %></td>
							<td><%=nab.getAlbumGenre()%></td>
							<td><%=nab.getAlbumArtist()%></td>
							<td><%=nab.getAlbumReport() %></td>
							<td>
								<form method=post action="MODULE/Album_controller.jsp?A_State=adelete&ALB_No=<%=nab.getAlbumNo()%>">
									<input type="submit" value="삭제" style="width:100%; heihgt:100%; border:none;">
								</form>
							</td>
						</tr>
					<%} %>
				
					<% for(int i = 0; i < alb.size(); i++) { 
						AlbumBean ab = alb.get(i);
					%>
						<tr>
							<td><%=ab.getAlbumNo() %></td>
							<td>
								<a href="MODULE/Album_controller.jsp?ALB_No=<%=ab.getAlbumNo()%>&A_State=detail"  style="color:black;">
									<%=ab.getAlbumTitle() %>
								</a>
							</td>
							<td><%=ab.getAlbumId() %></td>
							<td><%=dateformat.format(ab.getAlbumDate()) %></td>
							<td><%=ab.getAlbumGenre()%></td>
							<td><%=ab.getAlbumArtist()%></td>
							<td><%=ab.getAlbumReport() %></td>
							<td>
								<form method=post action="MODULE/Album_controller.jsp?A_State=adelete&ALB_No=<%=ab.getAlbumNo()%>">
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