<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- Navbar Start -->
        <div class="container-fluid nav-bar bg-transparent">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
                <a href="${pageContext.request.contextPath}/admin/main" class="navbar-brand d-flex align-items-center text-center">
                    <div class="icon p-2 me-2">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/template/makaan/img/icon-deal.png" alt="Icon" style="width: 30px; height: 30px;">
                    </div>
                    <h1 class="m-0 text-primary">ADMIN PAGE</h1>
                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">게시글</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="${pageContext.request.contextPath}/admin/banner" class="dropdown-item">배너 관리</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">채용 공고 관리</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="${pageContext.request.contextPath}/admin/business/main" class="dropdown-item">채용 공고 관리</a>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/account/usercheck" class="nav-item nav-link">내 계정 관리</a>
                        <a href="${pageContext.request.contextPath}/admin/category/main" class="nav-item nav-link">카테고리관리</a>
						<sec:authorize access="hasRole('ROLE_AM')">
                        	<a href="${pageContext.request.contextPath}/admin/account/manage" class="nav-item nav-link">관리자 계정 관리</a>
						</sec:authorize>
						<div class="logouttest mt-3 text-lg-end text-center">
							<form action="/job/logout" method="post">
							<button class="btn btn-dark border-0 w-15 py-2" type="submit">로그 아웃</button>
							</form>
						</div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Navbar End -->