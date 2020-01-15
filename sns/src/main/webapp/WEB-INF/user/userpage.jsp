<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script>
function heartThis(a,b){
	
	var eData = {"t_num":a,"m_num":b};
	
	$.ajax({
		url : "heartThis.ing",
		type : 'POST',
		data : eData,
		success : function(data) {
			//alert("완료!");
			console.log("완료");
			//$('.heartemoji'+a).children().remove();
			//$('.heartemoji'+a).prepend('<i class="fas fa-heart"></i>');
			/* $('.thereisheart'+a).css({display:'inline-block'});
			$('.therenoisheart'+a).css({display:'none'}); */
			//$('.heartemoji').addClass("fas");
			window.location.reload();
			//self.close();
		},
		error : function(data) {
			alert("수정되지 않음");
			//self.close();
		}

	});
	
	
	
}





function dontheartThis(a,b){
	
	var eData = {"t_num":a,"m_num":b};
	
	$.ajax({
		url : "dontheartThis.ing",
		type : 'POST',
		data : eData,
		success : function(data) {
			//alert("완료!");
			console.log("삭제로 오기 완료");
			//$('.heartemoji'+a).children().remove();
			//$('.heartemoji'+a).prepend('<i class="far fa-heart"></i>');
			//$('.heartemoji'+a).prepend('<i class="far fa-heart"></i>');
			/* $('.thereisheart'+a).css({display:'none'});
			$('.therenoisheart'+a).css({display:'inline-block'}); */
			//$('.heartemoji').addClass("fas");
			window.location.reload();
			//self.close();
		},
		error : function(data) {
			alert("수정되지 않음");
			//self.close();
		}

	});
	
	
	
}


function addfriend(a){
	console.log(a);
	var eData = {"f_theirNum":a};
	
	$.ajax({
		url : "addfriend.er",
		type : 'POST',
		data : eData,
		success: function(data){
			console.log("add")
			$('.insidetext').children().remove();
			$('.insidetext').append('<a onclick="deletefriend(${login.m_num })"><span class="addfriend">언팔로우</span></a>');
			
		},
		error : function(data) {
			alert("no friend");
			//self.close();
		}
		
	});
}

function deletefriend(a){
	console.log('delete');
	var eData = {"f_theirNum":a};
	
	$.ajax({
		url : "deletefriend.er",
		type : 'POST',
		data : eData,
		success: function(data){
			console.log("removeeee")
			$('.insidetext').children().remove();
			$('.insidetext').append('<a onclick="addfriend(${login.m_num })"><span class="addfriend">친구추가</span></a>');
			
		},
		error : function(data) {
			alert("no friend");
			//self.close();
		}
		
	});
	
	
	
}




</script>  


    
<style>
body{
	margin:0;
	background: #d4d4d4b8;
}

.total-container{
	margin: 0px 16.45444%;
}

.head-wrapper{
	    height: 400px;
    background: white;

}


.backgroundimg {
	    width: 100%;
    height: 350px;
}

.background-name{
    margin: -120px 10px;
    font-size: 40px;
    color: white;
}
.background-img{
width: 150px;
    height: 150px;
    border-radius: 50%;
    border: 8px solid white;
}
.background-span{
    color: white;
    font-weight: bold;
    margin: -100px 180px 0;
}
.background-changebtns{
    width: 60%;
    margin: 10px auto;
    height: 30px;
    border-left: 1px solid #d0d0d0;
    border-right: 1px solid #d0d0d0;
}
.background-changebtns table{
	    width: 100%;
    text-align: center;
}
.background-changebtns td{
    font-size: 15px;
    color: #4c6dca;
    font-weight: bold;
    width: 30%;
}


</style>   
<style>
.story-wrapper{

}
.story-table{
    border: 1px solid #b9b9b9;
    margin: 10px 0;
    width: 100%;
    background: white;
    border-radius: 5px;

}

.story-nickimg{
    width: 60px;
    height: 60px;
    border-radius: 50%;
    margin: 10px;
}
.story-nick{
    font-size: 30px;
    color: #6e6edc;
}




.likebox{
	    border-top: 1px solid #9c9c9c;
    border-bottom: 1px solid gray;
        width: 100%;
}
.likebox table{
    width: 100%;
    text-align: center;
}

.commentbox{
	width: 90%;
    border-radius: 30px;
    border: 1px solid gray;
    padding: 8px;
    background: #dddddd;
    outline: none;
        margin: 5px 0;
}
.comment-smallimg{
	width: 35px;
    height: 35px;
    border-radius: 50%;
    margin: -13px 0;
}


.post-images{
	width: 95%;
    margin: 10px;
    height: auto;
}

</style>    
    
    
    
    
    
    
    
<%@include file="./../common/header.jsp"%>

