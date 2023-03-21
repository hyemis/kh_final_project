<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 페이지</title>
</head>
<body>
	<!-- haeder : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm py-5">	
		<div class="grid gap-3 border border-dark-subtle">
		
		 	<form name="resumeForm" action="wrtie" method="post"> 
			<div class="form-floating">
			  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
			  <label for="floatingTextarea">이력서 제목을 입력하세요.</label>
			</div>
						
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">기본 정보 </h3>
							<div class="row">
								<div class="col-2 border border-dark-subtle">                      				  
									<img class="object-fit-sm-contain border rounded" src="https://dummyimage.com/150x200/d6d6d6/000000&text=150x200" alt="">
								</div>
								<div class="col-10 border border-dark-subtle">
									<form id="frmInfo" method="get">
										<input name="userId" value="${PsUserDto.userId }" type="text" readonly="readonly"><br>
									</form>
								
								
								
								<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">학력사항</h3>
							<div class="">
								<div class="border border-dark-subtle">dd</div>
								<div class="border border-dark-subtle">dd</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">경력사항</h3>
							<div class="">
								<div class="border border-dark-subtle">dd</div>
								<div class="border border-dark-subtle">dd</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">자격증</h3>
							<div class="">
								<div class="border border-dark-subtle">dd</div>
								<div class="border border-dark-subtle">dd</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="bg-light rounded p-3">
				<div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<div class="row g-5 align-items-center">
						<div class="mb-4">
							<h3 class="mb-3">포트폴리오</h3>
							<div class="">
								<div class="border border-dark-subtle">dd</div>
								<div class="border border-dark-subtle">dd</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
			  <button class="btn btn-primary me-md-2" type="button">save</button>
			  <button class="btn btn-primary" type="button">cancle</button>
			</div>
			
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>