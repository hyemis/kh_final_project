<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>인재찾기</title>
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
	<a class="btn btn-primary" href="<%=request.getContextPath()%>/business/search" role="button">면접 제안 리스트</a>
		
		<!-- 검색창 -->
		<div class="container-fluid row mt-3">
			<select class="col m-3 form-select" id="jobType" name="jobType">
				<option selected value="">직종</option>
				<option value="">선택안함</option>
				<c:forEach items="${JNlist}" var="categoryJN">
				<option value="${categoryJN.categoryId }" ${categoryJN.categoryId == pdto.searchNum? 'selected':'' }>${categoryJN.categoryName}</option>
				</c:forEach>
			</select>
			<select class="col m-3 form-select" id="career" name="career">
				<option selected value="">경력</option>
				<option value="">선택안함</option>
				<c:forEach items="${CAlist}" var="categoryCA">
				<c:if test="${categoryCA.categoryId != 'CA03'}">
				<option value="${categoryCA.categoryId }">${categoryCA.categoryName}</option>
				</c:if>
				</c:forEach>
			</select>
			<select class="col m-3 form-select" id="education" name="education">
				<option selected value="" >학력</option>
				<option value="">선택안함</option>
				<c:forEach items="${EDlist}" var="categoryED">
				<c:if test="${categoryED.categoryId != 'ED01'}">
				<option value="${categoryED.categoryId }">${categoryED.categoryName}</option>
				</c:if>
				</c:forEach>
			</select>
			<select class="col m-3 form-select" id="gender" name="gender">
				<option selected value="">성별</option>
				<option value="">선택안함</option>
				<c:forEach items="${SElist}" var="categorySE">
				<c:if test="${categorySE.categoryId != 'SE03'}">
				<option value="${categorySE.categoryId }">${categorySE.categoryName}</option>
				</c:if>	
				</c:forEach>
			</select>
			<button class="col-1 m-3 btn btn-primary" id="btn-search" type="button">검색</button>
		</div>	
	

		<!-- 목록 -->
		<c:set var="pageNumber" value="${empty pnum ? 1 : pnum }" />
		<div class="table-responsive mt-5">
		<table class="table table-hover">
			  <thead>
			    <tr class="text-center">
			        <th scope="col">이름</th>
			        <th scope="col">이력서</th>
			        <th scope="col">이메일</th>
			        <th scope="col">면접제안하기</th>
			    </tr>
			  </thead> 
			  <tbody id="result-body">
			  </tbody>
	   </table> 
	   <!-- 페이지네이션  -->
	 	<ul class = "pagination text-center justify-content-center">
		</ul>
	</div>
	</div>
