<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
</head>
<body>
	<!-- haeder : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
		
		<div class="grid gap-3 border border-primary">
			 <div class="row justify-content-center">
			 
		        <form class="col-6" name=form action="" method="post" onsubmit="return checkAll()">
			        	<div class="m-4"><h3>JOB-A 회원가입</h3></div>
			        	
				          <div class="row">
				          
				            <div class="mb-3">
				              <label for="userId">아이디</label>
				              <input type="text" class="form-control" id="userId" placeholder="영문,숫자,'_' 사용가능" required>
				              <div class="invalid-feedback">아이디를  입력해주세요.</div>
				            </div>
				            
				            <div class="mb-3">
				              <label for="password1">비밀번호</label>
				              <input type="password" class="form-control" id="password1" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" required>
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
				
							<div class="mb-3">
				              <label for="password2">비밀번호재확인</label>
				              <input type="password" class="form-control" id="password2" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" required>
				              <div class="invalid-feedback">비밀번호를 입력해주세요. </div>
				            </div>
					
				          <div class="mb-3">
				            <label for="name">이름</label>
				            <input type="text" class="form-control" id="name" placeholder="이름 입력" required>
				            <div class="invalid-feedback">이름을 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="birth">생년월일</label>
				            <input type="text" class="form-control" id="birth" placeholder="YYYYMMDD" required>
				            <div class="invalid-feedback">생년월일을 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="phone">휴대폰</label>
				            <input type="text" class="form-control" id="phone" placeholder="'-' 빼고 숫자만 입력" required>
				            <div class="invalid-feedback">휴대폰번호를 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="email">이메일</label>
				            <input type="text" class="form-control" id="email" placeholder="email@joba.co.kr" required>
				            <div class="invalid-feedback">이메일을 입력해주세요.</div>
				          </div>
				
				          
				          <hr class="mb-4">
				          
				          <div class="custom-control custom-checkbox">
				            <input type="checkbox" class="custom-control-input" id="aggrement" required>
				            <label class="custom-control-label" for="aggrement">서비스 이용약관, 개인정보 취급방침을 확인하였고, 이에 동의합니다.</label>
				          </div>
				          
				         <div class="d-grid m-3">
						  <button class="btn btn-primary" type="submit">회원가입 완료</button>
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
		        if (!checkUserId(form.userId.value)) {
		            return false;
		        } else if (!checkPassword(form.userId.value, form.password1.value, form.password2.value)) {
		            return false;
		        } else if (!checkName(form.name.value)) {
		            return false;
		        } else if (!checkBirth(form.birth.value)) {
		            return false;
		        } else if (!checkPhone(form.phone.value)) {
		            return false;
		        } else if (!checkEmail(form.email.value)) {
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

		// 아이디 체크 
		 function checkUserId(id) {
		        //Id가 입력되었는지 확인하기
		        if (!checkExistData(id, "아이디를"))
		            return false;
		 
		        var idRegExp = /^[a-zA-z0-9]{4,20}$/; //아이디 유효성 검사
		        if (!idRegExp.test(id)) {
		            alert("아이디는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!");
		            form.userId.value = "";
		            form.userId.focus();
		            return false;
		        }
		        return true; //확인이 완료되었을 때
		    }

		// 비밀번호1, 비밀번호2 체크 
		function checkPassword(id, password1, password2) {
        //비밀번호가 입력되었는지 확인하기
        if (!checkExistData(password1, "비밀번호를"))
            return false;
        //비밀번호 확인이 입력되었는지 확인하기
        if (!checkExistData(password2, "비밀번호 확인을"))
            return false;
 
        var password1RegExp = /^[a-zA-z0-9]{8,16}$/; //비밀번호 유효성 검사
        if (!password1RegExp.test(password1)) {
            alert("비밀번호는 영문 대소문자와 숫자 8~16자리로 입력해야합니다!");
            form.password1.value = "";
            form.password1.focus();
            return false;
        }
        //비밀번호와 비밀번호 확인이 맞지 않다면..
        if (password1 != password2) {
            alert("두 비밀번호가 맞지 않습니다.");
            form.password1.value = "";
            form.password2.value = "";
            form.password2.focus();
            return false;
        }
 
        //아이디와 비밀번호가 같을 때..
        if (id == password1) {
            alert("아이디와 비밀번호는 같을 수 없습니다!");
            form.password1.value = "";
            form.password2.value = "";
            form.password2.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
   		} 
		
		// 이름 체크 
		function checkName(name) {
        if (!checkExistData(name, "이름을"))
            return false;
 
        var nameRegExp = /^[가-힣]{2,4}$/;
        if (!nameRegExp.test(name)) {
            alert("이름이 올바르지 않습니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
    	}
		
		// 생년월일 체크 
		function checkBirth() {
        var text = document.getElementById("birth");
        if (!checkExistData(text.value, "생년월일을")) {
            alert("생년월일을 입력해 주세요!");
            return false;
        } else
            return true;
    	}
		
		
		// 휴대폰번호 체크 
		function checkPhone() {
        var text = document.getElementById("phone");
        if (!checkExistData(text.value, "휴대폰번호를")) {
            alert("휴대폰번호를 입력해 주세요!");
            return false;
        } else
            return true;
    	}
		
		
		// 이메일 확인 
		function checkEmail(email) {
        //mail이 입력되었는지 확인하기
        if (!checkExistData(email, "이메일을"))
            return false;
 
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        if (!emailRegExp.test(email)) {
            alert("이메일 형식이 올바르지 않습니다!");
            form.email.value = "";
            form.email.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
   		}
			
	</script>



</body>
</html>