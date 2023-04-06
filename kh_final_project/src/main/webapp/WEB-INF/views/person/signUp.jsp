<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 회원가입</title>
	<!-- cs -->
	<link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/person.css" rel="stylesheet">

	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	
	<style>
	  .hidden {
	    display: none;
	  }
	</style>
</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
		
		<div class="grid gap-3 border border-primary">
			 <div class="row justify-content-center">
			 
			 	<div class="row">
					<button class="col-6 btn btn-outline-dark" onclick="toggleForm('personal')">개인회원</button>
					<button class="col-6 btn btn-outline-dark" onclick="toggleForm('corporate')">기업회원</button>
				</div>

			 
			 
		        <form class="hidden" name=signUpForm id="personal-sign-form" action="signUp" method="post" onsubmit="return checkAll()">
			        	<div class="m-4"><h3>JOB-A 회원가입</h3></div>
			        	
				          <div class="row">
				          
				            <div class="mb-3">
				              <label for="userId">아이디</label>
				              <input type="text" class="form-control" name="userId" id="userId" placeholder="영문,숫자,'_' 사용가능" required>
				              <div class="invalid-feedback">아이디를  입력해주세요.</div>
				              <button class="btn btn-primary" type="button" id="idChk" onclick="fn_idChk();" value="N">아이디 중복 체크</button>
				              
				            </div>
				            
				            <div class="mb-3">
				              <label for="userPw">비밀번호</label>
				              <input type="password" class="form-control" name="userPw" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" required>
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
				
							<div class="mb-3">
				              <label for="userPw2">비밀번호재확인</label>
				              <input type="password" class="form-control" name="userPw2" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" required>
				              <div class="invalid-feedback">비밀번호를 입력해주세요. </div>
				            </div>
					
				          <div class="mb-3">
				            <label for="userName">이름</label>
				            <input type="text" class="form-control" name="userName" placeholder="이름 입력" required>
				            <div class="invalid-feedback">이름을 입력해주세요.</div>
				          </div>
				          
				          <!-- //TODO 기업일 경우, 이름 >기업명으로 기입 
				           <div class="mb-3">
				            <label for="userName">기업명</label>
				            <input type="text" class="form-control" name="userName" placeholder="이름 입력" required>
				            <div class="invalid-feedback">기업명을 입력해주세요.</div>
				          </div>
				          -->
				          
				          <div class="mb-3">
				            <label for="userBirth">생년월일</label>
				            <input type="text" class="form-control" name="userBirth" placeholder="YYYYMMDD" required>
				            <div class="invalid-feedback">생년월일을 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="userPhone">휴대폰</label>
				            <input type="text" class="form-control" name="userPhone" placeholder="'-' 빼고 숫자만 입력" required>
				            <div class="invalid-feedback">휴대폰번호를 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="userEmail">이메일</label>
				            <input type="text" class="form-control" name="userEmail" placeholder="email@joba.co.kr" required>
				            <div class="invalid-feedback">이메일을 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="userAdress">주소</label>
				            <input type="text" class="form-control" name="userAdress" placeholder="서울시 자바구 자바동" required>
				            <div class="invalid-feedback">주소를 입력해주세요.</div>
				          </div>
				
				          <hr class="mb-4">
				          
				          <!-- <div class="custom-control custom-checkbox">
				            <input type="checkbox" class="custom-control-input" id="termsAct" required>
				            <label class="custom-control-label" for="termsAct">서비스 이용약관, 개인정보 취급방침을 확인하였고, 이에 동의합니다.</label>
				          </div> -->
				          
						
						</div>
				         <div class="d-grid m-3">
						  <button class="btn btn-primary" type="submit">회원가입 완료</button>
						</div>
				</form>
				
				  <form class="hidden" id="corporate-sign-form" action="" method="post" >
				  	기업 회원가입 form 
				  	
				  	<div class="d-grid m-3">
						  <button class="btn btn-primary" type="submit">회원가입 완료</button>
					</div>
						
				  
				  </form>
				  
				  
				  
			       
				    
		    </div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	
	<script>
	function toggleForm(type) {
	    var personalForm = document.getElementById('personal-sign-form');
	    var corporateForm = document.getElementById('corporate-sign-form');

	    if (type === 'personal') {
	        personalForm.classList.remove('hidden');
	        corporateForm.classList.add('hidden');
	      } else if (type === 'corporate') {
	        personalForm.classList.add('hidden');
	        corporateForm.classList.remove('hidden');
	      }
	  }
	
	
	
			// id 중복확인
			function fn_idChk() {
				let userId = $("#userId").val();
				
				$.ajax({
					type : 'post',
					url:"idChk",
					data : {"userId" : userId},
					success : function(data) {
						if(data == "N") {
							alert("사용 가능한 아이디입니다.");
						} else {
							alert("중복된 아이디 입니다. 다시 입력해주세요.");
						}
					}
				})
			}
		
	
			
			function checkAll() {
		        if (!checkUserId(singUpForm.userId.value)) {
		            return false;
		        } else if (!checkPassword(singUpForm.userId.value, singUpForm.userPw.value, singUpForm.userPw2.value)) {
		            return false;
		        } else if (!checkName(singUpForm.userName.value)) {
		            return false;
		        } else if (!checkBirth(singUpForm.userBirth.value)) {
		            return false;
		        } else if (!checkPhone(singUpForm.userPhone.value)) {
		            return false;
		        } else if (!checkEmail(singUpForm.userEmail.value)) {
		            return false;
		        }  else if (!checkAdress(singUpForm.userAdress.value)) {
		            return false;
		        }  
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
		            singUpForm.userId.value = "";
		            singUpForm.userId.focus();
		            return false;
		        }
		        return true; //확인이 완료되었을 때
		    }

		// 비밀번호1, 비밀번호2 체크 
		function checkPassword(id, userPw, userPw2) {
        //비밀번호가 입력되었는지 확인하기
        if (!checkExistData(userPw, "비밀번호를"))
            return false;
        //비밀번호 확인이 입력되었는지 확인하기
        if (!checkExistData(userPw2, "비밀번호 확인을"))
            return false;
 
        var password1RegExp = /^[a-zA-z0-9]{8,16}$/; //비밀번호 유효성 검사
        if (!password1RegExp.test(userPw)) {
            alert("비밀번호는 영문 대소문자와 숫자 8~16자리로 입력해야합니다!");
            singUpForm.userPw.value = "";
            singUpForm.userPw.focus();
            return false;
        }
        //비밀번호와 비밀번호 확인이 맞지 않다면..
        if (userPw != userPw2) {
            alert("두 비밀번호가 맞지 않습니다.");
            singUpForm.userPw.value = "";
            singUpForm.userPw2.value = "";
            singUpForm.userPw2.focus();
            return false;
        }
 
        //아이디와 비밀번호가 같을 때..
        if (id == userPw) {
            alert("아이디와 비밀번호는 같을 수 없습니다!");
            singUpForm.userPw.value = "";
            singUpForm.userPw2.value = "";
            singUpForm.userPw2.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
   		} 
		
		// 이름 체크 
		function checkName(userName) {
        if (!checkExistData(userName, "이름을"))
            return false;
 
        var nameRegExp = /^[가-힣]{2,4}$/;
        if (!nameRegExp.test(userName)) {
            alert("이름이 올바르지 않습니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
    	}
		
		// 생년월일 체크 
		function checkBirth() {
        var text = document.getElementById("userBirth");
        if (!checkExistData(text.value, "생년월일을")) {
            alert("생년월일을 입력해 주세요!");
            return false;
        } else
            return true;
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
            singUpForm.userEmail.value = "";
            singUpForm.userEmail.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
   		}
		
		// 주소 체크 
		function checkAdress() {
        var text = document.getElementById("userAdress");
        if (!checkExistData(text.value, "주소를")) {
            alert("주소를 입력해 주세요!");
            return false;
        } else
            return true;
    	}
		
		
		
		// 회원가입 실패 alret
		var msg = "${msg}";
		if(msg) {
			alert(msg);
		}
		
		
	
			
	</script>
</body>
</html>