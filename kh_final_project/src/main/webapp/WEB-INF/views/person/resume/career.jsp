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
							<h3 class="mb-3">경력사항</h3>
						</div>
						<!-- 모달 버튼 -->
						<div class="col-auto">
							<button type="button" class="btn btn-outline-dark m-2 btn-sm"
								data-bs-toggle="modal" data-bs-target="#viewCareer">저장된
								정보 불러오기</button>
						</div>
						<div>
							<!-- 모달 창 -->
							<div class="modal fade" id="viewCareer" tabindex="-1"
								role="dialog" aria-labelledby="uploadModalLabel"
								aria-hidden="true">
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
											<p>불러올 경력을 체크하세요.</p>
											<div class="table-responsive">
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>선택</th>
															<th>재직기간</th>
															<th>회사명</th>
															<th>직급/직책</th>
															<th>근무부서</th>
															<th>담당업무</th>
															<th>연봉</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="careerList" items="${career}">
															<tr>
																<td><input type="checkbox" name="selectedCareer" /></td>
																<td>${careerList.carDate}</td>
																<td>${careerList.carName}</td>
																<td>${careerList.carPosition}</td>
																<td>${careerList.carDept}</td>
																<td>${careerList.carResp}</td>
																<td>${careerList.carSalary}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												<button type="button" data-bs-dismiss="modal"
													class="btn btn-primary mx-auto d-block" id="selectCarBtn">불러오기</button>
											</div>

										</div>
									</div>
								</div>
							</div>

							<input type="radio" id="radio-box" name="radio-group"> <label
								for="radio-box">경력없음(신입)</label><br>
							<hr>
							<button class="btn btn-primary" onclick="addCar()">경력추가</button>
							<br>
						</div>
						<div id="hidden-content">
							<div id="CarFormContainer">
								<form name="career" action="career" method="post">
									<div class="row mb-3">
										<label for="carName" class="col-sm-2 col-form-label">회사명</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="carName">
										</div>
									</div>

									<div class="row mb-3">
										<label for="carDate" class="col-sm-2 col-form-label">재직기간</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="carDate"
												placeholder="ex) 2020-01-01 ~ 2022-12-31">
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
											<input type="number" class="form-control" name="carSalary"
												min="0" placeholder="단위 : 만원">
										</div>
									</div>
									<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
										<button type="submit" class="btn btn-primary" id="saveCareer">저장</button>
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
			<div class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/list">취소</a>
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/person/resume/certi">다음</a>
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

		// 경력사항 '신입' 라디오박스 체크하면 아래내용 hidden
		const radioBox = document.getElementById("radio-box");
		const hiddenContent = document.getElementById("hidden-content");

		let clickCount = 0;
		radioBox.addEventListener("click", function() {
			clickCount++;
			if (radioBox.checked) {
				hiddenContent.classList.add("hidden");
			} else {
				hiddenContent.classList.remove("hidden");
			}
			if (clickCount % 2 === 1) {
				radioBox.checked = false;
				hiddenContent.classList.remove("hidden");
			}
		});

		// 경력사항 입력확인
		const rCareer = document.querySelector('form[name="career"]');
		const saveCareer = document.querySelector('#saveCareer');

		function checkInputs(event) {
			let inputs = rCareer.querySelectorAll('input[type=text]');
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
		saveCareer.addEventListener('click', checkInputs);
		rCareer.addEventListener('submit', checkInputs);
		
		
		// 모달창 체크박스 초기화
		$(document).ready(function() {
			$('#viewCareer').on('hidden.bs.modal', function() {
				$('input[name=selectedCareer]').prop('checked', false);
			});
		});

		// 경력 입력폼 추가
		var forms = [ document.getElementsByName("career")[0] ];

		function addCar() {

			var lastForm = forms[0];
			var form = lastForm.cloneNode(true);
			document.getElementById("CarFormContainer").appendChild(form);
			forms.push(form);
		}


		// 입력폼 삭제
		function removeForm(form) {
			form.remove();
		}

		/* let checkBoxes = document
				.querySelectorAll('input[name="selectedCareer"]');
		for (let i = 0; i < checkBoxes.length; i++) {
			checkBoxes[i].addEventListener("click", function() {
				if (this.checked) {
					for (let j = 0; j < checkBoxes.length; j++) {
						if (i !== j) {
							checkBoxes[j].disabled = true;
						}
					}
				} else {
					for (let j = 0; j < checkBoxes.length; j++) {
						checkBoxes[j].disabled = false;
					}
				}
			});
		} */

		
		// 체크박스 데이터 가져오기
		// 체크된 경력사항 배열에 저장
/* 		let saveButton = document.getElementById("selectCarBtn");
		saveButton
				.addEventListener(
						"click",
						function() {
							let careerForm = document.forms["career"];
							// 체크된 경력 데이터를 가져와서 form에 추가
							let selectedCareerList = document
									.querySelectorAll('input[name="selectedCareer"]:checked');
							for (let i = 0; i < selectedCareerList.length; i++) {
								selectedIdx = selectedCareerList[i].parentNode.parentNode.rowIndex - 1;
								otherCheckBoxList = document
										.querySelectorAll('input[name="selectedCareer"]');
								for (let j = 0; j < otherCheckBoxList.length; j++) {
									if (j !== selectedIdx) {
										otherCheckBoxList[j].disabled = true;
									}
								}
								let careerData = selectedCareerList[i].parentElement.parentElement
										.getElementsByTagName("td");
								careerForm.elements["carName"].value = careerData[1].textContent;
								careerForm.elements["carDate"].value = careerData[2].textContent;
								careerForm.elements["carPosition"].value = careerData[3].textContent;
								careerForm.elements["carDept"].value = careerData[4].textContent;
								careerForm.elements["carResp"].value = careerData[5].textContent;
								careerForm.elements["carSalary"].value = careerData[6].textContent;
							}
							
						}); */
						
						
						// 경력사항 불러오기 모달에서 불러오기 버튼 클릭 시 실행되는 함수
						function loadCareer() {
						  // 선택된 경력사항의 정보를 저장할 배열
						  var selectedCareer = [];

						  // 모든 경력사항 정보를 담은 tr 태그를 선택
						  var careerList = document.querySelectorAll('#viewCareer tbody tr');

						  // 선택된 경력사항 정보를 배열에 추가
						  for (var i = 0; i < careerList.length; i++) {
						    var checkbox = careerList[i].querySelector('input[name="selectedCareer"]');
						    if (checkbox.checked) {
						      var career = {
						        carName: careerList[i].querySelector('td:nth-child(2)').textContent,
						        carDate: careerList[i].querySelector('td:nth-child(3)').textContent,
						        carPosition: careerList[i].querySelector('td:nth-child(4)').textContent,
						        carDept: careerList[i].querySelector('td:nth-child(5)').textContent,
						        carResp: careerList[i].querySelector('td:nth-child(6)').textContent,
						        carSalary: careerList[i].querySelector('td:nth-child(7)').textContent
						      };
						      selectedCareer.push(career);
						    }
						  }

						  // 선택된 경력사항 정보를 담은 form 태그 생성
						  var form = document.createElement('form');
						  form.method = 'post';
						  form.action = 'career';

						  // 선택된 경력사항 정보를 form에 추가
						  for (var j = 0; j < selectedCareer.length; j++) {
						    var inputCarName = document.createElement('input');
						    inputCarName.type = 'hidden';
						    inputCarName.name = 'carName';
						    inputCarName.value = selectedCareer[j].carName;
						    form.appendChild(inputCarName);

						    var inputCarDate = document.createElement('input');
						    inputCarDate.type = 'hidden';
						    inputCarDate.name = 'carDate';
						    inputCarDate.value = selectedCareer[j].carDate;
						    form.appendChild(inputCarDate);

						    var inputCarPosition = document.createElement('input');
						    inputCarPosition.type = 'hidden';
						    inputCarPosition.name = 'carPosition';
						    inputCarPosition.value = selectedCareer[j].carPosition;
						    form.appendChild(inputCarPosition);

						    var inputCarDept = document.createElement('input');
						    inputCarDept.type = 'hidden';
						    inputCarDept.name = 'carDept';
						    inputCarDept.value = selectedCareer[j].carDept;
						    form.appendChild(inputCarDept);

						    var inputCarResp = document.createElement('input');
						    inputCarResp.type = 'hidden';
						    inputCarResp.name = 'carResp';
						    inputCarResp.value = selectedCareer[j].car

	</script>

</body>
</html>