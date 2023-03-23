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
    
    <title>관리자 계정 생성</title>
    
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
    	
    	<jsp:include page="/WEB-INF/views/common/adheader.jsp" />
		
		 <div class="container-xl mt-5 px-5 min-vh-100 d-flex justify-content-center">
		 	<form class="col-6" action="create" method="post" name="Account" onsubmit="return checkAll()">
				<div class="mb-3">
			         <label for="userId">아이디</label>
			         <input type="text" class="form-control" id="userId" name="userId" value="${admdto.userId}" required>
				  <div class="invalid-feedback">아이디를  입력해주세요.</div>
				 	 <p style="color: red;">${masage }</p>
		          </div>
				  <div class="mb-3">
			           <label for="password">비밀번호</label>
			           <input type="password" class="form-control" id="userPw" name="userPw" required>
			           <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				  </div>
				  <div class="mb-3">
			           <label for="passwordcheck">비밀번호재확인</label>
			           <input type="password" class="form-control" id="passwordcheck" name="passwordcheck" required>
			           <div class="invalid-feedback">비밀번호를 입력해주세요. </div>
				  </div>
				  <div class="mb-3">
			         <label for="name">이름</label>
			         <input type="text" class="form-control" id="userName" name="userName" value="${admdto.userName}" required>
				  	 <div class="invalid-feedback">이름을 입력해주세요.</div>
				  </div>
				<div class="mb-3">
				  <label for="phone">휴대폰</label>
				  <input type="text" class="form-control" id="userPhone" name="userPhone" value="${admdto.userPhone}" placeholder="'-' 빼고 숫자만 입력" required>
				  <div class="invalid-feedback">휴대폰번호를 입력해주세요.</div>
				</div>
				<div class="mb-3">
				  <label for="email">이메일</label>
				  <input type="text" class="form-control" id="userEmail" name="userEmail" value="${admdto.userEmail}" required>
				  <div class="invalid-feedback">이메일을 입력해주세요.</div>
				</div>			
				<div class="mb-3">
				  <label for="email">관리자 권한</label>
				  <select class="form-select" id="userRole" name="userRole" required>
				  	<option value="ROLE_A"  ${admdto.userRole == "ROLE_A" ? 'selected' : ""}>일반관리자</option>
					<option value="ROLE_AM" ${admdto.userRole == "ROLE_AM" ? 'selected' : ""}>마스터관리자</option>
				  </select>
				</div>			
			 	<div class="mx-5 mt-6 text-lg-end text-center">
			 		<button type="submit" class="btn btn-dark border-0 w-15 py-2">계정생성</button>
			 	</div>
		 	</form>
		 </div>

		<%-- <%@ include file="../common/footer.jsp" %> --%>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
	<script>
			
			function checkAll() {
		        if (!checkUserId(Account.userId.value)) {
		        	alert("아이디 실패");
		            return false;
		        } else if (!checkPassword(Account.userId.value, Account.userPw.value, Account.passwordcheck.value)) {
		        	alert("비밀번호 실패");
		            return false;
		        } else if (!checkName(Account.userName.value)) {
		        	alert("이름 실패");
		            return false;
		        } else if (!checkPhone(Account.userPhone.value)) {
		        	alert("폰번호 실패");
		            return false;
		        } else if (!checkEmail(Account.userEmail.value)) {
		        	alert("이메일 실패");
		            return false;
		        } 
		        alert("성공 탄다");
		        return true;
		    }
	
	
		// 공백 확인
		 function checkExistData(value, dataName) {
		        if (value == "") {
		            alert(dataName + " 입력해주세요!");
		            return false;
		        }
		        return true;
		    }

		// 아이디 체크 
		 function checkUserId(id) {
		        //Id가 입력되었는지 확인하기
		        if (!checkExistData(id, "아이디를"))
		            return false;
		 
		        var idRegExp = /^[a-zA-z0-9]{4,20}$/; //아이디 유효성 검사
		        if (!idRegExp.test(id)) {
		            alert("아이디는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!");
		            Account.userId.value = "";
		            Account.userId.focus();
		            return false;
		        }
		        return true; //확인이 완료되었을 때
		    }

		// 비밀번호1, 비밀번호2 체크 
		function checkPassword(id, userPw, passwordcheck) {

	        //비밀번호와 비밀번호 확인이 맞지 않다면..
	        if (userPw != passwordcheck) {
	            alert("두 비밀번호가 맞지 않습니다.");
	            Account.userPw.value ="";
	            Account.passwordcheck.value ="";
	            Account.userPw2.focus();
	            return false;
	        }
	        return true; //확인이 완료되었을 때
   		} 
		
		// 이름 체크 
		function checkName(userName) {
        if (!checkExistData(userName, "이름을")){
        	return false;
        }
            
 
        var nameRegExp = /^[가-힣]{2,4}$/;
        if (!nameRegExp.test(userName)) {
            alert("이름이 올바르지 않습니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
    	}
		
		// 휴대폰번호 체크 
		function checkPhone() {
        var text = document.getElementById("userPhone");
        if (!checkExistData(text.value, "휴대폰번호를")) {
            alert("휴대폰번호를 입력해 주세요!");
            return false;
        } else
            return true;
    	}
		
		
		// 이메일 확인 
		function checkEmail(userEmail) {
        //mail이 입력되었는지 확인하기
        if (!checkExistData(userEmail, "이메일을"))
            return false;
 
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        if (!emailRegExp.test(userEmail)) {
            alert("이메일 형식이 올바르지 않습니다!");
            Account.userEmail.value = "";
            Account.userEmail.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
   		}
		
		// 회원가입 성공, 실패 alret
		var msg = "${msg}";
		if(msg) {
			alert(msg);
		}
			
	</script>
</body>

</html>