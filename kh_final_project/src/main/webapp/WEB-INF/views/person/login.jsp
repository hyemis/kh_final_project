<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 로그인</title>
	<!-- css -->
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
	<link href="${pageContext.request.contextPath}/resources/css/person.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/person.kakao.css" rel="stylesheet">
	
	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	
	
	<style>
	#links a {
	  font-size: 14px;
	}
	
	</style>
</head>
<body>
	
	<!-- haeder  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm d-flex justify-content-center">	
		<div class="grid gap-3 w-75 my-5 border border-primary ">
			 <div class="row justify-content-center">
			 
		        <form class="col-6" name=singUpForm action="${pageContext.request.contextPath}/login" method="post">
			        	<div class="m-4 text-center"><h3>JOB-A 로그인</h3></div>
				          <div class="row">
				            <div class="mb-3">
				              <label for="userId">아이디</label>
				              <input type="text" class="form-control" name="userId" id="userId"required>
				              <div class="invalid-feedback">아이디를  입력해주세요.</div>
				            </div>
				            <div class="mb-3">
				              <label for="userPw">비밀번호</label>
				              <input type="password" class="form-control" name="userPw" required>
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
				            <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						    	<font color="red">
							        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
							        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
						    	</font>
							</c:if>
					        <div class="d-grid">
							  <button class="btn btn-primary" type="submit">로그인</button>
							</div>
							<div class="d-grid mb-2">
							 <a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=77dfb2057fb10018f5dbf8b933cc96dd&redirect_uri=http://localhost:8090/job/person/login&response_type=code">
								    <img src="${pageContext.request.contextPath}/resources/kakao_login_medium_narrow.png">
								    <div class="kakao_txt">카카오톡으로<br> 간편로그인 </div>
							  </a>
							</div>
							<div class="d-grid">
								<div class="row" id="links"> 
									<a href="${pageContext.request.contextPath}/person/findid" class="col-4"><p>아이디 찾기</p></a>
									<a href="${pageContext.request.contextPath}/person/findpw" class="col-4 text-center">비밀번호 찾기</a>
									<a href="${pageContext.request.contextPath}/person/signUp" class="col-4 text-end">회원 가입</a>
								</div>
							</div>
				</form> 
    
    	
				
		    </div>
		</div>
	</div>
	</section>
	<!-- footer -->
 	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 
	
	<script type="text/javascript">
		// a 태그 클릭 시 
		 function handleClick(event) {
   		 event.preventDefault(); // 기본 동작 중지
   		 const url = event.target.href; // a 태그의 href 속성값 가져오기
   		 window.location.href = url; // 새로운 URL로 페이지 이동
  			
		}
	
		 // a 태그에 클릭 이벤트 리스너 추가
		 const kakaoLoginBtn = document.querySelector('#kakao-login-btn');
		 kakaoLoginBtn.addEventListener('click', handleClick);
	
	
		// 카카오 로그인 실패 
		var msg = "${msg}";
		if(msg) {
			alert(msg);
		}
	</script>
</body>
</html>