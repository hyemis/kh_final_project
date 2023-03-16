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
<title>회원가입 페이지</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
		<div class="container-sm">	
		
		<h1>회원가입</h1>
		<div class="border border-secondary">
			 <form class="row g-4"  action="" method="post">
			  <div class="col-md-6">
			    <label for="inputEmail4" class="form-label">Id</label>
			    <input type="text" class="form-control" name="id">
			  </div>
			  
			  <div class="col-md-6">
			    <label for="inputPassword4" class="form-label">Password</label>
			    <input type="password" class="form-control" name="passwd">
			  </div>
			  
			  <div class="col-6">
			  	 <button type="button" class="btn btn-outline-secondary btn-sm" id="dupId">Id Check</button>
			  	 <span></span>
			  </div>
			  
			  <div class="col-12">
			    <label for="inputAddress" class="form-label">Name</label>
			    <input type="text" class="form-control" name="name" placeholder="name">
			  </div>
			  
			  <div class="col-12">
			    <label for="inputAddress" class="form-label">Email</label>
			    <input type="text" class="form-control" name="email" placeholder="Email@gmail.com">
			  </div>
			  
			  <div class="col-md-6">
			    <label for="inputAddress2" class="form-label">Address</label>
			    <input type="text" class="form-control" name="address" placeholder="Apartment, studio, or floor">
			  </div>
			  
			  <div class="col-md-6">
			    <label for="inputCity" class="form-label">Phone</label>
			    <input type="text" class="form-control"  name="phone">
			  </div>
			  
			  <div class="col-12 d-grid gap-2 col-6 mx-auto">
			    <button type="submit" class="btn btn-outline-secondary enroll">Sign In</button>
			  </div>
			</form>
		</div>
		
	 </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>