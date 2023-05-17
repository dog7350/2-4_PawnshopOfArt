<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.RegisterBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<% RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo"); %>

<div class="MyPage_Container">
	<div class="MyPage_Content">
		<div id="MyPage_TOP">
			<h1><%=lInfo.getMemberId() %>의 페이지</h1>
		</div>
		
		<div id="MyPage_Body">
			<div class="MP_Menu">
				<a href="Index.jsp?Module_PAGE=MyPage_Modify.jsp">회원 정보 수정</a><br>
				개인정보 수정<br>
				비밀번호 변경 등
			</div>
			<div class="MP_Menu">
				<a href="Index.jsp?Module_PAGE=MyPage_Cash.jsp">캐시 충전</a><br>
				거래에 사용할<br>
				캐시 충전
			</div>
			<div class="MP_Menu">
				<a href="#">내 게시글</a><br>
				내가 작성한 게시글<br>
				확인 및 수정
			</div>
			<div class="MP_Menu">
				<a href="#">내 댓글</a><br>
				내가 작성한 댓글<br>
				확인 및 수정
			</div>
			<div class="MP_Menu">
				<a href="Index.jsp?Module_PAGE=MyPage_controller.jsp?st=delete">회원 탈퇴</a><br>
				회원 탈퇴<br>
				(계정 복구 불가)
			</div>
		</div>
	</div>
</div>