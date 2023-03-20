<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인회원</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<c:forEach items="${plist }" var="person">
	<div>
	<span>아이디 : </span>
	<span>${person.userId }</span><br>
	<span>전화번호 : </span>
	<span>${person.userPhone }</span><br>
	<span>생년월일 : </span>
	<span>${person.userBirth }</span><br>
	<span>이름 : </span>
	<span>${person.userName }</span><br>
	</div>
	<hr>
	</c:forEach>
	
	<div class="logouttest">
		<form action="/job/logout" method="post">
		<button class="btn btn-dark border-0 w-100 py-3" type="submit">로그 아웃</button>
		</form>
	</div>
	
</body>
</html>