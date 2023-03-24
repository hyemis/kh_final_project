<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
		<div class="container-xxl">	
		
		<h1>회사소개</h1>
		
	
		   <div class="row">
	            <div class="col-md-3 col-sm-4 border border-secondary">
	                <div class="list-group">
	                    <a href="#" class="list-group-item list-group-item-action">내용</a>
	                    <a href="#" class="list-group-item list-group-item-action">내용</a>
	                    <a href="#" class="list-group-item list-group-item-action">내용</a>
	                </div>
	            </div>
	            <div class="col-9  border border-secondary">
	                <div class="border border-secondary">
		                <h1>회사소개</h1>
		                <button class="text-end" type="button"
		                href="<%=request.getContextPath()%>business/myinfo/infowrite">소개글 작성</button>
		                <p>소개 해주세요.</p>
	           	 	</div>
	           	 	<div class="border border-secondary">
		                <h1>뉴스레터</h1>
		                <p>소개 해주세요.</p>
	           	 	</div>
	           	 	<div class="border border-secondary">
		                <h1>Q&A</h1>
		                <p>소개 해주세요.</p>
	           	 	</div>
	            </div>
        	</div>
        	
	 	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>