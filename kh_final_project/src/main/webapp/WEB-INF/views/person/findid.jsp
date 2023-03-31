<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 아이디찾기</title>
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
	<link href="${pageContext.request.contextPath}/resources/css/person.css" rel="stylesheet">
	
	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	
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
	<div class="container-sm">	
		
		<div class="grid gap-3 border border-primary">
			 <div class="row justify-content-center">
		        	<div class="col-6 border border-primary">
		        		<div class="row mt-5 m-3 text-center">
			        	<h3>아이디 찾기</h3>
			       		</div>
			       		<hr>
			       		
			        	<div class="row" id="member">
			        	<button class="col-6 btn btn-outline-dark" onclick="toggleForm('personal')">Personal Member</button>
	  					<button class="col-6 btn btn-outline-dark" onclick="toggleForm('corporate')">Corporate Member</button>
			       		</div>
			       		
			       		<div class="row hidden" id="findType">
			        	<button class="col-6 btn btn-link" onclick="toggleForm('email')">email 로 찾기</button>
	  					<button class="col-6 btn btn-link" onclick="toggleForm('phone')">Phone 로 찾기</button>
			       		</div>
			       		
						<form id="personal-email-form" class="hidden m-5" method="post" action="">
						   <input class="form-control" type="text" id="personal-name" placeholder="이름">
			      		   <input class="form-control" type="text" id="personal-birth" placeholder="생년월일(19990101)">
			        	   <input class="form-control" type="text" id="personal-email" placeholder="이메일(job-a@joba.com)">
			        	   <div class="d-grid gap-2 col-6 mx-auto m-2">
							  <button class="btn btn-outline-dark" type="button" onclick="findIdEamil();">아이디 찾기</button>
							</div>
						</form>
						
						<form id="personal-phone-form" class="hidden m-5" method="post" action="">
						   <input class="form-control" type="text" placeholder="이름">
			      		   <input class="form-control" type="text" placeholder="생년월일(19990101)">
			        	   <input class="form-control" type="text" placeholder="'-' 빼고 숫자만 입력">
			        	   <div class="d-grid gap-2 col-6 mx-auto m-2">
							  <button class="btn btn-outline-dark" type="button" onclick="fn_findIdPhone(); return false;">아이디 찾기</button>
							</div>
						</form>
						 
						 <form id="corporate-form" class="hidden m-5" method="post" action="">
						 	기업회원
						    <label for="corporate-id">ID:</label>
						    <input type="text" id="corporate-id" name="id"><br>
						    <label for="corporate-pw">Password:</label>
						    <input type="password" id="corporate-pw" name="pw"><br>
						    <div class="d-grid gap-2 col-6 mx-auto m-2">
							  <button class="btn btn-outline-dark" type="button" onclick="fn_findIdCorporate(); return false;">아이디 찾기</button>
							</div>
						 </form>
		        	</div>
		        	
				 </div>
		        
		        
		    </div>
		</div>
	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
	// 토글
	 function toggleForm(type) {
	      var personalEmailForm = document.getElementById('personal-email-form');
	      var personalPhoneForm = document.getElementById('personal-phone-form');
	      var corporateForm = document.getElementById('corporate-form');
	      var findType = document.getElementById('findType');
	      
	         if (type === 'personal') {
		    	  corporateForm.classList.add('hidden');
		    	  findType.classList.remove('hidden');
	         } else if(type === 'email') {
	    		 personalEmailForm.classList.remove('hidden');
	    		 personalPhoneForm.classList.add('hidden');
	    		 corporateForm.classList.add('hidden');
	    	 } else if (type === 'phone') {
	    		 personalEmailForm.classList.add('hidden');
	    		 personalPhoneForm.classList.remove('hidden');
	    		 corporateForm.classList.add('hidden');
	    		 
	    	} else if(type === 'corporate'){
	    		personalEmailForm.classList.add('hidden');
	    		personalPhoneForm.classList.add('hidden');
	    	    corporateForm.classList.remove('hidden');
	    	}
	      
	    } 
	
	// email로 id 찾기
 	 function findIdEamil() {
		let formdata = new FormData();
		formdata.append("name", $('#personal-name').val());
		formdata.append("birth", $('#personal-birth').val());
		formdata.append("email", $('#personal-email').val());
		
		if(!name || !birth || !email) {
			alert("입력값을 모두 입력해주세요.");
			return;
		}
	
	
		$.ajax({
		url : "${pageContext.request.contextPath}/person/findid",
		type : "post",
		contentType: false, 
		processData: false,
		data: formdata, 
		sucess : function(result)
			if (result === 1) {
			alert("회원님의 아이디는" + "입니다.");
			location.href="/job/person/login";
		}	else {
			alert("입력하신 아이디는 job-a 에 등록된 아이디가 아닙니다. 회원가입 후 job-a 를 이용해주세요.");
			location.href="/job/person/signUp";
		}
		
		
		
		})
	} 
	
 	 </script>
</body>
</html>