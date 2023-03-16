<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고등록</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<h1>채용공고등록</h1>
<div>
	<form action="<%=request.getContextPath() %>/bs/recruitinsert" method="post">
		<div>
			모집분야<input type="text" name="recruitType">
		</div>
		<div>
			경력여부
			<select name="careerType">
				<option value="begin">신입</option>
				<option value="career">경력</option>
				<option value="not">경력무관</option>
			</select>
		</div>
		<div>
			담당업무<input type="text" name="inChargeType">
		</div>
		<div>
			근무부서<input type="text" name="department">
		</div>
		<div>
			직급(직책)<input type="text" name="position">
		</div>
		<div>
			필수/우대조건<input type="text" name="coditionType" placeholder="정보처리기사자격증">
		</div>
		<div>
			지원자_학력 <input type="text" name="applicant_education" placeholder="4년제 대학교 졸업 이상">
		</div>
		<div>
			지원자_성별
			<select name="applicant_gender">
				<option value="male">남자</option>
				<option value="female">여자</option>
				<option value="not">성별무관</option>
			</select>
		</div>
		<div>
			지원자_나이<input type="text" name="applicant_age" placeholder="30세 이상">
		</div>
		<div>
			연봉<input type="text" name="salary" placeholder="회사내규에 따름">		
		</div>
		<div>
			근무형태<input type="text" name="work_type" placeholder="정규직">
		</div>
		<div>
			근무요일<input type="text" name="work_day" placeholder="월~금">
		</div>
		<div>
			근무시간<input type="text" name="work_time" placeholder="오전 9시 ~ 오후 6시">
		</div>
		<div>
			공고대표직무<input type="text" name="raRepresentativeJob" placeholder="경영·사무 ▶ 기획·전략·경영 ▶  기획">
		</div>
		<div>
			지원접수기간<input type="text" name="application_period" placeholder="2023-03-15 ~ 2023-04-30">
		</div>
		<div>
			공고방식
			<select name="raType">
				<option value="normal">일반양식</option>
				<option value="company">자사양식</option>
				<option value="blind">블라인드양식</option>
			</select>
		</div>
		<div>
			지원서접수방법
			<select name="applyType">
				<option value="joba">Job-A접수</option>
				<option value="homepage">홈페이지</option>
			</select>
		</div>
		<div>
			지원서양식
			<select name="applyFormType">
				<option value="jobaForm">Job-A이력서</option>
				<option value="companyForm">자사이력서</option>
			</select>
		</div>
		<div>
			채용내용<input type="text" name="raTitle">
		</div>
		<div>
			채용제목<textarea cols="30" rows="20" name="raContent"></textarea>
		</div>
		<div>
			채용절차
			<c:forEach var="num" begin="1" end="5" step="1">
				<select class="process${num }" name="raProcess${num }" ${num > 2 ? "disabled" : ""}>
					<option value="">선택안함</option>
					<c:choose>
						<c:when test="${num eq 1}">
							<option value="서류전형" selected>서류전형</option>
						</c:when>
						<c:otherwise>	
							<option value="서류전형">서류전형</option>
						</c:otherwise>
					
					</c:choose>
					<option value="인적성검사">인적성검사</option>
					<option value="1차면접">1차면접</option>
					<option value="2차면접">2차면접</option>
					<option value="최종합격">최종합격</option>
				</select>
			</c:forEach>
		</div>
		<div>
			추가제출서류
			<c:forEach var="num" begin="1" end="3" step="1">
				<select class="extra${num }" name="raExtraDocument${num }" ${num > 1 ? "disabled" : ""}>
					<option value="">선택안함</option>
					<option value="Job-A인적성검사">Job-A인적성검사</option>
					<option value="포트폴리오">포트폴리오</option>
					<option value="사전인터뷰">사전인터뷰</option>
				</select>
			</c:forEach>
		</div>
		<div>
			<h3>주소검색 API</h3>
			<input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소">
			<input type="text" id="sample6_extraAddress" placeholder="동"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소">
		</div>
		<div>
			<button type="submit">채용공고 등록</button>
		</div>
	</form>
</div>

<%@include file="/WEB-INF/views/common/footer.jsp"%>

<script>
	$(".process1").on("click", processHandler);
	$(".process2").on("click", processHandler);
	$(".process3").on("click", processHandler);
	$(".process4").on("click", processHandler);
	$(".process5").on("click", processHandler);
	
	$(".extra1").on("click", processHandler);
	$(".extra2").on("click", processHandler);
	$(".extra3").on("click", processHandler);

	function processHandler(element){
		if($(this).val() != ""){
			$(this).next().removeAttr("disabled");
		} else if($(this).val() == ""){
			$(this).next().attr("disabled", true);
		}
	};
	
</script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>