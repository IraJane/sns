<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp"%>
        <%@include file="./../common/header.jsp"%>

<script>
$(function(){
	
	
	
});


</script>
<script>

function startChat(num){
	
	// ajax로 해당 번호 보내서 이 번호와 대화한 내역 가지고 오기 
	// 이 페이지는 다 ajax로 연결을 시키는 게 좋을거 같아 
	
	
}

function insertmsg(your){
	var texxt = $('.insertmessage'+your).val()
	var mine = $('.login-num').val()
	var bean = false;
	
	
	if(event.keyCode == 13){
		var dt = new Date();
		var eData = {"s_fromnum":mine, "s_msg":texxt, "s_date":dt, "s_tonum":your}
		console.log(eData);
		
		$.ajax({
			url : "insertmsg.mess",
			type : 'POST',
			data : eData,
			success: function(data){
				console.log(data);
				var str = '<TR>';
				var flag = false;
				$.each(data, function(i) {
					/* $('.tootoo'+mine).children().remove();
					$('.tootoo'+mine).append("<tr><td>"+
							val.s_msg + "</td></tr>"); */
					 /* $(".tootoo").text("<tr><td>dd</td></tr>").find('.tootoo') */
					
						str += '<TD>' + data[i].s_msg + '</TD>';
		                str += '</TR>';
		                str += '<TD>' + data[i].s_fromnum + '</TD>';
		                str += '</TR>';
		            	flag = true;
						
					
					console.log('str:'+str);
					
					
				});
				if(bean == false){
					$(".tootoo"+your).children().remove();
					$(".tootoo"+your).append(str);
					console.log('ddd');
					str ='';
					bean = true;
					
				}
				//$('.tootoo');
			},
			error : function(data) {
				console.log(data);
				//self.close();
			}
			
		});
		
		
	}
	
	
	
	
	
	
}

</script>
<script>




</script>



<style>
body{
	margin:0;
}
.big-container{
	width: 70%;
    margin: auto;
}
.bigtable-wrapper{
	width: 100%;
    border: 1px solid #b6b6b6;
    margin: 10px 0;
}
.bigimage{
	    width: 100px;
    height: 100px;
    margin: 10px;
}

.followlist{
	    width: 100%;
    /* border: 1px solid; */
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    background: #e0e0e0;
}

.hide{
display:none;
}
.show{
display:inline-block;
}

</style>

<div id="context"></div>

<div class="big-container">

<div  class="bigtable-wrapper">
<table>
<tr>
	<td style="    width: 14%;" >
		<div >
			<img class="smallimg bigimage" src="<%=request.getContextPath() %>/resources/${login.m_num}/${login.m_image}">
			<%-- <input type="text" value="${login.m_num }" class="login-num"> --%>
		</div>
	</td>
	<td >
		<div>
			<p style="    font-size: 30px;font-weight: bold;">채팅</p>
		
		</div>
	</td>
	
</tr>
</table>
<table style="width:100%;">
<tr>
	<td style="    width: 30%;">
		<c:forEach items="${friends }" var="follow">
			<table class="followlist"  onclick="startChat(${follow.m_num})">
				<tr>
					<td>
						
					<%-- 	<input type="text" value="${follow.m_num }" class="numm"> --%>
						<img class="smallimg" src="<%=request.getContextPath() %>/resources/${follow.m_num}/${follow.m_image}">
						
					</td>
					<td>
						${follow.m_name }
					</td>
				</tr>			
			</table>
			
		</c:forEach>
	</td>
	<td>
		<c:forEach items="${friends }" var="follow">
		<c:set var="loop_flag" value="false" />
		<c:forEach items="${mlist }" var="message">
		<table  class="tootoo tootoo${follow.m_num}" >
		<c:if test="${follow.m_num == message.s_tonum }">
				<tr>
					<td>
						${follow.m_num}
						${message.s_msg }
					</td>
				</tr>
				
		
		</c:if>
		<%-- 	 <input type="text" class="insertmessage-num" value="${follow.m_num}"> --%>
	
		</table>
		</c:forEach>
			<c:if test="${not loop_flag }">
			<input type="text" class="insertmessage${follow.m_num} tootoo tootoo${follow.m_num}" onkeypress="if (event.keyCode==13){insertmsg(${follow.m_num});}" placeholder="메세지를 입력하세요${follow.m_num}">
			<c:set var="loop_flag" value="true" />
			</c:if>
		</c:forEach>
				
		
		
	</td>
</tr>


</table>



</div>

</div>