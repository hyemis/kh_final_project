<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>합격자관리</title>
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
	
<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>


	
</head>
<body>
<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- page section -->	
<section>
	<div class="container-fluid bg-white p-5">
		<h3 class="m-3"><a href="view">지원자 관리</a></h3>
		<div class="container-xl px-5 d-flex">
			<div class="container-lg">
				<select id="searchNum" class="form-select searchNum" name="searchNum">
					<option value="">선택안함</option>
					<c:forEach items="${title }" var="title">
						<option value="${title.raNum }" ${title.raNum == pdto.searchNum? 'selected':'' }>${title.raTitle }</option>
					</c:forEach>
				</select>
			</div>
			<div class="">
				<select id="searchResult" class="form-select searchResult" name="searchResult">
					<option value="">선택안함</option>
					<option value="Y" ${pdto.searchResult=='Y'?'selected':''}>합격</option>
					<option value="N" ${pdto.searchResult=='N'?'selected':''}>불합격</option>
				</select>
			</div>
		</div>
		<!-- 리스트 영역 start-->
		<div>
			<c:set var="pageNumber" value="${empty pnum ? 1 : pnum }" />
		
		 <div class="container-xl px-5">
		 	<table class="table">
		 		<thead>
		 			<tr>
		 				<th scope="col">이력서번호</th>
		 				<th scope="col">지원자 이이다</th>
		 				<th scope="col">공고이름</th>
		 				<th scope="col">등록</th>
		 				<th scope="col">합격</th>
		 			</tr>
		 		</thead>
		 		<tbody>
		 			<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5">지원자가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- Paging 에서 getPage()로 해당 페이지에 맞는 게시글 리스트 가져오기 -->
							<c:forEach items="${list.getPage() }" var="list" varStatus="i">
								<tr>
									<td><a href="${pageContext.request.contextPath}/business/applicant/resume?resumeNo=${list.resumeNo}">${list.resumeNo }</a></td>									
									<td>${list.userId}</td>
									<td>${list.raTitle }</td>
									<td> ${list.applyDate}</td>
									<td>
									<c:choose>
										<c:when test="${list.resultType eq 'Y'}">
											합격
										</c:when>
										<c:when test="${list.resultType eq 'N'}">
											불합격
										</c:when>
										<c:otherwise>
											심사중
										</c:otherwise>
									</c:choose>
									</td>
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
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/business/applicant/view?pnum=${list.prevPage }&searchNum=${pdto.searchNum}&searchResult=${pdto.searchResult}">prev</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="pNum" items="${list.pageList }">
					<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${pageContext.request.contextPath}/business/applicant/view?pnum=${pNum}&searchNum=${pdto.searchNum}&searchResult=${pdto.searchResult}">${pNum }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${list.nextPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/abusiness/applicant/view?pnum=${list.nextPage }&searchNum=${pdto.searchNum}&searchResult=${pdto.searchResult}">next</a></li>
					</c:otherwise>
				</c:choose>					
			</ul>
		 </div>
		</div>
		<!-- 리스트 영역 end-->
		<div>
			<a class="btn btn-primary returnMain" href="${pageContext.request.contextPath}/business/applicant">지원자 메인</a>
		</div>
		
	</div>
</section>
	
<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>	

<!-- page script -->
<script type="text/javascript">
	$(document).on('change','select', function(){
		let searchNum = $('.searchNum').val();
		let searchResult = $('.searchResult').val();
		
		location.href = '${pageContext.request.contextPath}/business/applicant/view?pnum=${pageNumber}&searchNum='+searchNum+'&searchResult='+searchResult;
	});	
</script>	
</body>
</html>
