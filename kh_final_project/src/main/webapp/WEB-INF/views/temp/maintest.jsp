<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${id}
	<sec:authorize access="isAnonymous()">
		권한 인증 ㄴㄴㄴㄴㄴㄴ
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
	
	${role}
	<form action="/logout">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>
	
	</sec:authorize>
	
	<hr>
	
	${role}
	<form action="/logout">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>
	
</body>
</html>