<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플 jsp</title>
</head>
<body>
	<!-- haeder : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
		
		<div class="grid gap-3 border border-dark-subtle">
			<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	v
		  	<div class="p-2 g-col-6 border border-secondary">공간</div>
		  	v
		  	
		  	v
		  	
		  	
		</div>
	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>