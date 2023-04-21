<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<header>

	<!-- Navbar Start -->
	<div class="container-fluid nav-bar ">
		<nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
			<a href="${pageContext.request.contextPath}/person/main"
				class="navbar-brand d-flex align-items-center text-center">
				<div class="icon p-2 me-2">
					<img class="img-fluid" src="${pageContext.request.contextPath}/resources/template/makaan/img/icon-deal.png" alt="Icon" style="width: 30px; height: 30px;">
				</div>
				<h1 class="m-0 text-primary">JOB-A</h1>
			</a>
			<!-- 좌측 메뉴 -->
			<div class="container-fluid ms-auto">
				<a class="nav-link me-3" href="#">menu</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav">
						<a class="nav-link me-3"href="${pageContext.request.contextPath}/person/recruit/info">채용정보</a> 
						<a class="nav-link me-3" href="#">인재 검색</a> 
						<a class="nav-link me-3" href="#">커뮤니티</a>
					</div>
				</div>
			</div>

			<!-- 우측메뉴 -->
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto">
					<!-- 메뉴 구분 -->
					<a href="${pageContext.request.contextPath}/"
						class="nav-item nav-link active">Home</a>

					<!-- 개인 / 기업 -->
					<sec:authorize access="hasRole('ROLE_P')">
						<div>
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.username" var="user_id" />
								<a class="nav-item nav-link active"
									href="${pageContext.request.contextPath}/person/mypage?userId=${user_id}"
									id="user_id" style="text-decoration: none">${user_id }</a>
							</sec:authorize>
						</div>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle m-1"
								data-bs-toggle="dropdown">개인서비스</a>
							<div class="dropdown-menu rounded-0 ">
								<a
									href="${pageContext.request.contextPath}/person/main"
									class="dropdown-item">MY 홈</a> <a
									href="${pageContext.request.contextPath}/person/resume/list"
									class="dropdown-item">이력서 관리</a> <a href="property-agent.html"
									class="dropdown-item">입사지원 현황</a> <a href="property-agent.html"
									class="dropdown-item">스크랩한 채용공고</a> <a
									href="property-agent.html" class="dropdown-item">관심기업 정보</a>
								<hr class="dropdown-divider">
								<a
									href="${pageContext.request.contextPath}/person/mypage"
									class="dropdown-item" class="dropdown-item">회원정보 관리</a>
							</div>
						</div>
					</sec:authorize>

					<sec:authorize access="hasRole('ROLE_B')">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">기업서비스</a>
							<div class="dropdown-menu rounded-0 m-0">
								<a href="testimonial.html" class="dropdown-item">기업 홈</a> <a
									href="404.html" class="dropdown-item">공고/등록 관리</a> <a
									href="404.html" class="dropdown-item">지원자 관리</a> <a
									href="404.html" class="dropdown-item">인재 관리</a> <a
									href="404.html" class="dropdown-item">기업 소개</a>
								<hr class="dropdown-divider">
								<a href="404.html" class="dropdown-item">기업회원 정보</a>
							</div>
						</div>
					</sec:authorize>
				</div>

				<!-- 로그인 / 회원가입 / 로그아웃 -->
				<div class="nav-item nav-link active">
					<sec:authorize access="isAnonymous()">
						<div class="collapse navbar-collapse">
							<a class="nav-link me-2"
								href="${pageContext.request.contextPath}/person/login">login</a>
							<a class="nav-link me-2"
								href="${pageContext.request.contextPath}/person/signUp">signUp</a>
						</div>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<div class="logouttest">
							<form action="/job/logout" method="post">
								<button class="btn nav-link" type="submit"
									style="text-decoration: none">logout</button>
							</form>
						</div>
					</sec:authorize>

				</div>
			</div>
		</nav>
	</div>
	<div class="container-fluid header p-5" style="height: 150px;"></div>
	<!-- Navbar End -->

</header>