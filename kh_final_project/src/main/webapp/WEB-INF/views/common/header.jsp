<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<!-- Navbar Start -->
        <div class="container-fluid nav-bar bg-transparent">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
                <a href="index.html" class="navbar-brand d-flex align-items-center text-center">
                    <div class="icon p-2 me-2">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/template/makaan/img/icon-deal.png" alt="Icon" style="width: 30px; height: 30px;">
                    </div>
                    <h1 class="m-0 text-primary">JOB-A</h1>
                </a>
            </nav>
            
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
				  <div class="container-fluid">
				    <a class="nav-link me-3" href="#">menu</a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
				    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				      <div class="navbar-nav">
				        <a class="nav-link me-3" href="#">채용정보</a>
				        <a class="nav-link me-3" href="#">인재 검색</a>
				        <a class="nav-link me-3" href="#">커뮤니티</a>
				      </div>
				    </div>
				  </div>
				  
				  <div class="navbar-nav ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle me-3" data-bs-toggle="dropdown">개인서비스</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="property-list.html" class="dropdown-item">MY 홈</a>
                                <a href="property-type.html" class="dropdown-item">회원정보 관리</a>
                                <a href="property-agent.html" class="dropdown-item">이력서 관리</a>
                                <a href="property-agent.html" class="dropdown-item">입사지원 현황</a>
                                <a href="property-agent.html" class="dropdown-item">스크랩한 채용공고</a>
                                <a href="property-agent.html" class="dropdown-item">관심기업 정보</a>
                                <hr class="dropdown-divider">
                                <a href="property-agent.html" class="dropdown-item">회원정보 관리</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle me-3" data-bs-toggle="dropdown">기업서비스</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="testimonial.html" class="dropdown-item">기업 홈</a>
                                <a href="404.html" class="dropdown-item">공고/등록 관리</a>
                                <a href="404.html" class="dropdown-item">지원자 관리</a>
                                <a href="404.html" class="dropdown-item">인재 관리</a>
                                <a href="404.html" class="dropdown-item">기업 소개</a>
                                <hr class="dropdown-divider">
                                <a href="404.html" class="dropdown-item">기업회원 정보</a>
                            </div>
                        </div>
                    </div>
                    <a href="" class="btn btn-primary px-3 d-none d-lg-flex">login</a>
			</nav>
            
            
            
         
        </div>

</html>