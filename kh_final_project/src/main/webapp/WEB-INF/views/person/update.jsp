<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시** JOB-A 회원정보수정</title>
</head>
<body>
	<!-- header : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->

		
			<div id="pagetitle">
				<h2>회원정보관리</h2>
				<span>회원님의 개인정보를 관리하는 곳입니다.</span>
			</div>
			
			<div class="container-sm py-5">	
				<div class="grid gap-3 border border-dark-subtle">	
			
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">회원정보수정</h3>
							<button type="button" class="btn btn-outline-danger">바로가기</button>
							<div class="">
							<form id="frmInfo" method="get">
								<input name="id" value="${PsUserDto.userId }" type="text" readonly="readonly"><br>
								<input value="${PsUserDto.userPw }" type="password" readonly="readonly"><br>
								<input value="${PsUserDto.userName }"  type="text" readonly="readonly"><br>
								<input value="${PsUserDto.userEmail }" type="text" readonly="readonly"><br>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">이용현황</h3>
							<div class="">
								
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
			  <button class="btn btn-primary me-md-2" type="button">save</button>
			  <button class="btn btn-primary" type="button">cancle</button>
			</div>
			
			
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
<!--  
>
-->