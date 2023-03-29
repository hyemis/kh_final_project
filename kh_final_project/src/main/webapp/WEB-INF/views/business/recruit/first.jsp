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
	<h1 class="p-2 g-col-6 border border-secondary">Step01. 담당자 정보</h1>
	<form action="<%=request.getContextPath() %>/business/recruitinsert/first" method="post">
		<div class="p-2 g-col-6 border border-secondary">
			담당자 성함
			<input type="text" name="recruitName">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			전화번호 
			<input type="text" name="" placeholder="02">-<input type="text" name="">-<input type="text" name="">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			이메일
			<input type="email" name="">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			업종
			<input type="text" name="">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			대표 근무지역
			<input type="checkbox" id="chk1">
			<label for="chk1">해외지역</label>
			<input type="checkbox" id="chk2">
			<label for="chk2">재택근무 가능</label>
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			<h3>주소검색 API 구역</h3>
			<input type="text" id="sample6_postcode" placeholder="우편번호">
			<input class="btn btn-outline-secondary btn-sm" type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소">
			<input type="text" id="sample6_extraAddress" placeholder="동"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			<button class="btn btn-outline-primary btn-next" type="button">next</button>
		</div>
		
		<div class="p-2 g-col-6 border border-secondary">
			<h3>지도 API 구역</h3>
			
		</div>
	</form>
</div>
</section>

<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</body>
</html>