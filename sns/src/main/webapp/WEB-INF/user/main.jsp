<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>

<script>
function direct(){
	
	location.href="signup.er";
}

</script>
<style>
body{
margin: 0;
}
.body-wrapper{
margin: 0 100px;
	background: #f2f2f2;
}

.rightbar{
	float:right;
	width: 20%;
    /* margin: 0 10px; */
    height: 1000px;
    background: white;
    text-align:center;
}
.left-text{
	    position: absolute;
    margin: -35% 19%;
    background: #ffffffd4;
    padding: 30px;
    opacity: 0.7;
    border-radius: 5px;
    font-size: 40px;
    text-align: center;

}

.inputstyle {
	    background: #ebebeb;
    border: 1px solid #aeaeae;
    padding: 5px;
    border-radius: 5px;
    width:100%;
}

.login-input {
	background: #5e85dc;
    padding: 5px;
    width: 100%;
    border: 1px solid #537edd;
    border-radius: 5px;
    font-size: 20px;
    margin: 10px 0;
}

.signup-input {
	    border: none;
    background: none;
    font-size: 13px;
    /* text-align: center; */
    margin: auto;
    width: 100%;
    color: #6c6c6c;
}

.headcolor{
color:black;
text-decoration:none;
font-size:40px;
    margin: 0 0 0 100px;
}
.header-box{
	    height: 45px;
    background: #4c6dca;
	
}

</style>

<div class="header-box"><i class="headcolor fas fa-chess-queen"></i></div>





<div class="body-wrapper">

<div class="rightbar" >
	<div style="padding:10px;">

		<h4>로그인</h4>
		<form action="login.er" method="post">
		<table style="width: 100%;margin: auto;text-align: center;">
			<tr>
				<td><input class="inputstyle" type="text" name="m_email" placeholder="아이디" autocomplete="off"></td>
			</tr>
			<tr>
				<td><input class="inputstyle" type="password" name="m_password" placeholder="비밀번호" autocomplete="off"></td>
			</tr>
			<tr>
				
				<td><input class="login-input" type="submit"  value="Login" ></td>
			</tr>
		
		
		</table>
		</form>
		
		<hr>
		<button class="signup-input" type="button" onclick="direct()">회원가입 하기</button>
	</div>
</div>

<div class="leftbar" style="    width: 80%;">
<img src="./resources/img/map.jpg" style="    opacity: 0.5;    width: 100%;height: 1000px;">

</div>
</div>