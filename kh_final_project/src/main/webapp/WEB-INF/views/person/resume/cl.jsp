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
<script src="//cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>




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

.deleteCl {
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
							<h3 class="mb-3">자기소개서</h3>
						</div>
						<!-- 모달 버튼 -->
						<div class="col-auto">
							<button type="button" class="btn btn-outline-dark m-2 btn-sm"
								data-bs-toggle="modal" data-bs-target="#viewCl">저장된 정보
								불러오기</button>
						</div>
					</div>
					<div>
						<!-- 모달 창 -->
						<div class="modal fade" id="viewCl" tabindex="-1" role="dialog"
							aria-labelledby="uploadModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="uploadModalLabel">자기소개서 불러오기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p>불러올 자기소개서를 체크하세요.</p>
										<p>작성하신 자기소개서와 자기소개서 파일은 이력서에서 확인하실 수 있습니다.</p>
										<div class="table-responsive">
											<table class="table table-striped table-bordered">
												<thead>
													<tr>
														<th>선택</th>
														<th>파일</th>
														<th>성장과정</th>
														<th>지원동기</th>
														<th>장단점</th>
														<th>입사 후 포부</th>
													</tr>
												</thead>
												<tbody id="clList">
													<c:forEach var="coverList" items="${clList}">
														<tr>
															<td><input type="checkbox" name="selectedCl"
																onclick="checkOnly(this)" /></td>
															<td>${coverList.clFile}</td>
															<td>${coverList.clGrowth}</td>
															<td>${coverList.clMotive}</td>
															<td>${coverList.clAdv}</td>
															<td>${coverList.clAsp}</td>
															<td><input type="hidden" name="clNo"
																value="${coverList.clNo}" required>
																<button type="button"
																	class="btn btn-outline-dark deleteCl">삭제</button></td>

														</tr>
													</c:forEach>
												</tbody>
											</table>

											<div id="selectedClList"></div>
											<button type="button" data-bs-dismiss="modal"
												class="btn btn-primary mx-auto d-block" id="selectClBtn">불러오기
											</button>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="clContainer">
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

							<div
								class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
								<a class="btn btn-primary"
									href="${pageContext.request.contextPath}/person/resume/list">취소</a>
								<a class="btn btn-primary"
									href="${pageContext.request.contextPath}/person/resume/list">다음</a>
							</div>
						</div>
					</div>
				</div>
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

	// ck editor, 글자 수 체크 
	var textareas = document.querySelectorAll('textarea');
	for (var i = 0; i < textareas.length; i++) {
		CKEDITOR.replace(textareas[i].id, {
			  language: 'ko',
			  toolbar: []
			});

	  const textarea = CKEDITOR.instances[textareas[i].id];
	  const charCount = textarea.element.$.parentNode.nextElementSibling;

	  textarea.on('change', () => {
	    const text = textarea.getData().replace(/(<([^>]+)>)/gi, '');
	    const count = text.trim().length;
	    charCount.textContent = '글자 수 (공백제외) ' + count + ' 자';
	  });
	}
	
	// 모달창 체크박스 초기화
	$(document).ready(function() {
		$('#viewCl').on('hidden.bs.modal', function() {
			// 선택된 이력서 목록 초기화
		    $('#selectedClList').empty();
		    // 선택된 이력서 체크박스 초기화
		    $('input[name=selectedCl]').prop('checked', false);
		});
	});
	
	// 체크박스 하나만 체크 
	function checkOnly(checkbox) {
		var checkboxes = document
				.querySelectorAll('#clList input[type="checkbox"]');
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i] !== checkbox && checkboxes[i].checked) {
				checkboxes[i].checked = false;
			}
		}
	}
	
	// 모달창에 체크한 이력서 순서대로 표시
	$(document).ready(function() {
 	$('input[name="selectedCl"]').change(function() {
    // 선택된 체크박스를 담을 배열을 초기화
    var selectedCls = [];

    // 체크된 체크박스의 값 가져오기
    $('input[name="selectedCl"]:checked').each(function(index) {

    	var cl = {
    	clFile: $(this).closest('tr').find('td:eq(1)').text(),
    	clGrowth: $(this).closest('tr').find('td:eq(2)').text(),
    	clMotive: $(this).closest('tr').find('td:eq(3)').text(),
    	clAdv: $(this).closest('tr').find('td:eq(4)').text(),
    	clAsp: $(this).closest('tr').find('td:eq(5)').text(), 
    
    	clNumber: index + 1 // 선택된 체크박스가 배열에서 몇 번째인지를 이용해 번호 매기기
      };

      // 배열에 추가
      selectedCls.push(cl);
   	 });

    // 선택된 값을 테이블 형태로 출력
    var html = '<table class="table">';
    html += '<thead><th>파일</th><th>성장과정</th><th>지원동기</th><th>성격의 장/단점</th><th>입사 후 포부</th></tr></thead>';
    html += '<tbody>';

    for (var i = 0; i < selectedCls.length; i++) {
      html += '<tr>';
      html += '<td>' + selectedCls[i].clFile + '</td>';
      html += '<td>' + selectedCls[i].clGrowth + '</td>';
      html += '<td>' + selectedCls[i].clMotive + '</td>';
      html += '<td>' + selectedCls[i].clAdv + '</td>';
      html += '<td>' + selectedCls[i].clAsp + '</td>';
      html += '</tr>';
    }

    html += '</tbody></table>';

	    $('#selectedClList').html(html);
	  });
	});
	
	

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
					alert("최종 이력서 등록이 완료되었습니다.");
					
					location.href = "/job/person/resume/list";
				} else {
					alert("자기소개서 등록에 실패했습니다.");
				}
			}
		})
	}
	
	document.getElementById('selectClBtn').addEventListener('click', function() {
		  // 체크된 체크박스의 clNo 값을 가져옴
		  var checkedBoxes = document.querySelectorAll('#clList input[type="checkbox"]:checked');
		  var clNoList = [];
		  var clNo;

		  for (var i = 0; i < checkedBoxes.length; i++) {
		    clNo = checkedBoxes[i].parentNode.parentNode.querySelector('input[name="clNo"]').value;
		    clNoList.push(clNo);
		  }

		  // clNo ajax 로 보내서 끼인 테이블 insert 
		  $.ajax({
		    type: 'POST',
		    url: '${pageContext.request.contextPath}/person/resume/insertInfoCl',
		    data: { clNo: parseInt(clNo) },
		    success: function(result) {
		      if(result > 0) {
		        // 데이터베이스 삽입 작업이 성공한 경우에만 새 페이지 열기
		        window.open('/job/person/resume/detail/' + encodeURIComponent(clNoList.join(','))); 

		        // alert안떠... 
		        alert('작성 중인 이력서에 자기소개서가 등록되었습니다.');
		        location.reload();        
		      } else {
		        alert('작성 중인 이력서에 자기소개서 등록에 실패했습니다.');
		      }
		    }
		  });
		});



	// 자기소개서 삭제 
	$('.deleteCl').click(function() {
	var clNo = $(this).prev('input[name="clNo"]').val();

	  $.ajax({
	    type: 'POST',
	    url: 'deleteCl',
	    data: { clNo: clNo },
	    success: function(result) {
	      if(result > 0) {
	        alert('해당 자기소개서가 삭제되었습니다.');
	        location.reload();
	      } else {
	        alert('해당 자기소개서가 삭제에 실패했습니다.');
	      }
	    }
	  });
	});

	</script>
</body>
</html>
