<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.RegisterBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<% RegisterBean lInfo = (RegisterBean)session.getAttribute("LoginInfo"); %>

<div class="MyPage_Container">
	<div class="MyPage_Content">
		<div id="MyPage_TOP">
			<h1><%=lInfo.getMemberId() %>의 캐시 충전 프로젝트</h1>
		</div>
		
		<div id="MyPage_Body">
			<form class="MyPage_Cash_Form" method=post action="Index.jsp?Module_PAGE=MyPage_controller.jsp?st=cash&pay=plus">
				<TABLE class="Cash_Table" border="2">
					<thead bgcolor="#d5d5d5">
						<th>금액</th>
						<th>금액 + 보너스</th>
					</thead>
					<tbody>
						<tr>
							<td><input type="radio" name="cs" value="10100"> 10,000원</td>
							<td>10,000 + 100p</td>
						</tr>
						<tr>
							<td><input type="radio" name="cs" value="20200"> 20,000원</td>
							<td>20,000 + 200p</td>
						</tr>
						<tr>
							<td><input type="radio" name="cs" value="30300"> 30,000원</td>
							<td>30,000 + 300p</td>
						</tr>
						<tr>
							<td><input type="radio" name="cs" value="50500"> 50,000원</td>
							<td>50,000 + 500p</td>
						</tr>
						<tr>
							<td colspan=2><input type="submit" value="충전하기" onclick="return confirm('충전하시겠습니까?')" style="font-size:15pt; width:100px;"></td>
						</tr>
					</tbody>
				</TABLE>
			</form>
			
			<p style="font-weight:bold; text-align:left;">충전 시 유의사항</p>
			<div class="attention" style="text-align:left;">
				- 해당 상품은 부가가치세가 별도로 부과됩니다.<br><br>
				- 충전 후 사용하신 포인트는 환불할 수 없습니다.<br><br>
				- 자세한 사항은 고객센터로 문의 바랍니다.
			</div>
		</div>
	</div>
</div>