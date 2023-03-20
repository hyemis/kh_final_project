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
	<h1 class="p-2 g-col-6 border border-secondary">Step03. 자격조건 및 근무조건</h1>
	<form action="<%=request.getContextPath() %>/business/recruitinsert/third" method="post">
		<div class="p-2 g-col-6 border border-secondary">
			지원자_학력 <input type="text" name="applicant_education" placeholder="4년제 대학교 졸업 이상">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			지원자_성별
			<select name="applicant_gender">
				<option value="male">남자</option>
				<option value="female">여자</option>
				<option value="not">성별무관</option>
			</select>
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			지원자_나이<input type="text" name="applicant_age" placeholder="30세 이상">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			연봉<input type="text" name="salary" placeholder="회사내규에 따름">		
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			근무형태<input type="text" name="work_type" placeholder="정규직">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			근무요일<input type="text" name="work_day" placeholder="월~금">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			근무시간<input type="text" name="work_time" placeholder="오전 9시 ~ 오후 6시">
		</div>
		<div class="p-2 g-col-6 border border-secondary">
			<button class="btn btn-outline-primary btn-prev" type="button">prev</button>
			<button class="btn btn-outline-primary btn-next" type="button">next</button>
		</div>
	</form>
</div>
</section>

<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</body>
</html>