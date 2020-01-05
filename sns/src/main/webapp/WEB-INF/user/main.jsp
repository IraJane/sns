<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>

<script>
function direct(){
	
	location.href="signup.er";
}

</script>
<style>
.rightbar{
float:right;
}

</style>
<div class="rightbar">

<h4>안녕하세요 </h4>
<form action="login.er" method="post">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="m_email" ></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="m_password" ></td>
	</tr>
	<tr>
		
		<td><input type="submit"  value="Login" ></td>
	</tr>


</table>
</form>

<hr>
<button type="button" onclick="direct()">회원가입 하기</button>
</div>

<div class="leftbar">
<img  src="map.png" width="200px">

</div>