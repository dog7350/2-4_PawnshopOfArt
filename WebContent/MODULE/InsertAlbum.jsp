<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.RegisterBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String admin = (String)session.getAttribute("LoginState");
	RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo");
	String compose = lInfo.getMemberCompose();
%>

<% if(admin == null) { %>
	<script>
		alert('로그인 시 이용 가능합니다.');
		history.back();
	</script>
<% } else if(compose.equals("no") && admin.equals("True")) { %>
	<script>
		alert('작곡가만 이용 가능합니다.');
		history.back();
	</script>
<% } else {%>
	<section>
		<div id="Album_Container">
			<div class="Album_Content">
				<h1 style="margin-top:15px;">앨범</h1>
				<div class="formdiv">
					<form id="boardform" method="post" action="MODULE/Album_controller.jsp?A_State=write" enctype="Multipart/form-data">
						<% if(admin.equals("관리자")) {%>
							제목 : <input type="text" size="44" name="AlbumTitle">
							아티스트 : <input type="text" size="13" name="AlbumArtist">
							장르 : 
							<select name="A_Genre" style="font-size:16pt;">
								<option>None</option>
								<option>K-POP</option>
								<option>POP</option>
								<option>J-POP</option>
							</select>
							<select name="A_Notice" style="font-size:16pt;">
								<option>일반</option>
								<option>공지</option>
							</select>
						<%} else { %>
							제목 : <input type="text" size="49" name="AlbumTitle">
							아티스트 : <input type="text" size="15" name="AlbumArtist">
							장르 : 
							<select name="A_Genre" style="font-size:16pt;">
								<option>K-POP</option>
								<option>POP</option>
								<option>J-POP</option>
							</select>
						<%} %>
						<textarea cols="104" rows="100" name="AlbumContent"></textarea><br>
						<Table style="width:100%; margin-bottom:10px;">
							<tr>
								<td>앨범 이미지</td>
								<td><input type="file" name="AlbumImage"></td>
							<tr>
							<tr>
								<td>가격</td>
								<td><input type="text" name="AlbumPrice" value=0></td>
							</tr>
							<tr>
								<td>음악 (10MB 이하)</td>
								<td><input type="file" name="AlbumMusic"></td>
							</tr>
						</Table>
						<input type="button" value="취소" onclick="history.back()">
						<input type="submit" value="완료">
					</form>
				</div>
			</div>
		</div>
	</section>
<%} %>