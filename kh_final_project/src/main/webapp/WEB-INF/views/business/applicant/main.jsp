<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>지원자 관리 메인</title>
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
		<div class="container-xxl py-5 d-flex">
			<div class="myinfo p-2 col-3 border border-primary">
				<div class="container-xxl py-5">
					<div class="bg-white rounded p-4 row" style="border: 1px dashed rgba(0, 185, 142, .3)">
					<img class="object-fit-sm-contain border" src="${userinfo.userPic eq null ? 'https://dummyimage.com/150x200/d6d6d6/000000&text=150x200' : userinfo.userPic}" alt="">
						
					</div>
					<div class="userinfo p-2 pt-4">
						<span>이름 : </span>
						<span>${userinfo.userName }</span><br>
						<span>대표전화번호 : </span>
						<span>${userinfo.bsMainPhone }</span><br>
						<span>이메일 : </span>
						<span>${userinfo.userEmail }</span><br>
					</div>
				</div>
				<div>
					<a href="insert" class="btn btn-dark mb-1">지원자 관리</a>
					<a href="recruitAll" class="btn btn-dark mb-1">합격자 관리</a>					
				</div>
			</div>
			<div class="p-2 col-9">
				<div class="recruitlist p-2">
					<h3 class="my-2">지원자 현황</h3>
					<div class="bg-dark border">
						<table class="table table-borderless">
							<thead>
								<tr class="text-white h4">
									<th>총 지원자</th>
									<th>서류 합격</th>
									<th>최종 합격</th>
									<th> 불합격 </th>
								</tr>
							</thead>
							<tbody>
								<tr class="text-center">
									<td>
										<div class="aplicantAll bg-white rounded-circle d-inline-flex justify-content-center align-items-center" style="width: 100px; height: 100px;">
											<span class="h1">2</span>								
										</div>
									</td>
									<td>
										<div class="aplicantAll bg-white rounded-circle d-inline-flex justify-content-center align-items-center" style="width: 100px; height: 100px;">
											<span class="h1">3</span>								
										</div>
									</td>
									<td>
										<div class="aplicantAll bg-white rounded-circle d-inline-flex justify-content-center align-items-center" style="width: 100px; height: 100px;">
											<span class="h1">4</span>								
										</div>
									</td>
									<td>
										<div class="aplicantAll bg-white rounded-circle d-inline-flex justify-content-center align-items-center" style="width: 100px; height: 100px;">
											<span class="h1">5</span>								
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
					</div>
<!-- 					<div class="bg-dark border d-flex justify-content-center align-items-center" style="height: 150px;"> -->
<!-- 						<div class="aplicantAll bg-white rounded-circle d-inline-flex justify-content-center align-items-center mx-4" style="width: 100px; height: 100px;"> -->
<!-- 							<span class="h1">1</span>								 -->
<!-- 						</div> -->
<!-- 						<div class="aplicantAll bg-white rounded-circle d-inline-flex justify-content-center align-items-center mx-4" style="width: 100px; height: 100px;"> -->
<!-- 							<span class="h1">2</span> -->
<!-- 						</div> -->
<!-- 						<div class="aplicantAll bg-white rounded-circle d-inline-flex justify-content-center align-items-center mx-4" style="width: 100px; height: 100px;"> -->
<!-- 							<span class="h1">3</span> -->
<!-- 						</div> -->
<!-- 						<div class="aplicantAll bg-white rounded-circle d-inline-flex justify-content-center align-items-center mx-4" style="width: 100px; height: 100px;"> -->
<!-- 							<span class="h1">4</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<h3 class="my-2 mt-4">지원자 조회</h3>
					<div class="bg-white border">
						<div class="m-2 d-flex align-middle">
							<label for="aplicantList" class="col-auto h5 text-align-middle ">지원 공고  : </label>
							<div class="col-auto">
								<select id="aplicantList" class="form-select aplicantList " name="aplicantList" style="width: 500px;">
										<option>선택안함</option>
									<c:forEach items="${recruitlist}" var="list">
										<option value="${list.raNum }">${list.raTitle }</option>								
									</c:forEach>
								</select>
							</div>
						</div>
						<!-- 위의 select 박스가 바뀌면 아래 새로 그려짐  start-->
						<!-- 쿼리스트링으로 공고 번호 들어오면 먼저 그려줄수 있어야함 공고 검색 후 값이 없으면
						안그려져야됨-->
						<div class="m-2 d-flex align-middle">
							<p class="mx-2">지원자</p>
							<p>지원자수</p>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th>지원자</th>
									<th>지원 이력서</th>
									<th>지원 날짜</th>
									<th>합격여부</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						<!-- 위의 select 박스가 바뀌면 아래 새로 그려짐  end-->
					</div>
				</div>
			</div>
			
		</div>
		</section>

	
<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>	

<!-- page script -->

<script type="text/javascript">
	$(document).on('change','.aplicantList', function(){
		/* 여기서 선택된 공고 마다의 지원자 리스트 불러오기  */
		alert("변경");
	} )
</script>
	
</body>
</html>
