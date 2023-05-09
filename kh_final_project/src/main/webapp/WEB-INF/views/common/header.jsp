<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<header>

	<!-- Navbar Start -->
	<div class="container-fluid nav-bar ">
		<nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
			<a href="${pageContext.request.contextPath}/"
				class="navbar-brand d-flex align-items-center text-center">
				<div class="icon p-2 me-2">
					<img class="img-fluid"
						src="${pageContext.request.contextPath}/resources/template/makaan/img/icon-deal.png"
						alt="Icon" style="width: 30px; height: 30px;">
				</div>
				<h1 class="m-0 text-primary">JOB-A</h1>
			</a>
			<sec:authorize access="isAnonymous()">
					<div class="navbar-nav ms-1 me-auto">
						<a class="nav-link me-3" href="${pageContext.request.contextPath}/person/recruit/info">채용정보</a>
						<a class="nav-link me-3" href="${pageContext.request.contextPath}/board/company/companyinfo">회사정보</a>
						<a class="nav-link me-3" href="${pageContext.request.contextPath}/board/main">커뮤니티</a>
					</div>
			</sec:authorize>		
			<!-- 개인 -->
			<sec:authorize access="hasRole('ROLE_P')">
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<!-- 좌측 메뉴 -->
					<div class="navbar-nav ms-1 me-auto">
						<a class="nav-link me-3" href="${pageContext.request.contextPath}/person/recruit/info">채용정보</a>
						<a class="nav-link me-3" href="${pageContext.request.contextPath}/board/company/companyinfo">회사정보</a>
						<a class="nav-link me-3" href="${pageContext.request.contextPath}/board/main">커뮤니티</a>
					</div>
					<!-- 우측메뉴 -->
					<div class="navbar-nav">


						<a href="${pageContext.request.contextPath}/person/main"
							class="nav-item nav-link active">Home</a>
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
								<a href="${pageContext.request.contextPath}/person/main" class="dropdown-item">MY 홈</a> 
								<a href="${pageContext.request.contextPath}/person/resume/list" class="dropdown-item">이력서 관리</a> 
								<a href="${pageContext.request.contextPath}/person/applylist" class="dropdown-item">입사지원 현황</a> 
								<a href="${pageContext.request.contextPath}/person/scrapjob" class="dropdown-item">스크랩한 채용공고</a> 
								<a href="${pageContext.request.contextPath}/person/scrapcompany" class="dropdown-item">관심기업 정보</a>
								<hr class="dropdown-divider">
								<a href="${pageContext.request.contextPath}/person/mypage"
									class="dropdown-item" class="dropdown-item">회원정보 관리</a>
							</div>
						</div>
					</div>
				</div>
			</sec:authorize>

			<!-- 기업 -->
			<sec:authorize access="hasRole('ROLE_B')">
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<!-- 좌측 메뉴 -->
					<div class="navbar-nav ms-1 me-auto">
						<div class="nav-item dropdown">
							<a href="${pageContext.request.contextPath}/business/applicant" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">MENU</a>
							<div class="dropdown-menu rounded-0 m-0">
								<a href="${pageContext.request.contextPath}/person/recruit/info" class="dropdown-item">채용정보</a>
								<a href="${pageContext.request.contextPath}/board/company" class="dropdown-item">회사정보</a>
								<a href="${pageContext.request.contextPath}/board/main" class="dropdown-item">커뮤니티</a>
							</div>
						</div>
					</div>
					<!-- 우측메뉴 -->
					<div class="navbar-nav">
						<div class="nav-item dropdown">
							<a
								href="${pageContext.request.contextPath}/business/recruit/main"
								class="nav-link dropdown-toggle" data-bs-toggle="dropdown">공고
								관리</a>
							<div class="dropdown-menu rounded-0 m-0">
								<a href="${pageContext.request.contextPath}/business/recruit/main"
									class="dropdown-item">채용공고메인</a> 
								<a href="${pageContext.request.contextPath}/business/recruit/insert"
									class="dropdown-item">채용공고등록</a> 
								<a href="${pageContext.request.contextPath}/business/recruit/recruitAll"
									class="dropdown-item">등록된 공고 관리</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a href="${pageContext.request.contextPath}/business/applicant"
								class="nav-link dropdown-toggle" data-bs-toggle="dropdown">지원자
								관리</a>
							<div class="dropdown-menu rounded-0 m-0">
								<a href="${pageContext.request.contextPath}/business/applicant/view"
									class="dropdown-item">지원자 관리</a> 
								<a href="${pageContext.request.contextPath}/business/applicant/passview"
									class="dropdown-item">합격자 관리</a> 
								<a href="${pageContext.request.contextPath}/business/applicant/interview"
									class="dropdown-item">면접 일정 관리</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a href="${pageContext.request.contextPath}/business/search"
								class="nav-link dropdown-toggle" data-bs-toggle="dropdown">인재
								관리</a>
							<div class="dropdown-menu rounded-0 m-0">
								<a href="${pageContext.request.contextPath}/business/search/suggest"
									class="dropdown-item">맞춤형 인재 추천</a> <a
									href="${pageContext.request.contextPath}/business/search"
									class="dropdown-item">면접 제의</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a href="${pageContext.request.contextPath}/business/aboutus"
								class="nav-link dropdown-toggle" data-bs-toggle="dropdown">내기업
								관리</a>
							<div class="dropdown-menu rounded-0 m-0">
								<a href="${pageContext.request.contextPath}/business/"
									class="dropdown-item">회사소개</a> <a
									href="${pageContext.request.contextPath}/business/aboutus/newsletter"
									class="dropdown-item">뉴스레터</a> <a
									href="${pageContext.request.contextPath}/business/"
									class="dropdown-item">Q&A</a>
							</div>
						</div>

						<a href="${pageContext.request.contextPath}/business/account/info"
							class="nav-item nav-link">내 계정</a> <a
							href="${pageContext.request.contextPath}/business/main"
							class="nav-item nav-link active">MAIN</a>

					</div>
				</div>
			</sec:authorize>
			<!-- 관리자 -->
			<sec:authorize access="hasAnyRole('ROLE_A', 'ROLE_AM')">
				<div class="collapse navbar-collapse">
					<a href="${pageContext.request.contextPath}/admin/main" class="nav-item nav-link">어드민으로</a>
				</div>
			</sec:authorize>

			<!-- 로그인 / 회원가입 / 로그아웃 -->
			<div class="nav-item nav-link active ms-auto">
				<sec:authorize access="isAnonymous()">
					<div class="collapse navbar-collapse">
						<a class="nav-link me-2" 
							href="${pageContext.request.contextPath}/person/signUp">signUp</a>
						<a class="nav-link me-2" 
							href="${pageContext.request.contextPath}/person/login">login</a>
					</div>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<div class="logouttest">
						<form action="/job/logout" method="post">
							<button class="btn btn-primary px-3 d-none d-lg-flex"
								type="submit" style="text-decoration: none">logout</button>
						</form>
					</div>
				</sec:authorize>
			</div>
		</nav>
	</div>
	<div class="container-fluid header p-5" style="height: 150px;"></div>
	<!-- Navbar End -->

</header>