<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>home</title>
<!-- cs -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico"
	rel="icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css"
	rel="stylesheet">

<!-- js -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>



</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
<section>
	<div class="container-fluid bg-white p-5">
	<h4>기업회원을 위한 맞춤형 인재 추천</h4>
	<a class="btn btn-primary" href="<%=request.getContextPath()%>/business/search" role="button">열람한 인재</a>
		
		<!-- 검색창 -->
		<form action="search" method="post" id="searchForm" >
		<div class="container-fluid row mt-3">
			<select class="col m-3 form-select" name="jobType">
				<option selected>직종</option>
				<option value="0">선택안함</option>
				<c:forEach items="${JNlist}" var="categoryJN">
				<option value="${categoryJN.categoryId }">${categoryJN.categoryName}</option>
				</c:forEach>
			</select>
			<select class="col m-3 form-select" name="career">
				<option selected>경력</option>
				<option value="0">선택안함</option>
				<c:forEach items="${CAlist}" var="categoryCA">
				<option value="${categoryCA.categoryId }">${categoryCA.categoryName}</option>
				</c:forEach>
			</select>
			<select class="col m-3 form-select" name="education">
				<option selected>학력</option>
				<option value="0">선택안함</option>
				<c:forEach items="${EDlist}" var="categoryED">
				<option value="${categoryED.categoryId }">${categoryED.categoryName}</option>
				</c:forEach>
			</select>
			<select class="col m-3 form-select" name="gender">
				<option selected>성별</option>
				<option value="0">선택안함</option>
				<c:forEach items="${SElist}" var="categorySE">
				<option value="${categorySE.categoryId }">${categorySE.categoryName}</option>
				</c:forEach>
			</select>
			<button class="col-1 m-3 btn btn-primary" id="btn-search" type="submit">검색</button>
		</div>	
		</form>
		
		<!-- 목록 -->
		<div class="table-responsive mt-5">
		<table class="table table-hover">
			  <thead>
			    <tr class="text-center">
			      <th scope="col">이름</th>
			      <th scope="col">직종</th>
			      <th scope="col">경력</th>
			      <th scope="col">학력</th>
			      <th scope="col">성별</th>
			      <th scope="col">면접제안하기</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr class="text-center">
			      <td>이름</td>
			      <td>이력서</td>
			      <td><a type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#interview">면접제안</a></td>
			    </tr>
			   </tbody>
	   </table> 
	
	</div>
		
		
	</div>
</section>

	<!-- Modal -->
	<div class="modal fade" id="interview" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center" id="staticBackdropLabel">면접 제안
						작성</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath }/business/"
						method="post">

						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>제목</h4>
							</div>
							<div class="col-10 was-validated">
								<input type="text" class="form-control is-invalid"
									name="boardTitle" placeholder="제목을 입력해주세요" required>
								<hr>
							</div>
						</div>
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>내용</h4>
							</div>
							<div class="col-10 was-validated">
								<input type="text" class="form-control is-invalid"
									name="boardTitle" placeholder="내용을 입력해주세요" required>
								<hr>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-light"
								data-bs-dismiss="modal">취소</button>
							<button type="reset" class="btn btn-light">초기화</button>	
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->

</body>
</html>
