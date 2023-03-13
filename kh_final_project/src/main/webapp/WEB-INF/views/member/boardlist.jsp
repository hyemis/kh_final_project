<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board-test</title>
</head>
<body>
	<c:forEach items="${blist }" var="board">
	<div>
	<span>게시글 번호 : </span>
	<span>${board.bNum }</span><br>
	<span>게시글 제목 : </span>
	<span>${board.bTitle }</span><br>
	<span>게시글 작성자 : </span>
	<span>${board.bWriter }</span><br>
	<span>게시글 내용  : </span>
	<span>${board.bContent }</span><br>
	<span>게시글 작성일자   : </span>
	<span>${board.bDate }</span><br>
	</div>
	<hr>
	</c:forEach>
</body>
</html>