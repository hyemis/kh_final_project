<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전체글</title>
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
<link
	href="${pageContext.request.contextPath}/resources/css/recruit.insert.css"
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
.s {
	border: 1px solid gray;
	border-radius: 5px;
	padding: 30px;
}

.board-table {
	width: 100%;
	table-layout: fixed;
	border-bottom: 1px solid gray;
}
</style>

</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
		<div class="container-xxl py-5">
			<div class="container bg-white p-5">
				<div class="pb-4">
					<h2>게시글전체 검색결과</h2>
					<span>현재까지 등록된 전체 게시글입니다.</span>
				</div>
				<div class="s">조회 수 출력</div>
				<hr>
				<div class="s">
					<c:forEach items="${boardList}" var="board">
					<div class="p-4">
						<table class="board-table">
							<tr>
								<td class="fs-5 pb-3 fw-semibold">
								<a href="${pageContext.request.contextPath}/board/detail/${board.boardNo}" target="_blank"> 
								${board.boardTitle}
								</td>
								
							</tr>
							<tr>
								<td class="pb-3 fw-light">${board.boardContent}</td>
								
							</tr>
							<tr>
								<td>
									<div class="d-flex justify-content-between">
										<div>
											<span class="fas fa-eye">  ${board.boardRead}  </span> 
											<span class="fas fa-heart">  ${board.boardLike}  </span>
										</div>
										<div>
											<span>${board.userId}</span> 님이 <span>${board.updateDate}</span>
											에 작성
										</div>
									</div>
								</td>
							</tr>
						</table>
					
					
					
					</div>
					</c:forEach>
				</div>

			</div>
		</div>
	</section>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
	<script>
	</script>

</body>
</html>
