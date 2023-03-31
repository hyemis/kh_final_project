<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 아이디 비밀번호 찾기</title>
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
	<link href="${pageContext.request.contextPath}/resources/css/person.userId.css" rel="stylesheet">
	
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
		        		<div class="row m-3 text-center">
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
			       		
		       			
		       			
						<form id="personal-email-form" class="hidden" method="post" action="personal_login.jsp">
						    <label for="personal-id">ID:</label>
						    <input type="text" id="personal-id" name="id"><br>
						    <label for="personal-pw">Password:</label>
						    <input type="password" id="personal-pw" name="pw"><br>
						    <label for="personal-email">EMAIL:</label>
						    <input type="text" id="personal-email" name="email"><br>
						    <input type="submit" value="Login">
						</form>
						
						<form id="personal-phone-form" class="hidden" method="post" action="personal_login.jsp">
						    <label for="personal-id">ID:</label>
						    <input type="text" id="personal-id" name="id"><br>
						    <label for="personal-pw">Password:</label>
						    <input type="password" id="personal-pw" name="pw"><br>
						    <label for="personal-phone">PHONE:</label>
						    <input type="text" id="personal-phone" name="phone"><br>
						    <input type="submit" value="Login">
						</form>
						 
						 <form id="corporate-form" class="hidden" method="post" action="corporate_login.jsp">
						 	기업회원
						    <label for="corporate-id">ID:</label>
						    <input type="text" id="corporate-id" name="id"><br>
						    <label for="corporate-pw">Password:</label>
						    <input type="password" id="corporate-pw" name="pw"><br>
						    <input type="submit" value="Login">
						 </form>
					 
		        	</div>
		        	
		       		
		        	
			     <!--    <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
					  <label class="form-check-label" for="inlineRadio1">이메일</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">휴대폰</label>
					</div>
					
			        <input class="form-control" type="text" placeholder="이름">
			        <input class="form-control" type="text" placeholder="생년월일(19990101)">
			        <input class="form-control" type="text" placeholder="이메일(job-a@joba.com)">
			        
				    <div class="d-grid gap-2">
				   	 <button type="submit" class="btn btn-primary">Submit</button> -->
				   	</div>
		        </form>
		        
		        
		    </div>
		</div>
	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
	 function toggleForm(type) {
	      var personalEmailForm = document.getElementById('personal-email-form');
	      var personalPhoneForm = document.getElementById('personal-phone-form');
	      var corporateForm = document.getElementById('corporate-form');
	      var findType = document.getElementById('findType');
	      
	      if (type === 'personal') {
	    	    findType.classList.remove('hidden');
	    	    if(findType.value === 'email') {
	    	        personalEmailForm.classList.remove('hidden');
	    	        personalPhoneForm.classList.add('hidden');
	    	    } else if(findType.value === 'phone') {
	    	        personalPhoneForm.classList.remove('hidden');
	    	        personalEmailForm.classList.add('hidden');
	    	    }
	    	} else if(type === 'corporate'){
	    	    personalForm.classList.add('hidden');
	    	    corporateForm.classList.remove('hidden');
	    	}
	      
	    
	      
	      
	      
	    } 
	
    /*  function toggleForm(type) {
	      var personalForm = document.getElementById('personal-form');
	      var corporateForm = document.getElementById('corporate-form');
	      var findType = document.getElementById('findType');
	      
	      if (type === 'personal') {
	        findType.classList.remove('hidden');
	        personalForm.classList.remove('hidden');
	        corporateForm.classList.add('hidden');
	      } else if (type === 'corporate') {
	    	findType.classList.remove('hidden');
	        personalForm.classList.add('hidden');
	        corporateForm.classList.remove('hidden');
	      }
	    }  */
 	 </script>
</body>
</html>