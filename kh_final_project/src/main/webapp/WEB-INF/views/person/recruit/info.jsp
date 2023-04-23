<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>채용 정보</title>
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
<link href="${pageContext.request.contextPath}/resources/css/person.css"
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

<style>
.fdept, .mdept, .ldept {
	border: 1px solid gray;
	border-radius: 10px;
	margin: 0;
	height: 300px; /* 최소 높이 */
	overflow-y: auto; /* 스크롤 생기도록 */
}

</style>

</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
		<div class="container-fluid"
			style="background-color: #f2f2f2; min-height: 300px;">
			<div
				class="d-flex justify-content-center align-items-center">
				<div class="fdept flex-grow-1" style="min-height: 300px;">
					<div class="m-3 fdeptList" style="min-height: 300px;">
						<c:forEach var="fList" items="${fdeptList}">
							<div class="mx-2 fcateinfo">
								<input type="hidden" class="categoryId" name="categoryId"
									value="${fList.categoryId}"> <input type="hidden"
									class="categoryName" name="categoryName"
									value="${fList.categoryName}"> <input type="hidden"
									class="categoryType" name="categoryType"
									value="${fList.categoryType}"> <input type="hidden"
									class="reqCategoryId" name="reqCategoryId"
									value="${fList.categoryId}"> ${fList.categoryName}
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="mdept flex-grow-1 " style="min-height: 300px;"></div>
				<div class="ldept flex-grow-1 " style="min-height: 300px;"></div>
			</div>

			<div class="d-grid gap-2 d-md-flex justify-content-md-end p-2">
			<button class="btn btn-primary btn-lg me-md-2" type="button">검색 결과</button>
		</div>
		</div>


		<div class="container-fluid bg-white p-5">이 영역에 작성하시면 됩니다.</div>

	</section>



	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
	<script type="text/javascript">
		$('.fcateinfo')
				.on(
						'click',
						function() {

							let id = $(this).find('.categoryId').val();
							let type = $(this).find('.categoryType').val();
							let reqid = $(this).find('.reqCategoryId').val();

							//2단계 
							$
									.ajax({
										url : "${pageContext.request.contextPath}/person/listmcate",
										type : "post",
										data : {
											categoryId : id
										},
										dataType : "json",
										success : function(result) {
											let htmlVal = '<div class="m-3 mdeptList" style="min-height: 300px;">';
											htmlVal += '<input type="hidden" class="categoryType" name="categoryType" value="'+type+'">';
											htmlVal += '<input type="hidden" class="reqCategoryId" name="reqCategoryId" value="'+reqid+'">';
											for (i = 0; i < result.length; i++) {
												let list = result[i];
												htmlVal += '<div class="mx-2 mcateinfo">';
												htmlVal += '<input type="hidden" class="categoryId" name="categoryId" value="'+list.categoryId+'">';
												htmlVal += '<input type="hidden" class="categoryName" name="categoryName" value="'+list.categoryName+'">';
												htmlVal += list.categoryName;
												htmlVal += '</div>';
											}
											htmlVal += '</div>';
											$(".mdept").html(htmlVal);
										},
										error : function(e) {
											alert(e + " : 오류")
										}

									});
						});

		$(document)
				.on(
						'click',
						'.mcateinfo',
						function() {

							let id = $(this).find('.categoryId').val();
							let type = $(this).closest('.mdeptList').find(
									'.categoryType').val();

							//3단계
							$
									.ajax({
										url : "${pageContext.request.contextPath}/person/listlcate",
										type : "post",
										data : {
											categoryId : id
										},
										dataType : "json",
										success : function(result) {

											let htmlVal = '<div class="m-3  ldeptList" style="min-height: 300px;">';
											htmlVal += '<input type="hidden" class="categoryType" name="categoryType" value="'+type+'">';
											htmlVal += '<input type="hidden" class="reqCategoryId" name="reqCategoryId" value="'+id+'">';
											for (i = 0; i < result.length; i++) {
												let list = result[i];
												htmlVal += '<div class="mx-2 lcateinfo">';
												htmlVal += '<input type="hidden" class="categoryId" name="categoryId" value="'+list.categoryId+'">';
												htmlVal += '<input type="hidden" class="categoryName" name="categoryName" value="'+list.categoryName+'">';
												htmlVal += list.categoryName;
												htmlVal += '</div>';
											}
											htmlVal += '</div>';
											$(".ldept").html(htmlVal);
										},
										error : function(e) {
											alert(e + " : 오류")
										}
									});

						});
	</script>
</body>
</html>