</section>


	<!-- Modal -->
	<div class="modal fade" id="interviewModal" data-bs-backdrop="static"
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
				<form action="<%=request.getContextPath()%>/business/search/suggestForm" method="post">
				<div class="modal-body">
						<input type="text" class="form-control" id="user_id" name="psUser"  style="display: none;">
						<input type="text" class="form-control" id="resume_no" name="resumeNo" style="display: none;">
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>면접대상자</h4>
							</div>
							<div class="col-10 was-validated">
								<input type="text" class="form-control" id="user_name" >
							</div>
						</div>
						<div class="pt-3 row">
							<div class="col-2 text-center font-monospace">
								<h4>제안 공고</h4>
							</div>
							<div class="col-10">
								<select class="form-select" id="recruitSelect" name="raNum"  onchange="showSgTitle()">
										<c:forEach items="${recruit }" var="recruit">
										<option value="${recruit.raNum }">${recruit.raTitle}</option>
										</c:forEach>
								</select>
							</div>
						</div>

						<div class="pt-3 row ">
							<div class="col-2 text-center font-monospace">
								<h4>제목</h4>
							</div>
							<div class="col-10 was-validated">
								<input type="text" class="form-control is-invalid" 
									name="sgTitle" value="안녕하세요  ${info.userName }에서 면접제안드립니다." required>
							</div>
						</div>
						<div class="pt-3 row ">
							<div class="col-2 text-center font-monospace">
								<h4>내용</h4>
							</div>
							<div class="col-10 was-validated">
								<input type="text" class="form-control is-invalid"
									name="sgContent" placeholder="내용을 입력해주세요" required>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-light"
								data-bs-dismiss="modal">취소</button>
							<button type="reset" class="btn btn-light">초기화</button>	
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
	<script>
	let page = 1;
	$(document).ready(function() {
		  $('#btn-search').click(getSearchResume);
	});
	function getSearchResume() {
	    var jobType = $('#jobType').val();
	    var career = $('#career').val();
	    var education = $('#education').val();
	    var gender = $('#gender').val();
	    page = (!$(this).data("page")) ? 1 : $(this).data("page");
	    $.ajax({
	      url: '${pageContext.request.contextPath}/business/search/search',
	      type: 'POST',
	      data: {
	        jobType: jobType,
	        career: career,
	        education: education,
	        gender: gender,
	        page: page
	      },
	      success: function(data) {
	    	  console.log(data);
	    	  displayResume(data);
              displayPage(data);
	      },
	      error: function(xhr) {
	        // Ajax 요청이 실패했을 때 실행할 코드
	    	console.log('검색 실패');
	      }
	    });
	}// getSearchResume
	function displayResume(data){
		if (data.page.length === 0) {
            $('#result-body').html('<tr><td colspan="4" class="text-center">이력서 정보가 없습니다</td></tr>');
        } else {
 	  	  var html = '';
      	  for (var i = 0; i < data.page.length; i++) {
            var resume = data.page[i];
            html += '<tr>';
            html += '<td class="text-center">' + resume.userName + '</td>';
            html += '<td class="text-center"><a href="${pageContext.request.contextPath}/business/applicant/resume?resumeNo=' + resume.resumeNo +'">' + resume.resumeTitle + '</a></td>';
            html += '<td class="text-center">' + resume.userEmail + '</td>';
            html += '<td class="text-center"><a type="button" class="btn btn-light interview" data-bs-target="#interview" data-resumeno="'+resume.resumeNo+'" data-userid="'+resume.userId+'" data-username="'+resume.userName+'">면접제안</a></td>';
            html += '</tr>';
          }
          $('#result-body').html(html);
          //면접제안 버튼을 누르면 실행할 함수
          $(".btn.interview").on("click", function() {
          	  $('.modal-body #user_id').val($(this).data("userid")); //user_id에  userId값 넣기
          	  $('.modal-body #user_name').val($(this).data("username")); //username에  userName값 넣기
          	  $('.modal-body #resume_no').val($(this).data("resumeno")); //resumeno에  resumeNo값 넣기
        	  $("#interviewModal").modal("show"); 
        	});
		}
	}//displayResume
	function displayPage(data){
		var pageHtml = '';
		if(data.prevPage == -1){
			pageHtml+='<li class="page-item disabled"><a class="page-link">prev</a></li>';
		}else{
			pageHtml+='<li class="page-item"><a class="page-link" data-page="'+data.prevPage+'">prev</a></li>';
		}
		data.pageList.forEach(function(pNum){
			console.log(pNum);
			if(pNum==data.currentPage){
			pageHtml+='<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/business/search/suggest?page='+pNum+'">'+pNum+'</a></li>';
			}else {
			pageHtml+='<li class="page-item "><a class="page-link" data-page="'+pNum+'">'+pNum+'</a></li>';
			}
		});  // forEach
		if(data.nextPage == -1){
			pageHtml+='<li class="page-item disabled"><a class="page-link">next</a></li>';
		}else{
			pageHtml+='<li class="page-item"><a class="page-link"  data-page="'+data.nextPage+'">next</a></li>';
		}
		
	 $('ul.pagination').html(pageHtml);
	 $('.page-link').click(getSearchResume);
	}// displayPage
	</script>
	

	
</body>
</html>