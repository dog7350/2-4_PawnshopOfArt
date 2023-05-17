<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="member.RegisterBean" %>
<%@ page import="member.AlbumBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="member.AlbumMgr" id="albMgr" scope="session" />

<%
	if(session.getAttribute("LoginState") == null) { %>
		<script>
			alert("로그인 후 이용하세요.");
			location.href="../Index.jsp";
		</script>
	<%} else {
		String albumState = (String)request.getParameter("A_State");

		RegisterBean rb = (RegisterBean)session.getAttribute("LoginInfo");
		String id = rb.getMemberId();
		
		if(albumState.equals("write") || albumState.equals("modify")) {
			String uploadDir = this.getClass().getResource("").getPath();
			uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "JSP-TeamProject/WebContent/DATA-FILE";
			MultipartRequest multi = new MultipartRequest(request, uploadDir, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			// new MultipartRequest(req, uploadDir, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy())
			//							디렉토리, 최대용량, 인코딩방식, 중복파일 처리(동일 파일 이름시 뒤에 숫자 등을 붙여 회피)
			
			String title = multi.getParameter("AlbumTitle");
			String genre = multi.getParameter("A_Genre");
			String artist = multi.getParameter("AlbumArtist");
			String content = multi.getParameter("AlbumContent");
			String img;
			String music;
			String price = multi.getParameter("AlbumPrice");
			String notice = multi.getParameter("A_Notice");
			
			if(multi.getFilesystemName("AlbumImage") == null) {
				img = "0_def_img.jpg";
			} else {
				img = multi.getFilesystemName("AlbumImage");
			}
			if(multi.getFilesystemName("AlbumMusic") == null) {
				music = "0_def_music.mp3";
			} else {
				music = multi.getFilesystemName("AlbumMusic");
			}
			
			if(notice == null) notice = "no";
			else if(notice.equals("일반")) notice = "no";
			else if(notice.equals("공지")) notice = "yes";
			
			if(albumState.equals("write")) {
				if(title.equals("") || content.equals("") || price.equals("")) { %>
					<script>
						alert("제목과 내용, 가격을 입력하세요.");
						history.back();
					</script>
				<% } else {
					albMgr.insertAlbum(id, title, genre, artist, content, img, music, price, notice);
				
					response.sendRedirect("../Index.jsp?Module_PAGE=AlbumBoard.jsp");
				}
			} else if(albumState.equals("modify")) {
				if(title.equals("") || content.equals("") || price.equals("")) { %>
					<script>
						alert("제목과 내용, 가격을 입력하세요.");
						history.back();
					</script>
				<% } else {
					int no = Integer.parseInt((String)request.getParameter("ALB_No"));
					albMgr.updateAlbum(id, title, genre, artist, content, img, music, price, notice, no);
				
					response.sendRedirect("../Index.jsp?Module_PAGE=AlbumBoard.jsp");
				}
			}
		} else if(albumState.equals("detail")) {
			String no = (String)request.getParameter("ALB_No");
			Cookie cok = new Cookie(no, no);
			cok.setMaxAge(15);
			response.addCookie(cok);
			
			Cookie[] cokis = request.getCookies();
			String bNo = "";
			for(Cookie c : cokis) {
				if(c.getName().equals(no)) {
					bNo = c.getValue();
				}
			}
			
			if(!bNo.equals(no)) {
				response.sendRedirect("../Index.jsp?Module_PAGE=AlbumBoardContent.jsp&ALB_No=" + no + "&inq=up");
			} else {
				response.sendRedirect("../Index.jsp?Module_PAGE=AlbumBoardContent.jsp&ALB_No=" + no);
			}
		} else if(albumState.equals("delete")) {
			int no = Integer.parseInt((String)request.getParameter("ALB_No"));
			int n = albMgr.deleteAlbum(no);
			if(n == 1) {%>
				<script>
					alert("삭제 완료");
					location.href="../Index.jsp?Module_PAGE=AlbumBoard.jsp";
				</script>
			<%} else {%>
				<script>
					alert("삭제 실패");
					history.back();
				</sciprt>
			<%}
		} else if(albumState.equals("adelete")) {
			int no = Integer.parseInt((String)request.getParameter("ALB_No"));
			int n = albMgr.deleteAlbum(no);
			if(n == 1) {%>
				<script>
					alert("삭제 완료");
					location.href="../Index.jsp?Admin_PAGE=A_BOARD.jsp";
				</script>
			<%} else {%>
				<script>
					alert("삭제 실패");
					history.back();
				</sciprt>
			<%}
		} else if(albumState.equals("report")) {
			int no = Integer.parseInt((String)request.getParameter("ALB_No"));
			int inq = Integer.parseInt((String)request.getParameter("inq"));
			int rep = Integer.parseInt((String)request.getParameter("rep"));
			Timestamp time = Timestamp.valueOf((String)request.getParameter("ti"));
			int n = albMgr.updateAlbum(no, inq, rep + 1, time);
			if(n == 1) {%>
				<script>
					alert("신고 완료");
					location.href="../Index.jsp?Module_PAGE=AlbumBoard.jsp";
				</script>
			<%} else {%>
				<script>
					alert("신고 실패");
					history.back();
				</sciprt>
			<%}
		}
	}
%>