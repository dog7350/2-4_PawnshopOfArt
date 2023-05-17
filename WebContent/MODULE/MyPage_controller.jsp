<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="member.RegisterBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo");
	String state = (String)request.getParameter("st");
%>

<jsp:useBean class="member.RegisterBean" id="regBean" scope="session" />
<jsp:setProperty name="regBean" property="*" />
<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />

<%
	if(state.equals("modify")){
		String uploadDir = this.getClass().getResource("").getPath();
		uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "JSP-TeamProject/WebContent/DATA-FILE";
		MultipartRequest multi = new MultipartRequest(request, uploadDir, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		// new MultipartRequest(req, uploadDir, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy())
		//							디렉토리, 최대용량, 인코딩방식, 중복파일 처리(동일 파일 이름시 뒤에 숫자 등을 붙여 회피)
		
		String id = lInfo.getMemberId();
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

		if(pw != null && phone != null && email != null) {
			if(pw.equals(re_pw)) {
				int n = regMgr.updateMember(id, pw, phone, email, gender, genre, likemusic, profile, compose);
				if(n == 1) { %>
					<script>
						alert("수정 완료");
						location.href="MyPage_controller.jsp?st=cash&pay=modify&cs=0";
					</script>
				<%} else { %>
					<script>
						alert("수정 실패");
						history.back();
					</script>
				<%} %>
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
	} else if(state.equals("delete")) {
		int n = regMgr.memberDelete(lInfo.getMemberId());
		if(n == 1) { %>
			<script>
				alert("탈퇴 완료");
				location.href="../Index.jsp";
			</script>
		<%} else { %>
			<script>
				alert("탈퇴 실패");
				history.back();
			</script>
		<%}
	} else if(state.equals("cash")) {
		int cash = Integer.parseInt((String)request.getParameter("cs"));
		String pay = (String)request.getParameter("pay");
		String url = "";
		
		String id = lInfo.getMemberId();
		String pw = lInfo.getMemberPw();
		
		if(pay.equals("plus")) {
			cash = lInfo.getMemberCash() + cash;
			url = "MODULE/Login_controller.jsp?id=" + id + "&pw=" + pw;
		} else if(pay.equals("minus")) {
			cash = lInfo.getMemberCash() - cash;
			url = "Login_controller.jsp?id=" + id + "&pw=" + pw;
		}
		
		int n = regMgr.memberCash(lInfo, cash);
		
		if(n == 1) {
			if(session.getAttribute("LoginKeep") == null) {
				session.removeAttribute("LoginState");
				session.removeAttribute("LoginKeep");
				session.removeAttribute("LoginInfo");
				session.removeAttribute("LoginId");
				session.removeAttribute("LoginPw");
			} else {
				session.removeAttribute("LoginState");
				session.removeAttribute("LoginInfo");
			}
			if(pay.equals("modify")) {
				url = "Login_controller.jsp?id=" + id + "&pw=" + pw; %>
				<script>
					location.href="<%=url%>";
				</script>
			<% } %>
			<script>
				alert("충전 완료");
				location.href="<%=url%>";
			</script>
		<%} else { %>
			<script>
				alert("충전 실패");
				history.back();
			</script>
		<%}
	}
%>