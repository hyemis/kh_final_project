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
<link
	href="${pageContext.request.contextPath}/resources/css/person.css"
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

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm py-5">
		<div class="grid gap-3 border border-dark-subtle">
			<div
				class="input-group has-validation row d-grid gap-2 col-10 mx-auto">
				<div class="form-floating is-invalid">
					<input type="text" class="form-control is-invalid" id="resumeTitle"
						placeholder="resumeTitle" required> <label
						for="resumeTitle">이력서 제목을 입력하세요.</label>
				</div>
				<div class="invalid-feedback">이력서 제목을 입력하세요.</div>
				<div class="form-check ms-3">
					<input class="form-check-input" type="checkbox" value="Y"
						id="flexCheckChecked" checked> <label
						class="form-check-label" for="flexCheckChecked"> 이력서 공개여부
					</label>
				</div>
			</div>



			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4"
					style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">기본 정보</h3>
							<div class="row">
								<div class="col-2 border border-dark-subtle">


									<!-- 모달 창 -->
									<div class="modal fade" id="uploadModal" tabindex="-1"
										role="dialog" aria-labelledby="uploadModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="uploadModalLabel">파일 업로드</h5>
													<button type="button" class="close" data-bs-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form action="fileupload" method="post"
														enctype="multipart/form-data">
														<!-- file upload : multiple 하지 않음-->
														<input type="file" name="report" placeholder="첨부파일"><br>
														<button class="btn btn-outline-dark m-2" type="submit">게시글
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
								<div class="col-10 border border-dark-subtle">
									<input type="hidden" id="userId" placeholder="userId"
										value="${userinfo.userId }" required> <span>이름
										: </span> <span>${userinfo.userName }</span><br> <span>전화번호
										: </span> <span>${userinfo.userPhone }</span><br> <span>생년월일
										: </span> <span>${userinfo.userBirth }</span><br> <span>이메일
										: </span> <span>${userinfo.userEmail }</span><br>
									<%-- <span>주소 : </span>
										<span>${userinfo.AdressRoad }, ${userinfo.AdressRoad }, ${userinfo.AdressJibun },  ${userinfo.AdressDetail }, ${userinfo.AdressPostcode }</span><br> --%>
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
							<h3 class="mb-3">학력사항</h3>
							<!--  아코디언 -->
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingOne">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
											aria-expanded="false" aria-controls="flush-collapseOne">
											고등학교 졸업</button>
									</h2>
									<div id="flush-collapseOne" class="accordion-collapse collapse"
										aria-labelledby="flush-headingOne"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<!--  고등학교 학력사항 Form  -->
											<form name="rHSchool" action="rHSchool" method="post">
												<div class="row mb-3">
													<label for="ged" class="col-sm-2 col-form-label">대입
														검정고시</label>
													<div class="col-sm-10">
														<div class="row mb-3">
															<div class="col-sm-10 offset-sm-2">
																<input type="hidden" id="checkN" name="ged"> 
																<input type="checkbox" id="checkY" name="checkY" value="Y"> 대입 검정고시
															</div>
														</div>
													</div>
												</div>

												<div class="row mb-3">
													<label for="hName" class="col-sm-2 col-form-label">고등학교명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="hName">
													</div>
												</div>
												<div class="row mb-3">
													<label for="hDate" class="col-sm-2 col-form-label">고등학교
														졸업일자</label>
													<div class="col-sm-10">
														<input type="Date" class="form-control" name="hDate">
													</div>
												</div>
												<div class="row mb-3">
													<label for="hMajor" class="col-sm-2 col-form-label">고등학교
														전공계열</label>
													<div class="col-sm-10">
														<select class="form-select" name="hMajor">
															<option selected>전공계열</option>
															<option value="이과">이과</option>
															<option value="문과">문과</option>
															<option value="예체능">예체능</option>
														</select>
													</div>
												</div>
												<div
													class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
													<button type="submit" class="btn btn-primary">save</button>
												</div>
											</form>

										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingTwo">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
											aria-expanded="false" aria-controls="flush-collapseTwo">
											대학교 졸업</button>
									</h2>
									<div id="flush-collapseTwo" class="accordion-collapse collapse"
										aria-labelledby="flush-headingTwo"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<!-- 대학교 졸업 form -->
											<form name="rUniversity" action="rUniversity" method="post">
												<div class="row mb-3">
													<label for="uAct" class="col-sm-2 col-form-label">대학
														졸업유무</label>
													<div class="col-sm-10">
														<select class="form-select" name="uAct">
															<option selected>대학졸업유무선택</option>
															<option value="N">재학중</option>
															<option value="R">휴학</option>
															<option value="Y">졸업</option>
														</select>
													</div>
												</div>
												<div class="row mb-3">
													<label for="uCategory" class="col-sm-2 col-form-label">대학
														카테고리</label>
													<div class="col-sm-10">
														<select class="form-select" name="uCategory">
															<option selected>대학카테고리</option>
															<option value="T">2,3년제</option>
															<option value="F">4년제</option>
														</select>
													</div>
												</div>
												<div class="row mb-3">
													<label for="uName" class="col-sm-2 col-form-label">대학교명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="uName">
													</div>
												</div>
												<div class="row mb-3">
													<label for="uDate" class="col-sm-2 col-form-label">대학
														졸업일자</label><br>
													<div class="col-sm-10">
														<input type="Date" class="form-control" name="uDate">
													</div><br>
													<p>(졸업 전일 경우엔 공란으로 두셔도 됩니다.)</p>
												</div>
												<div class="row mb-3">
													<label for="uMajor" class="col-sm-2 col-form-label">대학
														전공</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="uMajor">
													</div>
												</div>
												<div class="row mb-3">
													<label for="uPoint" class="col-sm-2 col-form-label">대학
														학점</label>
													<div class="col-sm-10">
														<input type="number" step="0.01" class="form-control"
															name="uPoint" placeholder="소수점 두번째 자리까지만 입력">
													</div>
												</div>
												<div
													class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
													<button type="submit" class="btn btn-primary">save</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingThree">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapseThree" aria-expanded="false"
											aria-controls="flush-collapseThree">대학원 졸업</button>
									</h2>
									<div id="flush-collapseThree"
										class="accordion-collapse collapse"
										aria-labelledby="flush-headingThree"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<!-- 대학원 졸업 form -->
											<form name="rGSchool" action="rGSchool" method="post">
												<div class="row mb-3">
													<label for="gAct" class="col-sm-2 col-form-label">대학원
														졸업유무</label>
													<div class="col-sm-10">
														<select class="form-select" name="gAct">
															<option selected>대학졸업유무선택</option>
															<option value="N">재학중</option>
															<option value="R">휴학</option>
															<option value="Y">졸업</option>
														</select>
													</div>
												</div>
												<div class="row mb-3">
													<label for="gCategory" class="col-sm-2 col-form-label">대학원
														카테고리</label>
													<div class="col-sm-10">
														<select class="form-select" name="gCategory">
															<option selected>대학원카테고리</option>
															<option value="M">석사</option>
															<option value="D">박사</option>
														</select>
													</div>
												</div>
												<div class="row mb-3">
													<label for="gName" class="col-sm-2 col-form-label">대학원명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="gName">
													</div>
												</div>
												<div class="row mb-3">
													<label for="gDate" class="col-sm-2 col-form-label">대학원
														졸업일자</label>
													<div class="col-sm-10">
														<input type="Date" class="form-control" name="gDate">
													</div>
												</div>
												<div class="row mb-3">
													<label for="gMajor" class="col-sm-2 col-form-label">대학원
														전공</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="gMajor">
													</div>
												</div>
												<div class="row mb-3">
													<label for="gPoint" class="col-sm-2 col-form-label">대학원
														학점</label>
													<div class="col-sm-10">
														<input type="number" step="0.01" class="form-control"
															name="gPoint" placeholder="소수점 두번째 자리까지만 입력">
													</div>
												</div>
												<div
													class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
													<button type="submit" class="btn btn-primary">save</button>
												</div>
											</form>
										</div>
									</div>
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
							<h3 class="mb-3">경력사항</h3>
							<div>
								<form name="rCareer" action="rCareer" method="post">
									<div class="row mb-3">
										<label for="carName" class="col-sm-2 col-form-label">회사명</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="carName">
										</div>
									</div>

									<div class="row mb-3">
										<label for="carDate" class="col-sm-2 col-form-label">재직기간</label>
										<div class="col-sm-10">
											<input type="Date" class="form-control" name="carDate">
										</div>
									</div>
									<div class="row mb-3">
										<label for="carPosition" class="col-sm-2 col-form-label">직급/직책</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="carPosition">
										</div>
									</div>
									<div class="row mb-3">
										<label for="carDept" class="col-sm-2 col-form-label">근무부서</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="carDept">
										</div>
									</div>
									<div class="row mb-3">
										<label for="carResp" class="col-sm-2 col-form-label">담당업무</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="carResp">
										</div>
									</div>
									<div class="row mb-3">
										<label for="carSalary" class="col-sm-2 col-form-label">연봉</label>
										<div class="col-sm-10">
											<input type="number" class="form-control" name="carSalary">
										</div>
									</div>
									<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
										<button type="submit" class="btn btn-primary">save</button>
									</div>
								</form>
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
							<h3 class="mb-3">자격증</h3>
							<div>
								<form name="rCerti" action="rCerti" method="post">
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
										<button type="submit" class="btn btn-primary">save</button>
									</div>
								</form>
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
					onclick="fn_rWrite(); return false;">save</button>
				<button class="btn btn-primary" type="button">cancel</button>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
		// 이력서 등록
		function fn_rWrite() {
			let formdata = new FormData();
			formdata.append("resumeTitle", $("#resumeTitle").val());
			formdata.append("flexCheckChecked", $("#flexCheckChecked").val());
			formdata.append("uploadPortf", $("#uploadPortf")[0].files[0]);
			formdata.append("resumePhoto", $("#url").val());

			$.ajax({
				url : "${pageContext.request.contextPath}/person/resume/write",
				type : "post",
				contentType : false,
				processData : false,
				data : formdata,
				success : function(result) {
					if (result === 1) {
						alert("이력서가 등록되었습니다.");
						var userId = $("#userId").val();
						location.href = "/job/person/resume/list?userId="
								+ userId;
					} else {
						alert("이력서 등록에 실패했습니다.");
					}
				}
			})
		}
		
		

 		// 대입검정고시 체크박스 Y/N 체크
		 var ged = $("#checkY").prop("checked")? "Y" :"N";
			$("#checkN").val(ged);

 		
 		
		
		
			
	</script>

</body>
</html>