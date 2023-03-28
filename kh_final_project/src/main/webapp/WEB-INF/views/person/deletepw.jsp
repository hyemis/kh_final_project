<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 회원탈퇴</title>
</head>
<body>
	<!-- header : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<br>
	<div class="container-sm">	
		
		<div class="grid gap-3 border border-primary">
			 <div class="row justify-content-center">
			 
		        <form class="col-6" name=deleteForm action="deletepw" method="post" onsubmit="return checkAll()">
			        	<div class="m-4" style="text-align: center;"><h3>회원 탈퇴</h3></div>
			        	<p style="text-align: center">
			        	정말로 회원탈퇴를 하시겠습니까?<br>
			        	 아래 창에 비밀번호를 입력해주세요.<br>
			        	 
			        	 <!-- 
				            <div class="mb-3">
				          	  <label for="userId">아이디 </label>
				          	  <input value="${PsUserDto.userId}" class="form-control" type="text" name="userId" readonly="readonly" >
				            </div>
				             -->
				      			            
				            <div class="mb-3">
				              <label for="userPw">비밀번호</label>
				              <input type="password" class="form-control" name="userPw" placeholder="8~16자리/ 영문 대소문자, 숫자 조합">
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
				            
				            <div class="mb-3">
				              <label for="userPw2">비밀번호 확인</label>
				              <input type="password" class="form-control" name="userPw2" placeholder="8~16자리/ 영문 대소문자, 숫자 조합">
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
		
	     var password1RegExp = /^[a-zA-z0-9]{8,16}$/; //비밀번호 유효성 검사
	     if (!password1RegExp.test(userPw)) {
	         alert("비밀번호는 영문 대소문자와 숫자 8~16자리로 입력해야합니다!");
	         deleteForm.userPw.value = "";
	         deleteForm.userPw.focus();
	         return false;
	     }
	     //비밀번호와 비밀번호 확인이 맞지 않다면..
	     if (userPw != userPw2) {
	         alert("두 비밀번호가 맞지 않습니다.");
	         deleteForm.userPw.value = "";
	         deleteForm.userPw2.value = "";
	         deleteForm.userPw2.focus();
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