<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="Join_div">
	<div id="Join_form">
		<h1>회원 정보 입력</h1>
		<form method="post" action="MODULE/Join_controller.jsp" enctype="Multipart/form-data">
			<input id="mid" type="text" size="21" placeholder="아이디(필수)">&emsp;<input id="midc_btn" type="button" id="Join_idCheck" value="중복확인" onclick="idCheck()"><br>
			<input id="memid" type="hidden" name="memberId" value="">
			<input id="mid_check" type="hidden" name="memberId_Check" value="IdUncheck">
			<input type="password" size="30" name="memberPw" placeholder="비밀번호(필수)"><br>
			<input type="password" size="30" name="memberPw_Re" placeholder="비밀번호 재입력(필수)"><br>
			<input type="text" size="30" name="memberName" placeholder="이름(필수)"><br>
			<input type="text" size="30" name="memberRRN" placeholder="생년월일(필수)"><br>
			<input type="text" size="30" name="memberPhone" placeholder="전화번호(필수)"><br>
			<input type="text" size="30" name="memberEmail" placeholder="이메일(필수)"><br>
			<input type="text" size="30" name="memberGenre" placeholder="선호 장르(선택)"><br>
			<input type="text" size="30" name="memberLikemusic" placeholder="애창곡(선택)"><br>
			성별 : 
			<select name="memberGender">
				<option value="male" selected>남</option>
				<option value="female">여</option>
			</select><br>
			작곡여부 : 
			<select name="memberCompose">
				<option value="no" selected>아니오</option>
				<option value="yes">예</option>
			</select><br><br>
			프로필 사진<br>
			<input type="file" name="memberProfile"><br>
			<input type="submit" value="회원가입" onclick="return confirm('가입하시겠습니까?')">
		</form>
	</div>
</div>

<script type="text/javascript">
	function idCheck()
	{
		id = document.getElementById("mid");
		
		if(id.value == "") {
			alert("ID를 입력하세요");
			return;
		} else {
			url = "MODULE/Join_IdCheck.jsp?id=" + id.value;
			open(url, "IdCheck", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
		}
	}
</script>