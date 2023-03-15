<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>applyProcessList-test</title>
</head>
<body>
	[[${aplist }]]
	<c:forEach items="${aplist }" var="ap">
	<div>
	<span>지원절차번호 : </span>
	<span>${ap.apNum }</span><br>
	<span>step1 : </span>
	<span>${ap.step1}</span><br>
	<span>step2 : </span>
	<span>${ap.step2 }</span><br>
	<span>step3 : </span>
	<span>${ap.step3 }</span><br>
	<span>step4 : </span>
	<span>${ap.step4 }</span><br>
	<span>step5 : </span><br>
	<span>${ap.step5 }</span><br>
	</div>
	<hr>
	</c:forEach>
</body>
</html>