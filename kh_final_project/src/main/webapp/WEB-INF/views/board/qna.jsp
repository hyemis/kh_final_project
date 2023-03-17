<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>게시판 메인</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
		<div class="container-sm">	
		
		<h1>Q&A</h1>
		
	
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
		                <h1>Q&A</h1>
		                <p>질문 목록</p>
	           	 	</div>
	            </div>
        	</div>
		
	 </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>