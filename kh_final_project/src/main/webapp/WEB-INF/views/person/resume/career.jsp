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

#deleteCareer {
	width: 60px;
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
															<th></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="careerList" items="${career}">
															<tr>
																<td><input type="checkbox" name="selectedCareer"/></td>
																<td>${careerList.carDate}</td>
																<td>${careerList.carName}</td>
																<td>${careerList.carPosition}</td>
																<td>${careerList.carDept}</td>
																<td>${careerList.carResp}</td>
																<td>${careerList.carSalary}</td>
																<td>
																<input type="hidden" name="carNo"
																	value="${careerList.carNo}" required>
																	<button type="button"
																		class="btn btn-outline-dark deleteCareer"
																		>삭제</button></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												
												<div id="selectedCareerList"></div>
												
												<button type="button" data-bs-dismiss="modal"
													class="btn btn-primary mx-auto d-block" id="selectCarBtn" data-carNo="${careerList.carNo}">불러오기</button>
											</div>

										</div>
									</div>
								</div>
							</div>

							<input type="radio" id="radio-box" name="radio-group"> <label
								for="radio-box">경력없음(신입)</label><br>
							<hr>
							<button class="btn btn-primary" onclick="addCar()">새정보추가</button>
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
			var originForm = forms[0];
			var form = originForm.cloneNode(true);
			originForm.parentNode.insertBefore(form, originForm.nextSibling);
			forms.push(form);
		}

		// 입력폼 삭제
		function removeForm(form) {
			form.remove();
		}
		
		// 모달창에서 정보 불러와서 출력하기
		let saveButton = document.getElementById("selectCarBtn");
						
						saveButton.addEventListener("click", function() {
						  // 체크된 경력 데이터를 가져와서 form에 추가
						  let selectedCareerList = document.querySelectorAll('input[name="selectedCareer"]:checked');
						    
						  let newFormHTML =	`
						  <form>
								<div class="row mb-3">
									<label for="carName" class="col-sm-2 col-form-label">회사명</label>
									<div class="col-sm-10">
									
										<input type="text" class="form-control" name="carNewName">
									</div>
								</div>

								<div class="row mb-3">
									<label for="carDate" class="col-sm-2 col-form-label">재직기간</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="carNewDate"
											>
									</div>
								</div>
								<div class="row mb-3">
									<label for="carPosition" class="col-sm-2 col-form-label">직급/직책</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="carNewPosition" >
									</div>
								</div>
								<div class="row mb-3">
									<label for="carDept" class="col-sm-2 col-form-label">근무부서</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="carNewDept" >
									</div>
								</div>
								<div class="row mb-3">
									<label for="carResp" class="col-sm-2 col-form-label">담당업무</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="carNewResp">
									</div>
								</div>
								<div class="row mb-3">
									<label for="carSalary" class="col-sm-2 col-form-label">연봉</label>
									<div class="col-sm-10">
										<input type="number" class="form-control" name="carNewSalary"
											>
									</div>
								</div>
								<hr>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
									<button type="submit" class="btn btn-primary">수정</button>
									
								</div>
							</form>
						    `;
						    
						      for (let i = 0; i < selectedCareerList.length; i++) {
						          let newForm = document.createElement("form");
						          let formContainer = document.getElementById("CarFormContainer");
						          newForm.innerHTML = newFormHTML;
						          formContainer.appendChild(newForm);
						    
						     // 기존 form 뒤에 새로운 form 추가

						    let carData = selectedCareerList[i].closest("tr").getElementsByTagName("td");
						    newForm.elements["carNewName"].value = carData[1].textContent;
						    newForm.elements["carNewDate"].value = carData[2].textContent;
						    newForm.elements["carNewPosition"].value = carData[3].textContent;
						    newForm.elements["carNewDept"].value = carData[4].textContent;
						    newForm.elements["carNewResp"].value = carData[5].textContent;
						    newForm.elements["carNewSalary"].value = carData[6].textContent;
						    
						  }

						});
						
						
						// 경력사항 삭제 
	$('.deleteCareer').click(function() {
		var carNo = $(this).prev('input[name="carNo"]').val();

  $.ajax({
    type: 'POST',
    url: 'deleteCareer',
    data: { carNo: carNo },
    success: function(result) {
      if(result > 0) {
        alert('해당 경력사항이 삭제되었습니다. 이전에 이미 작성한 이력서에 포함된 경력사항은 삭제되지 않습니다.');
        location.reload();
      } else {
        alert('해당 경력사항 삭제에 실패했습니다.');
      }
    }
  });
});
						
						
		// 모달창에 체크한 이력서 순서대로 표시
		$(document).ready(function() {
	 	$('input[name="selectedCareer"]').change(function() {
	    // 선택된 체크박스를 담을 배열을 초기화
	    var selectedCareers = [];
	
	    // 체크된 체크박스의 값 가져오기
	    $('input[name="selectedCareer"]:checked').each(function(index) {
	
	    	var career = {
	        carDate: $(this).closest('tr').find('td:eq(1)').text(),
	        carName: $(this).closest('tr').find('td:eq(2)').text(),
	        carPosition: $(this).closest('tr').find('td:eq(3)').text(),
	        carDept: $(this).closest('tr').find('td:eq(4)').text(),
	        carResp: $(this).closest('tr').find('td:eq(5)').text(),
	        carSalary: $(this).closest('tr').find('td:eq(6)').text(),
	        carNumber: index + 1 // 선택된 체크박스가 배열에서 몇 번째인지를 이용해 번호 매기기
	      };
	
	      // 배열에 추가
	      selectedCareers.push(career);
	   	 });
	
	    // 선택된 값을 테이블 형태로 출력
	    var html = '<table class="table">';
	    html += '<thead><tr><th>순서</th><th>재직기간</th><th>회사명</th><th>직급/직책</th><th>근무부서</th><th>담당업무</th><th>연봉</th></tr></thead>';
	    html += '<tbody>';
	
	    for (var i = 0; i < selectedCareers.length; i++) {
	      html += '<tr>';
	      html += '<td>' + selectedCareers[i].carNumber + '</td>';
	      html += '<td>' + selectedCareers[i].carDate + '</td>';
	      html += '<td>' + selectedCareers[i].carName + '</td>';
	      html += '<td>' + selectedCareers[i].carPosition + '</td>';
	      html += '<td>' + selectedCareers[i].carDept + '</td>';
	      html += '<td>' + selectedCareers[i].carResp + '</td>';
	      html += '<td>' + selectedCareers[i].carSalary + '</td>';
	      html += '</tr>';
	    }
	
	    html += '</tbody></table>';
	
		    $('#selectedCareerList').html(html);
		  });
		});
	
	
		// 모달창 닫으면 초기화
		$('#viewCareer').on('hidden.bs.modal', function () {
		    $('#selectedCareerList').html('');
		    $('input[name="selectedCareer"]').prop('checked', false);
		});





	</script>

</body>
</html>