<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="member.RegisterBean" %>
<%@ page import="member.QnaBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />
<jsp:useBean class="member.QnaMgr" id="qaMgr" scope="session" />

<%
	if(session.getAttribute("LoginState") == null) { %>
		<script>
			alert("로그인 후 이용하세요.");
			location.href="Index.jsp";
		</script>
	<%} else {
		String qnaState = (String)request.getParameter("Q_State");
		RegisterBean rb = (RegisterBean)session.getAttribute("LoginInfo");
		String id = rb.getMemberId();
		
		if(qnaState.equals("write")) {
			String content = (String)request.getParameter("BoardContent");
			String title = (String)request.getParameter("BoardTitle");
			int n = qaMgr.insertQna(id, title, content);
			if(n == 1) { %>
				<script>
					alert("질문 완료");
					location.href="../Index.jsp?Module_PAGE=QnaBoard.jsp";
				</script>
			<% } else { %>
				<script>
					alert("질문 실패");
					location.href="../Index.jsp?Module_PAGE=QnaBoard.jsp";
				</script>
			<% }
		} else if(qnaState.equals("answer")) {
			int no = Integer.parseInt((String)request.getParameter("qno"));
			String content = (String)request.getParameter("AnswerContent");
			String title = null;
			int n = qaMgr.answerQna(no, id, title, content);
			if(n == 1) { %>
				<script>
					location.href="../Index.jsp?Module_PAGE=QnaContent.jsp&QAB_No=<%=no%>";
				</script>
			<% } else { %>
				<script>
					location.href="../Index.jsp?Module_PAGE=QnaContent.jsp&QAB_No=<%=no%>";
				</script>
			<% }
			
		} else if(qnaState.equals("delete")) {
			int no = Integer.parseInt((String)request.getParameter("qno"));

			int n = qaMgr.deleteQna(no);
			if(n == 1) { %>
				<script>
					alert("삭제 완료");
					location.href="../Index.jsp?Module_PAGE=QnaBoard.jsp";
				</script>
			<% } else { %>
				<script>
					alert("삭제 실패");
					location.href="../Index.jsp?Module_PAGE=QnaBoard.jsp";
				</script>
			<% }
		}
} %>