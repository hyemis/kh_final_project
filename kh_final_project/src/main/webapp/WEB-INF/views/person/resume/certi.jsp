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
						<div>
							<!-- 모달 창 -->
							<div class="modal fade" id="viewCerti" tabindex="-1"
								role="dialog" aria-labelledby="uploadModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg"
									role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="uploadModalLabel">경력사항 불러오기</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<p>불러올 자격증을 체크하세요.</p>
											<div class="table-responsive">
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>선택</th>
															<th>자격증명</th>
															<th>발행처</th>
															<th>취득일자</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="certiList" items="${certi}">
															<tr>
																<td><input type="checkbox" name="selectedCerti" /></td>
																<td>${certiList.certiName}</td>
																<td>${certiList.certiPub}</td>
																<td>${certiList.certiDate}</td>
																<td><input type="hidden" name="certiNo"
																	value="${certiList.certiNo}" required>
																	<button type="button"
																		class="btn btn-outline-dark deleteCerti">삭제</button></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>

												<div id="selectedCertiList"></div>
												<button type="button" data-bs-dismiss="modal"
													class="btn btn-primary mx-auto d-block" id="selectCertiBtn"
													data-carNo="${certiList.certiNo}">불러오기</button>
											</div>

										</div>
									</div>
								</div>
							</div>
							<hr>
							<button class="btn btn-primary" onclick="addCerti()">새 정보추가</button>
							<br>

						</div>

						<div>
							<div id="CertiFormContainer">
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
		const rCerti = document.querySelector('form[name="certi"]');
		const saveCerti = document.querySelector('#saveCerti');
		
		function checkInputs(event) {
			let inputs = rCerti.querySelectorAll('input[type=text]');
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
		
		// 모달창 체크박스 초기화
		$(document).ready(function() {
			$('#viewCerti').on('hidden.bs.modal', function() {
				$('input[name=selectedCerti]').prop('checked', false);
			});
		});
		
		// 경력 입력폼 추가
		var forms = [ document.getElementsByName("certi")[0] ];

		function addCerti() {
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
		let saveButton = document.getElementById("selectCertiBtn");
						
						saveButton.addEventListener("click", function() {
							
						  // 체크된 경력 데이터를 가져와서 form에 추가
						  let selectedCertiList = document.querySelectorAll('input[name="selectedCerti"]:checked');
						    
						  let newFormHTML =	`
							  <form name="certi" action="certi" method="post">
							  <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
								<button type="button" class="btn btn-outline-dark" id="deleteInfo">
								  <i class="fa fa-minus"></i>
								</button>
								</div>
								<div class="row mb-3">
									<label for="certiNewName" class="col-sm-2 col-form-label">자격증명</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="certiNewName">
									</div>
								</div>
								<div class="row mb-3">
									<label for="certiNewPub" class="col-sm-2 col-form-label">자격증발행처</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="certiNewPub">
									</div>
								</div>
								<div class="row mb-3">
									<label for="certiNewDate" class="col-sm-2 col-form-label">자격증취득일자</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="certiNewDate">
									</div>
								</div>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
								<button type="button" id="update" class="btn btn-primary">수정</button>
								</div>
								<hr>
							</form>
						    `;
						    
						   let newForm = null;
						    
						for (let i = 0; i < selectedCertiList.length; i++) {
						  newForm = document.createElement("form");
						  let formContainer = document.getElementById("CertiFormContainer");
						  newForm.id = "certi-form-"+i; // 각각의 폼에 대해 고유한 id 값 부여
						  newForm.innerHTML = newFormHTML;
						  formContainer.appendChild(newForm);
						
						  // 기존 form 뒤에 새로운 form 추가
						  let certiData = selectedCertiList[i].closest("tr").getElementsByTagName("td");
						  newForm.elements["certiNewName"].value = certiData[1].textContent;
						  newForm.elements["certiNewPub"].value = certiData[2].textContent;
						  newForm.elements["certiNewDate"].value = certiData[3].textContent;
						
						  // - 버튼
						 let deleteBtn = newForm.querySelector("#deleteInfo");
							deleteBtn.addEventListener("click", function() {
							  const formToRemove = this.closest("form");
							  const certiNoInput = formToRemove.querySelector("input[name='certiNo']");
							  const certiNo = certiNoInput ? certiNoInput.value : null;
							
							  // certiNo 값을 가져온 후 삭제
							  formContainer.removeChild(formToRemove);
						    
							  $.ajax({
							    type: 'POST',
							    url: 'deleteInfoCerti',
							    data: { certiNo: certiNo },
							    success: function(result) {
							      if(result > 0) {
							        alert('작성 중인 이력서에서 해당 자격증 정보가 삭제되었습니다.');
							      } else {
							        alert('작성 중인 이력서에서 해당 자격증 정보 삭제에 실패했습니다.');
							      }
							    }
							  });
						    
						    
						  });
						  
						  // 수정 버튼 
						  let updateBtn = newForm.querySelector("#update");
						  updateBtn.addEventListener("click", function() {
						    const certiNewName = newForm.elements["certiNewName"].value;
						    const certiNewPub = newForm.elements["certiNewPub"].value;
						    const certiNewDate = newForm.elements["certiNewDate"].value;
						    
						    const data = {
						      certiNo: certiNo,
						      certiNewName: certiNewName,
						      certiNewPub: certiNewPub,
						      certiNewDate: certiNewDate
						    };

						    $.ajax({
						      type: "POST",
						      url: 'updateCerti',
						      data: data,
						      success: function(result) {
						        if(result > 0) {
						          alert('해당 자격증이 수정되었습니다.');
						          location.reload();
						        } else {
						          alert('해당 자격증 수정에 실패했습니다.');
						        }
						      }
						    });
						  });
						  
						  

						}
						
						 // 정보불러오기 버튼 시 끼인 테이블 insert 
						var certiNo = $("input[name='certiNo']").val();
						$.ajax({
						    type: 'POST',
						    url: 'insertInfoCerti',
						    data: { certiNo: certiNo },
						    success: function(result) {
						      if(result > 0) {
						        alert('작성 중인 이력서에서 해당 자격증 정보가 입력되었습니다.');
						      } else {
						        alert('작성 중인 이력서에서 해당 자격증 입력에 실패했습니다. ');
						      }
						    }
						  }); 
						
						


						});
						
						// 모달창에 체크한 이력서 순서대로 표시
						$(document).ready(function() {
					 	$('input[name="selectedCerti"]').change(function() {
					    // 선택된 체크박스를 담을 배열을 초기화
					    var selectedCerties = [];
					
					    // 체크된 체크박스의 값 가져오기
					    $('input[name="selectedCerti"]:checked').each(function(index) {
					
					    	var certi = {
					    	certiName: $(this).closest('tr').find('td:eq(1)').text(),
					    	certiPub: $(this).closest('tr').find('td:eq(2)').text(),
					        certiDate: $(this).closest('tr').find('td:eq(3)').text(),
					    
					        certiNumber: index + 1 // 선택된 체크박스가 배열에서 몇 번째인지를 이용해 번호 매기기
					      };
					
					      // 배열에 추가
					      selectedCerties.push(certi);
					   	 });
					
					    // 선택된 값을 테이블 형태로 출력
					    var html = '<table class="table">';
					    html += '<thead><tr><th>순서</th><th>자격증명</th><th>자격증발행처</th><th>자격증취득일자</th></tr></thead>';
					    html += '<tbody>';
					
					    for (var i = 0; i < selectedCerties.length; i++) {
					      html += '<tr>';
					      html += '<td>' + selectedCerties[i].certiNumber + '</td>';
					      html += '<td>' + selectedCerties[i].certiName + '</td>';
					      html += '<td>' + selectedCerties[i].certiPub + '</td>';
					      html += '<td>' + selectedCerties[i].certiDate + '</td>';
					      html += '</tr>';
					    }
					
					    html += '</tbody></table>';
					
						    $('#selectedCertiList').html(html);
						  });
						});
						
						// 모달창 닫으면 초기화
						$('#viewCerti').on('hidden.bs.modal', function () {
						    $('#selectedCertiList').html('');
						    $('input[name="selectedCerti"]').prop('checked', false);
						});
						
						
					
						
						// 자격증 삭제 
						$('.deleteCerti').click(function() {
						var certiNo = $(this).prev('input[name="certiNo"]').val();
				
						  $.ajax({
						    type: 'POST',
						    url: 'deleteCerti',
						    data: { certiNo: certiNo },
						    success: function(result) {
						      if(result > 0) {
						        alert('해당 자격증이 삭제되었습니다. 이전에 이미 작성한 이력서에 포함된 자격증은 삭제되지 않습니다.');
						        location.reload();
						      } else {
						        alert('해당 자격증 삭제에 실패했습니다.');
						      }
						    }
						  });
						});
						
		
	</script>

</body>
</html>