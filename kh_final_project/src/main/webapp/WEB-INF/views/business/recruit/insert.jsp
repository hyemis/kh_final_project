<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css file link part start -->
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
    <!-- css file link part end -->

<title>채용공고등록</title>

    <!-- js part start -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	
	<!-- js part end -->
 
 </head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

<section>

	<div class="container-sm">
		<!-- 탭 -->
		<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link me-4 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Home</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link me-4" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link me-4" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Contact</button>
			</li>
		</ul>
	
		<!-- 탭 내용 -->
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="nav-tab-1">
				
				<div>
				<!-- 1번에서 8번 -->
					<h3>회사 정보</h3>
					<form id="formdata1">
					
					</form>
					<button type="button" class="nextbtn">다음</button>
				</div>
				
			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="nav-tab-2">
				<div>
					<!-- 9번에서 16번 -->
					<h3>채용 정보</h3>
					<form id="formdata2">
					
					</form>
					<button type="button" class="prevbtn">이전</button>
					<button type="button" class="nextbtn">다음</button>
				</div>
			</div>
			<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="nav-tab-3">
				<!-- 15번에서 20번 -->
					<h3>채용 기간 및 기타 내용</h3>
					<form id="formdata3">
					
					</form>
					<button type="button" class="prevbtn">이전</button>
					
			</div>
		</div>

	</div>
	
</section>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>

	<script type="text/javascript">
	  $(document).ready(function() {
		  // 다음 버튼 클릭 시 다음 탭으로 이동
		  $('.nextbtn').click(function() {
		    var activeTab = $('.tab-pane.active');
		    var nextTab = activeTab.next('.tab-pane');
		    var activeNav = $('.nav-link.active');
		    var nextNav = activeNav.parent().next().children('.nav-link');
		    if (nextTab.length) {
		      activeTab.removeClass('active show');
		      nextTab.addClass('active show');
		      activeNav.removeClass('active');
		      nextNav.addClass('active');
		    }
		  });

		  // 이전 버튼 클릭 시 이전 탭으로 이동
		  $('.prevbtn').click(function() {
		    var activeTab = $('.tab-pane.active');
		    var prevTab = activeTab.prev('.tab-pane');
		    var activeNav = $('.nav-link.active');
		    var prevNav = activeNav.parent().prev().children('.nav-link');
		    if (prevTab.length) {
		      activeTab.removeClass('active show');
		      prevTab.addClass('active show');
		      activeNav.removeClass('active');
		      prevNav.addClass('active');
		    }
		  });
		  });
	</script>

</body>

</html>