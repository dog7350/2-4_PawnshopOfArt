<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="member.AlbumBean" %>
<%@ page import="member.RegisterBean" %>
<%@ page import="member.A_ReplyBean" %>

<% request.getParameter("UTF-8"); %>

<jsp:useBean class="member.AlbumMgr" id="albMgr" scope="session" />
<jsp:useBean class="member.A_ReplyMgr" id="arepMgr" scope="session" />

<%
	String admin = (String)session.getAttribute("LoginState");
	RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo");
	int no = Integer.parseInt((String)request.getParameter("ALB_No"));
	
	AlbumBean alb = albMgr.searchAlbum(no);
	alb.setAlbumContent(alb.getAlbumContent().replace("\r\n", "<br>"));

	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	List<A_ReplyBean> arpList = arepMgr.listReply(alb.getAlbumNo());
	String replyState = (String)request.getParameter("R_State");
%>

<% if(admin == null) { %>
	<script>
		alert('로그인 시 이용 가능합니다.');
		history.back();
	</script>
<% } else {
	String inq = (String)request.getParameter("inq");
	if(inq == null) { }
	else if(inq.equals("up")) {
		albMgr.updateAlbum(no, alb.getAlbumInquiry() + 1, alb.getAlbumReport(), alb.getAlbumDate());
	}
}
%>

<section>
	<div id="OpenBoard_Container">
		<div class="OpenBoard_Content">
			<div class="Board_Top">
				<div id="Board_C_Id">작성자 : <%=alb.getAlbumId() %></div> | 
				<div id="Board_C_Time">작성 시간 : <%=dateformat.format(alb.getAlbumDate()) %></div> | 
				<div id="Board_C_Inquiry">조회수 : <%=alb.getAlbumInquiry() %></div> |
				<div id="Board_C_Report">신고수 : <%=alb.getAlbumReport() %></div> 
				<% if(admin.equals("관리자") || alb.getAlbumId().equals(lInfo.getMemberId())) { %>
						<input type="button" value="수정" onclick="location.href='Index.jsp?Module_PAGE=ModifyAlbum.jsp?ALB_No=<%=alb.getAlbumNo()%>'">
						<input type="button" value="삭제" onclick="location.href='MODULE/Album_controller.jsp?A_State=delete&ALB_No=<%=alb.getAlbumNo()%>'"> | 
				<%	} %>
				<input type="button" value="신고" onclick="location.href='MODULE/Album_controller.jsp?A_State=report&ALB_No=<%=alb.getAlbumNo()%>&inq=<%=alb.getAlbumInquiry()%>&rep=<%=alb.getAlbumReport()%>&ti=<%=alb.getAlbumDate()%>'"><br>
				<div id="Board_C_Title">제목 : <%=alb.getAlbumTitle()%></div>
			</div>
			
			<div class="Board_Body">
				<div id="Board_C_Info">
					<div id="Board_C_Genre">장르 : <%=alb.getAlbumGenre()%></div>
					<div id="Board_C_Price">가격 : <%=alb.getAlbumPrice()%> 원</div>
					<div id="Board_C_Artist">아티스트 : <%=alb.getAlbumArtist()%></div>
				</div>
				<div id="Board_C_Product">
					<% if(!alb.getAlbumMusic().equals("0_def_music.mp3")) {%>
							<div id="Board_C_Down"><input type="button" value="다운로드" onclick="location.href='MODULE/Pay_Music.jsp?ALB_No=<%=alb.getAlbumNo()%>'"></div>
					<%}
					   if(!alb.getAlbumMusic().equals("0_def_music.mp3")) {%>
							<div id="Board_C_Before">
								<audio id="preview">
									<source src="DATA-FILE/<%=alb.getAlbumMusic()%>">
								</audio>
							</div>
							<div id="time1" style="display:inline;">0:00</div>
							<div id="time2" style="display:inline;"></div><br>
							<input id="ply_btn" type="button" value="재생" onclick="play()">
							<input id="stp_btn" type="button" value="정지" onclick="stop()">
							<script src="JS\Preview.js"></script>
					<%}
					   if(!alb.getAlbumImg().equals("0_def_img.jpg")) {%>
							<div id="Board_C_Img"><img src="DATA-FILE/<%=alb.getAlbumImg()%>"></div>
					<%} %>
				</div>
				<div id="Board_C_Content"><%=alb.getAlbumContent() %></div>
			</div>
			
			<% if(replyState == null) { %>
				<form class="ReplyForm" method="post" action="MODULE/A_Reply_controller.jsp?R_State=write&bno=<%=alb.getAlbumNo()%>">
					<textarea cols="145" rows="3" name="ReplyContent" style="margin-right:15px; resize:none;"></textarea>
					<input type="submit" value="작성" style="position:absolute; width:50px; height:48px; font-size:15pt;">
				</form>
			<% } else {
				int r_no = Integer.parseInt((String)request.getParameter("R_No"));
				A_ReplyBean arep = arepMgr.selectReply(alb.getAlbumNo(), r_no);
				arep.setA_ReplyContent(arep.getA_ReplyContent().replace("<br>", "\r\n"));
			%>
				<form class="ReplyForm" method="post" action="MODULE/A_Reply_controller.jsp?R_State=modify&bno=<%=alb.getAlbumNo()%>&rno=<%=arep.getA_ReplyNo() %>&ti=<%=arep.getA_ReplyDate()%>">
					<textarea cols="145" rows="3" name="ReplyContent" style="margin-right:15px; resize:none;"><%=arep.getA_ReplyContent() %></textarea>
					<input type="submit" value="수정" style="position:absolute; width:50px; height:48px; font-size:15pt;">
				</form>
			<% } %>
			
			<% for(int i = 0; i < arpList.size(); i++) { 
					A_ReplyBean arep = arpList.get(i);
					arep.setA_ReplyContent(arep.getA_ReplyContent().replace("\r\n", "<br>"));
			%>
				<div class="Reply_Body">
					<div class="Reply_head">
						<span style="font-weight:bold;">작성자 : <%=arep.getA_ReplyId() %></span>
						<span style="disply:inline-block; color:gray; font-size:9pt;"><%=dateformat.format(arep.getA_ReplyDate()) %></span>
					</div>
					<div class="Reply_btn">
						<% if(admin.equals("관리자") || arep.getA_ReplyId().equals(lInfo.getMemberId())) { %>
							<input type="button" value="수정" onclick="location.href='Index.jsp?Module_PAGE=AlbumBoardContent.jsp&ALB_No=<%=alb.getAlbumNo() %>&R_State=modify&R_No=<%=arep.getA_ReplyNo() %>'">
							<input type="button" value="삭제" onclick="location.href='MODULE/A_Reply_controller.jsp?R_State=delete&bno=<%=alb.getAlbumNo()%>&rno=<%=arep.getA_ReplyNo()%>'"> | 
						<% } %>
						<input type="button" value="신고" onclick="location.href='MODULE/A_Reply_controller.jsp?R_State=report&bno=<%=alb.getAlbumNo()%>&rno=<%=arep.getA_ReplyNo()%>&ti=<%=arep.getA_ReplyDate()%>&rp=<%=arep.getA_ReplyReport()%>'">
					</div>
					
					<div class="Reply_content">
						<%=arep.getA_ReplyContent() %>
					</div>
				</div>
			<%} %>
		</div>
	</div>
</section>