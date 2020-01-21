<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp"%>
        <%@include file="./../common/header.jsp"%>

<script>
window.onload=function(){
	//alert($(location).attr('search'));
	var url = $(location).attr('search');
	var gg = url.split('=');
	console.log(gg[1])
	if(gg[1] != null){
		var mynum = $('.loginnum').val()
		console.log(mynum +','+gg[1])
		startChat(mynum, gg[1])
		
	}
	
}

</script>
<script>

function startChat(mynum, yournum){
	
	var eData = {"s_fromnum":mynum, "s_tonum": yournum};
	
	$.ajax({
		url:'getMessage.mess',
		type : 'POST',
		data : eData,
		success: function(data){
			console.log('dhk');
			console.log(data.length)
			
			if(data.length > 0){
				var msgg = '';
				$('.tootoo').empty();
				for(var i = 0; i<data.length; i++){
					console.log(i);
					msgg = msgg + '<tr><td>'+data[i].s_msg +'</td><td>'+data[i].s_date +'</td></tr>';
					
				}
				$('.insertmsg').addClass('hide');
				$('.insertmessage'+yournum).addClass('show');
				$('.tootoo').append(msgg);
				var getinsert = $('.insertmessage'+yournum);
				if(getinsert.length == 0){
					$('.tootoo').append('<div><input type="text" class="insertmsg insertmessage'+yournum+' tootoo tootoo'+yournum+'" onkeypress="if (event.keyCode==13){insertmsg('+yournum+');}" placeholder="메세지를 입력하세요'+yournum+'"></div>')
					
				}
				
			}
			if(data.length == 0){
				$('.insertmsg').addClass('hide');
				$('.insertmessage'+yournum).addClass('show');
				$('.tootoo').empty();
				var getinsert = $('.insertmessage'+yournum);
				if(getinsert.length == 0){
					$('.tootoo').append('<div><input type="text" class="insertmsg insertmessage'+yournum+' tootoo tootoo'+yournum+'" onkeypress="if (event.keyCode==13){insertmsg('+yournum+');}" placeholder="메세지를 입력하세요'+yournum+'"></div>')
					
				}	
			}
			
			
			
		},
		error : function(data) {
			console.log('error');
			//self.close();
		}
		
		
		
		
		
		
	}) 
	
	
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
				
				var msgg = '';
				$('.tootoo').empty();
				for(var i = 0; i<data.length; i++){
					console.log(i);
					msgg = msgg + '<tr><td>'+data[i].s_msg +'</td><td>'+data[i].s_date +'</td></tr>';
					
				}
				$('.insertmsg').addClass('hide');
				$('.insertmessage'+your).addClass('show');
				$('.tootoo').append(msgg);
				var getinsert = $('.insertmessage'+your);
				if(getinsert.length == 0){
					$('.tootoo').append('<div><input type="text" class="insertmsg insertmessage'+your+' tootoo tootoo'+your+'" onkeypress="if (event.keyCode==13){insertmsg('+your+');}" placeholder="메세지를 입력하세요'+your+'"></div>')
					
				}
				
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

.tootoo{
/* 	    border: 1px solid red; */
    width: 65%;
    margin: 10px;
    float: right;
    height: 30px;
    display: inline-block;
}
}

</style>

<div id="context"></div>

<input type="hidden" class="loginnum" value="${login.m_num}">
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

<div style="width:30%;display: inline-block;">
		<c:forEach items="${friends }" var="follow">
			<table class="followlist"  onclick="startChat(${login.m_num},${follow.m_num})">
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
	
	<%-- <td  class="tootoo tootoo${follow.m_num}" > --%>
		<%-- <c:forEach items="${friends }" var="follow">
		<c:set var="loop_flag" value="false" />
		<c:forEach items="${mlist }" var="message">
		<table  > --%>
		
				<%-- <tr class="tootoo tootoo${follow.m_num}" >
					<td>
						친구를 눌러 채팅을 시작하세요 
					</td>
				</tr> --%>
				
		
		
		<%-- 	 <input type="text" class="insertmessage-num" value="${follow.m_num}"> --%>
	
	<%-- 	</table>
		</c:forEach>
			<c:if test="${not loop_flag }">
			<input type="text" class="insertmessage${follow.m_num} tootoo tootoo${follow.m_num}" onkeypress="if (event.keyCode==13){insertmsg(${follow.m_num});}" placeholder="메세지를 입력하세요${follow.m_num}">
			<c:set var="loop_flag" value="true" />
			</c:if>
		</c:forEach> --%>
				
		
		
	<!-- </td> -->



</div>
<div   class="tootoo" >

	친구를 클릭해 대화를 시작하세요


</div>



</div>

</div>