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
<title>회사소개작성</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="container-xxl py-5">
		<h1 class="mb-3 text-primary">회사소개를 작성해 주세요</h1>
			
		<!-- 입력창 start -->
		<div class="container">
        	<div class="row">
        		<p>해당하는 태그를 클릭해주세요</p>
				<div class="col-2"><h3>태그</h3></div>
				<div class="col-10">
				<form action="" method="post" >
					   
				<input type="checkbox" name="item" value="신발>"신발
		
	
				</form>
				</div>
            </div>
		</div>
		<!-- 입력창 end-->
		
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script type="text/javascript">
	
	</script>
</body>



</html>