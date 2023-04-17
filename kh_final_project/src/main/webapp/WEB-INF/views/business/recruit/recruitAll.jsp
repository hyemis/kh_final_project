<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <!-- css file link part start -->
	    <!-- Favicon -->
	    <link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
	    <!-- Google Web Fonts -->
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
	    
	    <!-- Icon Font Stylesheet -->
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
	    <!-- Libraries Stylesheet -->
	    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	
	    <!-- Customized Bootstrap Stylesheet -->
	    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Template Stylesheet -->
	    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
	    <!-- css file link part end -->
	    
	    <title>채용공고메인</title>
	    
	    <meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <meta content="" name="keywords">
	    <meta content="" name="description">
	    
	    <!-- js part start -->
	    <!-- JavaScript Libraries -->
	    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	    
	    <!-- Template Javascript -->
	    <script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	    <!-- Custom Javascript -->
	    <script src="${pageContext.request.contextPath}/resources/js/admin.account.js"></script>
	    <!-- js part end -->
	</head>
	<body>
	
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		
		<div class="container-xxl bg-white p-0">
     
    	<!-- 현재 페이지 확인 -->
		<c:set var="pageNumber" value="${empty pidto.pnum ? 1 : pidto.pnum }" />
		
		<div class="container-xl px-5">
			<h3 class="my-5"><a href="${pageContext.request.contextPath}/business/recruit/recruitAll?pnum=${pidto.pnum}&search=${pidto.search}">채용 공고 목록</a></h3>
		 	
		 	<form action="" method="get" class="row g-2 mb-4">
			 	<div class="col-6">
			 		<input type="text" class="form-control" name="search" placeholder="검색어를 입력해 주세요.">
			 	</div>
			 	<div class="col-auto">
			 		<button class="btn btn-primary" type="submit">검색</button>
			 	</div>
		 	</form>
		 	<table class="table">
		 		<thead>
		 			<tr>
		 				<th scope="col">회사이름</th>
		 				<th scope="col">작성자</th>
		 				<th scope="col">제목</th>
		 				<th scope="col">마감일</th>
		 				<th scope="col">승인확인</th>
		 			</tr>
		 		</thead>
		 		<tbody>
		 			<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="3">미승인 된 공고가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- Paging 에서 getPage()로 해당 페이지에 맞는 게시글 리스트 가져오기 -->
							<c:forEach items="${list.getPage() }" var="list" varStatus="i">
								<tr>
									<td>${list.companyName }</td>
									<td>${list.userId}</td>
									<td><a class="" href="${pageContext.request.contextPath}/business/recruit/view?id=${list.raNum}&pnum=${pnum }&search=${search}">${list.raTitle }</a></td>
									<td> ${list.closeDate }까지</td>
									<td class="text-center"><p>
										<c:choose>
											<c:when test="${list.raAdmission == 'N'}">
												미승인
											</c:when>
											<c:when test="${list.raAdmission == 'P'}">
												게시안함
											</c:when>
											<c:otherwise>
												게시함
											</c:otherwise>
										</c:choose>
									</p></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		 		</tbody>
		 	</table>
		 	
		 	
		 	<!-- 페이지네이션  -->
		 	<ul class = "pagination text-center justify-content-center">
				<c:choose>
					<c:when test="${list.prevPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">prev</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/business/main?pnum=${list.prevPage }&search=${search}">prev</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="pNum" items="${list.pageList }">
					<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${pageContext.request.contextPath}/admin/business/main?pnum=${pNum}&search=${search}">${pNum }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${list.nextPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/business/main?pnum=${list.nextPage }&search=${search}">next</a></li>
					</c:otherwise>
				</c:choose>					
			</ul>
			
			<!-- 위치 나중에 수정 -->
			<div class="container-xl p-5 d-flex justify-content-end" >
				<a href="main" class="btn btn-dark">메인으로</a>
			</div>
			
		 </div>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

		
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		
	</body>
</html>