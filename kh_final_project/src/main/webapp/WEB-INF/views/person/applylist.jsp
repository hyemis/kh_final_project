<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 입사지원현황</title>

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
	<link href="${pageContext.request.contextPath}/resources/css/person.userId.css" rel="stylesheet">
	
	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	
	<style>
	  th.center {
	    text-align: center;
	  }
	</style>
	
</head>
<body>
	
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
          <div class="text-start mx-5 mt-5">
            <h1>입사지원 현황</h1><br>
            <p>
           	열람한 이력서는 입사지원 취소가 불가능합니다.
          </p>

					<div class="bg-light rounded p-3">
						<div class="bg-white rounded p-4"
							style="border: 1px dashed rgba(0, 185, 142, .3)">
							<div class="row g-5 align-items-center">
								<div class="mb-4">

	
									<table class="table table-hover">
										<thead>
										   <tr>
											 <th scope="col" class="center">지원일</th>
										     <th scope="col" class="center">회사명</th>
										     <th scope="col" class="center">공고명</th>
										     <th scope="col" class="center">열람상태</th>
										   </tr>
										 </thead>
										  <tbody class="table-group-divider">
										 
											   

										   
										      
							
										  </tbody>
										</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


		<script>
			
			// alret
			var msg = "${msg}";
			if(msg) {
				alert(msg);
			}

		</script>
</body>
</html>