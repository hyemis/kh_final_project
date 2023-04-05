<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 회원정보 수정</title>
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

		$('.selectpicker').selectpicker({
	      style: 'btn-info',
	      size: 4
	  });
	  
	</style>
</head>
<body>

	
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<br>
	<div class="container-sm">	
		
		<div class="grid gap-3 border border-primary">
			 <div class="row justify-content-center">
			 
		        <form class="col-6" name=updateForm action="update" method="post" onsubmit="return checkAll()">
			        	<div class="m-4" style="text-align: center"><h3>회원정보수정</h3></div>
			        	
		
				          
				            <div class="mb-3">
				            <label for="userName">이름 </label>
				            <input value="${PsUserDto.userName}" class="form-control" type="text" name="userName" readonly="readonly" >
				            </div>
				            
				            <div class="mb-3">
				              <label for="userPw">새 비밀번호</label>
				              <input type="password" class="form-control" name="userPw" placeholder="8~16자리/ 영문 대소문자, 숫자 조합">
				              <div class="invalid-feedback">변경할 비밀번호를 입력해주세요.</div>
				            </div>
				            
				            <div class="mb-3">
				              <label for="userPw2">새 비밀번호 확인</label>
				              <input type="password" class="form-control" name="userPw2" placeholder="8~16자리/ 영문 대소문자, 숫자 조합">
				              <div class="invalid-feedback">변경할 비밀번호를 입력해주세요.</div>
				            </div>
						          
				          <div class="mb-3">
				            <label for="userPhone">휴대폰</label>
				            <input value="${PsUserDto.userPhone}" class="form-control" type="text" name="userPhone">
				            <div class="invalid-feedback">변경할 휴대폰번호를 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="userEmail">이메일</label>
				            <input value="${PsUserDto.userEmail}" class="form-control" type="text" name="userEmail">
				            <div class="invalid-feedback">변경할 이메일을 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="termsPeriod">개인정보유효기간</label>
				            <select name="termsPeriod" class="form-select form-select-sm" aria-label=".form-select-sm example">
							  <option value="3" selected>3개월</option>
							  <option value="6">6개월</option>
							  <option value="12">1년</option>
							  <option value="60">5년</option>
							</select>
				
				         <hr class="mb-4"> 
				          
				         <div class="d-grid m-3">
						  <button class="btn btn-primary" type="submit">회원정보 수정 완료</button>
						</div>
						
						</div>
				</form>
			       
				    
		    </div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


	
	<script>
	
	
		function checkAll() {
	        if (!checkPassword(updateForm.userPw.value, updateForm.userPw2.value)) {
	            return false;
	        } else if (!checkPhone(updateForm.userPhone.value)) {
	            return false;
	        } else if (!checkEmail(updateForm.userEmail.value)) {
	            return false;
	        } else if (!checkPeriod(updateForm.termsPeriod.value)) {
	            return false; 
	        return true;
	  	  }
		}
	
		
		
		// 공백 확인
		 function checkExistData(value, dataName) {
		        if (value == "") {
		            alert(dataName + " 입력해주세요!");
		            return false;
		        }
		        return true;
		    }
		
		
		// 비밀번호1, 비밀번호2 체크 
			function checkPassword(userPw, userPw2) {
	     //비밀번호가 입력되었는지 확인하기
	     if (!checkExistData(userPw, "비밀번호를"))
	         return false;
	     //비밀번호 확인이 입력되었는지 확인하기
	     if (!checkExistData(userPw2, "비밀번호 확인을"))
	         return false;
		
	     var password1RegExp = /^[a-zA-z0-9]{8,16}$/; //비밀번호 유효성 검사
	     if (!password1RegExp.test(userPw)) {
	         alert("비밀번호는 영문 대소문자와 숫자 8~16자리로 입력해야합니다!");
	         updateForm.userPw.value = "";
	         updateForm.userPw.focus();
	         return false;
	     }
	     //비밀번호와 비밀번호 확인이 맞지 않다면..
	     if (userPw != userPw2) {
	         alert("두 비밀번호가 맞지 않습니다.");
	         updateForm.userPw.value = "";
	         updateForm.userPw2.value = "";
	         updateForm.userPw2.focus();
	         return false;
	     }
		
		
		}
		
		
		// alret
		var msg = "${msg}";
		if(msg) {
			alert(msg);
		}
		
	
	
	
	
	</script>
</body>
</html>