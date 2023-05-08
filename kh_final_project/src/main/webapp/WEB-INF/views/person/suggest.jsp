<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>면접제안</title>
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



</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
		<div class="container-container-fluid p-5">
			<div class="container">
				<div class="bg-light rounded p-3">
				<a class="btn btn-primary ms-auto" href="<%=request.getContextPath()%>/person/applylist">지원 현황</a>
					<div class="bg-white rounded p-4"
						style="border: 1px dashed rgba(0, 185, 142, .3)">
						<div class="row g-5 align-items-center">
							<div class="mb-4">
								<h1 class="mb-3">면접 제안</h1>
								<p>기업으로부터 온 면접 제안 리스트 입니다. 수락시 서류전형 없이 바로 면접대상자가 됩니다.</p>
								
								<table class="table">
									<thead>
										<tr>
											<th scope="col">제안 날짜</th>
											<th scope="col">회사명</th>
											<th scope="col">면접제안보기</th>
											<th scope="col">수락</th>
										</tr>
									</thead>
										<tbody>
										<c:forEach items="${suggest.getPage() }" var="suggest">
										<c:if test="${suggest.suggestAccept != 'Y'}">
											<tr>
												<td>${suggest.sendDate }</td>
												<td>${suggest.companyName }</td>
												<td>${suggest.sgTitle }</td>
												<td><a type="button" class="btn btn-primary suggest"
													   data-sgno="${suggest.sgNo}" data-resumeno="${suggest.resumeNo }" data-ranum="${suggest.raNum }" >수락하기</a></td>
											</tr>
										</c:if>	
										</c:forEach>	
										</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
<script>
$(document).ready(function() {
	$('.btn.suggest').click(function() {
		var sgNo = $(this).data('sgno');
		var resumeNo = $(this).data('resumeno');
		var raNum = $(this).data('ranum');
		
		if(confirm("정말 수락하시겠습니까?")) {
			$.ajax({
				url: '${pageContext.request.contextPath}/person/interviewAccept',
				method: 'post',
				data: { sgNo: sgNo,
						resumeNo: resumeNo,
						raNum: raNum
						},
				success: function(response) {
					console.log(response);
					alert('지원해주셔서 감사합니다.\n기업담당자 확인 후 면접일정을 발송해드리겠습니다.');
					window.location.href = "/job/person/applylist";
				},
				error: function(xhr, status, error) {
					alert('오류가 발생하였습니다. 다시 시도해주세요.');
				}
			});
		}
	});
});
</script>




	
	

</body>
</html>
