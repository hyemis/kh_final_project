<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인회원</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
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
						<span class="fs-3" id="user_id">${user_id }</span>
				</sec:authorize>
			</div>
			
			<h3 class="mb-3">님 반갑습니다</h3>
			<br>
			<p>차곡차곡 한걸음씩, </br>JOB-A와 함께 해요!</p>
		</div>
		<!-- 상단 end -->
		<!-- menu button start -->
		<div class="row g-4 ">
			<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
				data-wow-delay="0.1s"
				style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
				<a class="cat-item d-block bg-light text-center rounded p-3" href="${pageContext.request.contextPath}/person/mypage?userId=${user_id}">
					<div class="rounded p-4">
						<h5>회원정보관리</h5>
						<span></span>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
				data-wow-delay="0.3s"
				style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
				<a class="cat-item d-block bg-light text-center rounded p-3" href="${pageContext.request.contextPath}/person/resume/list?userId=${user_id}">
					<div class="rounded p-4">
						<h5>이력서 관리</h5>
						<span></span>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
				data-wow-delay="0.5s"
				style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
				<a class="cat-item d-block bg-light text-center rounded p-3" href="">
					<div class="rounded p-4">
						<h5>입사지원현황</h5>
						<span></span>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
				data-wow-delay="0.7s"
				style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
				<a class="cat-item d-block bg-light text-center rounded p-3" href="">
					<div class="rounded p-4">
						<h5>스크랩한 채용공고</h5>
						<span href="/"></span>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto "
				data-wow-delay="0.9s"
				style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
				<a class="cat-item d-block bg-light text-center rounded p-3" href="">
					<div class="rounded p-4">
						<h5>관심기업정보</h5>
						<span href="/"></span>
					</div>
				</a>
			</div>

		</div>
		<!-- menu button end -->



	</div>
	<!-- Category End -->
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>