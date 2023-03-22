<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 회원정보 수정</title>
</head>
<body>
	<!-- header : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
		
		<div class="grid gap-3 border border-primary">
			 <div class="row justify-content-center">
			 
		        <form class="col-6" name=singUpForm action="signUp" method="post" onsubmit="return checkAll()">
			        	<div class="m-4"><h3>JOB-A 회원정보수정</h3></div>
			        	
				          <div class="row">
				          
				            <div class="mb-3">
				            <label for="userName"/>이름 </label>
				              <input type="text" class="form-control" name="userId" value="${PsUserDto.userId}" readonly="readonly">
				            </div>
				            
				            <div class="mb-3">
				              <label for="userPw">새 비밀번호</label>
				              <input type="password" class="form-control" name="userPw" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" required>
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
				            
				            <div class="mb-3">
				              <label for="userPw">새 비밀번호 확인</label>
				              <input type="password" class="form-control" name="userPw" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" required>
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
						          
				          <div class="mb-3">
				            <label for="userPhone">휴대폰</label>
				            <input type="text" class="form-control" name="userPhone" placeholder="'-' 빼고 숫자만 입력" required>
				            <div class="invalid-feedback">휴대폰번호를 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="userEmail">이메일</label>
				            <input type="text" class="form-control" name="userEmail" placeholder="email@joba.co.kr" required>
				            <div class="invalid-feedback">이메일을 입력해주세요.</div>
				          </div>
				
				          
				          <hr class="mb-4">
				          
				          <!-- <div class="custom-control custom-checkbox">
				            <input type="checkbox" class="custom-control-input" id="termsAct" required>
				            <label class="custom-control-label" for="termsAct">서비스 이용약관, 개인정보 취급방침을 확인하였고, 이에 동의합니다.</label>
				          </div> -->
				          
				         <div class="d-grid m-3">
						  <button class="btn btn-primary" type="submit">회원가입 완료</button>
						</div>
						
						</div>
				</form>
			       
				    
		    </div>
		</div>
	</div>
</body>
</html>