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

<title>404 error</title>

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

<!-- 페이지 전체 컨테이너 -->
<div class="container w-70 p-5 wow fadeInUp">
	<!-- 제목 -->
	<div>
		<h1 class="mb-3">회사소개를 작성해주세요</h1>
	</div>
	<hr>
	<!-- 작성창 상단 -->
	<div class="row P-3">
		<div class="col-3 M-3">
		 <a>회사명</a>
		</div>
		<div  class="col-9 M-3">
			<input type="text">
		</div>
		<div class="col-3 M-3">
		 <a>태그</a>
		</div>
		<div  class="col-9 M-3">
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-outlined" autocomplete="off">
			<label class="btn btn-outline-primary " for="btn-check-outlined">Single toggle</label>
			
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-2" checked autocomplete="off">
			<label class="btn btn-primary" for="btn-check-2">Checked</label>
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-2" checked autocomplete="off">
			<label class="btn btn-primary" for="btn-check-2">Checked</label>
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-2" checked autocomplete="off">
			<label class="btn btn-primary" for="btn-check-2">Checked</label>
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-2" checked autocomplete="off">
			<label class="btn btn-primary" for="btn-check-2">Checked</label>
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-2" checked autocomplete="off">
			<label class="btn btn-primary" for="btn-check-2">Checked</label>
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-2" checked autocomplete="off">
			<label class="btn btn-primary" for="btn-check-2">Checked</label>
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-2" checked autocomplete="off">
			<label class="btn btn-primary" for="btn-check-2">Checked</label>
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-2" checked autocomplete="off">
			<label class="btn btn-primary" for="btn-check-2">Checked</label>
			<input type="checkbox" class="btn-check btn-sm col-lg-1" id="btn-check-2" checked autocomplete="off">
			<label class="btn btn-primary" for="btn-check-2">Checked</label>
			
		</div>
	</div>
	<!-- 소개글 -->
	<div>
	<p>소개글</p>
	<input type="text">
	</div>
	
	<!-- 하단 -->
	<div>
	<a>소개글</a>
	<button>내 pc</button>
	<input type="text" placeholder="파일을 넣어주세요.">
	</div>
	
	<div class="text-center">
		<button>등록</button>
		<button>삭제</button>
		<button>취소</button>
	</div>
	
	
	
 </div>       
<!-- footer -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>

<!-- script -->
<script></script>
        
</body>
</html>