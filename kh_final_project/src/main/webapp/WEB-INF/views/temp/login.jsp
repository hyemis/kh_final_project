<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>


</head>
<body>
	<h1>로그인페이지</h1>
	<hr>
	<form action="${pageContext.request.contextPath}/login" method="post">
		<input type="text" name="userId" placeholder="Username"/><br>
		<input type="password" name="userPw" placeholder="Password"/><br>
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
	    	<font color="red">
		        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
		        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
	    	</font>
		</c:if>
		<button type="submit">로그인</button>	
	</form>
</body>
</html>