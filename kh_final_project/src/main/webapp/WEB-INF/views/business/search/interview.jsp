<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>지원자 결과 관리</title>
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
	
	<link href="${pageContext.request.contextPath}/resources/css/recruit.insert.css" rel="stylesheet">
	
<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	<!-- ckeditor5 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>


	
</head>
<body>
<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- page section -->	
<section>
	<div class="container-fluid bg-white p-5">
		<h3>면접 메일 발송</h3>
		해당 지원자에게 보낼 면접 일정 관련 내용을 작성해주세요. 
		<form action="<%=request.getContextPath()%>/business/search/sendinterview" method="post">
			<p name="userId" vlaue=" ${info.psUser }" style="display: none;">지원자 아이디 ${info.psUser }</p>
			<p name="bsUser" vlaue="${info.bsUser }" style="display: none;" >회사 아이디    ${info.bsUser }</p>
			<div class="row pt-2">
				<div class="col-3 text-center">지원자명</div>
				<div class="col-8">
					<input type="text" class="form-control" name="userName" value="${info.userName }" readonly>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">지원자 이메일</div>
				<div class="col-8">
					<input type="text" class="form-control" name="userEmail" value="${info.userEmail }" readonly>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">면접 일정 제목</div>
				<div class="col-8">
					<input type="text" class="form-control" name="caTitle" >
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">면접 날짜</div>
				<div class="col-8">
					<input type="date" class="form-control" name="dateStart" >
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">면접 시간</div>
				<div class="col-8">
					<input type="time" class="form-control" name="interviewTime" >
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">면접 장소</div>
				<div class="col-8">
					<input type="text" class="form-control" name="location" >
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">메모</div>
				<div class="col-8">
					<input type="text" class="form-control" name="memo" >
				</div>
			</div>
			<button type="submit" class="btn btn-primary">보내기</button>
		</form>
	</div>
</section>

	
<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


</body>
</html>
