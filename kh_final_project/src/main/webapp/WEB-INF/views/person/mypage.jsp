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
							
							 <a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#editModal">모달띄우기</a> 
							 
						<!--  	<button type="button" class="btn btn-outline-danger" onclick="location.href='/update'">바로가기</button>-->
							</div>
							
							<div class="pi-1">
								<label for="userName"/>이름 : </label>
								<input name="userId" value="${PsUserDto.userId}" type="text" border="none" readonly="readonly"><br>
								
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


	<script>
		$(document).ready(function(){
		    $("#myBtn").click(function(){
		        $("#editModal").modal();
		    });
		});
	</script>

</body>
</html>