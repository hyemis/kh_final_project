<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>home</title>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>

<!-- style -->	

	
</head>
<body>
<!-- haeder  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- page section -->	
<section>
<div class="container-fluid bg-white p-5">
<!-- Category Start -->
		<div class="container-xxl py-5">
			<div>로고 위치</div>
			<!-- 상단 start -->
			<div class="text-center mx-auto mb-5 wow fadeInUp"
				data-wow-delay="0.1s" style="max-width: 600px;">
				<h1 class="mb-3">안녕하세요</h1>
				<div class="mb-3">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" var="user_id" />
							<span class="fs-3" id="user_id">${user_id } 님 반갑습니다</span>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
							<span class="fs-3" id="user_id">반갑습니다.<br> 로그인하시면 더 많은 정보를 볼 수 있습니다.</span>
					</sec:authorize>
				</div>
				<br>
				<p>공고 등록부터 합격자 발표까지 쉽고 빠르게,</br> 우리 기업을 위한 맞춤형 인재 찾기 까지 JOB-A가 함께 할게요</p>
			</div>
			<!-- 상단 end -->
			<!-- menu button start -->
			<div class="row g-4 ">
				<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
					data-wow-delay="0.1s"
					style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
					<a class="cat-item d-block bg-light text-center rounded p-3" href="<%=request.getContextPath()%>/business/recruit/main">
						<div class="rounded p-4">
							<h5>공고등록/관리</h5>
							<span href="">채용 공고 등록</span>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
					data-wow-delay="0.3s"
					style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
					<a class="cat-item d-block bg-light text-center rounded p-3" href="">
						<div class="rounded p-4">
							<h5>지원자관리</h5>
							<span href=""></span>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
					data-wow-delay="0.5s"
					style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
					<a class="cat-item d-block bg-light text-center rounded p-3" href="">
						<div class="rounded p-4">
							<h5>인재 관리</h5>
							<span href=""></span>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
					data-wow-delay="0.7s"
					style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
					<a class="cat-item d-block bg-light text-center rounded p-3" href="<%=request.getContextPath()%>/business/myinfo">
						<div class="rounded p-4">
							<h5>내 기업 관리</h5>
							<span href="/">회사소개</span>
							<span href="/">뉴스레터</span>
							<span href="/">Q & A</span>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
					data-wow-delay="0.1s"
					style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
					<a class="cat-item d-block bg-light text-center rounded p-3" href="<%=request.getContextPath()%>/business/account/info">
						<div class="rounded p-4">
							<h5>내 정보</h5>
							<span href="/">기업 정보 관리</span>
						</div>
					</a>
				</div>
	
			</div>
			<!-- menu button end -->	
		</div>
		<!-- Category End -->
</div>
</section>

	
<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>	

<!-- page script -->
	
</body>
</html>
