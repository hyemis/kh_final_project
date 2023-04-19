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
					</div>
					 <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
								<button type="button" class="btn btn-outline-dark" id="deleteInfo">
								  <i class="fa fa-minus"></i>
								</button>
								</div>

					<!-- 성장과정 내용 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>성장과정</h4>
						</div>
						<div class="justify-content-center align-items-center mb-3">
							<textarea name="text" id="growth" class="form-control">${cl.clGrowth}</textarea>
						</div>
						<span class="d-flex justify-content-end"></span>
					</div>
					<!-- 지원동기 내용 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>지원동기</h4>
						</div>
						<div class="justify-content-center align-items-center">
							<textarea name="text" id="motive" class="form-control">${cl.clMotive}</textarea>
						</div>
						<span class="d-flex justify-content-end"></span>
					</div>
					<!-- 장단점 내용 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>성격의 장/단점</h4>
						</div>
						<div class="justify-content-center align-items-center">
							<textarea name="text" id="adv" class="form-control">${cl.clAdv}</textarea>
						</div>
						<span class="d-flex justify-content-end"></span>
					</div>
					<!-- 입사 후 포부 내용 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>입사 후 포부</h4>
						</div>
						<div class="justify-content-center align-items-center">
							<textarea name="text" id="asp" class="form-control">${cl.clAsp}</textarea>
						</div>
						<span class="d-flex justify-content-end"></span>
					</div>
					<!-- 파일 첨부 -->
					<div class="bg-gray p-4 mb-3">
						<div class="mb-3">
							<h4>자기소개서</h4>
						</div>
						<div class="justify-content-center align-items-center">
							<c:if test="${empty cl.clFile}">
								<span>파일없음</span>
							</c:if>
							<c:if test="${not empty cl.clFile}">
								<div class="row">
									<div class="input-group">
										<input type="text" class="form-control" id="uploadCl2"
											value="${cl.clFile}"> <span class="input-group-btn">
											<button type="button" id="deleteFile" class="btn btn-primary">기존
												파일 삭제</button>
										</span>
									</div>
								</div>
							</c:if>
							<form enctype="multipart/form-data">
								<input type="file" class="form-control" id="uploadCl"
									placeholder="자기소개서 첨부파일"> <br>
							</form>

							<br>
						</div>
					</div>

					<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
						<button type="button" id="update" class="btn btn-primary">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
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
	
	// 수정 버튼 
	let updateBtn = document.querySelector("#update");
	updateBtn.addEventListener("click", function() {
	  let formdata = new FormData();
	  formdata.append("No", parseInt(window.location.href.split('/').pop()));

	  const clFileInput = $("#uploadCl")[0];
	  if (clFileInput && clFileInput.files && clFileInput.files.length > 0) {
	    const clFile = clFileInput.files[0];
	    formdata.append("updateClFile", clFile);
	    formdata.append("curPath", ""); // 기존 경로는 없음
	  } else {
	    const uploadCl2Val = $('#uploadCl2').val();
	    if (uploadCl2Val !== null && uploadCl2Val !== '') {
	      formdata.append("updateClFile", uploadCl2Val);
	      formdata.append("curPath", curPath); // 기존 경로
	    }
	  }

	  formdata.append("growth", document.querySelector("#growth").value);
	  formdata.append("motive", document.querySelector("#motive").value);
	  formdata.append("adv", document.querySelector("#adv").value);
	  formdata.append("asp", document.querySelector("#asp").value);

	  $.ajax({
	    type: 'POST',
	    url: '${pageContext.request.contextPath}/person/resume/updateCl',
	    contentType: false,
	    processData: false,
	    data: formdata,
	    success: function(result) {
	      if (result > 0) {
	        alert('자기소개서가 수정되었습니다.');
	        location.reload();
	      } else {
	        alert('자기소개서 수정에 실패했습니다.');
	      }
	    }
	  });
	});

	
	// 기존 파일 삭제 버튼 
	$(document).on('click', '#deleteFile', function() {
    var fileUrl = $('#uploadCl2').val();
    $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/person/resume/deleteClFile',
        data: { fileUrl: fileUrl },
        success: function(result) {
  	      if(result > 0) {
  	        alert('기존에 작성했던 자기소개서 파일이 삭제되었습니다.');
  	        location.reload();
  	      } else {
  	        alert('기존에 작성했던 자기소개서 파일 삭제에 실패했습니다.');
  	      }
  	    }
    });
});
	
	
	// - 버튼
	let deleteBtn = document.querySelector("#deleteInfo");
		deleteBtn.addEventListener("click", function() {
		  const clNo = parseInt(window.location.href.split('/').pop());
		
		  $.ajax({
		    type: 'POST',
		    url: '${pageContext.request.contextPath}/person/resume/deleteInfoCl',
		    data: { clNo: clNo },
		    success: function(result) {
		      if(result > 0) {
		        alert('작성 중인 이력서에서 해당 자기소개서가 삭제되었습니다.');
		      } else {
		        alert('작성 중인 이력서에서 해당 자기소개서 삭제에 실패했습니다.');
		      }
		    }
		  });
	    
	    
	  });
			
		</script>
</body>
</html>