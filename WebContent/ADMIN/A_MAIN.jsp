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
	List<BoardBean> inOpB = bodMgr.adminInqRepBoard("조회");
	List<BoardBean> rpOpB = bodMgr.adminInqRepBoard("신고");
	List<AlbumBean> inAlB = albMgr.adminInqRepAlbum("조회");
	List<AlbumBean> rpAlB = albMgr.adminInqRepAlbum("신고");
	
	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<section>
	<div id="ADMIN_Container">
		<div class="ADMIN_Content">
			<H1 style="margin-top:15px; margin-bottom:20px; border-bottom:3px solid #d5d5d5;">예술의 전당포 관리실</H1>
			<section>
				<div id="OpenBoard_Container">
					<div class="OpenBoard_Content">
						<h1 style="margin-top:15px;">자유 게시판 조회수 TOP 5</h1>
						<div class="OpenBoard_Board">
							<TABLE class="OpenBoard_Table" border="2">
								<thead bgcolor="#d5d5d5">
									<th width="40">번호</th>
									<th>제목</th>
									<th width="140">작성자</th>
									<th width="150">작성시간</th>
									<th width="60">조회수</th>
									<th width="60">신고수</th>
								</thead>
								<tbody>
									<% for(int i = 0; i < inOpB.size(); i++) { 
										BoardBean inquiry = inOpB.get(i);
									%>
										<tr>
											<td><%=inquiry.getBoardNo() %></td>
											<td>
												<a href="MODULE/Board_controller.jsp?OPB_No=<%=inquiry.getBoardNo()%>&B_State=detail">
													<%=inquiry.getBoardTitle() %>
												</a>
											</td>
											<td><%=inquiry.getBoardId() %></td>
											<td><%=dateformat.format(inquiry.getBoardDate()) %></td>
											<td><%=inquiry.getBoardInquiry() %></td>
											<td><%=inquiry.getBoardReport() %></td>
										</tr>
									<%} %>
								</tbody>
							</TABLE>
						</div>
					</div>
					
					<div class="OpenBoard_Content">
						<h1 style="margin-top:15px;">자유 게시판 신고수 TOP 5</h1>
						<div class="OpenBoard_Board">
							<TABLE class="OpenBoard_Table" border="2">
								<thead bgcolor="#d5d5d5">
									<th width="40">번호</th>
									<th>제목</th>
									<th width="140">작성자</th>
									<th width="150">작성시간</th>
									<th width="60">조회수</th>
									<th width="60">신고수</th>
								</thead>
								<tbody>
									<% for(int i = 0; i < rpOpB.size(); i++) { 
										BoardBean repot = rpOpB.get(i);
									%>
										<tr>
											<td><%=repot.getBoardNo() %></td>
											<td>
												<a href="MODULE/Board_controller.jsp?OPB_No=<%=repot.getBoardNo()%>&B_State=detail">
													<%=repot.getBoardTitle() %>
												</a>
											</td>
											<td><%=repot.getBoardId() %></td>
											<td><%=dateformat.format(repot.getBoardDate()) %></td>
											<td><%=repot.getBoardInquiry() %></td>
											<td><%=repot.getBoardReport() %></td>
										</tr>
									<%} %>
								</tbody>
							</TABLE>
						</div>
					</div>
					
					<!-- 자유 게시판 -->
					
					<div class="OpenBoard_Content">
						<h1 style="margin-top:15px;">앨범 게시판 조회수 TOP 5</h1>
						<div class="OpenBoard_Board">
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
									<% for(int i = 0; i < inAlB.size(); i++) { 
										AlbumBean ab = inAlB.get(i);
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
					
					<div class="OpenBoard_Content">
						<h1 style="margin-top:15px;">앨범 게시판 신고수 TOP 5</h1>
						<div class="OpenBoard_Board">
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
									<% for(int i = 0; i < inAlB.size(); i++) { 
										AlbumBean abrp = rpAlB.get(i);
									%>
										<tr>
											<td><%=abrp.getAlbumNo() %></td>
											<td>
												<a href="MODULE/Album_controller.jsp?ALB_No=<%=abrp.getAlbumNo()%>&A_State=detail"  style="color:black;">
													<%=abrp.getAlbumTitle() %>
												</a>
											</td>
											<td><%=abrp.getAlbumId() %></td>
											<td><%=dateformat.format(abrp.getAlbumDate()) %></td>
											<td><%=abrp.getAlbumGenre()%></td>
											<td><%=abrp.getAlbumArtist()%></td>
											<td><%=abrp.getAlbumInquiry() %></td>
											<td><%=abrp.getAlbumReport() %></td>
										</tr>
									<%} %>
								</tbody>
							</TABLE>
						</div>
					</div>
				</div>
			</section>
			
		</div>
	</div>
</section>