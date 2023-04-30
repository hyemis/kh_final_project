<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 스크랩한 채용공고</title>

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
            <h1>스크랩한 채용공고</h1>
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
										<h1 class="mb-3">스크랩 정보</h1><br>
										<p>
											1. 스크랩한 채용공고는 공고 마감과 상관없이 스크랩일로부터 90일 동안 보관됩니다.<br> 2.
											'지원'을 클릭하면 해당 공고에 바로 입사지원 하실 수 있습니다.<br>
										</p>
										<br>	
										<br>
										<br>
										 <table class="table table-hover"> 
 											<thead>
												<tr>
													<th scope="col" class="center"></th>
													<th scope="col" class="center">회사명</th>
													<th scope="col" class="center">공고명</th>
													<th scope="col" class="center">마감일</th>
													<th scope="col" class="center">입사지원</th>
												</tr>
											</thead>
											<tbody class="table-group-divider">
												<c:forEach items="${scraplist }" var="scrap">
													<tr>
														<td><input type="checkbox" name="scrapCheckBox"
															value="${scrap.raNum }" /></td>
														<td>${scrap.companyName }</td>
														<td><a
															href="${pageContext.request.contextPath}/person/viewrecruit/${scrap.raNum}">${scrap.raTitle }</a></td>
														<td>${scrap.closeDate }</td>
														<td>
														<button type="button" class="btn btn-outline-dark apply-btn" data-bs-toggle="modal" data-bs-target="#apply">지원</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

										<!-- 지원하기 모달 창 -->
										<div class="modal fade" id="apply" tabindex="-1" role="dialog"
											aria-labelledby="uploadModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">

												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="uploadModalLabel">${redto.raTitle}
															입사지원</h5>

														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<p>
															<strong>해당 공고에 지원할 이력서를 선택하세요.</strong>
														</p>
														<div class="selectbox-wrapper">
															<select name="selectbox">
																<c:forEach items="${resumelist}" var="resume">
																	<option value="${resume.resumeNo}">${resume.resumeTitle}</option>
																</c:forEach>
															</select>
														</div>
														<br>
														<hr>

														<button type="button" data-bs-dismiss="modal"
															class="btn btn-primary mx-auto d-block" type="submit"
															id="applyJobBtn" data-raNum="${scrap.raNum}">입사지원하기</button>
													</div>
												</div>
											</div>
										</div>


										<div
											class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
											<button class="btn btn-primary me-md-2" type="button"
												id="deleteJob" onclick="deleteJob(); return false;">스크랩삭제</button>
										</div>
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
	
	// 스크랩 삭제
	function deleteJob() {
    // 체크된 raNum 값을 가져오기
    var raNumList = [];
    $("input[name='scrapCheckBox']:checked").each(function() {
        raNumList.push($(this).val());
    });
    
    // 체크된 항목이 없는 경우
    if (raNumList.length == 0) {
        alert("선택된 채용공고가 없습니다.");
        return;
    }

    // 각각의 raNum을 전달하며 ajax 호출하기
    for (var i = 0; i < raNumList.length; i++) {
        var raNum = raNumList[i];

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/person/deleteJob',
            data: {raNum : raNum},
            success: function() {
                alert('스크랩 삭제에 성공했습니다.');
                location.reload();
            },
            error: function(error) {
                alert("스크랩 삭제에 실패하였습니다.");
            }
        });
    }
}
	
	
	// '지원' 버튼 클릭 이벤트 처리
	const applyButtons = document.querySelectorAll('.apply-btn');
	applyButtons.forEach(button => {
	  button.addEventListener('click', function() {
	    // 마감일 정보 가져오기
	    const row = this.closest('tr');
	    const closeDate = row.querySelector('td:nth-child(4)').textContent;
	
	    // 마감일과 현재 날짜 비교
	    const today = new Date();
	    const closeDateObj = new Date(closeDate);
	
	    if (closeDateObj < today) {
	      // 마감일이 지난 경우 알림창 띄우기
	      alert('공고 마감일이 지났습니다.');
	    } else {
	      // 마감일이 지나지 않은 경우 모달창 띄우기
	      $('.apply').modal('show');
	    }
	  });
	});


	
	 // 입사지원 ajax
	 $(".apply-btn").click(function() {
	  var raNum = $(this).closest("tr").find("input[name=scrapCheckBox]").val(); // 해당 행의 raNum 값을 가져옴
	  $("#applyJobBtn").data("raNum", raNum); // 모달 내부의 지원하기 버튼에 raNum 값을 저장함
	});
	
	$("#applyJobBtn").click(function() {
	  var resumeNo = $("select[name=selectbox]").val(); // 선택된 이력서 번호
	  var raNum = $(this).data("raNum"); // 모달 내부에서 저장한 raNum 값을 가져옴
	
	  // checkApply 호출해 지원 여부 확인
	  $.ajax({
	    type: "POST",
	    url: "${pageContext.request.contextPath}/person/checkApply",
	    data: { raNum: raNum },
	    success: function (data) {  	
	      if (data == 0 ) {
	        // 입사지원
	        $.ajax({
	          url: '${pageContext.request.contextPath}/person/applyJob',
	          type: "POST",
	          data: { resumeNo: resumeNo, raNum: raNum },
	          success: function(response) {
	            $("#apply").modal("hide");
	            alert("입사지원이 완료되었습니다.");
	          },
	          error: function(error) {
	            alert("입사지원에 실패하였습니다.");
	          }
	        });
	      } else {   	  
	        // 입사 지원 불가
	        alert("이미 입사 지원한 공고입니다.");
	      }
	    },
	    error: function(error) {
	      console.log(error);
	    }
	  });
	});



	
	
	
	
	</script>
</body>
</html>