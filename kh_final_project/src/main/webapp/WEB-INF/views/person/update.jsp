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
			 
		        <form class="col-6" name=updateForm action="update" method="post">
			        	<div class="m-4" style="text-align: center;"><h3>회원정보수정</h3></div>
			        	
				          <div class="row">
				          
				            <div class="mb-3">
				            <label for="userName"/>이름 </label>
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
				            <select class="form-select form-select-sm" aria-label=".form-select-sm example">
							  <option selected>3개월</option>
							  <option value="1">6개월</option>
							  <option value="2">1년</option>
							  <option value="3">5년</option>
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

	<style>
	
		$('.selectpicker').selectpicker({
	      style: 'btn-info',
	      size: 4
	  });
	  
	</style>
	
</body>
</html>