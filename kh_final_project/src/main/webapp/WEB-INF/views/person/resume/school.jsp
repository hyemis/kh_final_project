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


.parent {
	display: flex;
	justify-content: flex-end;
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
									<h3 class="mb-3">학력사항</h3>
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

											<!--  고등학교 학력사항 Form  -->

											<button class="btn btn-primary" onclick="addHigh()">새
												정보추가</button>
											<div class="col-auto">
												<button type="button"
													class="btn btn-outline-dark m-2 btn-sm"
													data-bs-toggle="modal" data-bs-target="#viewHigh">저장된
													정보 불러오기</button>
											</div>

											<!-- 고등학교 모달 창 -->
											<div class="modal fade" id="viewHigh" tabindex="-1"
												role="dialog" aria-labelledby="uploadModalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered modal-lg"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="uploadModalLabel">학력사항
																불러오기</h5>

															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<p>이력서에 불러올 고등학교 학력정보를 선택하세요.</p>

															<div class="table-responsive">
																<table class="table table-striped table-bordered">
																	<thead>
																		<tr>
																			<th>선택</th>
																			<th>졸업상태</th>
																			<th>학교명</th>
																			<th>졸업일자</th>
																			<th>전공</th>
																		</tr>
																	</thead>
																	<tbody id="highSchoolList">
																		<c:forEach var="hschool" items="${high}">
																			<tr>
																			
																				<td><input type="checkbox" name="selectedHigh" /></td>
																				<td data-hschoolged="${hschool.ged}"><c:choose>
																						<c:when test="${hschool.ged == 'Y'}">
																							<c:set var="gedName" value="검정고시" />
																						</c:when>
																						<c:when test="${hschool.ged == 'N'}">
																							<c:set var="gedName" value="졸업" />
																						</c:when>																		
																					</c:choose> ${gedName} <!-- gedName 변수 출력 --></td>
																				
																				<td>${hschool.highName}</td>
																				<td>${hschool.highDate}</td>
																				<td>${hschool.highMajor}</td>
																				<td><input type="hidden" name="highEduNo"
																					value="${hschool.highEduNo}" required>
																					<button type="button"
																						class="btn btn-outline-dark deleteHigh">삭제</button></td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
																<div id="selectedHighList"></div>

																<button type="button" data-bs-dismiss="modal"
																	class="btn btn-primary mx-auto d-block"
																	id="selectHighBtn" data-carNo="{hschool.highEduNo}">불러오기</button>
															</div>
														</div>
													</div>
												</div>
											</div>

											<div id="HighFormContainer">
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
																<option value="">전공계열</option>
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
														<button class="btn btn-primary delete-btn"
															onclick="removeForm(this.parentNode.parentNode)">삭제</button>
													</div>
													<hr>
												</form>
											</div>
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
											<button class="btn btn-primary" onclick="addUniv()">새
												정보추가</button>
											<div class="col-auto">
												<button type="button"
													class="btn btn-outline-dark m-2 btn-sm"
													data-bs-toggle="modal" data-bs-target="#viewUni">저장된
													정보 불러오기</button>
											</div>
											
											<!-- 대학교 모달 창 -->
											<div class="modal fade" id="viewUni" tabindex="-1"
												role="dialog" aria-labelledby="uploadModalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered modal-lg"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="uploadModalLabel">학력사항
																불러오기</h5>

															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<p>이력서에 불러올 대학교 학력정보를 선택하세요.</p>

															<div class="table-responsive">
																<table class="table table-striped table-bordered">
																	<thead>
																		<tr>
																			<th>선택</th>
																			<th>졸업상태</th>
																			<th>대학카테고리</th>
																			<th>학교명</th>
																			<th>졸업일자</th>
																			<th>전공</th>
																			<th>학점</th>
																		</tr>
																	</thead>
																	<tbody id="universityList">
																		<c:forEach var="university" items="${uni}">
																			<tr>
																				<td><input type="checkbox" name="selectedUni" /></td>

																				<td data-selectedvalue="${university.uniAct}"><c:choose>
																						<c:when test="${university.uniAct == 'Y'}">
																							<c:set var="uniActName" value="졸업" />
																						</c:when>
																						<c:when test="${university.uniAct == 'N'}">
																							<c:set var="uniActName" value="재학중" />
																						</c:when>
																						<c:when test="${university.uniAct == 'R'}">
																							<c:set var="uniActName" value="휴학" />
																						</c:when>
																					</c:choose> ${uniActName} <!-- uniActName 변수 출력 --></td>


																				<td data-selectedvalue="${university.uniCategory}"><c:set var="uniCategory"
																						value="${university.uniCategory}" /> <c:if
																						test="${uniCategory eq 'T'}">
																						<c:set var="uniCategoryName" value="2,3년제" />
																					</c:if> <c:if test="${uniCategory eq 'F'}">
																						<c:set var="uniCategoryName" value="4년제" />
																					</c:if> ${uniCategoryName} <!-- uniCategoryName 변수 출력 -->
																				</td>


																				<td>${university.uniName}</td>
																				<td>${university.uniDate}</td>
																				<td>${university.uniMajor}</td>
																				<td>${university.uniPoint}</td>
																				<td><input type="hidden" name="uniEduNo"
																					value="${university.uniEduNo}" required>
																					<button type="button"
																						class="btn btn-outline-dark deleteUni">삭제</button></td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
																<div id="selectedUniList"></div>

																<button type="button" data-bs-dismiss="modal"
																	class="btn btn-primary mx-auto d-block"
																	id="selectUniBtn" data-carNo="{university.uniEduNo}">불러오기</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<!-- 대학교 입력 form -->
											<div id="UniFormContainer">
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
														<button class="btn btn-primary delete-btn"
															onclick="removeForm(this.parentNode.parentNode)">삭제</button>
													</div>
													<hr>
												</form>
											</div>
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
											<button class="btn btn-primary" onclick="addGrad()">새
												정보추가</button>
											<div class="col-auto">
												<button type="button"
													class="btn btn-outline-dark m-2 btn-sm"
													data-bs-toggle="modal" data-bs-target="#viewGrad">저장된
													정보 불러오기</button>
											</div>

											<!-- 대학원 모달 창 -->
											<div class="modal fade" id="viewGrad" tabindex="-1"
												role="dialog" aria-labelledby="uploadModalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered modal-lg"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="uploadModalLabel">학력사항
																불러오기</h5>

															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<p>이력서에 불러올 대학원 학력정보를 선택하세요.</p>

															<div class="table-responsive">
																<table class="table table-striped table-bordered">
																	<thead>
																		<tr>
																			<th>선택</th>
																			<th>졸업상태</th>
																			<th>대학원카테고리</th>
																			<th>학교명</th>
																			<th>졸업일자</th>
																			<th>전공</th>
																			<th>학점</th>
																		</tr>
																	</thead>
																	<tbody id="gradList">
																		<c:forEach var="gschool" items="${grad}">
																			<tr>
																			
																				<td><input type="checkbox" name="selectedGrad" /></td>

																				<td data-selectedvalue="${gschool.gradAct}"><c:choose>
																						<c:when test="${gschool.gradAct == 'Y'}">
																							<c:set var="gradActName" value="졸업" />
																						</c:when>
																						<c:when test="${gschool.gradAct == 'N'}">
																							<c:set var="gradActName" value="재학중" />
																						</c:when>
																						<c:when test="${gschool.gradAct == 'R'}">
																							<c:set var="gradActName" value="휴학" />
																						</c:when>
																					</c:choose> ${gradActName} <!-- gradActActName 변수 출력 --></td>

																				
																				<td data-selectedvalue="${gschool.gradCategory}">
																				<c:set var="gradCategoryName"
																					value="${gschool.gradCategory eq 'M' ? '석사' : '박사'}" />
																				${gradCategoryName}</td>

																				<td>${gschool.gradName}</td>
																				<td>${gschool.gradDate}</td>
																				<td>${gschool.gradMajor}</td>
																				<td>${gschool.gradPoint}</td>

																				<td><input type="hidden" name="gradEduNo"
																					value="${gschool.gradEduNo}" required>
																					<button type="button"
																						class="btn btn-outline-dark deleteGrad">삭제</button></td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
																<div id="selectedGradList"></div>

																<button type="button" data-bs-dismiss="modal"
																	class="btn btn-primary mx-auto d-block"
																	id="selectGradBtn" data-carNo="{gschool.gradEduNo}">불러오기</button>
															</div>
														</div>
													</div>
												</div>
											</div>

											<!-- 대학원 입력form -->
											<div id="GradFormContainer">
												<form name="rGSchool" action="rGSchool" method="post">
													<div class="row mb-3">
														<label for="gradAct" class="col-sm-2 col-form-label">대학원
															졸업유무</label>
														<div class="col-sm-10">
															<select class="form-select" name="gradAct">
																<option selected>대학원졸업유무선택</option>
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
														<button class="btn btn-primary delete-btn"
															onclick="removeForm(this.parentNode.parentNode)">삭제</button>
													</div>
													<hr>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="accordion accordion-flush" id="accordionFlushNew"></div>

						</div>
			</div>

		</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/career">다음</a>
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


			
// 선택 완료 버튼 클릭 시
	function completeCheck() {
	  var checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
	  
	  // 선택된 체크박스 
	  
	  if (checkboxes.length > 0) {
	    // 체크박스가 하나 이상 선택된 경우
	    $('#viewRSchool').modal('hide'); // 모달 창 닫기
	    
	    // 모달 창이 닫히면 체크박스 초기화
	    var allCheckboxes = document.querySelectorAll('input[type=checkbox]');
	    for (var i = 0; i < allCheckboxes.length; i++) {
	      allCheckboxes[i].checked = false;
	    }
	
	    // 이전 아코디언 숨기기
	    $('#accordionFlushExample').removeClass('show');
	    $('#accordionFlushExample').addClass('collapse');
	
		// 선택한 체크박스 값 출력
		var selectedValues = '';
		  var selectedCheckboxes = document.querySelectorAll('input[type=checkbox]:checked');
		for (var i = 0; i < checkboxes.length; i++) {
		  selectedValues += checkboxes[i].value + ' ';
		}
		var selectedValuesHTML = '<p>선택한 항목: ' + selectedValues + '</p>';
		
		// 새로운 아코디언 보이기
		var newAccordion = `
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="flush-heading-new">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-new" aria-expanded="false" aria-controls="flush-collapse-new">
		        새로운 아코디언
		      </button>
		    </h2>
		    <div id="flush-collapse-new" class="accordion-collapse collapse show" aria-labelledby="flush-heading-new" data-bs-parent="#accordionFlushNew">
		      <div class="accordion-body">
		        <form name="rHSchool" action="rHSchool" method="post">
		          ${selectedValuesHTML}
		          <input type="hidden" name="selectedValues" value="${selectedValues.trim()}" />
		        </form>
		      </div>
		    </div>
		  </div>
		`;

	
	    $('#accordionFlushNew').append(newAccordion);
	    $('#flush-collapse-new').addClass('show');
	    
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


// 모든 표 숨기기
function showList(type) {
	document.getElementById("highSchoolList").style.display = "none";
	document.getElementById("universityList").style.display = "none";
	document.getElementById("graduateList").style.display = "none";

	// 해당 타입에 맞는 표 보이기
	document.getElementById(type + "List").style.display = "table-row-group";
}
		
		
// 고등학교 입력폼 추가
function addHigh() {
	var originForm = rsforms[0];
	var form = originForm.cloneNode(true);
	originForm.parentNode.insertBefore(form, originForm.nextSibling);
	rsforms.push(form);
}
var rsforms = [ document.getElementsByName("rHSchool")[0] ];
		
				
// 대학교 입력폼 추가
function addUniv() {
	var originForm = uniforms[0];
	var form = originForm.cloneNode(true);
	originForm.parentNode.insertBefore(form, originForm.nextSibling);
	uniforms.push(form);
}
var uniforms = [ document.getElementsByName("rUniversity")[0] ];
		
		
// 대학원 입력폼 추가
function addGrad() {
	var originForm = gsforms[0];
	var form = originForm.cloneNode(true);
	originForm.parentNode.insertBefore(form, originForm.nextSibling);
	gsforms.push(form);
}
var gsforms = [ document.getElementsByName("rGSchool")[0] ];

// 입력폼 삭제
function removeForm(form) {
	form.remove();
}
		
		
		
// 고등학교삭제
$('.deleteHigh').click(function() {
	var highEduNo = $(this).prev('input[name="highEduNo"]').val();
  $.ajax({
    type: 'POST',
    url: 'deleteHigh',
    data: { highEduNo: highEduNo },
    success: function(result) {
      if(result > 0) {
        alert('해당 학력이 삭제되었습니다. 이전에 이미 작성한 이력서에 포함된 학력사항은 삭제되지 않습니다.');
        location.reload();
      } else {
        alert('해당 학력사항 삭제에 실패했습니다.');
      }  // if end
    } // success end
  });  // ajax end
}); // click-function

// 대학교삭제
$('.deleteUni').click(function() {
	var uniEduNo = $(this).prev('input[name="uniEduNo"]').val();
  $.ajax({
    type: 'POST',
    url: 'deleteUni',
    data: { uniEduNo: uniEduNo },
    success: function(result) {
      if(result > 0) {
        alert('해당 학력이 삭제되었습니다. 이전에 이미 작성한 이력서에 포함된 학력사항은 삭제되지 않습니다.');
        location.reload();
      } else {
        alert('해당 학력사항 삭제에 실패했습니다.');
      }  // if end
    } // success end
  });  // ajax end
}); // click-function

// 대학원삭제
$('.deleteGrad').click(function() {
	var gradEduNo = $(this).prev('input[name="gradEduNo"]').val();
  $.ajax({
    type: 'POST',
    url: 'deleteGrad',
    data: { gradEduNo: gradEduNo },
    success: function(result) {
      if(result > 0) {
        alert('해당 학력이 삭제되었습니다. 이전에 이미 작성한 이력서에 포함된 학력사항은 삭제되지 않습니다.');
        location.reload();
      } else {
        alert('해당 학력사항 삭제에 실패했습니다.');
      }  // if end
    } // success end
  });  // ajax end
}); // click-function
		
		
		
// 모달창 체크박스 초기화
$(document).ready(function() {
	$('#viewHigh').on('hidden.bs.modal', function() {
		$('input[name=selectedHigh]').prop('checked', false);
	});
});

$(document).ready(function() {
	$('#viewUni').on('hidden.bs.modal', function() {
		$('input[name=selectedUni]').prop('checked', false);
	});
});

$(document).ready(function() {
	$('#viewGrad').on('hidden.bs.modal', function() {
		$('input[name=selectedGrad]').prop('checked', false);
	});
});


//고등학교 DB 낀테이블 insert - success - ok -> new form create - btn event handler
//고등학교 - 모달창에서 정보 불러와서 출력하기
let highSaveButton = document.getElementById("selectHighBtn");
//event
highSaveButton.addEventListener("click", function() {
	// 체크된 데이터를 가져와서 form에 추가
	let selectedHighList = document.querySelectorAll('input[name="selectedHigh"]:checked');

	let highNewFormHTML =	`
		<form name="rHSchool" action="rHSchool" method="post">
		 <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
			<button type="button" class="btn btn-outline-dark" id="deleteHighInfo">
			  <i class="fa fa-minus"></i>
			</button>
	 	</div>
		
	 	<div class="row mb-3">
			<label for="ged" class="col-sm-2 col-form-label">대입 검정고시</label>
			<div class="col-sm-10">
				<div class="row mb-3">
					<div class="col-sm-10 offset-sm-2">
						<input type="checkbox" name="highNewGed">대입 검정고시</div>
				</div>
			</div>
		</div>

		<div class="row mb-3">
			<label for="highNewName" class="col-sm-2 col-form-label">고등학교명</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="highNewName">
			</div>
		</div>
		
		<div class="row mb-3">
			<label for="highNewDate" class="col-sm-2 col-form-label">고등학교 졸업일자</label>
			<div class="col-sm-10">
				<input type="Date" class="form-control" name="highNewDate">
			</div>
		</div>
		
		<div class="row mb-3">
			<label for="highNewMajor" class="col-sm-2 col-form-label">고등학교	전공계열</label>
			<div class="col-sm-10">
				<select class="form-select" name="highNewMajor">
					<option value="0">전공계열</option>
					<option value="이과">이과</option>
					<option value="문과">문과</option>
					<option value="예체능">예체능</option>
				</select>
			</div>
		</div>
	
		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
			<button type="button" id="highUpdate" class="btn btn-primary">수정</button>
		</div>
		<hr>
	</form>
	`;
	
	 
	let highNewForm = null;
 
 // 모달창에서 체크된 경력 데이터 - new form create 
 for (let i = 0; i < selectedHighList.length; i++) {
	  	// 선택된 체크박스가 속한 <tr> 요소 찾기
	  	let tr = selectedHighList[i].closest("tr");
	  	// 해당 <tr> 요소 내의 highEduNo 값 가져오기
	  	let highEduNo = tr.querySelector("input[name='highEduNo']").value;
	  	$.ajax({
	  		url : 'insertInfoHigh',
	  		type: 'POST',
	  		data : {highEduNo : highEduNo},
	  		success : function(result) {
	  			if(result > 0) {
	  				highNewForm = document.createElement("form");
		  			let highFormContainer = document.getElementById("HighFormContainer");
		  			highNewForm.id = "high-form-"+i; // 각각의 폼에 대해 고유한 id 값 부여
		  			highNewForm.innerHTML = highNewFormHTML;
		  			highFormContainer.appendChild(highNewForm);
		  			
 
	    // 기존 form 뒤에 새로운 form 추가
	    let highData = selectedHighList[i].closest("tr").getElementsByTagName("td");
	      
	    var hschoolged = highData[1].dataset.hschoolged;
	    if(hschoolged=="Y"){
	    	highNewForm.elements["highNewGed"].checked = true;
	    }

 	 
		highNewForm.elements["highNewName"].value = highData[2].textContent;
	    highNewForm.elements["highNewDate"].value = highData[3].textContent;
	    highNewForm.elements["highNewMajor"].value = highData[4].textContent;

	    
	    // new form delete 버튼 -
	    let highDeleteBtn = highNewForm.querySelector("#deleteHighInfo");
			highDeleteBtn.addEventListener("click", function() {
			  highDeleteHandler(highFormContainer, this, highEduNo);
			});
   
		    // new form 수정 버튼 
		    let highUpdateBtn = highNewForm.querySelector("#highUpdate");
			highUpdateBtn.addEventListener("click", function() {
			highUpdateHandler(highNewForm, highEduNo);
			});
	      } else {
	      }
	    }
	}); 

		
alert('작성 중인 이력서에서 해당 경력 정보가 입력되었습니다.');

}			
});  


//new form delete 버튼 - 
function highDeleteHandler(highFormContainer, highDeleteBtn, highEduNo){
	const formToRemove = highDeleteBtn.closest("form");

	// highEduNo 값을 가져온 후 삭제
	highFormContainer.removeChild(formToRemove);
	    	
	 $.ajax({
	   type: 'POST',
	   url: 'deleteInfoHigh',
	   data: { highEduNo: highEduNo },
	   success: function(result) {
	     if(result > 0) {
	       alert('작성 중인 이력서에서 해당 학력 정보가 삭제되었습니다.');
	     } else {
	       alert('작성 중인 이력서에서 해당 학력 정보 삭제에 실패했습니다.');
		  }
		}
		});
	}

//new form 수정 버튼 
 function highUpdateHandler(highNewForm,highEduNo) {
	const highNewName = highNewForm.elements["highNewName"].value;
	const highNewDate = highNewForm.elements["highNewDate"].value;
	const highNewMajor = highNewForm.elements["highNewMajor"].value;

	const data = {
		highEduNo: highEduNo,
		highNewName: highNewName,
		highNewDate: highNewDate,
		highNewMajor: highNewMajor
		};

	
	$.ajax({
		type: "POST",
		url: 'updateHigh',
		data: data,
		success: function(result) {
		 if(result > 0) {
		   alert('해당 학력이 수정되었습니다.');
		   location.reload();
		 } else {
		   alert('해당 학력 수정에 실패했습니다.');
		    }
		  }
		});
	 
	}



//고등학교 모달창에서 체크한 사항 순서대로 표시
$(document).ready(function() {
	$('input[name="selectedHigh"]').change(function() {
	// 선택된 체크박스를 담을 배열을 초기화
	var selectedHighs = [];

	// 체크된 체크박스의 값 가져오기
	$('input[name="selectedHigh"]:checked').each(function(index) {

		var hschool = {
			ged: $(this).closest('tr').find('td:eq(1)').text(),
			highName: $(this).closest('tr').find('td:eq(2)').text(),
			highDate: $(this).closest('tr').find('td:eq(3)').text(),
			highMajor: $(this).closest('tr').find('td:eq(4)').text(),
			highNumber: index + 1
	};

	// 배열에 추가
	selectedHighs.push(hschool);
		}); 	

	// 선택된 값을 테이블 형태로 출력
	var html = '<table class="table">';
	html += '<thead><tr><th>순서</th><th>졸업상태</th><th>학교명</th><th>졸업일자</th><th>전공</th></tr></thead>';
	html += '<tbody>';
	
	for (var i = 0; i < selectedHighs.length; i++) {
	html += '<tr>';
	html += '<td>' + selectedHighs[i].highNumber + '</td>';
	html += '<td>' + selectedHighs[i].ged + '</td>';
	html += '<td>' + selectedHighs[i].highName + '</td>';
	html += '<td>' + selectedHighs[i].highDate + '</td>';
	html += '<td>' + selectedHighs[i].highMajor + '</td>';
	html += '</tr>';
	}
	
	html += '</tbody></table>';
	
	$('#selectedHighList').html(html);
	});
});



//모달창 닫으면 표 초기화
$('#viewHigh').on('hidden.bs.modal', function () {
	$('#selectedHighList').html('');
	$('input[name="selectedHigh"]').prop('checked', false);
}); 








//대학원 DB 낀테이블 insert - success - ok -> new form create - btn event handler
// 대학원 - 모달창에서 정보 불러와서 출력하기
let gradSaveButton = document.getElementById("selectGradBtn");
// event
gradSaveButton.addEventListener("click", function() {
  // 체크된 데이터를 가져와서 form에 추가
  let selectedGradList = document.querySelectorAll('input[name="selectedGrad"]:checked');

  let gradNewFormHTML =	`
	  <form name="rGSchool" action="rGSchool" method="post">
	  <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
		<button type="button" class="btn btn-outline-dark" id="deleteGradInfo">
		  <i class="fa fa-minus"></i>
		</button>
	 </div>

	 <div class="row mb-3">
			<label for="gradNewAct" class="col-sm-2 col-form-label">대학원
				졸업유무</label>
			<div class="col-sm-10">
				<select class="form-select" name="gradNewAct">
					<option selected>대학원졸업유무선택</option>
					<option value="N">재학중</option>
					<option value="R">휴학</option>
					<option value="Y">졸업</option>
				</select>
			</div>
		</div>
		<div class="row mb-3">
			<label for="gradNewCategory" class="col-sm-2 col-form-label">대학원
				카테고리</label>
			<div class="col-sm-10">
				<select class="form-select" name="gradNewCategory">
					<option selected>대학원카테고리</option>
					<option value="M">석사</option>
					<option value="D">박사</option>
				</select>
			</div>
		</div>
		<div class="row mb-3">
			<label for="gradNewName" class="col-sm-2 col-form-label">대학원명</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="gradNewName">
			</div>
		</div>
		<div class="row mb-3">
			<label for="gradNewDate" class="col-sm-2 col-form-label">대학원
				졸업일자</label><br>
			<div class="col-sm-10">
				<input type="Date" class="form-control" name="gradNewDate">
			</div>
		</div>
		<div class="row mb-3">
			<label for="gradNewMajor" class="col-sm-2 col-form-label">대학원
				전공</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="gradNewMajor">
			</div>
		</div>
		<div class="row mb-3">
			<label for="gradNewPoint" class="col-sm-2 col-form-label">대학원
				학점</label>
			<div class="col-sm-10">
				<input type="number" step="0.01" class="form-control"
					name="gradNewPoint" min="0">
			</div>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
		<button type="button" id="gradUpdate" class="btn btn-primary">수정</button>
		</div>
		<hr>
	</form>
    `;
    
    let gradNewForm = null;
    
    // 모달창에서 체크된 경력 데이터 - new form create 
    for (let i = 0; i < selectedGradList.length; i++) {
		// DB 낀테이블 insert - success - ok -> new form create - btn event handler
	  	// 선택된 체크박스가 속한 <tr> 요소 찾기
	  	let tr = selectedGradList[i].closest("tr");
	  	// 해당 <tr> 요소 내의 gradEduNo 값 가져오기
	  	let gradEduNo = tr.querySelector("input[name='gradEduNo']").value;
	  	$.ajax({
	  		url : 'insertInfoGrad',
	  		type: 'POST',
	  		data : {gradEduNo : gradEduNo},
	  		success : function(result) {
	  			if(result > 0) {
	  		        //alert('작성 중인 이력서에서 해당 경력 정보가 입력되었습니다.');
	  		        gradNewForm = document.createElement("form");
		  			let gradFormContainer = document.getElementById("GradFormContainer");
		  			gradNewForm.id = "grad-form-"+i; // 각각의 폼에 대해 고유한 id 값 부여
		  			gradNewForm.innerHTML = gradNewFormHTML;
		  			gradFormContainer.appendChild(gradNewForm);
    
	    // 기존 form 뒤에 새로운 form 추가
	    let gradData = selectedGradList[i].closest("tr").getElementsByTagName("td");
	  
	    let gradNewAct = gradData[1].getAttribute("data-selectedvalue");
	    let gradNewCategory = gradData[2].getAttribute("data-selectedvalue");
	    gradNewForm.elements["gradNewAct"].value = gradNewAct;
	    gradNewForm.elements["gradNewCategory"].value = gradNewCategory;
	    gradNewForm.elements["gradNewName"].value = gradData[3].textContent;
	    gradNewForm.elements["gradNewDate"].value = gradData[4].textContent;
	    gradNewForm.elements["gradNewMajor"].value = gradData[5].textContent;
	    gradNewForm.elements["gradNewPoint"].value = gradData[6].textContent;
	    
	    
	    // new form delete 버튼 -
	    let gradDeleteBtn = gradNewForm.querySelector("#deleteGradInfo");
			gradDeleteBtn.addEventListener("click", function() {
			  gradDeleteHandler(gradFormContainer, this, gradEduNo);
			});
      
		    // new form 수정 버튼 
		    let gradUpdateBtn = gradNewForm.querySelector("#gradUpdate");
			gradUpdateBtn.addEventListener("click", function() {
			gradUpdateHandler(gradNewForm, gradEduNo);
			});
	      } else {
	      }
	    }
	}); 

alert('작성 중인 이력서에서 해당 경력 정보가 입력되었습니다.');

}			
});  


//new form delete 버튼 - 
function gradDeleteHandler(gradFormContainer, gradDeleteBtn, gradEduNo){
	const formToRemove = gradDeleteBtn.closest("form");

	// gradEduNo 값을 가져온 후 삭제
	gradFormContainer.removeChild(formToRemove);
	    	
	 $.ajax({
	   type: 'POST',
	   url: 'deleteInfoGrad',
	   data: { gradEduNo: gradEduNo },
	   success: function(result) {
	     if(result > 0) {
	       alert('작성 중인 이력서에서 해당 학력 정보가 삭제되었습니다.');
	     } else {
	       alert('작성 중인 이력서에서 해당 학력 정보 삭제에 실패했습니다.');
		  }
		}
		});
	}

//new form 수정 버튼 
function gradUpdateHandler(gradNewForm,gradEduNo) {
	const gradNewAct = gradNewForm.elements["gradNewAct"].value;
	const gradNewCategory = gradNewForm.elements["gradNewCategory"].value;
	const gradNewName = gradNewForm.elements["gradNewName"].value;
	const gradNewDate = gradNewForm.elements["gradNewDate"].value;
	const gradNewMajor = gradNewForm.elements["gradNewMajor"].value;
	const gradNewPoint = gradNewForm.elements["gradNewPoint"].value;

	const data = {
		gradEduNo: gradEduNo,
		gradNewAct: gradNewAct,
		gradNewCategory: gradNewCategory,
		gradNewName: gradNewName,
		gradNewDate: gradNewDate,
		gradNewMajor: gradNewMajor,
		gradNewPoint: gradNewPoint
		};

	
	$.ajax({
		type: "POST",
		url: 'updateGrad',
		data: data,
		success: function(result) {
		 if(result > 0) {
		   alert('해당 학력이 수정되었습니다.');
		   location.reload();
		 } else {
		   alert('해당 학력 수정에 실패했습니다.');
		    }
		  }
		});
	 }



// 대학원 모달창에서 체크한 사항 순서대로 표시
$(document).ready(function() {
	$('input[name="selectedGrad"]').change(function() {
	// 선택된 체크박스를 담을 배열을 초기화
	var selectedGschools = [];

	// 체크된 체크박스의 값 가져오기
	$('input[name="selectedGrad"]:checked').each(function(index) {

		var gschool = {
			gradAct: $(this).closest('tr').find('td:eq(1)').text(),
			gradCategory: $(this).closest('tr').find('td:eq(2)').text(),
			gradName: $(this).closest('tr').find('td:eq(3)').text(),
			gradDate: $(this).closest('tr').find('td:eq(4)').text(),
			gradMajor: $(this).closest('tr').find('td:eq(5)').text(),
			gradPoint: $(this).closest('tr').find('td:eq(6)').text(),
			gradNumber: index + 1
	};

	// 배열에 추가
	selectedGschools.push(gschool);
		}); 	

	// 선택된 값을 테이블 형태로 출력
	var html = '<table class="table">';
	html += '<thead><tr><th>순서</th><th>졸업상태</th><th>대학원카테고리</th><th>학교명</th><th>졸업일자</th><th>전공</th><th>학점</th></tr></thead>';
	html += '<tbody>';
	
	for (var i = 0; i < selectedGschools.length; i++) {
	html += '<tr>';
	html += '<td>' + selectedGschools[i].gradNumber + '</td>';
	html += '<td>' + selectedGschools[i].gradAct + '</td>';
	html += '<td>' + selectedGschools[i].gradCategory + '</td>';
	html += '<td>' + selectedGschools[i].gradName + '</td>';
	html += '<td>' + selectedGschools[i].gradDate + '</td>';
	html += '<td>' + selectedGschools[i].gradMajor + '</td>';
	html += '<td>' + selectedGschools[i].gradPoint + '</td>';
	html += '</tr>';
	}

	html += '</tbody></table>';
	
	$('#selectedGradList').html(html);
	});
});


//모달창 닫으면 표 초기화
$('#viewGrad').on('hidden.bs.modal', function () {
	$('#selectedGradList').html('');
	$('input[name="selectedGrad"]').prop('checked', false);
});
		




		
// 대학교 DB 낀테이블 insert - success - ok -> new form create - btn event handler
		// 대학교 - 모달창에서 정보 불러와서 출력하기
		let uniSaveButton = document.getElementById("selectUniBtn");
		// event
		uniSaveButton.addEventListener("click", function() {
		  // 체크된 데이터를 가져와서 form에 추가
		  let selectedUniList = document.querySelectorAll('input[name="selectedUni"]:checked');

		  let uniNewFormHTML =	`
				<form name="rUniversity" action="rUniversity" method="post">
				 <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
			 		<button type="button" class="btn btn-outline-dark" id="deleteUniInfo">
					  <i class="fa fa-minus"></i>
					</button>
			  	 </div>
					<div class="row mb-3">
						<label for="uniNewAct" class="col-sm-2 col-form-label">대학
							졸업유무</label>
						<div class="col-sm-10">
							<select class="form-select" name="uniNewAct">
								<option value="N">재학중</option>
								<option value="R">휴학</option>
								<option value="Y">졸업</option>
							</select>
						</div>
					</div>
					<div class="row mb-3">
						<label for="uniNewCategory" class="col-sm-2 col-form-label">대학
							카테고리</label>
						<div class="col-sm-10">
							<select class="form-select" name="uniNewCategory">
								<option value="T">2,3년제</option>
								<option value="F">4년제</option>
							</select>
						</div>
					</div>
					<div class="row mb-3">
						<label for="uniNewName" class="col-sm-2 col-form-label">대학교명</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="uniNewName">
						</div>
					</div>
					<div class="row mb-3">
						<label for="uniNewDate" class="col-sm-2 col-form-label">대학
							졸업일자</label><br>
						<div class="col-sm-10">
							<input type="Date" class="form-control" name="uniNewDate">
						</div>
					</div>
					<div class="row mb-3">
						<label for="uniNewMajor" class="col-sm-2 col-form-label">대학
							전공</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="uniNewMajor">
						</div>
					</div>
					<div class="row mb-3">
						<label for="uniNewPoint" class="col-sm-2 col-form-label">대학
							학점</label>
						<div class="col-sm-10">
							<input type="number" step="0.01" class="form-control"
								name="uniNewPoint" min="0">
						</div>
					</div>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
					<button type="button" id="uniUpdate" class="btn btn-primary">수정</button>
					</div>
					<hr>
				</form>
		    `;
		    
		    let uniNewForm = null;
		    
		    // 모달창에서 체크된 경력 데이터 - new form create 
		    for (let i = 0; i < selectedUniList.length; i++) {
				// DB 낀테이블 insert - success - ok -> new form create - btn event handler
			  	// 선택된 체크박스가 속한 <tr> 요소 찾기
			  	let tr = selectedUniList[i].closest("tr");
			  	// 해당 <tr> 요소 내의 uniEduNo 값 가져오기
			  	let uniEduNo = tr.querySelector("input[name='uniEduNo']").value;
			  	$.ajax({
			  		url : 'insertInfoUni',
			  		type: 'POST',
			  		data : {uniEduNo : uniEduNo},
			  		success : function(result) {
			  			if(result > 0) {
			  		        //alert('작성 중인 이력서에서 해당 경력 정보가 입력되었습니다.');
			  		        uniNewForm = document.createElement("form");
				  			let uniFormContainer = document.getElementById("UniFormContainer");
				  			uniNewForm.id = "car-form-"+i; // 각각의 폼에 대해 고유한 id 값 부여
				  			uniNewForm.innerHTML = uniNewFormHTML;
				  			uniFormContainer.appendChild(uniNewForm);
		    
			    // 기존 form 뒤에 새로운 form 추가
			    let uniData = selectedUniList[i].closest("tr").getElementsByTagName("td");
			    let uniNewAct = uniData[1].getAttribute("data-selectedvalue");
			    let uniNewCategory = uniData[2].getAttribute("data-selectedvalue");
			    uniNewForm.elements["uniNewAct"].value = uniNewAct;
			    uniNewForm.elements["uniNewCategory"].value = uniNewCategory;
			    uniNewForm.elements["uniNewName"].value = uniData[3].textContent;
			    uniNewForm.elements["uniNewDate"].value = uniData[4].textContent;
			    uniNewForm.elements["uniNewMajor"].value = uniData[5].textContent;
			    uniNewForm.elements["uniNewPoint"].value = uniData[6].textContent;
			    
			    
			    // new form delete 버튼 -
			    let deleteBtn = uniNewForm.querySelector("#deleteUniInfo");
					deleteBtn.addEventListener("click", function() {
					  deleteClickHandler(uniFormContainer, this, uniEduNo);
					});
		      
	  		    // new form 수정 버튼 
	  		    let updateBtn = uniNewForm.querySelector("#uniUpdate");
	  			updateBtn.addEventListener("click", function() {
	  			updateClickHandler(uniNewForm, uniEduNo);
	  			});
  		      } else {
  		      }
	  	    }
	  	}); 
    
  	alert('작성 중인 이력서에서 해당 경력 정보가 입력되었습니다.');
    
   }			
});  


//new form delete 버튼 - 
function deleteClickHandler(uniFormContainer, deleteBtn, uniEduNo){
  const formToRemove = deleteBtn.closest("form");
  
	// uniEduNo 값을 가져온 후 삭제
  uniFormContainer.removeChild(formToRemove);
			    	
   	  $.ajax({
   	    type: 'POST',
   	    url: 'deleteInfoUni',
   	    data: { uniEduNo: uniEduNo },
   	    success: function(result) {
   	      if(result > 0) {
   	        alert('작성 중인 이력서에서 해당 학력 정보가 삭제되었습니다.');
   	      } else {
   	        alert('작성 중인 이력서에서 해당 학력 정보 삭제에 실패했습니다.');
   		  }
   		}
   		});
   	}
    
//new form 수정 버튼 
function updateClickHandler(uniNewForm,uniEduNo) {
     const uniNewAct = uniNewForm.elements["uniNewAct"].value;
     const uniNewCategory = uniNewForm.elements["uniNewCategory"].value;
     const uniNewName = uniNewForm.elements["uniNewName"].value;
     const uniNewDate = uniNewForm.elements["uniNewDate"].value;
     const uniNewMajor = uniNewForm.elements["uniNewMajor"].value;
     const uniNewPoint = uniNewForm.elements["uniNewPoint"].value;
     
     
     const data = {
 	   uniEduNo: uniEduNo,
       uniNewAct: uniNewAct,
       uniNewCategory: uniNewCategory,
       uniNewName: uniNewName,
       uniNewDate: uniNewDate,
       uniNewMajor: uniNewMajor,
       uniNewPoint: uniNewPoint
     };

     $.ajax({
       type: "POST",
       url: 'updateUni',
       data: data,
       success: function(result) {
         if(result > 0) {
           alert('해당 학력이 수정되었습니다.');
           location.reload();
         } else {
           alert('해당 학력 수정에 실패했습니다.');
	        }
	      }
	    });
}



	// 대학교 모달창에 체크한 이력서 순서대로 표시
	$(document).ready(function() {
 	$('input[name="selectedUni"]').change(function() {
    // 선택된 체크박스를 담을 배열을 초기화
    var selectedUnis = [];

    // 체크된 체크박스의 값 가져오기
    $('input[name="selectedUni"]:checked').each(function(index) {

    	var university = {
  			uniAct: $(this).closest('tr').find('td:eq(1)').text(),
  			uniCategory: $(this).closest('tr').find('td:eq(2)').text(),
  			uniName: $(this).closest('tr').find('td:eq(3)').text(),
  			uniDate: $(this).closest('tr').find('td:eq(4)').text(),
  			uniMajor: $(this).closest('tr').find('td:eq(5)').text(),
  			uniPoint: $(this).closest('tr').find('td:eq(6)').text(),
        uniNumber: index + 1 // 선택된 체크박스가 배열에서 몇 번째인지를 이용해 번호 매기기
      };

      // 배열에 추가
      selectedUnis.push(university);
   	 });  // 

    // 선택된 값을 테이블 형태로 출력
    var html = '<table class="table">';
    html += '<thead><tr><th>순서</th><th>졸업상태</th><th>대학카테고리</th><th>학교명</th><th>졸업일자</th><th>전공</th><th>학점</th></tr></thead>';
    html += '<tbody>';

    for (var i = 0; i < selectedUnis.length; i++) {
      html += '<tr>';
      html += '<td>' + selectedUnis[i].uniNumber + '</td>';
      html += '<td>' + selectedUnis[i].uniAct + '</td>';
      html += '<td>' + selectedUnis[i].uniCategory + '</td>';
      html += '<td>' + selectedUnis[i].uniName + '</td>';
      html += '<td>' + selectedUnis[i].uniDate + '</td>';
      html += '<td>' + selectedUnis[i].uniMajor + '</td>';
      html += '<td>' + selectedUnis[i].uniPoint + '</td>';
      html += '</tr>';
    }

    html += '</tbody></table>';

    $('#selectedUniList').html(html);
  });
});


// 모달창 닫으면 표 초기화
$('#viewUni').on('hidden.bs.modal', function () {
    $('#selectedUniList').html('');
    $('input[name="selectedUni"]').prop('checked', false);
});
		
		
		
		
		
		

		
		
		
		
		
		
		
	</script>

</body>
</html>