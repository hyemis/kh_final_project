<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css file link part start -->
<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico"
	rel="icon">
<%-- ${pageContext.request.contextPath} --%>
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css"
	rel="stylesheet">
<!-- css file link part end -->

<title>기업회원 메인</title>

<!-- js part start -->
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>

<!-- js part end -->

<script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

	<!-- Category Start -->
	<div class="container-xxl py-5">
		<div>로고 위치</div>
		<!-- 상단 start -->
		<div class="text-center mx-auto mb-5 wow fadeInUp"
			data-wow-delay="0.1s" style="max-width: 600px;">
			<h1 class="mb-3">안녕하세요</h1>
			<h3 class="mb-3">님 반갑습니다</h3>
			<br>
			<p>
				공고 등록부터 합격자 발표까지 쉽고 빠르게,</br> 우리 기업을 위한 맞춤형 인재 찾기 까지 JOB-A가 함께 할게요
			</p>
		</div>
		<!-- 상단 end -->
		<!-- menu button start -->
		<div class="container-fluid text-center">
			<div class="row" style="Height: 250px;">
				<div class="col text-center wow fadeInUp" data-wow-delay="0.1s">
					<a class="h-100 cat-item d-block bg-light text-center rounded p-3">
						<div class="h-100 rounded p-4">
							<h6 class="rounded p-4">공고등록/관리</h6>
							<span class="text-center">
								<p>
									<button>채용 공고 등록</button>
								</p>
								<p>
									<button>공고 관리</button>
								</p>
							</span>
						</div>
					</a>
				</div>
				<div class="col text-center wow fadeInUp" data-wow-delay="0.1s">
					<a class="h-100 cat-item d-block bg-light text-center rounded p-3">
						<div class="h-100 rounded p-4">
							<h6 class="rounded p-4">공고등록/관리</h6>
							<span class="text-center">
								<p>
									<button>지원자관리</button>
								</p>
								<p>
									<button></button>
									<button></button>
								</p>
							</span>
						</div>
					</a>
				</div>
				<div class="col text-center wow fadeInUp" data-wow-delay="0.1s">
					<a class="h-100 cat-item d-block bg-light text-center rounded p-3">
						<div class="h-100 rounded p-4">
							<h6 class="rounded p-4">공고등록/관리</h6>
							<span class="text-center">
								<p>
									<button></button>
								</p>
								<p>
									<button></button>
								</p>
							</span>
						</div>
					</a>
				</div>
			</div>
			<div class="row" style="Height: 250px;">
				<div class="col text-center wow fadeInUp" data-wow-delay="0.1s">
					<a class="h-100 cat-item d-block bg-light text-center rounded p-3">
						<div class="h-100 rounded p-4">
							<h6 class="rounded p-4">기업 소개</h6>
							<span class="text-center">
								<p>
									<button> 회사소개 </button>
								</p>
								<p>
									<button> 뉴스레터 </button>
								</p>
								<p>
									<button> Q & A </button>
								</p>
							</span>
						</div>
					</a>
				</div>
				<div class="col text-center wow fadeInUp" data-wow-delay="0.1s">
					<a class="h-100 cat-item d-block bg-light text-center rounded p-3">
						<div class="h-100 rounded p-4">
							<h6 class="rounded p-4">내 정보</h6>
							<span class="text-center">
								<p>
									<button></button>
								</p>
								<p>
									<button></button>
								</p>
							</span>
						</div>
					</a>
				</div>
			</div>
			<!-- menu button end -->
		</div>
		<!-- Category End -->

		<section>
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
		</section>

		<script></script>
</body>
</html>