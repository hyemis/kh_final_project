<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- css file link part start -->
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
	<%-- ${pageContext.request.contextPath} --%>
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
    
    <title>계정 확인 </title>
    
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!-- js part start -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->
     
    	<jsp:include page="/WEB-INF/views/common/adheader.jsp" />
		
		 
		 <div class="container-lg mt-5 px-5">
			 <div class="text-center mx-auto mb-5">
			 	<h3>계정 정보 관리</h3>
			 	<p>${addto.userId}의 계정 입니다.</p>
			 	<p>${masage }</p>
			 </div>
		 	<form action="usercheck" method="post">
		 			<input type="hidden" class="form-control" id="userId" name="userId" value="${userId}" required>
		 			
		 			<div class="mb-3">
		              <label for="password">비밀번호</label>
		              <input type="password" class="form-control" id="password" name="userPw" required>
		              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
		            </div>
					<div class="mb-3">
		              <label for="passwordcheck">비밀번호재확인</label>
		              <input type="password" class="form-control" id="passwordcheck" required>
		              <div class="invalid-feedback">비밀번호를 입력해주세요. </div>
		            </div>

		 			<div class="mb-3">
			            <label for="name">이름</label>
			            <input type="text" class="form-control" id="name" name="userName" value="${addto.userName}" required>
			            <div class="invalid-feedback">이름을 입력해주세요.</div>
		          </div>
		          <div class="mb-3">
			            <label for="phone">휴대폰</label>
			            <input type="text" class="form-control" id="phone" name="userPhone" value="${addto.userPhone}" placeholder="'-' 빼고 숫자만 입력" required>
			            <div class="invalid-feedback">휴대폰번호를 입력해주세요.</div>
		          </div>
		          <div class="mb-3">
			            <label for="email">이메일</label>
			            <input type="text" class="form-control" id="email" name="userEmail" value="${addto.userEmail}" required>
			            <div class="invalid-feedback">이메일을 입력해주세요.</div>
		          </div>			
		          <div class="mb-3">
			            <label for="email">관리자 권한</label>
			            <select class="form-select" id="role" name="userRole" required>
			            	<option value="ROLE_A"  ${addto.userRole == "ROLE_A" ? 'selected' : ""}>일반관리자</option>
			            	<option value="ROLE_AM" ${addto.userRole == "ROLE_AM" ? 'selected' : ""}>마스터관리자</option>
			            </select>
	         	 </div>	
	         	<div class="mx-5 mt-6 text-lg-end text-center">
		 			  <button type="submit" class="btn btn-dark border-0 w-15 py-2">비밀번호 확인</button>
		 		</div>
		 	</form>
		 </div>

		<%-- <%@ include file="../common/footer.jsp" %> --%>
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

</body>

</html>