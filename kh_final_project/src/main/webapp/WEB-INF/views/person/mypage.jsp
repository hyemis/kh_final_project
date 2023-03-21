<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인회원 mypage</title>
</head>
<body>
	<!-- haeder : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm py-5">	
		<!-- 상단 네비게이션 영역 -->
		<div>
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-home-tab"
						data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
						role="tab" aria-controls="nav-home" aria-selected="true">회원정보 관리</button>
					<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
						data-bs-target="#nav-profile" type="button" role="tab"
						aria-controls="nav-profile" aria-selected="false">이력서 관리</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">입사지원 현황</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">스크랩한 채용공고</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">관심기업정보</button>
				</div>
			</nav>			
		</div>
		<div class="row">
			<!-- 좌측 프로필 영역 -->
			<div class="col-3">
				<div class="container-sm py-5">
					<div class="container">
						<div class="bg-light rounded p-3">
							<div class="bg-white rounded p-4"
								style="border: 1px dashed rgba(0, 185, 142, .3)">
								<div class="p-2 me-2">
								<!-- 유저프로필 -->
                      				  <img class="img-fluid" src="https://dummyimage.com/600x800/d6d6d6/000000&text=600x800" alt="">
                   			 	</div>
								<p>이름</p>
								<p>휴대폰</p>
								<p>이메일</p>
								<a href="" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>페이지이동</a> 
								<a href="" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>페이지이동</a> 
								<a href="" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>페이지이동</a> 
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
										<h1 class="mb-3">게시판 제목</h1>
										<p>Eirmod sed ipsum dolor sit rebum magna erat. Tempor
											lorem kasd vero ipsum sit sit diam justo sed vero dolor duo.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container-xxl py-5">
					<div class="container">
						<div class="bg-light rounded p-3">
							<div class="bg-white rounded p-4"
								style="border: 1px dashed rgba(0, 185, 142, .3)">
								<div class="row g-5 align-items-center">
									<div class="mb-4">
										<h1 class="mb-3">게시판 제목</h1>
										<p>Eirmod sed ipsum dolor sit rebum magna erat. Tempor
											lorem kasd vero ipsum sit sit diam justo sed vero dolor duo.</p>
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