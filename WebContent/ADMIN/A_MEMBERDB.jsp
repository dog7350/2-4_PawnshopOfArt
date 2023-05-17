<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.RegisterBean" %>

<% request.getParameter("UTF-8"); %>

<%
	RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo");
	if(session.getAttribute("LoginState") == null) { %>
		<script>
			alert("로그인 후 이용하세요.");
			location.href="Index.jsp"
		</script>
	<%}
	if(lInfo.getMemberAdmin().equals("no")) { %>
		<script>
			alert("관리자가 아닙니다.");
			location.href="Index.jsp"
		</script>
	<%}
%>

<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />

<%
	String searchOption = request.getParameter("select");
	String searchText = request.getParameter("search");
	
	List<RegisterBean> rbList = regMgr.memberSearch(searchOption, "%" + searchText + "%");
%>

<section>
	<div id="ADMIN_Container">
		<div class="ADMIN_Content">			
			<H1 style="margin-top:15px; margin-bottom:15px;">회원 목록</H1>
			<div class="ADMIN_Board">
				<TABLE class="ADMIN_Table" border="2">
					<thead bgcolor="#d5d5d5">
						<th>번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>성별</th>
						<th>선호장르</th>
						<th>선호음악</th>
						<th>작곡여부</th>
						<th>보유캐시</th>
						<th>관리자여부</th>
						<th>정지상태</th>
						<th>강퇴여부</th>
					</thead>
					<tbody>
						<% for(int i = 0; i < rbList.size(); i++) { 
							RegisterBean rb = rbList.get(i);
						%>
							<tr>
								<td><%=i + 1 %></td>
								<td><%=rb.getMemberId() %></td>
								<td><%=rb.getMemberPw() %></td>
								<td><%=rb.getMemberName() %></td>
								<td><%=rb.getMemberRRN() %></td>
								<td><%=rb.getMemberPhone() %></td>
								<td><%=rb.getMemberEmail() %></td>
								<td><%=rb.getMemberGender() %></td>
								<td><%=rb.getMemberGenre() %></td>
								<td><%=rb.getMemberLikemusic() %></td>
								<td><%=rb.getMemberCompose() %></td>
								<td><%=rb.getMemberCash() %></td>
								<td><%=rb.getMemberAdmin() %></td>
								<td>
									<form method=post action="Index.jsp?Admin_PAGE=A_MEMBER_SD.jsp?id=<%=rb.getMemberId() %>&admin=<%=rb.getMemberAdmin() %>&stop=<%=rb.getMemberStop() %>">
										<input type="submit" value="<%=rb.getMemberStop() %>" style="width:100%; heihgt:100%; border:none;">
									</form>
								</td>
								<td>
									<form method=post action="Index.jsp?Admin_PAGE=A_MEMBER_SD.jsp?id=<%=rb.getMemberId() %>&admin=<%=rb.getMemberAdmin() %>">
										<input type="submit" value="강퇴" style="width:100%; heihgt:100%; border:none;">
									</form>
								</td>
							</tr>
						<%} %>
					</tbody>
				</TABLE>
			</div>
		</div>
	</div>
</section>