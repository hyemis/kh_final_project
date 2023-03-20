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
<h1>Step02. 모집분야</h1>
<section>
<div>
	<form action="<%=request.getContextPath() %>/business/recruitinsert/second" method="post">
		<div>
			모집분야<input type="text" name="recruitType">
		</div>
		<div>
			경력여부
			<select name="careerType">
				<option value="begin">신입</option>
				<option value="career">경력</option>
				<option value="not">경력무관</option>
			</select>
		</div>
		<div>
			담당업무<input type="text" name="inChargeType">
		</div>
		<div>
			근무부서<input type="text" name="department">
		</div>
		<div>
			직급(직책)<input type="text" name="position">
		</div>
		<div>
			필수/우대조건<input type="text" name="coditionType" placeholder="정보처리기사자격증">
		</div>
		<div>
			지원자_학력 
			<input type="text" name="applicant_education" placeholder="4년제 대학교 졸업 이상">
			<input type="checkbox" id="chk1">
			<label for="chk1">우대</label>
			<input type="checkbox" id="chk2">
			<label for="chk2">필수</label>
		</div>
		<div>
			<button class="btn btn-outline-secondary" type="button">모집분야 추가</button>
		</div>
		<div>
			<button class="btn btn-outline-primary" type="submit">prev</button>
			<button class="btn btn-outline-primary" type="submit">next</button>
		</div>
	</form>
</div>
</section>

<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</body>
</html>