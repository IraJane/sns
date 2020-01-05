<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<h3>회원가입 하기</h3>

<form action="signup.er" method="post" enctype="multipart/form-data">

<table>
	<tr>
		<td>
			이메일
		</td>
		<td>
			<input name="m_email" type="text">
		</td>
	</tr>
	
	<tr>
		<td>
			비밀번호
		</td>
		<td>
			<input name="m_password" type="password">
		</td>
	</tr>
	
	<tr>
		<td>
			비밀번호 확인
		</td>
		<td>
			<input name="pass_check" type="password">
		</td>
	</tr>
	
	<tr>
		<td>
			이름
		</td>
		<td>
			<input name="m_firstname" type="text"> <input name="m_lastname" type="text">
		</td>
	</tr>
	
	<tr>
		<td>
			이미지
		</td>
		<td>
			<input name="imglist" type="file">
		</td>
	</tr>
	
	<tr>

		<td>
			<input value="SignUp" type="submit"> 
		</td>
	</tr>
	
	



</table>

</form>