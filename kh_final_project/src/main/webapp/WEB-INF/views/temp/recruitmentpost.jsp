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
	<%-- ${pageContext.request.contextPath} --%>
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

<title>공고상세조회</title>

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

<script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
 </head>

<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>

	<!-- Contact Start -->
    <div class="container-xxl py-5">
    		
    		
        	<div class="container row me-0">
        		<!-- 사진 -->
        		<div class="w-75">
        		<img src="https://dummyimage.com/800x400/000/fff&text=공고게시글에+들어갈+사진"  alt="...">
        		</div>
        		<!-- nav -->
        		<div class="w-25 mx-auto text-center" style="background-color: yellow;">
        			<a>회사명</a>
        			<a><p>회사명</p>
        			   <p>근무지역</p>
        			   <p>급여조건</p>
        			</a>
        			<a><p>경력</p>
        			   <p>학력</p>
        			</a>
        			<button>지원하기</button>
        		</div>
        	</div>
    		
    		
        	<!-- 제목 부분 -->
        	<div class="container " style="background-color: orange;">
        		<h1 class="mb-3">백엔드 개발자</h1>
                <p>회사명/위치</p>
                <div>태그 넣을 공간</div>
        	</div>
        	
        	<!-- 상세내용 -->
        	<div class="container"style="background-color: yellow;">
        		<div>상세내용</div>
        	</div>
        	
        	<!-- 기술스택/툴-->
        	<div class="container"style="background-color: orange;">
        		<p>기술스택 * 툴</p>
                <div>태그 넣을 공간</div>
        	</div>
        	
        	<!-- 정보 -->
        	<div class="container"style="background-color: yellow;">
        		<p>마감일</p>
                <p>근무지역</p>
                <div class="col-12">
                         <iframe class="position-relative rounded w-100 h-100"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001156.4288297426!2d-78.01371936852176!3d42.72876761954724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew%20York%2C%20USA!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd"
                            frameborder="0" style="min-height: 400px; border:0;" allowfullscreen="" aria-hidden="false"
                            tabindex="0"></iframe>
                </div>
        	</div>
        	
        	<!-- 회사 로고 및 이름 -->
        	<div class="container"style="background-color: orange;">
        		<img class="img-fluid" src="${pageContext.request.contextPath}/" alt="Icon" style="width: 40px; height: 40px;">
        		<a>회사명 직종</a>
        	</div>
        	
        	
	</div>      	
	<!-- Contact End -->
	
 	<!-- effect 
 		<div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
 		</div>
 	-->	
 		
<!-- footer -->        
<%@include file="/WEB-INF/views/common/footer.jsp"%>

<!-- script -->  
<script></script>
        
</body>
</html>