<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script>
	function showNameChanger() {

		$('.changeNameInfo').css({

			display : 'inline-block'
		});
		$('.currentNameInfo').css({

			display : 'none'
		});
		$('.nameChangebtn').css({

			display : 'none'
		});

	}
	function showEmailChanger() {

		$('.changeEmailInfo').css({

			display : 'inline-block'
		});
		$('.currentEmailInfo').css({

			display : 'none'
		});
		$('.emailChangebtn').css({

			display : 'none'
		});

	}

	function ajaxName() {
		var first = $('.first').val()
		var second = $('.second').val()
		var allData = {
			"allData" : first + ' ' + second
		}
		//alert(allData);
		$.ajax({
			url : "changeInfo.er",
			type : 'POST',
			data : allData,
			success : function(data) {
				//alert("완료!");
				$('.changeNameInfo').css({
					display : 'none'
				});
				$('.currentNameInfo').css({
					display : 'inline-block'
				});
				$('.nameChangebtn').css({
					display : 'inline-block'
				});
				$('.currentName').append().text(first + ' ' + second);
				window.opener.location.reload();
				self.close();
			},
			error : function(data) {
				alert("수정되지 않음");
				self.close();
			}

		});

	}
	function ajaxEmail() {
		var email = $('.email').val()
		var eData = {
			"eData" : email
		}
		//alert(allData);
		$.ajax({
			url : "changeInfo.er",
			type : 'POST',
			data : eData,
			success : function(data) {
				//alert("완료!");
				$('.changeEmailInfo').css({
					display : 'none'
				});
				$('.currentEmailInfo').css({
					display : 'inline-block'
				});
				$('.emailChangebtn').css({
					display : 'inline-block'
				});
				$('.currentEmail').append().text(email);
				window.opener.location.reload();
				self.close();
			},
			error : function(data) {
				alert("수정되지 않음");
				self.close();
			}

		});

	}
</script>
<script>
var selectedIdx = -1;

function pushLayer(target) {
	$('#myModal').show();
};

function deleteAccount(num){
	//alert(num);
	
	location.href="deleteAccount.er?num="+num;
	//get방식으로 넘기면 좀 그런거 같은데 ajax 사용은 없나 찾아보기
	
};



function close_pop(flag) {
	$('#myModal').hide();
};
</script>
<style>
.changeNameInfo {
	display: none;
}

.changeEmailInfo {
	display: none;
}


.myModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(203, 220, 247, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
	background-color: rgb(203, 220, 247);
	margin: 15% auto; /* 15% from the top and centered */
	/* padding: 20px; */
	border: 1px solid #888;
	width: 40%; /* Could be more or less, depending on screen size */
}
</style>
<%@include file="./../common/header.jsp"%>

userInfo${login}

<table>
	<tr>
		<td>이름</td>
		<td class="currentNameInfo">
			<div class="currentName">${login.m_name}</div>


		</td>
		<td class="changeNameInfo">

			<table>
				<tr>
					<td>성 <input class="first" type="text" value="${first}"></td>
					<td>이름 <input class="second" type="text" value="${second}"></td>
				</tr>
				<tr>
					<td><input type="button" onclick="ajaxName()" value="수정"></td>
				</tr>
			</table>

		</td>
		<td>
			<button class="nameChangebtn" type="button"
				onclick="showNameChanger()">수정</button>
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td class="currentEmailInfo">
			<div class="currentEmail">${login.m_email}</div>
		</td>
		<td class="changeEmailInfo">
			<table>
				<tr>
					<td><input class="email" type="text" placeholder="이메일을 입력해주세요"
						value="${email}"></td>
				</tr>
				<tr>
					<td><input type="button" onclick="ajaxEmail()" value="수정"></td>
				</tr>
			</table>
		</td>
		<td>
			<button class="emailChangebtn" type="button"
				onclick="showEmailChanger()">수정</button>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>******</td>
		<td>수정</td>
	</tr>




</table>

<a href="<%=request.getContextPath()%>/">main</a>
<a onclick="pushLayer(this)" id="modalbtn">탈퇴하기</a>

<div id="myModal" class="myModal">
	<div class="modal-content">
		<div class="col-md-12 text-center">
			<div class="submit-review2" onClick="close_pop()">X</div>
			<h2 style="text-align: center;">정말 탈퇴하시겠습니까?</h2>
		</div>
		<p>탈퇴를 하면 안되는 이유</p>
		<button type="button" onclick="deleteAccount(${login.m_num})">예</button>
		<button type="button" onclick="close_pop()">아니요</button>
		
	</div>
</div>
