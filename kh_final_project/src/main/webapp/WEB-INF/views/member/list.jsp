<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실행 확인</title>
</head>
<body>
	<c:forEach items="${mlist }" var="member">
	<div>
	<span>아이디 : </span>
	<span>${member.userId }</span><br>
	<span>비번 : </span>
	<span>${member.userPw }</span><br>
	<span>이름 : </span>
	<span>${member.name }</span><br>
	</div>
	<hr>
	</c:forEach>
	
</body>
</html>