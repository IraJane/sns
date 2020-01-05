<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
body{
margin:0;
}
.headcolor{
color:black;
text-decoration:none;
}
.header-box{
	    height: 45px;
    background: #4c6dca;
	
}

.header-left{
    float: left;
    width: 30%;
    height: 100%;
    margin: -3px 16%;
    font-size: 34px;
}
.header-left input{
	width: 85%;
    height: 65%;
    vertical-align: middle;
    border: 1px solid #404040;
    border-radius: 3px;
}



.header-right{
	float:right;
    margin: 10px 15% 0 0;
}
</style>

<div class="header-box">
	<div class="header-left">
		<a href="login.er"><i class="headcolor fas fa-chess-queen"></i></a>&nbsp;<input type="text" placeholder="검색">
	
	</div>
	<div class="header-right">
		<a href="info.er"><img class="smallimg" src="<%=request.getContextPath() %>/resources/${login.m_num}/${login.m_image}"><span class="headcolor">${login.m_name}</span></a>		
		<a href="login.er" class="headcolor">홈</a>
		<a href="#" class="headcolor">친구찾기</a>
		<a href="#" class="headcolor"><i class="fas fa-user-friends"></i></a>
		<a href="#" class="headcolor"><i class="fab fa-facebook-messenger"></i></a>
		<a href="#" class="headcolor"><i class="fas fa-bell"></i></a>
		<a href="#" class="headcolor"><i class="fas fa-sign-out-alt"></i></a>
	</div>


</div>