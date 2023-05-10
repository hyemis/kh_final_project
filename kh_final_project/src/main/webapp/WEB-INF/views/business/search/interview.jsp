<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>지원자 결과 관리</title>
<!-- cs -->
	<link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
	
	<link href="${pageContext.request.contextPath}/resources/css/recruit.insert.css" rel="stylesheet">
	
<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	<!-- ckeditor5 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>


	
</head>
<body>
<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- page section -->	
<section>
	<div class="container-fluid bg-white p-5">
		<h3>면접 메일 발송</h3>
		해당 지원자에게 보낼 면접 일정 관련 내용을 작성해주세요. 
		<form action="<%=request.getContextPath()%>/business/search/sendinterview" method="post" id="sendInterview" class="was-validated" onsubmit="return checkForm();">
			<input name="userId" value=" ${info.psUser }" >
			<input name="baNum" value=" ${info.baNum }" >
			<input name="sgNo" value=" ${info.sgNo }" >
			<input name="bsUser" value="${info.bsUser }"  >
			<div class="row pt-2">
				<div class="col-3 text-center">지원자명</div>
				<div class="col-8">
					<input type="text" class="form-control" name="userName" value="${info.userName }" readonly>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">지원자 이메일</div>
				<div class="col-8">
					<input type="text" class="form-control" name="userEmail" value="${info.userEmail }" readonly>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center ">면접 일정 제목</div>
				<div class="col-8">
					<input type="text" class="form-control" id="caTitleInput" name="caTitle" required>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">면접 날짜</div>
				<div class="col-8">
					<input type="date" class="form-control" id="dateStartInput" name="dateStart" required>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">면접 시간</div>
				<div class="col-8">
					<input type="time" class="form-control" id="interviewTimeInput" name="interviewTime" required>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">면접 장소</div>
				<div class="col-8">
					<input type="text" class="form-control" id="locationInput" name="location" required>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">메모</div>
				<div class="col-8">
					<input type="text" class="form-control" name="memo" style="height:100px; ">
				</div>
			</div>
			<div class="row pt-2">
				<div class="col-3 text-center">메일 제목 미리보기</div>
				<div class="col-8">
					<input type="text" class="form-control" id="outputTitle" name="resultTitle" required>
				</div>
			</div>	
			<div class="row pt-2">
				<div class="col-3 text-center">메일 내용 미리보기</div>
				<div class="col-8">
					<input type="text" class="form-control" id="output" name="resultContent" style="height:300px; "required>
				</div>
			</div>
			<a class="btn btn-outline-primary" data-bs-toggle="pill" onclick=" history.go(-1)">뒤로</a>
			<button type="submit" class="btn btn-primary">보내기</button>
		</form>
	</div>
</section>

	
<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
function checkFrom() {
	  // 빈칸 검사
	  var caTitleInput = document.getElementById("caTitleInput").value;
	  var dateStartInput = document.getElementById("dateStartInput").value;
	  var interviewTimeInput = document.getElementById("interviewTimeInput").value;
	  var locationInput = document.getElementById("locationInput").value;
	  var outputTitle = document.getElementById("outputTitle").value;
	  var output = document.getElementById("output").value;

	  
	  if (caTitleInput === "" ) {
	    alert("면접 일정 제목 입력해주세요");
	    return false;
	  }
	  if (dateStartInput === "" ) {
	    alert("빈칸이 있습니다. 비밀번호를 입력해주세요");
	    return false;
	  }
	  if (interviewTimeInput === "" ) {
	    alert("빈칸이 있습니다. 비밀번호를 입력해주세요");
	    return false;
	  }
	  if (locationInput === "" ) {
	    alert("빈칸이 있습니다. 비밀번호를 입력해주세요");
	    return false;
	  }
	  if (outputTitle === "" ) {
	    alert("빈칸이 있습니다. 비밀번호를 입력해주세요");
	    return false;
	  }
	  if (output === "" ) {
	    alert("빈칸이 있습니다. 비밀번호를 입력해주세요");
	    return false;
	  }

	

	  // 모든 검사를 통과한 경우, 폼 제출
	  return true;
	}

</script>	
<script>
  const interviewTimeInput = document.getElementById('interviewTimeInput');
  const caTitleInput = document.getElementById('caTitleInput');
  const dateStartInput = document.getElementById('dateStartInput');
  const locationInput = document.getElementById('locationInput');
  const outputTitle = document.getElementById('outputTitle');
  const output = document.getElementById('output');

  function updateOutput() {
    const interviewTimeValue = interviewTimeInput.value;
    const caTitleValue = caTitleInput.value;
    const dateStartValue = dateStartInput.value;
    const locationValue = locationInput.value;
    
    outputTitle.value = `제목 ${caTitleValue}`
    output.value = ` 귀사에 지원해 주셔서 감사합니다.\n 아래와 같이 면접일정을 안내드립니다.\n면접일: ${dateStartValue}\n면접 시간: ${interviewTimeValue}\n면접장소: ${locationValue}`;
    				
  }

  interviewTimeInput.addEventListener('change', updateOutput);
  caTitleInput.addEventListener('change', updateOutput);
  dateStartInput.addEventListener('change', updateOutput);
  locationInput.addEventListener('change', updateOutput);
</script>

<script>
  const sendInterview = document.getElementById('sendInterview');

  sendInterview.addEventListener('keypress', (event) => {
    if (event.key === 'Enter') {
      event.preventDefault(); 
    }
  });
</script>


</body>
</html>
