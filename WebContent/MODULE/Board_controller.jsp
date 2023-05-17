<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="member.RegisterBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="member.BoardBean" id="bodBean" scope="session" />
<jsp:useBean class="member.BoardMgr" id="bodMgr" scope="session" />

<%
	if(session.getAttribute("LoginState") == null) { %>
		<script>
			alert("로그인 후 이용하세요.");
			location.href="../Index.jsp";
		</script>
	<%} else {
		String boardState = (String)request.getParameter("B_State");
	
		RegisterBean rb = (RegisterBean)session.getAttribute("LoginInfo");
		String id = rb.getMemberId();
		String title = (String)request.getParameter("BoardTitle");
		String content = (String)request.getParameter("BoardContent");
		String notice = (String)request.getParameter("B_Notice");
		
		if(notice == null) notice = "no";
		else if(notice.equals("일반")) notice = "no";
		else if(notice.equals("공지")) notice = "yes";
	
		if(boardState.equals("write")) {
			if(title == null || content == null) { %>
				<script>
					alert("제목과 내용을 입력하세요.");
					history.back();
				</script>
			<% } else {
				bodBean.setBoardId(id);
				bodBean.setBoardTitle(title);
				bodBean.setBoardContent(content);
				bodBean.setBoardNotice(notice);
				
				bodMgr.insertBoard(bodBean);
				response.sendRedirect("../Index.jsp?Module_PAGE=OpenBoard.jsp");
			}
		} else if(boardState.equals("modify")) {
			if(title.equals("") || content.equals("")) { %>
				<script>
					alert("제목과 내용을 입력하세요.");
					history.back();
				</script>
			<% } else {
				int no = Integer.parseInt((String)request.getParameter("OPB_No"));
				Timestamp time = Timestamp.valueOf((String)request.getParameter("ti"));
				int n = bodMgr.updateBoard(no, title, time, content, notice);
				if(n == 1) {%>
					<script>
						alert("수정 완료");
						location.href="../Index.jsp?Module_PAGE=OpenBoard.jsp";
					</script>
				<%} else {%>
					<script>
						alert("수정 실패");
						history.back();
					</script>
				<%}
			}
		} else if(boardState.equals("delete")) {
			int no = Integer.parseInt((String)request.getParameter("OPB_No"));
			int n = bodMgr.deleteBoard(no);
			if(n == 1) {%>
				<script>
					alert("삭제 완료");
					location.href="../Index.jsp?Module_PAGE=OpenBoard.jsp";
				</script>
			<%} else {%>
				<script>
					alert("삭제 실패");
					history.back();
				</sciprt>
			<%}
		} else if(boardState.equals("adelete")) {
			int no = Integer.parseInt((String)request.getParameter("OPB_No"));
			int n = bodMgr.deleteBoard(no);
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
		} else if(boardState.equals("report")) {
			int no = Integer.parseInt((String)request.getParameter("OPB_No"));
			int inq = Integer.parseInt((String)request.getParameter("inq"));
			int rep = Integer.parseInt((String)request.getParameter("rep"));
			Timestamp time = Timestamp.valueOf((String)request.getParameter("ti"));
			int n = bodMgr.updateBoard(no, inq, rep + 1, time);
			if(n == 1) {%>
				<script>
					alert("신고 완료");
					location.href="../Index.jsp?Module_PAGE=OpenBoard.jsp";
				</script>
			<%} else {%>
				<script>
					alert("신고 실패");
					history.back();
				</sciprt>
			<%}
		} else if(boardState.equals("detail")) {
			String no = (String)request.getParameter("OPB_No");
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
				response.sendRedirect("../Index.jsp?Module_PAGE=OpenBoardContent.jsp&OPB_No=" + no + "&inq=up");
			} else {
				response.sendRedirect("../Index.jsp?Module_PAGE=OpenBoardContent.jsp&OPB_No=" + no);
			}
		}
	}
%>