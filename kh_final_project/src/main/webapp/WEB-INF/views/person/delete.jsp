<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 회원탈퇴</title>
<!-- cs -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico"
	rel="icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/person.css"
	rel="stylesheet">

<!-- js -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>


</head>
<body>


	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">
		<c:if test="${PsUserDto.userRole == 'ROLE_P'}">
			<div class="text-start mx-5 mt-5">
				<h1>회원 탈퇴</h1>
				<br>
				<p>	＊JOB-A에서는 다양한 맞춤서비스들을 제공하고 있습니다.<br> 
				            ＊탈퇴를 하시면 다음과 같은 서비스를 이용하실 수 없습니다.<br> 
					＊소셜계정을 통해 가입된 정보는 JOB-A에서만 삭제되며, 해당 소셜 채널에서 탈퇴되지 않습니다.
				</p>
				<div class="container-sm py-5">
					<div class="grid gap-3 border border-dark-subtle">
						<div class="bg-light rounded p-3">
							<div class="bg-white rounded p-4"
								style="border: 1px dashed rgba(0, 185, 142, .3)">
								<div class="row g-5 align-items-center">
									<div class="mb-4">
										<div class="d-grid gap-2 d-md-flex mb-1">
											<h3 class="mb-3">탈퇴를 하시면</h3>
										</div>
											<b>이력서 삭제</b><br> 
											등록해 놓은 이력서가 삭제되어 원하시는 기업의 채용공고에 JOB-A의
											이력서를 사용한 온라인 지원에 제약이 가해질 수 있습니다.<br><br> 
											<b>입사지원내역 조회불가</b><br> 
											JOB-A를 통해 지원하신 입사지원 내역을 조회하실 수 없습니다. <br><br> 
											<b>다양한 이벤트 참가불가</b><br> 
											회원을 탈퇴하시면 JOB-A에서 준비한 다양한 이벤트에 참여 하실 수 없습니다. <br> 
											참여하시고자 한다면 재가입하셔야 합니다.<br><br>
										<button class="btn btn-primary" onclick="location.href='deletepw'">회원탈퇴 하러가기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${PsUserDto.userRole == 'ROLE_B'}">
		<div class="row wow fadeInUp mx-auto " data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
				<h1>회원 탈퇴</h1>
				<p class="fs-5 text-primary">신청하기 전에 안내 사항을 꼭 확인해 주세요.</p><br>
				<p>JOB-A에서는 다양한 맞춤서비스들을 제공하고 있습니다. 탈퇴를 하시면 더이상 기업 서비스를 이용하실 수 없습니다.<br> </p>
				
				<div class="bg-white m-3 p-5 rounded ">
				<p class="fs-3 fw-bolder">탈퇴 안내</p>
				<p><i class="bi bi-check-circle-fill text-primary"></i> 탈퇴시 복구가 불가능합니다.</p>
				<p><i class="bi bi-check-circle-fill text-primary"></i> 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</p>
				<p><i class="bi bi-check-circle-fill text-primary"></i> 소셜계정을 통해 가입된 정보는 JOB-A에서만 삭제되며,해당 소셜 채널에서 탈퇴되지 않습니다.</p>
				<p><i class="bi bi-check-circle-fill text-primary"></i> 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</p>
				<p>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 <a style="color: red;">삭제</a>하시기 바랍니다.</p>
				<br>
				<p class="text-center"><button class="btn btn-primary" onclick="location.href='deletepw'">회원탈퇴 하러가기</button></p>
				</div>
		</div>
		</c:if>
	</div>



	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


	<script>
		// alret
		var msg = "${msg}";
		if (msg) {
			alert(msg);
		}
	</script>
</body>
</html>