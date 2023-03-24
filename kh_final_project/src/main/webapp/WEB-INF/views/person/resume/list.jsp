<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 관리 </title>
</head>
<body>
	<!-- haeder : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
          <div class="text-start mx-5 mt-5">
            <h1>이력서 관리</h1>
          </div>
		  <div class="row">
			<!-- 좌측 프로필 영역 -->
			<div class="col-3">
				<div class="container-xxl py-5">
					<div class="container">
						<div class="bg-light p-3">
							<div class="bg-white rounded p-4 row" style="border: 1px dashed rgba(0, 185, 142, .3)">
								<img class="object-fit-sm-contain border" src="https://dummyimage.com/150x200/d6d6d6/000000&text=150x200" alt="">
							</div>
							<div class="">
									<span>이름 : </span>
									<span>${userinfo.userName }</span><br>
									<span>전화번호 : </span>
									<span>${userinfo.userPhone }</span><br>
									<span>생년월일 : </span>
									<span>${userinfo.userBirth }</span><br>
									<span>이메일 : </span>
									<span>${userinfo.userEmail }</span><br>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 우측 조회 영역 -->
			<div class="col-9">
				<div class="container-xxl py-5">
					<div class="container">
						<div class="bg-light rounded p-3">
							<div class="bg-white rounded p-4"
								style="border: 1px dashed rgba(0, 185, 142, .3)">
								<div class="row g-5 align-items-center">
									<div class="mb-4">
										<h1 class="mb-3">이력서</h1>
										<p>이력서를 생성한 뒤에 이력서를 작성해주세요.</p>
										
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>