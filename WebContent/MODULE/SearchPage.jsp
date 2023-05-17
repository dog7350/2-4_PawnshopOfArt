<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="member.BoardBean" %>
<%@ page import="member.AlbumBean" %>

<jsp:useBean class="member.BoardMgr" id="bodMgr" scope="session" />
<jsp:useBean class="member.AlbumMgr" id="albMgr" scope="session" />

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String searchOption = (String)request.getParameter("select");
	String searchText = (String)request.getParameter("search");

	List<BoardBean> NOList = bodMgr.searchBoardList("yes", searchOption, "%" + searchText + "%");
	List<BoardBean> rbList = bodMgr.searchBoardList("no", searchOption, "%" + searchText + "%");
	
	List<AlbumBean> nalb = albMgr.searchAlbumList("yes", searchOption, "%" + searchText + "%");
	List<AlbumBean> alb = albMgr.searchAlbumList("no", searchOption, "%" + searchText + "%");

	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<section>
	<div id="OpenBoard_Container">
		<div class="OpenBoard_Content">
			<h1 style="margin-top:15px;">자유 게시판</h1>
			<div class="OpenBoard_Board">
				<input type="button" value="글 쓰기" onclick="location.href='Index.jsp?Module_PAGE=InsertBoard.jsp'" style="float:right;"><br>
				<TABLE class="OpenBoard_Table" border="2">
					<thead bgcolor="#d5d5d5">
						<th width="40">번호</th>
						<th>제목</th>
						<th width="140">작성자</th>
						<th width="140">작성시간</th>
						<th width="60">조회수</th>
						<th width="60">신고수</th>
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
								<td><%=nrb.getBoardInquiry() %></td>
								<td><%=nrb.getBoardReport() %></td>
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
								<td><%=rb.getBoardInquiry() %></td>
								<td><%=rb.getBoardReport() %></td>
							</tr>
						<%} %>
					</tbody>
				</TABLE>
			</div>
		</div>
		
		<div class="OpenBoard_Content">
			<h1 style="margin-top:15px;">앨범 게시판</h1>
			<div class="OpenBoard_Board">
				<input type="button" value="글 쓰기" onclick="location.href='Index.jsp?Module_PAGE=InsertAlbum.jsp'" style="float:right;"><br>
				<TABLE class="OpenBoard_Table" border="2">
					<thead bgcolor="#d5d5d5">
						<th width="40">번호</th>
						<th>제목</th>
						<th width="140">작성자</th>
						<th width="150">작성시간</th>
						<th width="60">장르</th>
						<th width="150">아티스트</th>
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
								<td><%=nab.getAlbumInquiry() %></td>
								<td><%=nab.getAlbumReport() %></td>
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
								<td><%=ab.getAlbumInquiry() %></td>
								<td><%=ab.getAlbumReport() %></td>
							</tr>
						<%} %>
					</tbody>
				</TABLE>
			</div>
		</div>
	</div>
</section>