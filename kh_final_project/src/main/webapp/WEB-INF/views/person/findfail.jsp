<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 실패</title>
</head>
<body>
	<!-- haeder : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
		
		<div class="grid gap-3 border border-primary">
			 <div class="row justify-content-center">
		       <div class="col-6 border border-primary">
		        	<div>
		        		<span>아이디/ 비밀번호 찾기</span>
		        	</div>
		        	<div class="border border-primary mb-5">
			        	<p>입력하신 정보와 일치하는 아이디가 없습니다. </p>
			        	<p> 정확한 정보 확인 후 다시 입력하세요. </p>
		        	</div>
		        	<div class="d-grid gap-2 mb-3">
				   		<a class="btn btn-primary" href="<%=request.getContextPath()%>/person/idPw" role="button">정확한 정보 확인 후 다시 아이디 찾기</a>
				   	</div>
				   	<div class="d-grid gap-2 mb-3">
				   	 	<a class="btn btn-primary" href="<%=request.getContextPath()%>/person/signUp" role="button">아직 job-a 회원이 아니세요? 회원가입</a>
				   	</div>
		        </div>
		    </div>
		</div>
	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>