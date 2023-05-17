<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="member.RegisterBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<% RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo"); %>

<div id="Join_div">
	<div id="Join_form">
		<h1>회원 정보 입력</h1>
		<form method="post" action="MODULE/MyPage_controller.jsp?st=modify" enctype="Multipart/form-data">
			<input type="text" size="21" name="memberId" placeholder="아이디(필수)" value="<%=lInfo.getMemberId()%>" disabled>&emsp;<input type="button" id="Join_idCheck" value="중복확인" disabled><br>
			<input type="password" size="30" name="memberPw" placeholder="비밀번호(필수)"><br>
			<input type="password" size="30" name="memberPw_Re" placeholder="비밀번호 재입력(필수)"><br>
			<input type="text" size="30" name="memberName" placeholder="이름(필수)" value="<%=lInfo.getMemberName()%>" disabled><br>
			<input type="text" size="30" name="memberRRN" placeholder="생년월일(필수)" value="<%=lInfo.getMemberRRN()%>" disabled><br>
			<input type="text" size="30" name="memberPhone" placeholder="전화번호(필수)" value="<%=lInfo.getMemberPhone()%>"><br>
			<input type="text" size="30" name="memberEmail" placeholder="이메일(필수)" value="<%=lInfo.getMemberEmail()%>"><br>
			<input type="text" size="30" name="memberGenre" placeholder="선호 장르(선택)" value="<%=lInfo.getMemberGenre()%>"><br>
			<input type="text" size="30" name="memberLikemusic" placeholder="애창곡(선택)" value="<%=lInfo.getMemberLikemusic()%>"><br>
			성별 : 
			<select name="memberGender">
				<option value="male" selected>남</option>
				<option value="female">여</option>
			</select><br>
			작곡여부 : 
			<select name="memberCompose">
				<option value="no" selected>아니오</option>
				<option value="yes">예</option>
			</select><br>
			프로필 사진<br>
			<input type="file" name="memberProfile"><br>
			<input type="submit" value="정보 수정" onclick="return confirm('수정하시겠습니까?')">
		</form>
	</div>
</div>