<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 회원탈퇴</title>
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
	
</head>
<body>
	

	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	
	<!-- haeder  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<br>
	<div class="container-sm">	
		
		<div class="grid gap-3 border border-primary">
			 <div class="row justify-content-center">
			 
		        <form class="col-6" name=deleteForm action="deletepw" method="post" onsubmit="return checkAll()">
			        	<div class="m-4" style="text-align: center"><h3>회원 탈퇴</h3></div>
			        	<p style="text-align: center">
			        	정말로 회원탈퇴를 하시겠습니까?<br>
			        	 아래 창에 비밀번호를 입력해주세요.<br>
			        	 
			        	
				            <div class="mb-3">
				          	  <label for="userId">아이디 </label>
				          	  <input value="${PsUserDto.userId}" class="form-control" type="text" name="userId" readonly="readonly" >
				            </div>
				             
				      			            
				            <div class="mb-3">
				              <label for="userPw">비밀번호</label>
				              <input type="password" class="form-control" name="userPw">
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
				            
				            <div class="mb-3">
				              <label for="userPw2">비밀번호 확인</label>
				              <input type="password" class="form-control" name="userPw2">
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
						          
				
						
				         <div class="d-grid m-1 mt-4 mb-4">
						  <button class="btn btn-primary" type="submit">회원탈퇴 완료</button>
						</div>

				</form>
		    </div>
		</div>
	</div>
	
	
	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


	<script>
	
	
		function checkAll() {
			if (!checkPassword(deleteForm.userPw.value, deleteForm.userPw2.value)) {
	            return false;
	     	} 
	       		return true;
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
		
	     //비밀번호와 비밀번호 확인이 맞지 않다면..
	     if (userPw != userPw2) {
	         alert("두 비밀번호가 맞지 않습니다.");
	         deleteForm.userPw.value = "";
	         deleteForm.userPw2.value = "";
	         deleteForm.userPw2.focus();
	         return false;
	     }
		return true;
		
		}
		
		
		// alret
		var msg = "${msg}";
		if(msg) {
			alert(msg);
		}
	
		</script>
	</body>
</html>