<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 이력서 페이지</title>
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
.hidden {
	display: none;
}
</style>

</head>
<body>


	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm py-5">
		<div class="grid gap-3 border border-dark-subtle">
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4"
					style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="col">
							<h3 class="mb-3">자격증</h3>
						</div>
						<!-- 모달 버튼 -->
						<div class="col-auto">
							<button type="button" class="btn btn-outline-dark m-2 btn-sm"
								data-bs-toggle="modal" data-bs-target="#viewCerti">저장된
								정보 불러오기</button>
						</div>
						<!-- 모달 창 -->
						<div class="modal fade" id="viewCerti" tabindex="-1" role="dialog"
							aria-labelledby="uploadModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="uploadModalLabel">경력사항 불러오기</h5>
										<button type="button" class="close" data-bs-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p>불러올 자격증을 체크하세요.</p>
										<div class="table-responsive">
											<table class="table table-striped table-bordered">
												<thead>
													<tr>
														<th>선택</th>
														<th>취득일자</th>
														<th>자격증명</th>
														<th>발행처</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="certiList" items="${certi}">
														<tr>
															<td></td>
															<td>${certiList.certiDate}</td>
															<td>${certiList.certiName}</td>
															<td>${certiList.certiPub}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

									</div>
								</div>
							</div>
						</div>

						<div>
							<form name="certi" action="certi" method="post">
								<div class="row mb-3">
									<label for="certiName" class="col-sm-2 col-form-label">자격증명</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="certiName">
									</div>
								</div>
								<div class="row mb-3">
									<label for="certiPub" class="col-sm-2 col-form-label">자격증발행처</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="certiPub">
									</div>
								</div>
								<div class="row mb-3">
									<label for="certiDate" class="col-sm-2 col-form-label">자격증취득일자</label>
									<div class="col-sm-10">
										<input type="Date" class="form-control" name="certiDate">
									</div>
								</div>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="submit" class="btn btn-primary" id="saveCerti">저장</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/list">취소</a>
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/cl">다음</a>
			</div>

		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
		// alret
		var msg = "${msg}";
		if (msg) {
			alert(msg);
		}

		// 자격증 입력 확인
		const rCerti = document.querySelector('form[name="rCerti"]');
		const saveCerti = document.querySelector('#saveCerti');
		function checkInputs(event) {
			let inputs = rCerti
					.querySelectorAll('input[type=text], input[type=date]');
			let isAllFilled = true;
			for (let i = 0; i < inputs.length; i++) {
				if (inputs[i].value.trim() === '') {
					isAllFilled = false;
					break;
				}
			}
			if (!isAllFilled) {
				alert('모든 칸을 입력하세요!');
				event.preventDefault(); // 저장 취소
			}
		}
		saveCerti.addEventListener('click', checkInputs);
		rCerti.addEventListener('submit', checkInputs);
	</script>

</body>
</html>