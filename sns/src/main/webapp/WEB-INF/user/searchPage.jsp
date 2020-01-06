<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<script>
$(function(){
	$('.selectPerson').click(function(){
		
		$('.posts').addClass('post-hidden')
		$('.posts').removeClass('post')
		$('.persons').removeClass('person-hidden')
		$('.selectPerson').children().addClass('menu');
		$('.selectPost').children().removeClass('menu');
		
	});
	$('.selectPost').click(function(){
		$('.persons').addClass('person-hidden')
		$('.persons').removeClass('person')
		$('.posts').removeClass('post-hidden')
		$('.selectPerson').children().removeClass('menu');
		$('.selectPost').children().addClass('menu');
	});
	
});


</script>







<style>
body{
	margin:0;
	background: #d4d4d4b8;
}
.menu-table{
    width: 100%;
    text-align: center;
    background: white;
    height: 35px;
    color: #646464;
}

.total-container{
/* 	    border: 1px solid red; */
    width: 68%;
    margin: auto;
	
}
.person{
	display:inline-block;
}
.post{
	display:inline-block;
}

.person-hidden{
	display:none;
}
.post-hidden{
	display:none;
}

.persons{
	width:100%;
	margin: 10px 0;
}
.menu{
	border-bottom: 3px solid #4c6dca;
    color: black;
    font-weight: bold;
}

.nothingfound{
	width: 100%;
    background: white;
    margin: 10px 0;
    height: 100px;
    border-radius: 5px;
}

.persons-table{
	    width: 100%;
    background: white;
    height: 100px;
    border-radius: 5px;
}
.persons-img{
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin: 15px 10px;
}
.persons-atag:hover, .persons-atag:active, .persons-atag:visited, .persons-atag:link{
	color: #4c6dca;
	text-decoration:none;
}

.posts-table{
	    height: 100px;
    background: white;
    width: 100%;
    margin: 10px 0;
    border-radius: 5px;
}

</style>



<%@include file="./../common/header.jsp"%>

<table class="menu-table">
	<tr>
		<td  class="selectPerson"><a class="menu">사람</a></td>
		<td class="selectPost"><a>게시물</a></td>
	</tr>

</table>

<div class="total-container">





 
<div class="persons person">
	
	<c:if test="${fn:length(keymember) == 0}">
	<table class="nothingfound">
			<tr>
					<td>
						검색되지 않음
					</td>
				</tr>
			<tr>
	</table>
	</c:if>
	
	
	<c:forEach items="${keymember }" var="member">
	<table class="persons-table">
		<tr>
			<td style="width: 10%;">
				<img class="persons-img" src="<%=request.getContextPath() %>/resources/${member.m_num}/${member.m_image}">
			</td>
			<td style="width: 70%;font-size: 30px;color: #4c6dca;">
				<a class="persons-atag" href="search.er?m_num=${member.m_num }">${member.m_name }</a>
			</td>
			<td style="width: 20%;">
			
				<table style="border: 1px solid gray;">
					<tr>
						<td style="border-right: 1px solid gray;">
							<p style="    margin: 0 10px;"><i class="fas fa-user-plus"></i>친구추가</p> 
						
						</td>
						<td>
							<p style="margin: 0 10px;"><i class="fas fa-ellipsis-h"></i></p>
						
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</c:forEach>

</div>

<div class="posts post-hidden">
	
		<c:if test="${fn:length(keylist) == 0}">
		<table  class="nothingfound">
			<tr>
					<td>
						검색되지 않음
					</td>
				</tr>
			<tr>
		</table>
		</c:if>
		
	<c:forEach items="${keylist }" var="list">
	<table class="posts-table">		
		<tr>
			<td>
				${list.t_content }
			</td>
		</tr>
	</table>
	</c:forEach>

</div>









</div>