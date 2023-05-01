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
	<a class="btn btn-primary" href="<%=request.getContextPath()%>/business/search" role="button">열람한 인재</a>
		
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
				</div>
			</div>
		</div>
	</div>
	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
	<script>

	$(document).ready(function() {
		  $('#btn-search').click(function() {
		    var jobType = $('#jobType').val();
		    var career = $('#career').val();
		    var education = $('#education').val();
		    var gender = $('#gender').val();

		    $.ajax({
		      url: '${pageContext.request.contextPath}/business/search/suggest',
		      type: 'POST',
		      data: {
		        jobType: jobType,
		        career: career,
		        education: education,
		        gender: gender
		      },
		      success: function(data) {
		    	  if (data.length === 0) {
		              $('#result-body').html('<tr><td colspan="4" class="text-center">이력서 정보가 없습니다</td></tr>');
		          } else {
		    	  var html = '';
                  for (var i = 0; i < data.length; i++) {
                      var resume = data[i];
                      html += '<tr>';
                      html += '<td class="text-center">' + resume.userName + '</td>';
                      html += '<td class="text-center"><a href="${pageContext.request.contextPath}/business/applicant/resume?resumeNo=' + resume.resumeNo +'">' + resume.resumeTitle + '</a></td>';
                      html += '<td class="text-center">' + resume.userEmail + '</td>';
                      html += '<td class="text-center"><a type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#interview">면접제안</a></td>';
                      html += '</tr>';
                  }
                  $('#result-body').html(html);
		         }
		      },
		      error: function(xhr) {
		        // Ajax 요청이 실패했을 때 실행할 코드
		    	console.log('검색 실패');
		      }
		    });
		  });
		});
	</script>
	
</body>
</html>