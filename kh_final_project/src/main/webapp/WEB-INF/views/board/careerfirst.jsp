<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
		<div class="container-sm">	
		<h1>신입방</h1>
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
		                <h1>신입방</h1>
		               <div class="border border-secondary">내용</div>
		               <div class="border border-secondary">내용</div>
	           	 	</div>
	            </div>
        	</div>
		 </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>