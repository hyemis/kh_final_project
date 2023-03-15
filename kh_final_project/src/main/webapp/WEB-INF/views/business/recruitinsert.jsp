<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고등록</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
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
				<select class="process${num }" name="raProcess${num }" ${num > 1 ? "disabled" : ""}>
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
			<c:forEach begin="1" end="3" step="1">
				<select name="raExtraDocument">
					<option value="Job-A인적성검사">Job-A인적성검사</option>
					<option value="포트폴리오">포트폴리오</option>
					<option value="사전인터뷰">사전인터뷰</option>
				</select>
			</c:forEach>
		</div>
		<div>
			<button type="submit">채용공고 등록</button>
		</div>
		
		<div>
			test 주소검색 api
		</div>
	</form>
</div>

<script>
	$(".process1").on("click", processHandler);
	$(".process2").on("click", processHandler);
	$(".process3").on("click", processHandler);
	$(".process4").on("click", processHandler);
	$(".process5").on("click", processHandler);

	
	function processHandler(element){
		if($(this).val() != ""){
			$(this).next().removeAttr("disabled");
		} else if($(this).val() == ""){
			$(this).next().attr("disabled", true);
		}
	};
	
</script>
</body>
</html>