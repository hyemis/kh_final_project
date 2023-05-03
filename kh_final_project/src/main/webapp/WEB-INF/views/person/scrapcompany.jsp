<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 관심기업정보</title>

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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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
            <h1>관심기업 정보</h1>
          </div>
		  <div class="row">
			<!-- 좌측 프로필 영역 -->
			<div class="col-3">
				<div class="container-xxl py-5">
					<div class="container border border-primary">
						<div class="bg-light p-3">
							<div class="bg-white rounded p-4 row" style="border: 1px dashed rgba(0, 185, 142, .3)">
								<img class="object-fit-sm-contain border" src="https://dummyimage.com/150x200/d6d6d6/000000&text=150x200" alt="">
							</div>
							<div class="">
									<span>이름 : </span>
									<span>${userinfo.userName }</span><br>
									<span>전화번호 : </span>
									<span>${userinfo.userPhone }</span><br>
									<span>생년월일 : </span>
									<span>${userinfo.userBirth }</span><br>
									<span>이메일 : </span>
									<span>${userinfo.userEmail }</span><br>
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
										<h1 class="mb-3">관심기업정보</h1>
										<p>회사명을 클릭하면 회사소개 페이지로 이동합니다.</p>
										<br>	
										<br>
										<br>
										<table class="table table-hover">
										  <thead>
										    <tr>
										     <th scope="col" class="center"></th>
											 <th scope="col" class="center">회사명</th>
										     <th scope="col" class="center">채용현황</th>										   
										     </tr>
										  </thead>
											<tbody class="table-group-divider">
												<c:forEach items="${scraplist }" var="scrap">
													<tr>
														<td style="text-align: center;"><input
															type="checkbox" name="scrapCheckBox"
															value="${scrap.companyId}" /></td>
														<td style="text-align: center;">${scrap.companyName}</td>
														<td style="text-align: center;"> <a href="${pageContext.request.contextPath}/board/company/companyinfo/view?no=${info.boardNo }" class="btn btn-primary">이동</a> </td>
													</tr>

												</c:forEach>
											</tbody>
										</table>
										
									</div>

									<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
										<button class="btn btn-primary me-md-2" type="button"
											id="deleteCompany" onclick="deleteCompany(); return false;">관심기업 삭제</button>
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
	
	
	// 관심기업 삭제
	function deleteCompany() {
    // 체크된 companyName 값을 가져오기
    var companyIdList = [];
    $("input[name='scrapCheckBox']:checked").each(function() {
    	companyIdList.push($(this).val());
    });
    
    // 체크된 항목이 없는 경우
    if (companyIdList.length == 0) {
        alert("선택된 관심기업이 없습니다.");
        return;
    }

    // 각각의 companyName을 전달하며 ajax 호출하기
    for (var i = 0; i < companyIdList.length; i++) {
        var companyId = companyIdList[i];

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/person/deleteCompany',
            data: {companyId : companyId},
            success: function() {
                alert('관심기업 삭제에 성공했습니다.');
                location.reload();
            },
            error: function(error) {
                alert("관심기업 삭제에 실패하였습니다.");
            }
        });
    }
}
	
	
	
	
	
	</script>
</body>
</html>