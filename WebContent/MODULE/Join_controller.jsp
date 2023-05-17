<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />

<%
	String uploadDir = this.getClass().getResource("").getPath();
	uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "JSP-TeamProject/WebContent/DATA-FILE";
	MultipartRequest multi = new MultipartRequest(request, uploadDir, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
	// new MultipartRequest(req, uploadDir, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy())
	//							디렉토리, 최대용량, 인코딩방식, 중복파일 처리(동일 파일 이름시 뒤에 숫자 등을 붙여 회피)
	String idCheck = multi.getParameter("memberId_Check");
	if(idCheck.equals("IdUncheck")){%>
		<script>
			alert("아이디 중복확인 필수");
			history.back();
		</script>
	<%} else {
		String id = multi.getParameter("memberId");
		String pw = multi.getParameter("memberPw");
		String re_pw = multi.getParameter("memberPw_Re");
		String name = multi.getParameter("memberName");
		String rrn = multi.getParameter("memberRRN");
		String phone = multi.getParameter("memberPhone");
		String email = multi.getParameter("memberEmail");
		String genre = multi.getParameter("memberGenre");
		String likemusic = multi.getParameter("memberLikemusic");
		String gender = multi.getParameter("memberGender");
		String compose = multi.getParameter("memberCompose");
		String profile = multi.getParameter("memberProfile");
		
		if(multi.getFilesystemName("memberProfile") == null) {
			profile = "0_def_img.jpg";
		} else {
			profile = multi.getFilesystemName("memberProfile");
		}
		
		if(id != null && pw != null && name != null && rrn != null && phone != null && email != null) {
			if(pw.equals(re_pw)) {
				regMgr.insertMember(id, pw, name, rrn, phone, email, genre, likemusic, gender, compose, profile);
			%>
				<script>
					alert("가입 완료");
					location.href="../Index.jsp";
				</script>
			<% }
			else { %>
				<script>
					alert("비밀번호를 확인하세요.");
					history.back();
				</script>
			<% }
		} else { %>
			<script>
				alert("필수 입력 누락");
				history.back();
			</script>
		<% }
	}
%>