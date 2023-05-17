<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String TOP_AP = (String)request.getParameter("Admin_PAGE");
%>

<div id="TopBase">
	<div id="TopMenu">
		<header>
			<div>
				<a href="Index.jsp"><img class="Logo" src="IMG/Logo.png" alt="예술의 전당포"></a>
				<div id="Search">
					<div id="SearchForm">
						<%if (TOP_AP.equals("A_MAIN.jsp")) {%>
							<form method=post action="Index.jsp?Module_PAGE=SearchPage.jsp">
						<%} else { %>
							<form method=post action="Index.jsp?Admin_PAGE=<%=TOP_AP %>">
						<%} %>
								<%if (TOP_AP.equals("A_MAIN.jsp")) { %>
									<select name="select">
										<option>전체</option>
										<option>장르</option>
										<option>아티스트</option>
										<option>작성자</option>
										<option>내용</option>
									</select>
								<%} else if (TOP_AP.equals("A_MEMBERDB.jsp")) { %>
									<select name="select">
										<option>아이디</option>
										<option>이름</option>
									</select>
								<%} else if (TOP_AP.equals("A_BOARD.jsp")) {%>
									<select name="select">
										<option>제목</option>
										<option>아이디</option>
										<option>내용</option>
									</select>
								<%} else if (TOP_AP.equals("A_REPLY.jsp")) {%>
									<select name="select">
										<option>아이디</option>
										<option>내용</option>
									</select>
								<%} %>
								<div id="SearchBar">
									<input type="text" name="search" placeholder="검색어 입력">
									<input type="submit" value=" ">
								</div>
							</form>
					</div>
				</div>
			</div>
		</header>
		<nav>
			<div id="MenuContainer">
				<div id="MenuBar">
					<ul id="MainMenu">
						<li><a href="Index.jsp?Admin_PAGE=A_MAIN.jsp" class="Btn_Menu">관리자 메인</a></li>
						<li><a href="#" class="Btn_Menu"></a></li>
						<li><a href="Index.jsp?Admin_PAGE=A_MEMBERDB.jsp" class="Btn_Menu">회원 DB</a></li>
						<li><a href="Index.jsp?Admin_PAGE=A_BOARD.jsp" class="Btn_Menu">게시글 관리</a></li>
						<li><a href="Index.jsp?Admin_PAGE=A_REPLY.jsp" class="Btn_Menu">댓글 관리</a></li>
						<li><a href="#" class="Btn_Menu"></a></li>
						<li><a href="#" class="Btn_Menu"></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</div>