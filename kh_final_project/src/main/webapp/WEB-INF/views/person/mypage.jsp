<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 마이페이지</title>
</head>
<body>
	<!-- haeder : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm py-5">	
		<!-- 상단 네비게이션 영역 -->
		<div>
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-home-tab"
						data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
						role="tab" aria-controls="nav-home" aria-selected="true">회원정보 관리</button>
					<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
						data-bs-target="#nav-profile" type="button" role="tab"
						aria-controls="nav-profile" aria-selected="false">이력서 관리</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">입사지원 현황</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">스크랩한 채용공고</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">관심기업정보</button>
				</div>
			</nav>			
		</div>
		
		<div class="container-sm">	
	
		<div class="grid gap-4 m-4">
			<h2>회원정보관리</h2>
		  	<span>회원님의 개인정보를 관리하는 곳입니다.</span>
		</div>
	
			<div class="container-sm py-5">	
				<div class="grid gap-3 border border-dark-subtle">	
			
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							
							<div class="d-grid gap-2 d-md-flex mb-3">
							<h3 class="mb-3">회원정보수정</h3>
							
							<!-- 모달창 -->
							<input type="button" value="바로가기" id="btnOpen">

							<div id="modal">
								<div id="content">
									<input type="button" value="X" class="close" id="btnClose"/>
									<label>비밀번호를 입력하세요</label><br/>
									<input type="password" id="confirmPw" name="confirmPw" />
									<input type="button" value="확인" id="btnCheck" onclick="checkPassword();"/>
								</div>
							</div>
							 
							</div>
							
							<div class="pi-1">
								<label for="userName"/>이름 : </label>
								<input name="userName" value="${PsUserDto.userName}" type="text" border="none" readonly="readonly"><br>
								
								<label for="userPhone"/>핸드폰 : </label>
								<input value="${PsUserDto.userPhone }"  type="text" readonly="readonly"><br>
								
								<label for="userEmail"/>이메일 : </label>
								<input value="${PsUserDto.userEmail }" type="text" readonly="readonly"><br>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">이용현황</h3>
							<div class="">
								
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<style>
		#modal{
			display : none;
			z-index : 1;
			background-color: rgba(0,0,0,.3);
			position:fixed;
			left:0;
			top: 0;
			width:100%;
			height:100%;
			
		}
		#modal>#content{
			width:300px;
			margin:100px auto;
			padding:20px;
			position: relative;
			background-color:#fff;
		}
		
		#modal .close{
			position:absolute;
			top:4px;
			right:4px;	
			font-size:20px;
			border:0;
			background-color: #fff;
		}
		
		#modal .close:hover,
		#modal .close:focus {
		  color : #000;
		  text-decoration: none;
		  cursor :pointer;
		}
	</style>

	<script>
	
		// modal창
		var btnOpen  = document.getElementById('btnOpen');
		var btnCheck = document.getElementById('btnCheck');
		var btnClose = document.getElementById('btnClose');
		
		// modal창 감춤
		var closeRtn = function(){
		  var modal = document.getElementById('modal');
		  modal.style.display = 'none';
		}
		
		// modal창 보여줌
		btnOpen.onclick = function(){
		  var modal = document.getElementById('modal');
		  modal.style.display = 'block';
		}
		
		btnCheck.onclick = closeRtn;
		btnClose.onclick = closeRtn;
		
		
		// 입력 비밀번호 체크 - 일치하면 회원정보수정 페이지로 이동
		function checkPassword() {
			var userPw = document.getElementById("userPw").value;
			var confirmPw = document.getElementById("confirmPw").value;
			if(userPw != confirmPassword){ 
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}else{	
				location.href="update.jsp";
				return true;
				}
			}
		
		
	</script>

</body>
</html>