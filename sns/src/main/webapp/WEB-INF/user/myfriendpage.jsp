<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="./../common/header.jsp"%>
<style>
body{
	margin:0;
	background: #d4d4d4b8;
}
.total-container{
/* 	    border: 1px solid red; */
    width: 68%;
    margin: auto;
	
}
.friendslist{
	    margin: 15px 0;
    background: white;
    width: 100%;
    text-align: center;
    height: 100px;
}

.persons-img{
	    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin: 10px;
}


</style>

<div class="total-container">

	<c:forEach items="${friends }" var="friend">
		<table class="friendslist">
			<tr>
				<td  style="width: 20%;">
					<img class="persons-img" src="<%=request.getContextPath() %>/resources/${friend.m_num}/${friend.m_image}">
				</td>
				<td>
					${friend.m_name }
				</td>
				<td>
					<a href="tomessenger.mess?f_num=${friend.m_num }" class="headcolor"><i class="fab fa-facebook-messenger"></i></a>
				</td>
				
			</tr>
			
		</table>
	
	</c:forEach>

</div>