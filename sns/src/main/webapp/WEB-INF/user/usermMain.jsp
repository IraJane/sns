<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp"%>

<script>
$(function(){
	var count = 0
    $(".hashtag").click(function(){
    	
    	if($('.hash-hashtag').length==0){
	    	$('.hashtag').empty();	
    	}
    	
    	if(count ==0){
    		
	    	$('.hashtag').append("<input class='hash-hashtag' type='text' value='#'>");
	    	count = 1;
    	}
    	
    	$(".hash-hashtag").keypress(function(e) {
    		if (e.keyCode === 13) { 
    			$('.hashtag').append("<input class='hash-hashtag' type='text' value='#'>"); 
    		}
    	});

    	
	    
	    
    	
    	$('.hash-hashtag').each(function(){
    		alert($(this).val());
	    	
	    	
	    	
    	})
    });
});
</script>

<style>
body{
    background: #d4d4d4b8;
    margin:0;
    
}

.big-container{
	width: 70%;
	margin: auto;

}




.leftbar{
    float: left;
    /* border: 1px solid blue; */
    /* margin: 10px; */
    padding: 0 10px;
    text-align: center;
    width: 15%;
}
.leftbar a{
	text-decoration: none;
    color: black;
}

.left-menutable{
	    width: 100%;
    margin: auto;
    /* text-align: center; */
    border-collapse: separate;
  	border-spacing: 0 15px;
  	font-size: 17px;
}

.smallimg{
width: 25px;
    height: 25px;
    border-radius: 50%;
    margin: -8px 0;
    
}
.smallimg span{
	text-decoration: none;
    margin: 0 10px;
    font-size: 25px;
}

</style>
<style>

.rightbar{
	width: 80%;
	margin: 0 20%;
}
.right-heading{
	background: #efefef;
    height: 35px;
    padding: 0 15px;s
}

.left-textarea{
    width: 85%;
    height: 100px;
    margin: 0 10px;
    resize: none;
    border: none;
	outline: none;
}
.left-textarea::placeholder{
	font-size:20px;
	font-weight:bold;
}
.left-smallimg{
	    width: 50px;
    height: 50px;
    border-radius: 50%;
    float:left;
}
.left-newsbtn{
	text-decoration: none;
    color: black;
    /* font-size: 15px; */
    font-weight: bold;
}
.right-inputbtn{
	    float: right;
    border: 1px solid #4c6dca;
    background: #4c6dca;
    color: white;
    padding: 5px;
    border-radius: 10%;
}
</style>
<style>
.story-table{
	    width: 100%;
    margin: 10px 0;
    background: white;
    height: auto;
    border-radius: 5px;
}
</style>

    <%@include file="./../common/header.jsp"%>
usermMain
${login}
${login.m_image}
<br>
<div class="big-container">
<div class="leftbar">
<table class="left-menutable">
	<tr>
		<td>
			<a href="#"><img class="smallimg" src="<%=request.getContextPath() %>/resources/${login.m_num}/${login.m_image}">&nbsp;&nbsp;<span>${login.m_name}</span></a>		
		</td>
	</tr>
	<tr>
		<td style=" background: #f3f3f3;border-radius: 3px; padding: 5px;">
			<a class="left-newsbtn" href="login.er"><i class="fas fa-calendar-week"></i>&nbsp;뉴스 피드</a>
		</td>
	</tr>
	<tr>
		<td>
			<a><i class="fab fa-facebook-messenger"></i>&nbsp;메신저</a>	
		</td>
	</tr>
	


</table>


</div>

<div class="rightbar">
<table style="    width: 100%;">
	<tr>
		<td class="right-heading">
			<h4 style="margin:0;">게시물 만들기</h4>
		</td>	
	</tr>
	<tr>
		<td style="background:white; padding:15px;">
			<form action="insertText.ing" style="margin:0;" method="post">
				<input type="hidden" name="m_num" value="${login.m_num }">
				<div style="width: 90%;">
				<label for="textarea">
					<img class="left-smallimg" src="<%=request.getContextPath() %>/resources/${login.m_num}/${login.m_image}">
				
				</label>
				<textarea name="textarea" class="left-textarea" placeholder="${login.m_name}님 무슨 생각을 하고 계신가요?" name="t_content"></textarea></div>
				<div class="hashtag" name="category">#</div>	
				<div><input class="right-inputbtn" type="submit" value="작성"></div>	
			</form>
		</td>	
	</tr>


</table>

<table class="story-table">
	<tr>
		<td>
			<h4>여기 아래는 스토리 </h4>
		</td>	
	</tr>
	<tr>
		<td>
				<div>0내용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
		</td>	
	</tr>
	<tr>
		<td>
				<div>좋아요</div>
		</td>	
	</tr>
	<tr>
		<td>
				<div>댓글 퍼가기 등</div>
		</td>	
	</tr>


</table>

	


</div>
</div>
