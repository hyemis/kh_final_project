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
<script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>




<style>
.hidden {
	display: none;
}

.bg-gray {
	background-color: rgb(248, 249, 249);
}

.editor {
	height: 300px;
	width: 700px;
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
							<h3 class="mb-3">자기소개서</h3>
						</div>
						<!-- 모달 버튼 -->
						<div class="col-auto">
							<button type="button" class="btn btn-outline-dark m-2 btn-sm"
								data-bs-toggle="modal" data-bs-target="#viewCl">저장된 정보
								불러오기</button>
						</div>
					</div>
					<!-- 모달 창 -->
					<div class="modal fade" id="viewCl" tabindex="-1" role="dialog"
						aria-labelledby="uploadModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="uploadModalLabel">자기소개서 불러오기</h5>
									<button type="button" class="close" data-bs-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<p>불러올 자기소개서를 체크하세요.</p>
									<div class="table-responsive">
										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>선택</th>
													<th>자기소개서 항목명</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td></td>

												</tr>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>

					<!-- 성장과정 내용 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>성장과정</h4>
						</div>
						<div class="justify-content-center align-items-center mb-3">
							<textarea name="text" id="growth" class="form-control"></textarea>
						</div>
						<span class="d-flex justify-content-end"></span>
					</div>
					<!-- 지원동기 내용 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>지원동기</h4>
						</div>
						<div class="justify-content-center align-items-center">
							<textarea name="text" id="motive" class="form-control"></textarea>
						</div>
						<span class="d-flex justify-content-end"></span>
					</div>
					<!-- 장단점 내용 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>성격의 장/단점</h4>
						</div>
						<div class="justify-content-center align-items-center">
							<textarea name="text" id="adv" class="form-control"></textarea>
						</div>
						<span class="d-flex justify-content-end"></span>
					</div>
					<!-- 입사 후 포부 내용 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>입사 후 포부</h4>
						</div>
						<div class="justify-content-center align-items-center">
							<textarea name="text" id="asp" class="form-control"></textarea>
						</div>
						<span class="d-flex justify-content-end"></span>
					</div>
					<!-- 파일 첨부 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>자기소개서</h4>
						</div>
						<div class="justify-content-center align-items-center">
							<form enctype="multipart/form-data">
								<input type="file" class="form-control" id="uploadCl"
									placeholder="자기소개서 첨부파일"><br>
							</form>
						</div>
					</div>

					<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3">
						<button type="button" class="btn btn-primary"
							onclick="fn_clWrite(); return false;">저장</button>
					</div>

				</div>
			</div>

			<div class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/list">취소</a>
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/list">다음</a>
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

		var textareas = document.querySelectorAll('textarea');
		for (var i = 0; i < textareas.length; i++) {
		  CKEDITOR.replace(textareas[i].id, {
		    language: 'ko',
		  });

		  const textarea = CKEDITOR.instances[textareas[i].id];
		  const charCount = textarea.element.$.parentNode.nextElementSibling;

		  textarea.on('change', () => {
		    const text = textarea.getData().replace(/(<([^>]+)>)/gi, '');
		    const count = text.trim().length;
		    charCount.textContent = '글자 수 (공백제외) ' + count + ' 자';
		  });
		}

		// cl 등록
		function fn_clWrite() {
			let formdata = new FormData();
			formdata.append("growth", CKEDITOR.instances.growth.getData());
			formdata.append("motive", CKEDITOR.instances.motive.getData());
			formdata.append("adv", CKEDITOR.instances.adv.getData());
			formdata.append("asp", CKEDITOR.instances.asp.getData());
			formdata.append("uploadCl", $("#uploadCl")[0].files[0]);

			$.ajax({
				url : "${pageContext.request.contextPath}/person/resume/cl",
				type : "post",
				contentType : false,
				processData : false,
				data : formdata,
				success : function(result) {
					if (result == 1) {
						alert("자기소개서가 등록되었습니다.");
						location.href = "/job/person/resume/list";
					} else {
						alert("자기소개서 등록에 실패했습니다.");
					}
				}
			})
		}
	</script>

</body>
</html>