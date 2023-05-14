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
						<div class="mb-4">
							<h3 class="mb-3">이력서</h3>
							<div class="form-floating is-invalid">
								<input type="text" class="form-control is-invalid"
									id="resumeTitle" placeholder="resumeTitle" required> 
									<label for="resumeTitle" id="resumeTitleLabel">이력서 제목을 입력하세요.</label>
							</div>
							<div class="invalid-feedback mb-3">이력서 제목을 입력하세요.</div>
							<div class="form-check ms-3 pt-3">
								<div class="pb-5">
									희망직종 
									<select class="form-select form-select-sm" id="jobType">
										<option selected value="0">선택안함</option>
										<c:forEach items="${JNlist}" var="categoryJN">
										<option value="${categoryJN.categoryId }">${categoryJN.categoryName}</option>
										</c:forEach>
									</select>
									성별
									<select class="form-select form-select-sm" id="gender">
									  <option selected >선택안함</option>
									  <option value="M">남자</option>
									  <option value="W">여자</option>
									</select>
								</div>
								<input class="form-check-input pt-3" type="checkbox" value="Y" id="resumeAct">
								<label class="form-check-label" for="flexCheckChecked"> 이력서 공개여부 </label>
								
							</div>
							
							
						</div>
					</div>
				</div>
			</div>



			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4"
					style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">기본 정보</h3>
							<div class="row">
								<div class="col-2">


									<!-- 모달 창 -->
									<div class="modal fade" id="uploadModal" tabindex="-1"
										role="dialog" aria-labelledby="uploadModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="uploadModalLabel">파일 업로드</h5>
													<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<form action="fileupload" method="post"
														enctype="multipart/form-data">
														<!-- file upload : multiple 하지 않음-->
														<input type="file" name="report" placeholder="첨부파일"><br>
														<button class="btn btn-outline-dark m-2" type="submit">사진
															등록</button>
													</form>
												</div>
											</div>
										</div>
									</div>

									<c:choose>
										<c:when test="${not empty url}">
											<img src="${url}" width="150" height="200" alt="resume photo">
											<input type="hidden" id="url" placeholder="url"
												value="${url }" required>
										</c:when>
										<c:otherwise>
											<img
												src="https://dummyimage.com/150x200/000000/ffffff.png&text=No+Image"
												width="150" height="200" alt="no image">
										</c:otherwise>
									</c:choose>

									<!-- 모달 버튼 -->
									<button type="button" class="btn btn-outline-dark m-2"
										data-bs-toggle="modal" data-bs-target="#uploadModal">사진
										등록</button>
								</div>
								<div class="col-10 p-4">
									<input type="hidden" id="userId" placeholder="userId"
										value="${userinfo.userId }" required> <span>이름
										: </span> <span>${userinfo.userName }</span><br> <span>전화번호
										: </span> <span>${userinfo.userPhone }</span><br> <span>생년월일
										: </span> <span>${userinfo.userBirth }</span><br> <span>이메일
										: </span> <span>${userinfo.userEmail }</span><br>
									 <span>주소 : </span>
										<span>${userinfo.addressRoad },  ${userinfo.addressJibun },  ${userinfo.addressDetail }, ${userinfo.addressPostcode }</span><br> 
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			

			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4"
					style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">포트폴리오</h3>
							<span>직무와 연관되는 포트폴리오, 기획서, 자격증 사본 등을 업데이트 하세요.</span>
							<div class="input-group m-3">
								<form enctype="multipart/form-data">
									<input type="file" class="form-control" name="uploadPortf"
										id="uploadPortf" placeholder="포트폴리오첨부파일"><br>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
				<button class="btn btn-primary me-md-2" type="button" id="rWrite"
					onclick="fn_rWrite(); return false;">다음</button>
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/list">취소</a>

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

		// 이력서 등록
		function fn_rWrite() {
			let formdata = new FormData();
			formdata.append("resumeTitle", $("#resumeTitle").val());
			formdata.append("uploadPortf", $("#uploadPortf")[0].files[0]);
			formdata.append("resumePhoto", $("#url").val());
			formdata.append("jobType", $("#jobType").val());
			formdata.append("gender", $("#gender").val());
			formdata.append("resumeAct", $("#resumeAct").val());

			$.ajax({
				url : "${pageContext.request.contextPath}/person/resume/write",
				type : "post",
				contentType : false,
				processData : false,
				data : formdata,
				success : function(result) {
					// result <== resumeNo 
					if (result > 1) {
						alert("이력서가 등록되었습니다.");
						location.href = "${pageContext.request.contextPath}/person/resume/school";
					} else {
						alert("이력서 등록에 실패했습니다.");
					}
				}
			})
		}

	// 이력서 글자 수 제한 
	$(document).ready(function() {
        $('#resumeTitle').keyup(function() {
        	  var titleLength = $(this).val().length;
        	  if (titleLength <= 20) {
                  $(this).removeClass('is-invalid').addClass('is-valid');
                  $('#resumeTitleLabel').hide();
                  $('.invalid-feedback').hide();
              } else {
                  $(this).removeClass('is-valid').addClass('is-invalid');
                  $('#resumeTitleLabel').show();
                  $('.invalid-feedback').show();
              }
        });
    });
	
	</script>

</body>
</html>