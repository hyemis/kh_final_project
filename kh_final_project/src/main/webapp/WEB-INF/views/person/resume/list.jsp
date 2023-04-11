<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 이력서 관리</title>
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

<style>
.btn-container {
	overflow: hidden;
}

.btn-container button {
	float: left;
	margin-right: 10px;
}
</style>


</head>

<body>


	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">
		<div class="text-start mx-5 mt-5">
			<h1>이력서 관리</h1>
		</div>
		<div class="row">
			<!-- 좌측 프로필 영역 -->
			<div class="col-3">
				<div class="container-xxl py-5">
					<div class="container border border-primary">
						<div class="bg-light p-3">
							<div class="bg-white rounded p-4 row"
								style="border: 1px dashed rgba(0, 185, 142, .3)">
								<img class="object-fit-sm-contain border"
									src="https://dummyimage.com/150x200/d6d6d6/000000&text=150x200"
									alt="">
							</div>
							<div class="">
								<span>이름 : </span> <span>${userinfo.userName }</span><br> <span>전화번호
									: </span> <span>${userinfo.userPhone }</span><br> <span>생년월일
									: </span> <span>${userinfo.userBirth }</span><br> <span>이메일
									: </span> <span>${userinfo.userEmail }</span><br>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 우측 조회 영역 -->

			<div class="col-9">
				<div class="container-xxl py-5">
					<div class="container">
						<div class="bg-light rounded p-3">
							<div class="bg-white rounded p-4"
								style="border: 1px dashed rgba(0, 185, 142, .3)">
								<div class="row g-5 align-items-center">
									<div class="mb-4">
										<h1 class="mb-3">이력서 목록</h1>
										<p>
											1. 이력서 생성한 뒤 작성해주세요.<br> 
											2. 생성된 이력서로 채용공고마다 다른 이력서로 입사지원이 가능합니다. (단, 입사 지원 후 이력서 수정
											내용은 반영되지 않습니다.) <br> 3. 인재정보에는 작성하신 이력서 중 대표 이력서 1개만 공개
											가능합니다.
										</p>
										<br>
										<sec:authorize access="isAuthenticated()">
											<sec:authentication property="principal.username"
												var="user_id"></sec:authentication>
											<div class="d-grid gap-2 d-md-flex justify-content-md-end">
												<a
													href="${pageContext.request.contextPath}/person/resume/write">이력서
													생성</a>
											</div>
										</sec:authorize>
										<br> <br>
										<table class="table table-hover">
											<thead>
												<tr>
													<th scope="col">이력서 제목</th>
													<th scope="col">최종 수정일</th>
													<th scope="col"></th>
												</tr>
											</thead>
											<tbody class="table-group-divider">
												<c:forEach items="${resumelist }" var="resume">
													<tr>
														<td><a
															href="${pageContext.request.contextPath}/person/resume/read/${resume.resumeNo}">${resume.resumeTitle }</a></td>
														<td>${resume.resumeDate }</td>
														<td>
															<div class="btn-container">
																<form method="post" action="delete">
																	<input type="hidden" name="resumeNo"
																		value="${resume.resumeNo}" required>
																	<button type="submit" class="btn btn-outline-dark">삭제</button>
																</form>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
	
	// 이력서 alret
	var msg = "${msg}";
	if(msg) {
		alert(msg);
	}
	</script>
</body>
</html>