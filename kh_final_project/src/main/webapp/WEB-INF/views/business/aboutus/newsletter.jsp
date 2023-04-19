</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>기업 뉴스레터</title>
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
	<link href="${pageContext.request.contextPath}/resources/css/person.css" rel="stylesheet">
	
<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>

	
</head>
<body>
<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- page section -->	
<section>
		<div class="container-fluid bg-white p-5">
			<h1 class="text-center">뉴스레터</h1>

			<div class="row">
				<div class="col-md-2 col-sm-2  border border-secondary">
					<div class="team-item rounded overflow-hidden">
						<div class="position-relative">
							<img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/template/makaan/img/team-1.jpg"
								alt="">
							<div
								class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
								<a class="btn btn-square mx-1" href=""><i
									class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
									href=""><i class="fab fa-twitter"></i></a> <a
									class="btn btn-square mx-1" href=""><i
									class="fab fa-instagram"></i></a>
							</div>
						</div>
						<div class="text-center p-4 mt-3">
							<h5 class="fw-bold mb-0">Full Name</h5>
							<small>email</small>
						</div>
						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action">바로가기</a>
							<a href="#" class="list-group-item list-group-item-action">바로가기</a>
							<a href="#" class="list-group-item list-group-item-action">바로가기</a>
						</div>
					</div>

				</div>
				<div class="col-md-10 col-sm-10 border border-secondary">
					<!-- 뉴스레터  -->
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newsletter">등록</button>

					<!-- Modal -->
					<div class="modal fade" id="newsletter" data-bs-backdrop="static"
						 data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title text-center" id="staticBackdropLabel">뉴스레터작성</h3>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="/saveNewletter" method="post"
											enctype="multipart/form-data">

											<div class="row ">
												<div class="col-2 text-center font-monospace">
													<h4>제목</h4>
												</div>
												<div class="col-10 was-validated">
													<input type="text" class="form-control is-invalid"
														name="boardTitle" placeholder="제목을 입력해주세요" required>
													<hr>
												</div>
											</div>
											<div class="row ">
												<div class="col-2 text-center font-monospace">
													<h4>파일첨부</h4>
												</div>
												<div class="col-10 ">
													<div class="mb-3">
														<label for="formFile" class="form-label">Default
															file input example</label> <input class="form-control"
															type="file" id="formFile" multiple>
													</div>
												</div>
											</div>
											<div class="row ">
												<div class="col-2 text-center font-monospace">
													<h4>관련링크</h4>
												</div>
												<div class="col-10 ">
													<input type="text" class="form-control" name=""
														placeholder="링크를 입력해주세요">
													<hr>
												</div>
											</div>

											<div class="row ">
												<div class="col-2 text-center font-monospace">
													<h4>소개글</h4>
												</div>
												<div class="col-10 was-validated">
													<div class="mb-3">
														<textarea class="form-control is-invalid"
															name="boardContent" style="height: 300px;" required></textarea>
													</div>
													<div>작성일자</div>
												</div>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-light"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">등록</button>
									</div>
								</div>
							</div>
						</div>
					<!-- 뉴스레터 목록 -->
					<div>
					<c:forEach items="${newsletter }" var="board">	
						<div class="card">
						  	<h5 class="card-header">number , date</h5>
						  	<div class="card-body">
						    <h5 class="card-title">boardtitle</h5>
						    <p class="card-text">board content.</p>
						    <a href="#" class="btn btn-primary">상세페이지 보기</a>
						  	</div>
						</div>
					</c:forEach>
					</div>
					
					
					
				
				</div>
			</div>
		</div>
	</section>

	
<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>	

<!-- page script -->
	
</body>
</html>
