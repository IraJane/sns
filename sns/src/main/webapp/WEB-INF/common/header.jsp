<%@page import="user.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	User login = (User) session.getAttribute("userLoginfo");
	String url = request.getContextPath();
	if(login == null){
		response.sendRedirect(url + "/main.er");


	}
%>



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

.smallimg{
width: 25px;
    height: 25px;
    border-radius: 50%;
    margin: -8px 0;
    
}
</style>

<div class="header-box">
	<div class="header-left">
	<form action="search.er">
		<a href="login.er"><i class="headcolor fas fa-chess-queen"></i></a>&nbsp;<input name="keyword" type="text" placeholder="검색">
	</form>
	
	</div>
	<div class="header-right">
		<a href="info.er"><img class="smallimg" src="<%=request.getContextPath() %>/resources/${login.m_num}/${login.m_image}"><span class="headcolor">${login.m_name}</span></a>		
		<a href="login.er" class="headcolor">홈</a>
		<a href="friends.er" class="headcolor"><i class="fas fa-user-friends"></i></a>
		<a href="tomessenger.mess" class="headcolor"><i class="fab fa-facebook-messenger"></i></a>
		<a href="logout.er" class="headcolor"><i class="fas fa-sign-out-alt"></i></a>
	</div>


</div>