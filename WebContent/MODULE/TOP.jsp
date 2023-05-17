<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<div id="TopBase">
	<div id="TopMenu">
		<header>
			<div>
				<a href="Index.jsp"><img class="Logo" src="IMG/Logo.png" alt="예술의 전당포"></a>
				<div id="Search">
					<div id="SearchForm">
						<form method=post action="Index.jsp?Module_PAGE=SearchPage.jsp">
							<select name="select">
								<option>전체</option>
								<option>장르</option>
								<option>아티스트</option>
								<option>작성자</option>
								<option>내용</option>
							</select>
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
						<li><a href="#" class="Btn_Menu">주간 인기 TOP 10</a></li>
						<li><a href="#" class="Btn_Menu">월간 인기 TOP 10</a></li>
						<li><a href="#" class="Btn_Menu">선호 장르 TOP 10</a></li>
						<li id="Sub1">
							<a href="Index.jsp?Module_PAGE=AlbumBoard.jsp" class="Btn_Menu">앨 범</a>
							<ul id="SubMenu1">
								<li><a href="#" class="Btn_Menu">최신곡</a></li>
								<li><a href="#" class="Btn_Menu">인기곡</a></li>
								<li><a href="Index.jsp?Module_PAGE=AlbumBoard.jsp&genre=K-POP" class="Btn_Menu">K-POP</a></li>
								<li><a href="Index.jsp?Module_PAGE=AlbumBoard.jsp&genre=POP" class="Btn_Menu">POP</a></li>
								<li><a href="Index.jsp?Module_PAGE=AlbumBoard.jsp&genre=J-POP" class="Btn_Menu">J-POP</a></li>
							</ul>
						</li>
						<li><a href="#" class="Btn_Menu">아 티 스 트</a></li>
						<li><a href="Index.jsp?Module_PAGE=OpenBoard.jsp" class="Btn_Menu">자 유 게 시 판</a></li>
						<li><a href="Index.jsp?Module_PAGE=QnaBoard.jsp" class="Btn_Menu">Q & A</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</div>