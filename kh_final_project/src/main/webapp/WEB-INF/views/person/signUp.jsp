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
<%-- 	<link href="${pageContext.request.contextPath}/resources/css/person.userId.css" rel="stylesheet"> --%>

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
			 <!-- toggle -->
				<div class="row">
					<button class="col-6 btn btn-outline-dark"
						onclick="toggleForm('personal')">개인회원</button>
					<button class="col-6 btn btn-outline-dark"
						onclick="toggleForm('corporate')">기업회원</button>
				</div>
		        <form class="hidden personal-sign-form signUpForm" name="pssignUpForm" id="personal-sign-form" action="signUp" method="post" onsubmit="return pscheckAll()">
			        	<div class="m-4"><h3>개인회원 회원가입</h3></div>
			        	
				          <div class="row">
				          
				            <div class="mb-3">
				              <label for="userId">아이디</label>
				              <input type="text" class="form-control userId" name="userId" id="psuserId" placeholder="영문,숫자,'_' 사용가능" >
				              <div class="invalid-feedback">아이디를  입력해주세요.</div>
				              <button class="btn btn-primary" type="button" id="idChk" onclick="fn_idChk();" value="N">아이디 중복 체크</button>
				              
				            </div>
				            
				            <div class="mb-3">
				              <label for="userPw">비밀번호</label>
				              <input type="password" class="form-control" name="userPw" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" >
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
				
							<div class="mb-3">
				              <label for="userPw2">비밀번호재확인</label>
				              <input type="password" class="form-control" name="userPw2" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" >
				              <div class="invalid-feedback">비밀번호를 입력해주세요. </div>
				            </div>
					
				          <div class="mb-3">
				            <label for="userName">이름</label>
				            <input type="text" class="form-control" name="userName" placeholder="이름 입력" >
				            <div class="invalid-feedback">이름을 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="userBirth">생년월일</label>
				            <input type="date" class="form-control" name="userBirth" placeholder="YYYYMMDD" >
				            <div class="invalid-feedback">생년월일을 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="userPhone">휴대폰</label>
				            <input type="text" class="form-control" name="userPhone" placeholder="'-' 빼고 숫자만 입력" >
				            <div class="invalid-feedback">휴대폰번호를 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="userEmail">이메일</label>
				            <input type="text" class="form-control" name="userEmail" placeholder="email@joba.co.kr" >
				            <div class="invalid-feedback">이메일을 입력해주세요.</div>
				          </div>
				          
				          <div class="row">
							<label for="addressPostcode">주소</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="postcode"
									name="addressPostcode" required>
							</div>
							<div class="col-sm-2">
								<input type="button" class="form-control"
									onclick="execDaumPostcode()" value="주소찾기"><br>
							</div>
						</div>
						<div class="mb-3 ">
							<label for="addressRoad">도로명주소</label> <input type="text"
								class="form-control" id="roadAddress" name="addressRoad">
						</div>
						<div class="mb-3 ">
							<label for="addressJibun">지번주소</label> <input type="text"
								class="form-control" id="jibunAddress" name="addressJibun">
						</div>
						<div class="mb-3 ">
							<label for="addressDetail">상세주소</label> <input type="text"
								class="form-control" id="detailAddress" name="addressDetail">
							<span id="guide" style="color: #999; display: none"></span>
						</div>
				
				          <hr class="mb-4">
						</div>
						
				        <div class="d-grid m-3">
							<button class="btn btn-primary" type="submit">회원가입 완료</button>
						</div>
				</form>	     
				<form class="hidden corporate-sign-form signUpForm" name="signUpForm" id="corporate-sign-form" action="signUp" method="post" onsubmit="return bscheckAll()">
				<div class="m-4"><h3>기업회원 회원가입</h3></div>
			        	
				          <div class="row">
				          
				            <div class="mb-3">
				              <label for="userId">아이디</label>
				              <input type="text" class="form-control userId" name="userId" id="bsuserId" placeholder="영문,숫자,'_' 사용가능" >
				              <div class="invalid-feedback">아이디를  입력해주세요.</div>
				              <button class="btn btn-primary" type="button"  onclick="fn_idChk2();" value="N">아이디 중복 체크</button>
				              
				            </div>
				            
				            <div class="mb-3">
				              <label for="userPw">비밀번호</label>
				              <input type="password" class="form-control" name="userPw" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" >
				              <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				            </div>
				
							<div class="mb-3">
				              <label for="userPw2">비밀번호재확인</label>
				              <input type="password" class="form-control" name="userPw2" placeholder="8~16자리/ 영문 대소문자, 숫자 조합" >
				              <div class="invalid-feedback">비밀번호를 입력해주세요. </div>
				            </div>
					
				          <div class="mb-3">
				            <label for="userName">기업명</label>
				            <input type="text" class="form-control" name="userName" placeholder="이름 입력" >
				            <div class="invalid-feedback">기업명을 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="bsLicense">사업자번호</label>
				            <input type="text" class="form-control" name="bsLicense" placeholder="YYYYMMDD" >
				            <div class="invalid-feedback">사업자번호을 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="bsMainPhone">대표전화</label>
				            <input type="text" class="form-control" name="bsMainPhone" placeholder="'-' 빼고 숫자만 입력" >
				            <div class="invalid-feedback">대표번호를 입력해주세요.</div>
				          </div>
				          
				          <div class="mb-3">
				            <label for="userEmail">이메일</label>
				            <input type="text" class="form-control" name="userEmail" placeholder="email@joba.co.kr" >
				            <div class="invalid-feedback">이메일을 입력해주세요.</div>
				          </div>
				          
				          <div class="row">
							<label for="addressPostcode">주소</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" 
									name="addressPostcode" >
							</div>
							<div class="col-sm-2">
								<input type="button" class="form-control" id="postcode2"
									onclick="execDaumPostcode2()" value="주소찾기"><br>
							</div>
						</div>
						<div class="mb-3 ">
							<label for="addressRoad">도로명주소</label> <input type="text"
								class="form-control" id="addressRoad" name="addressRoad">
						</div>
						<div class="mb-3 ">
							<label for="addressJibun">지번주소</label> <input type="text"
								class="form-control" id="addressJibun" name="addressJibun">
						</div>
						<div class="mb-3 ">
							<label for="addressDetail">상세주소</label> <input type="text"
								class="form-control" id="addressDetail" name="addressDetail">
							<span id="guide" style="color: #999; display: none"></span>
						</div>
				
				          <hr class="mb-4">
						</div>
						
				        <div class="d-grid m-3">
							<button class="btn btn-primary" type="submit">회원가입 완료</button>
						</div>
				</form>
		    </div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<!-- toggle -->
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
	</script>

	<script>
			// id 중복확인
			function fn_idChk() {
				let userId = $("#psuserId").val();
				
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
			
			// id 중복확인
			function fn_idChk2() {
				let userId = $("#bsuserId").val();
				
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
		
			function pscheckAll() {
		        if (!checkUserId(pssignUpForm.userId.value)) {
		            return false;
		        } else if (!checkPassword(pssignUpForm.userId.value, pssignUpForm.userPw.value, pssignUpForm.userPw2.value)) {
		            return false;
		        } else if (!checkName(pssignUpForm.userName.value)) {
		            return false;
		        } else if (!checkBirth(pssignUpForm.userBirth.value)) {
		            return false;
		        } else if (!checkPhone(pssignUpForm.userPhone.value)) {
		            return false;
		        } else if (!checkEmail(pssignUpForm.userEmail.value)) {
		            return false;
		        }  else if (!checkAdress(pssignUpForm.userAdress.value)) {
		            return false;
		        }  
		        return true;
		    }
			
			function bscheckAll() {
		        if (!checkUserId(signUpForm.userId.value)) {
		            return false;
		        } else if (!checkPassword(signUpForm.userId.value, signUpForm.userPw.value, signUpForm.userPw2.value)) {
		            return false;
		        } else if (!checkName(signUpForm.userName.value)) {
		            return false;
		        } else if (!checkBirth(signUpForm.userBirth.value)) {
		            return false;
		        } else if (!checkPhone(signUpForm.userPhone.value)) {
		            return false;
		        } else if (!checkEmail(signUpForm.userEmail.value)) {
		            return false;
		        }  else if (!checkAdress(signUpForm.userAdress.value)) {
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
		            signUpForm.userId.value = "";
		            signUpForm.userId.focus();
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
	            signUpForm.userPw.value = "";
	            signUpForm.userPw.focus();
	            return false;
	        }
	        //비밀번호와 비밀번호 확인이 맞지 않다면..
	        if (userPw != userPw2) {
	            alert("두 비밀번호가 맞지 않습니다.");
	            signUpForm.userPw.value = "";
	            signUpForm.userPw2.value = "";
	            signUpForm.userPw2.focus();
	            return false;
	        }
	 
	        //아이디와 비밀번호가 같을 때..
	        if (id == userPw) {
	            alert("아이디와 비밀번호는 같을 수 없습니다!");
	            signUpForm.userPw.value = "";
	            signUpForm.userPw2.value = "";
	            signUpForm.userPw2.focus();
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
            signUpForm.userEmail.value = "";
            signUpForm.userEmail.focus();
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
	
	<!-- map -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("roadAddress").value = roadAddr;
							document.getElementById("jibunAddress").value = data.jibunAddress;
							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>
	<script>
		function execDaumPostcode2() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode2').value = data.zonecode;
							document.getElementById("addressRoad").value = roadAddr;
							document.getElementById("addressDetail").value = data.jibunAddress;
							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>

</body>
</html>