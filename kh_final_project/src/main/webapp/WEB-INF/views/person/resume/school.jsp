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
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-3">학력사항</h3>
								</div>
								<!-- 모달 버튼 -->
								<div class="col-auto">
									<button type="button" class="btn btn-outline-dark m-2 btn-sm"
										data-bs-toggle="modal" data-bs-target="#viewRSchool">저장된
										정보 불러오기</button>
								</div>
							</div>

							<!-- 모달 창 -->
							<div class="modal fade" id="viewRSchool" tabindex="-1"
								role="dialog" aria-labelledby="uploadModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg"
									role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="uploadModalLabel">학력사항 불러오기</h5>

											<button type="button" class="close" data-bs-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<p>최종 학력 선택 후 불러올 학력을 체크하세요.</p>
											<!-- 버튼 그룹 -->
											<div class="btn-group mb-3">
												<button type="button" class="btn btn-outline-secondary"
													onclick="showList('highSchool')">고등학교 졸업</button>
												<button type="button" class="btn btn-outline-secondary"
													onclick="showList('university')">대학교 졸업</button>
												<button type="button" class="btn btn-outline-secondary"
													onclick="showList('graduate')">대학원 졸업</button>
											</div>
											<!-- 버튼 클릭 내용 -->
											<div class="table-responsive">
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>선택</th>
															<th>졸업상태</th>
															<th>학교명(소재지)</th>
															<th>카테고리</th>
															<th>졸업일자</th>
															<th>전공</th>
															<th>학점</th>
														</tr>
													</thead>
													<tbody id="highSchoolList">
														<c:forEach var="hschool" items="${high}">
															<tr>
																<td><input type="checkbox" name="hschool"
																	value="${hschool.highEduNo}" onclick="checkOnly(this)"></td>
																<td>${hschool.ged}</td>
																<td>${hschool.highName}</td>
																<td></td>
																<td>${hschool.highDate}</td>
																<td>${hschool.highMajor}</td>
																<td></td>
															</tr>
														</c:forEach>
													</tbody>
													<tbody id="universityList" style="display: none">
														<c:forEach var="university" items="${uni}">
															<tr>
																<td><input type="checkbox" name="university"
																	value="${university.uniEduNo}" onclick="checkOnly(this)"></td>
																<td>${university.uniAct}</td>
																<td>${university.uniName}</td>
																<td>${university.uniCategory}</td>
																<td>${university.uniDate}</td>
																<td>${university.uniMajor}</td>
																<td>${university.uniPoint}</td>
															</tr>
														</c:forEach>
													</tbody>
													<tbody id="graduateList" style="display: none">
														<c:forEach var="gschool" items="${grad}">
															<tr>
																<td><input type="checkbox" name="gschool"
																	value="${gschool.gradEduNo}" onclick="checkOnly(this)"></td>
																<td>${gschool.gradAct}</td>
																<td>${gschool.gradName}</td>
																<td>${gschool.gradCategory}</td>
																<td>${gschool.gradDate}</td>
																<td>${gschool.gradMajor}</td>
																<td>${gschool.gradPoint}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>

											<div
												class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
												<button type="button" class="btn btn-primary" onclick="completeCheck()">선택완료</button>
											</div>
										</div>

									</div>
								</div>

							</div>


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
											<!-- 보유중인 고등학교 학력사항 출력 -->

											<!--  고등학교 학력사항 Form  -->
											<form name="rHSchool" action="rHSchool" method="post">
												<div class="row mb-3">
													<label for="ged" class="col-sm-2 col-form-label">대입
														검정고시</label>
													<div class="col-sm-10">
														<div class="row mb-3">
															<div class="col-sm-10 offset-sm-2">
																<input type="hidden" id="ged" name="ged"> <input
																	type="checkbox" id="checkY" name="checkY" value="Y">대입
																검정고시
															</div>
														</div>
													</div>
												</div>

												<div class="row mb-3">
													<label for="highName" class="col-sm-2 col-form-label">고등학교명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="highName">
													</div>
												</div>
												<div class="row mb-3">
													<label for="highDate" class="col-sm-2 col-form-label">고등학교
														졸업일자</label>
													<div class="col-sm-10">
														<input type="Date" class="form-control" name="highDate">
													</div>
												</div>
												<div class="row mb-3">
													<label for="highMajor" class="col-sm-2 col-form-label">고등학교
														전공계열</label>
													<div class="col-sm-10">
														<select class="form-select" name="highMajor">
															<option value="0">전공계열</option>
															<option value="이과">이과</option>
															<option value="문과">문과</option>
															<option value="예체능">예체능</option>
														</select>
													</div>
												</div>
												<div
													class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
													<button type="submit" class="btn btn-primary"
														onclick="fn_checkY();">저장</button>
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
													<label for="uniAct" class="col-sm-2 col-form-label">대학
														졸업유무</label>
													<div class="col-sm-10">
														<select class="form-select" name="uniAct">
															<option selected>대학졸업유무선택</option>
															<option value="N">재학중</option>
															<option value="R">휴학</option>
															<option value="Y">졸업</option>
														</select>
													</div>
												</div>
												<div class="row mb-3">
													<label for="uniCategory" class="col-sm-2 col-form-label">대학
														카테고리</label>
													<div class="col-sm-10">
														<select class="form-select" name="uniCategory">
															<option selected>대학카테고리</option>
															<option value="T">2,3년제</option>
															<option value="F">4년제</option>
														</select>
													</div>
												</div>
												<div class="row mb-3">
													<label for="uniName" class="col-sm-2 col-form-label">대학교명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="uniName">
													</div>
												</div>
												<div class="row mb-3">
													<label for="uniDate" class="col-sm-2 col-form-label">대학
														졸업일자</label><br>
													<div class="col-sm-10">
														<input type="Date" class="form-control" name="uniDate">
													</div>
													<br>
													<p>(졸업 전일 경우엔 공란으로 두셔도 됩니다.)</p>
												</div>
												<div class="row mb-3">
													<label for="uniMajor" class="col-sm-2 col-form-label">대학
														전공</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="uniMajor">
													</div>
												</div>
												<div class="row mb-3">
													<label for="uniPoint" class="col-sm-2 col-form-label">대학
														학점</label>
													<div class="col-sm-10">
														<input type="number" step="0.01" class="form-control"
															name="uniPoint" placeholder="소수점 두번째 자리까지만 입력" min="0">
													</div>
												</div>
												<div
													class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
													<button type="submit" class="btn btn-primary">저장</button>
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
													<label for="gradAct" class="col-sm-2 col-form-label">대학원
														졸업유무</label>
													<div class="col-sm-10">
														<select class="form-select" name="gradAct">
															<option selected>대학졸업유무선택</option>
															<option value="N">재학중</option>
															<option value="R">휴학</option>
															<option value="Y">졸업</option>
														</select>
													</div>
												</div>
												<div class="row mb-3">
													<label for="gradCategory" class="col-sm-2 col-form-label">대학원
														카테고리</label>
													<div class="col-sm-10">
														<select class="form-select" name="gradCategory">
															<option selected>대학원카테고리</option>
															<option value="M">석사</option>
															<option value="D">박사</option>
														</select>
													</div>
												</div>
												<div class="row mb-3">
													<label for="gradName" class="col-sm-2 col-form-label">대학원명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="gradName">
													</div>
												</div>
												<div class="row mb-3">
													<label for="gradDate" class="col-sm-2 col-form-label">대학원
														졸업일자</label><br>
													<div class="col-sm-10">
														<input type="Date" class="form-control" name="gradDate">
													</div>
													<br>
													<p>(졸업 전일 경우엔 공란으로 두셔도 됩니다.)</p>
												</div>
												<div class="row mb-3">
													<label for="gradMajor" class="col-sm-2 col-form-label">대학원
														전공</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="gradMajor">
													</div>
												</div>
												<div class="row mb-3">
													<label for="gradPoint" class="col-sm-2 col-form-label">대학원
														학점</label>
													<div class="col-sm-10">
														<input type="number" step="0.01" class="form-control"
															name="gradPoint" placeholder="소수점 두번째 자리까지만 입력" min="0">
													</div>
												</div>
												<div
													class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
													<button type="submit" class="btn btn-primary">저장</button>
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

			<div class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/list">취소</a>
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/career">다음</a>
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
		
		// 체크박스 하나만 체크 
		function checkOnly(checkbox) {
			  var checkboxes = document.querySelectorAll('#highSchoolList input[type="checkbox"], #universityList input[type="checkbox"], #graduateList input[type="checkbox"]');
			  for (var i = 0; i < checkboxes.length; i++) {
			    if (checkboxes[i] !== checkbox && checkboxes[i].checked) {
			      checkboxes[i].checked = false;
			    }
			  }
			}
		
		// 선택 완료 버튼
		function completeCheck() {
			  var checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
			  if (checkboxes.length > 0) {
			    // 체크박스가 하나 이상 선택된 경우 모달 창 닫기
			    $('#viewRSchool').modal('hide');
			    
			    // 모달 창이 닫히면 체크박스 초기화
			    var allCheckboxes = document.querySelectorAll('input[type=checkbox]');
			    for (var i = 0; i < allCheckboxes.length; i++) {
			      allCheckboxes[i].checked = false;
			    }
			    
			  } 
			}


		//  대입검정고시 체크박스 Y/N 체크
		function fn_checkY() {
			var ged = $("#checkY").prop("checked") ? "Y" : "N";
			$("#ged").val(ged);
		}

		//  대입검정고시 체크박스 Y/N 체크
		function fn_checkY() {
			var ged = $("#checkY").prop("checked") ? "Y" : "N";
			$("#ged").val(ged);
		}

		// 체크박스 '대입 검정고시' 체크하면 아래내용 비활성화
		const disableInputCheckbox = document.getElementById("checkY");
		const dateField = document.getElementById("dateField");
		const selectField = document.getElementById("selectField");
		disableInputCheckbox.addEventListener("change", function() {
			if (this.checked) {
				inputField.disabled = true;
				dateField.disabled = true;
				selectField.disabled = true;
			} else {
				inputField.disabled = false;
				dateField.disabled = false;
				selectField.disabled = false;
			}
		});

		function showList(type) {
			// 모든 표 숨기기
			document.getElementById("highSchoolList").style.display = "none";
			document.getElementById("universityList").style.display = "none";
			document.getElementById("graduateList").style.display = "none";

			// 해당 타입에 맞는 표 보이기
			document.getElementById(type + "List").style.display = "table-row-group";
		}
	</script>

</body>
</html>