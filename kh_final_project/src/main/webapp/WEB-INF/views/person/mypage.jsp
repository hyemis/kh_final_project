<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 마이페이지</title>
	<!-- cs -->
	<link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/person.userId.css" rel="stylesheet">
	
	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>

	<style>
			#modal {
				display: none;
				z-index: 1;
				position:fixed;
				left: 50%;
				top: 50%;
				width: 100%;
				height: 100%;
			}
			
			#modal>#content {
				width: 300px;
				position: absolute;
				margin: auto;
				padding: 20px;
				background-color: #e5e5e5 ;
			}
			
			#modal .close {
				position: absolute;
				top: 4px;
				right: 4px;
				font-size: 20px;
				border: 0;
				background-color: #e5e5e5 ;
			}
			
			#modal .close:hover, #modal .close:focus {
				color: #000;
				text-decoration: none;
				cursor: pointer;
			}
		</style>

</head>
<body>
	
	<!-- haeder  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm py-5">
		<!-- 상단 네비게이션 영역 -->
		<div>
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-home-tab"
						data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
						role="tab" aria-controls="nav-home" aria-selected="true">회원정보
						관리</button>
					<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
						data-bs-target="#nav-profile" type="button" role="tab"
						aria-controls="nav-profile" aria-selected="false">이력서 관리</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">입사지원 현황</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">스크랩한
						채용공고</button>
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
						<div class="bg-white rounded p-4"
							style="border: 1px dashed rgba(0, 185, 142, .3)">
							<div class="row g-5 align-items-center">
								<div class="mb-4">

									<div class="d-grid gap-2 d-md-flex mb-3">
										<h3 class="mb-3">회원정보수정</h3>

										<!-- 모달창 바로가기버튼 -->
										<button class="btn btn-primary" type="button" id="btnOpen">바로가기</button>

									</div>

									<div class="pi-1">
								<div id="userName">이름 : ${PsUserDto.userName}</div>
								
								<div id="userPhone">핸드폰 : ${PsUserDto.userPhone }</div>
								
								<div id="userEmail">이메일 : ${PsUserDto.userEmail }</div>
							</div>
						</div>
					</div>
				</div>
			</div>

					<div class="bg-light rounded p-3">
						<div class="bg-white rounded p-4"
							style="border: 1px dashed rgba(0, 185, 142, .3)">
							<div class="row g-5 align-items-center">
								<div class="mb-4">
									<h3 class="mb-3">이용현황</h3>
									<div class=""></div>
								</div>
							</div>
						</div>
					</div>
					
					<div style="text-align: right">
						<a href="delete"><u>탈퇴안내</u></a>
					</div>
				
			

				<form id="modal" name="modal" method="post" action="pwChk">
					<div id="content">
						<input type="button" value="X" class="close" id="btnClose"/>
						<label>비밀번호를 입력하세요</label><br/>
						<input type="password" id="confirmPw" name="confirmPw" />
						<button class="btn btn-primary" type="submit">확인</button>
					</div>
				</form>
			</div>


		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	

		<script>
			// modal창
			var btnOpen = document.getElementById('btnOpen');
			var btnClose = document.getElementById('btnClose');

			// modal창 감춤
			var closeRtn = function() {
				var modal = document.getElementById('modal');
				modal.style.display = 'none';
			}

			// modal창 보여줌
			btnOpen.onclick = function() {
				var modal = document.getElementById('modal');
				modal.style.display = 'block';
			}

			btnClose.onclick = closeRtn;
			
			
			// 회원가입 실패 alret
			var msg = "${msg}";
			if(msg) {
				alert(msg);
			}

		</script>
</body>
</html>