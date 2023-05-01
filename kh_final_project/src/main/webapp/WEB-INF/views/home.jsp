<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>home</title>
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

	<!-- page section -->
	<section>
	<div class="container-fluid p-5" style="background-color: #f2f2f2; min-height: 300px;">
		<div id="carouselCantent" class="carousel slide" data-bs-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-bs-target="#carouselCantent" data-bs-slide-to="0" class="active"></li>
		    <li data-bs-target="#carouselCantent" data-bs-slide-to="1"></li>
		    <li data-bs-target="#carouselCantent" data-bs-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		  <c:forEach items="${bList }" var="list" varStatus="i">
		  	<div class="carousel-item ${i.count ==1?'active':'' }">
			  	<a href="${pageContext.request.contextPath}${list.bannerLink }">
			      <img src="${list.bannerThum eq null? 'https://dummyimage.com/200x200/000000/ffffff.png&text=No+Image' : list.bannerThum}" class="d-block" alt="..." style="width: 600px; height: 400px;">
			    </a>
		    </div>
		  </c:forEach>
		  </div>
		  <a class="carousel-control-prev " href="#carouselCantent" role="button" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="flas"></span>
		    <span class="visually-hidden">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselCantent" role="button" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </a>
		</div> 
    </div>
	
	
	<div class="container-fluid bg-white p-5">
		회사 공고 
	</div>
	<div class="container-fluid p-5" style="background-color:primary; min-height: 300px;">
		커뮤니티 
	</div>
	
	</section>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
		<script type="text/javascript">
	
	$(document).ready(function() {
		  $('#carouselCantent').carousel({
		    interval: 4000 // 5초마다 슬라이드 변경
		  });
		});
	
	</script>

</body>
</html>
