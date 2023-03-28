<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 로그인</title>
</head>
<body>
	<!-- haeder : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
		
		<div class="grid gap-3 mt-2 border border-primary">
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
					        <div class="d-grid m-3">
							  <button class="btn btn-primary" type="submit">로그인</button>
							</div>
						</div>
				</form>
    
		    </div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>