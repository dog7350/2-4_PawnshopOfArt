<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.RegisterBean" %>
<%@ page import="member.BoardBean" %>
<%@ page import="member.AlbumBean" %>

<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />
<jsp:useBean class="member.BoardMgr" id="bodMgr" scope="session" />
<jsp:useBean class="member.AlbumMgr" id="albMgr" scope="session" />

<%
	List<BoardBean> NOList = bodMgr.listBoard("yes");
	List<BoardBean> rbList = bodMgr.listBoard("no");

	List<AlbumBean> alb = albMgr.searchAlbumList("no");
%>

<div class="RollingContainer">
	<button type="button" id="prev"><img src="IMG/Left_Button_Out.png" onmouseover="changeover(this, 'Left_Button')" onmouseout="changeout(this, 'Left_Button')"></button>
	<button type="button" id="next"><img src="IMG/Right_Button_Out.png" onmouseover="changeover(this, 'Right_Button')" onmouseout="changeout(this, 'Right_Button')"></button>
	<div class="RollingDiv">
		<ul class="RollingBanner">
			<li><a href="#"><img src="IMG/Rolling1.jpg" width="1100px" height="100%"></a></li>
			<li><a href="#"><img src="IMG/Rolling2.jpg" width="1100px" height="100%"></a></li>
			<li><a href="#"><img src="IMG/Rolling3.jpg" width="1100px" height="100%"></a></li>
		</ul>
	</div>
</div>
				
<section>
	<div class="SecContainer">
		<div id="MonthStar">
			<div class="MainTitle">
				<img src="IMG/StarBGM.jpg" style="width:120px; height:30px;">
			</div>
			
			<div class="Part1">
				<% for(int i = 0; i < 5; i++) {
					AlbumBean ab;
					if(alb.size() <= i) break;
					else {
						ab = alb.get(i);
					}
				%>
					<div class="RankNumber">No.<%=i + 1 %></div>
					<div class="RankName">
						<a href="MODULE/Album_controller.jsp?ALB_No=<%=ab.getAlbumNo()%>&A_State=detail" style="color:black;">
							<%=ab.getAlbumTitle() %>
						</a>
					</div>
				<% } %>
			</div>
			<div class="Part2">
				<% for(int i = 5; i < 10; i++) {
					AlbumBean ab;
					if(alb.size() <= i) break;
					else {
						ab = alb.get(i);
					}
				%>
					<div class="RankNumber">No.<%=i + 1 %></div>
					<div class="RankName">
						<a href="MODULE/Album_controller.jsp?ALB_No=<%=ab.getAlbumNo()%>&A_State=detail" style="color:black;">
							<%=ab.getAlbumTitle() %>
						</a>
					</div>
				<% } %>
			</div>
		</div>
	</div>
	
	<div class="SecContainer">
		<div id="StarArtist">
			<div class="MainTitle">
				<img src="IMG/StarArtist.jpg" style="width:120px; height:30px;">
			</div>
			<%
				int artist = 0;
				for(int i = 0; i < alb.size(); i++) {
					boolean flag = false;
					
					AlbumBean ab = alb.get(i);
					
					if(artist >= 6) break;
					
					for(int j = 0; j < i; j++) {
						if(ab.getAlbumId().equals(alb.get(j).getAlbumId())) {
							flag = true;
							break;
						}
					}
					if(flag == true) continue;
					else artist++;
					
					RegisterBean user = regMgr.memberLogin(ab.getAlbumId());
			%>
				<div class="Artist">
					<img src="DATA-FILE/<%=user.getMemberProfile()%>" class="ArtistPhoto" alt="아티스트">
					<p class="ArtistName"><%=user.getMemberId() %></p>
				</div>
			<% } %>
			</div>
	</div>
					
	<div class="SecContainer">
		<div class="FreeBoard">
			<div class="MainTitle">
				<img src="IMG/FreeBoard.jpg" style="width:120px; height:30px;">
			</div>
			<Table class="BoardTable" border="2">
				<thead bgcolor="#d5d5d5">
					<th width="40">번호</th>
					<th>제목</th>
					<th width="140">작성자</th>
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
							</tr>
						<%} %>
					
						<% for(int i = 0; i < rbList.size(); i++) { 
							BoardBean rb = rbList.get(i);
							if(i >= 15) break;
						%>
							<tr>
								<td><%=rb.getBoardNo() %></td>
								<td>
									<a href="MODULE/Board_controller.jsp?OPB_No=<%=rb.getBoardNo()%>&B_State=detail"  style="color:black;">
										<%=rb.getBoardTitle() %>
									</a>
								</td>
								<td><%=rb.getBoardId() %></td>
							</tr>
						<%} %>
				</tbody>
			</Table>
		</div>
	</div>
</section>