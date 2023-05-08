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
		.user_id {
			position: fixed;;
			top: 20px;
			right: 210px;
		}
		
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
            <h1>입사지원 현황</h1>
          </div>
		  <div class="row">
			<!-- 좌측 프로필 영역 -->
			<div class="col-3">
				<div class="container-xxl py-5">
					<div class="container border border-primary">
						<div class="bg-light p-3">
							<div class="bg-white rounded p-4 row" style="border: 1px dashed rgba(0, 185, 142, .3)">
								<img class="object-fit-sm-contain border" 
									src="<c:if test='${not empty userinfo.userPic}'>${userinfo.userPic}</c:if>
								         <c:if test='${empty userinfo.userPic}'>https://dummyimage.com/150x200/d6d6d6/000000&text=150x200</c:if>"
								     width="150" 
								     height="200">								
							</div>
							<div>
								<span style="font-size: 85%;">이름 : </span> <span
									style="font-size: 85%;">${userinfo.userName }</span><br> <span
									style="font-size: 85%;">전화번호 : </span> <span
									style="font-size: 85%;">${userinfo.userPhone }</span><br>
								<span style="font-size: 85%;">생년월일 : </span> <span
									style="font-size: 85%;">${userinfo.userBirth }</span><br>
								<span style="font-size: 80%;">이메일 : </span> <span
									style="font-size: 80%;">${userinfo.userEmail }</span><br>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 우측 조회 영역 -->
			<div class="col-9">
				<div class="container-xxl py-5">
					<div class="container">
						<div class="bg-light rounded p-3">
							<div class="bg-white rounded p-4"
								style="border: 1px dashed rgba(0, 185, 142, .3)">
								<div class="row g-5 align-items-center">
									<div class="mb-4">
										<h1 class="mb-3">입사지원 목록</h1>
										<p>기업이 열람한 이력서는 입사지원 취소가 불가능합니다.</p>
										<br>	
										<br>
										<br>
										<table class="table table-hover">
										  <thead>
										    <tr>
											 <th scope="col">지원일</th>
										     <th scope="col" >회사명</th>
										     <th scope="col" >공고명</th>
										     <th></th>
										   </tr>
										  </thead>
										  <tbody class="table-group-divider">
												<c:forEach items="${applylist}" var="apply">
													<tr>
														<td>${apply.applyDate}</td>
														<td>${apply.companyName}</td>
														<td><a
															href="${pageContext.request.contextPath}/person/viewrecruit/${apply.raNum}">
																${apply.raTitle} </a></td>
														<td class="text-center"><c:choose>
																<c:when	test="${apply.resultType == 'Y' || apply.resultType == 'N'}">열람완료</c:when>
																<c:when test="${apply.resultType == 'A'}">
																	<button type="button" class="btn btn-outline-dark"
																		id="cancelBtn"
																		onclick="cancelApply(${apply.raNum}); return false;">지원취소</button>

																</c:when>
															</c:choose></td>
												</c:forEach>
										  </tbody>
										
										</table>
										
									</div>
								</div>
							</div>
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
	
	// 지원 취소 ajax
	function cancelApply(raNum) {
    $.ajax({
        type: "POST",
        url: '${pageContext.request.contextPath}/person/cancelApply',
        data: {raNum : raNum},
        success: function() {
            // 지원취소 완료
            alert("입사 지원이 취소됐습니다.");
            location.reload();
        },
        error: function(error) {
            alert("입사 지원 취소에 실패하였습니다.");
        }
    });
}

	
	
	
	</script>
</body>
</html>