<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="member.AlbumBean" %>

<% request.getParameter("UTF-8"); %>

<jsp:useBean class="member.AlbumMgr" id="albMgr" scope="session" />

<%
	String genre = (String)request.getParameter("genre");

	List<AlbumBean> nalb;
	List<AlbumBean> alb;
	if(genre == null) {
		nalb = albMgr.listAlbum("yes", "None");
		alb = albMgr.listAlbum("no", "None");
	} else {
		nalb = albMgr.listAlbum("yes", "None");
		alb = albMgr.listAlbum("no", genre);
	}

	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<section>
	<div id="OpenBoard_Container">
		<div class="OpenBoard_Content">
			<%if(genre == null) {%>
				<h1 style="margin-top:15px;">앨범</h1>
			<%} else if(genre.equals("K-POP")) { %>
				<h1 style="margin-top:15px;">K-POP</h1>
			<%} else if(genre.equals("POP")) { %>
				<h1 style="margin-top:15px;">POP</h1>
			<%} else if(genre.equals("J-POP")) { %>
				<h1 style="margin-top:15px;">J-POP</h1>
			<%} %>
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