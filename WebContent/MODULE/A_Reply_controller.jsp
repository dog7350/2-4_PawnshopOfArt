<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="member.A_ReplyBean" %>
<%@ page import="member.RegisterBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="member.A_ReplyBean" id="arepBean" scope="session" />
<jsp:useBean class="member.A_ReplyMgr" id="arepMgr" scope="session" />

<%
	if(session.getAttribute("LoginState") == null) { %>
		<script>
			alert("로그인 후 이용하세요.");
			location.href="Index.jsp";
		</script>
	<%} else {
		String replyState = (String)request.getParameter("R_State");
		RegisterBean rb = (RegisterBean)session.getAttribute("LoginInfo");
		String id = rb.getMemberId();
		int b_no = Integer.parseInt((String)request.getParameter("bno"));
		String content = (String)request.getParameter("ReplyContent");
		
		if(replyState.equals("write")) {
			arepBean.setAlbumNo(b_no);
			arepBean.setA_ReplyId(id);
			arepBean.setA_ReplyContent(content);
			
			arepMgr.insertReply(arepBean);
			response.sendRedirect("../Index.jsp?Module_PAGE=AlbumBoardContent.jsp&ALB_No=" + b_no);
		} else if(replyState.equals("modify")) {
			int r_no = Integer.parseInt((String)request.getParameter("rno"));
			Timestamp time = Timestamp.valueOf((String)request.getParameter("ti"));
			
			arepMgr.updateReply(b_no, r_no, time, content);
			response.sendRedirect("../Index.jsp?Module_PAGE=AlbumBoardContent.jsp&ALB_No=" + b_no);
		} else if(replyState.equals("delete")) {
			int r_no = Integer.parseInt((String)request.getParameter("rno"));
			
			arepMgr.deleteReply(b_no, r_no);
			response.sendRedirect("../Index.jsp?Module_PAGE=AlbumBoardContent.jsp&ALB_No=" + b_no);
		} else if(replyState.equals("adelete")) {
			int r_no = Integer.parseInt((String)request.getParameter("rno"));
			
			arepMgr.deleteReply(b_no, r_no);
			response.sendRedirect("../Index.jsp?Admin_PAGE=A_REPLY.jsp");
		} else if(replyState.equals("report")) {
			int r_no = Integer.parseInt((String)request.getParameter("rno"));
			Timestamp time = Timestamp.valueOf((String)request.getParameter("ti"));
			int report = Integer.parseInt((String)request.getParameter("rp")) + 1;
			
			int check = arepMgr.reportReply(b_no, r_no, time, report);
			
			if(check == 1) {%>
				<script>
					alert("신고되었습니다.");
					location.href="../Index.jsp?Module_PAGE=AlbumBoardContent.jsp&ALB_No=<%=b_no%>";
				</script>
			<% } else { %>
				<script>
					alert("신고 실패");
					location.href="../Index.jsp?Module_PAGE=AlbumBoardContent.jsp&ALB_No=<%=b_no%>";
				</script>
			<%}
		}
	}
%>