<input type="hidden" name="mnum" class="mnum" value="${thisUser.m_num }">
<div class="total-container" >
<div class="head-wrapper">
	<div class="background-place">
		<img class="backgroundimg" src="<%=request.getContextPath() %>/resources/img/backgroundimg.jpg">
	</div>
	<div class="background-name">
		<img class="background-img" src="<%=request.getContextPath() %>/resources/${thisUser.m_num}/${thisUser.m_image}">
		<p class="background-span">${thisUser.m_name }</p>
		
		
		
		<div class="background-changebtns">
			<table>
				<tr>
					<td  class="insidetext">
						
						<c:if test="${followlist == 5  }">
								나의 계정
						</c:if>
						
						<c:if test="${followlist == 0}">
							<a onclick="addfriend(${login.m_num })"><span class="addfriend">친구추가</span></a>
						</c:if>
						<c:if test="${followlist != 0 && followlist != 5 }">
							<a onclick="deletefriend(${login.m_num })"><span class="addfriend">언팔로우</span></a>
						</c:if>
						 
					</td>
					<td style="border-left: 1px solid #d0d0d0;border-right: 1px solid #d0d0d0;"><a href="#">메시지 보내기</a></td>
					<td style="    border-right: 1px solid #e2e2e2;"><a href="#">사진</a></td> <!-- heartThis.ing -->
					<td>...</td> <!-- heartThis.ing -->
				</tr>
			</table>
		</div>
	</div>
</div>
	
	
	
	
	
<div class="story-wrapper">
	
	
	
	   
	<c:forEach items="${list }" var="text">
	<input type="hidden" class="tnum" value="${text.t_num }">
	<table class="story-table">
		<tr>
			<td style="width: 8%;">
				<img class="story-nickimg" src="<%=request.getContextPath() %>/resources/${thisUser.m_num}/${thisUser.m_image}">
				
			</td>
			<td>
				<a class="story-nick">${thisUser.m_name }</a>
				<div>${text.t_todate }</div>
			</td>
			
		</tr>
		
		<tr>
			
			<td colspan=2>
			${text.t_content }
			</td>
		</tr>
		<tr>
			
			<td colspan=2 style="    text-align: center;">
			
				<c:forEach items="${text.t_image }" var="images" >
					<img class="post-images" src="<%=request.getContextPath() %>/resources/${thisUser.m_num}/posts/${text.t_num}/${images}">
				</c:forEach>
			</td>
		</tr>
		<tr>
			
			<td  class="likebox" colspan=2>
				<table class="likeboxtable">
					<tr>
						<td>
							
							
							
							<c:set var="testnum" value="${text.t_num }"></c:set>
							
							
							
								<c:if test="${fn:contains(mylikes,testnum) }">
									<%-- <c:if test="${not loop_flag }"> --%>
									
									<a class="thereisheart${text.t_num }" onclick="dontheartThis(${text.t_num },${thisUser.m_num })" ><span class=" heartemoji${text.t_num }"><i class="fas fa-heart"></i> 좋아요</span></a>
									<c:set var="loop_flag" value="true" />
									
								<%-- 	</c:if> --%>
								</c:if>
								
								<%-- <c:otherwise> --%>
									<c:if test="${!fn:contains(mylikes,testnum) }">
								
									<c:set var="loop_flag" value="true" />
									<a class="thereisnoheart${text.t_num }" onclick="heartThis(${text.t_num },${thisUser.m_num })" ><span class=" heartemoji${text.t_num }"><i class="far fa-heart"></i> 좋아요</span></a>
									
									</c:if> 
								<%-- </c:otherwise> --%>
									
							
							<c:forEach items="${mylikes }" var="likes">
								<c:if test="${!fn:contains(likes, testnum) && loop_flag == false }">
									
									<c:set var="loop_flag" value="true" />
									<a class="thereisnoheart${text.t_num }" onclick="heartThis(${text.t_num },${thisUser.m_num })" ><span class=" heartemoji${text.t_num }"><i class="far fa-heart"></i> 좋아요</span></a>
								</c:if>
							
							</c:forEach>	
							
							
								
							
							
							
						</td>   <!-- <i class="fas fa-heart"></i>  -->
						<td><i class="far fa-comment-alt"></i> 댓글</td>
						<td><i class="fas fa-external-link-alt"></i> 공유하기</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			
			<td colspan=2 style="height: 35px;text-align: center;">
				<img class="comment-smallimg" src="<%=request.getContextPath() %>/resources/${thisUser.m_num}/${thisUser.m_image}">
				<input class="commentbox" type="text" placeholder="댓글을 입력해주세요">
			</td>
		</tr>
	</table>
	</c:forEach>
	
</div>
	
	
	
	
<div class="image-wrapper">
imgimg




</div>
	
	
	
	
	
	
	
	
	
	
	
</div>













   