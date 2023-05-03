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

<style>

.icon-container i.fas {
  color: red;
}

</style>



<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- page section -->
<section>
<div class="container-fluid bg-white p-5">
 기업 회사 소개 리스트
<div class="row">
	<c:forEach items="${info.getPage() }" var="info">
	<div class="col p-3">
		<div class="card">
		  <div class="card-header" style="display: flex; align-items: center;">
		  	<div>
		  		<a>${info.userName }</a>
		  	</div>
		  	
   		 		<!-- 채용공고 스크랩 -->
				<sec:authorize access="hasRole('ROLE_P')">
				<div class="icon-container ml-auto" style="margin-left: 5px;">
		  			<i class="far fa-heart" onclick="toggleHeart(this)"></i>
				</div>
				</sec:authorize> 
				
		  </div>
		  <div class="card-body">
		    <h5 class="card-title">${info.boardTitle }</h5>
		    <p class="card-text">${info.tag }</p>
		    <a href="${pageContext.request.contextPath}/board/company/companyinfo/view?no=${info.boardNo }" class="btn btn-primary">이동</a> 
		  </div>
		</div>
	</div>
	</c:forEach>
</div>


	 	<!-- 페이지네이션  -->
		 	<ul class = "pagination text-center justify-content-center">
				<c:choose>
					<c:when test="${info.prevPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">prev</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/company/companyinfo?p=${list.prevPage }">prev</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="pNum" items="${info.pageList }">
					<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${pageContext.request.contextPath}/board/company/companyinfo?p=${pNum}">${pNum }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${info.nextPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/company/companyinfo?p=${list.nextPage }">next</a></li>
					</c:otherwise>
				</c:choose>					
			</ul>	

</div>
</section>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



<script>

// 페이지 로드 시 실행되는 함수
window.onload = function() {
    // companyName 값 가져오기
    var companyName = ${info.userName };
    // AJAX를 이용해 스크랩 여부 확인
    $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/person/checkComScrap',
        data: {companyName: companyName},
        success: function(data) {
            // 스크랩 여부에 따라 하트 상태 변경
            if(data == 1) {
                $(".icon-container i").removeClass("far").addClass("fas");
            } else {
                $(".icon-container i").removeClass("fas").addClass("far");
            }
        }
    });
}


//하트 클릭 - 관심기업 스크랩 ajax
function toggleHeart(icon) {
const isFilled = icon.classList.contains('fas');

var companyName = '${info.userName }';

$.ajax({
   type: 'POST',
   url: '${pageContext.request.contextPath}/person/checkComScrap',
   data: {companyName : companyName},
   success: function(data) {
     if (data == 0 ) {
   	  //스크랩 정보 추가
       $.ajax({
           type: 'POST',
           url: '${pageContext.request.contextPath}/person/scrapCompany',
           data: {companyName : companyName},
           success: function() {
             icon.classList.remove('far');
             icon.classList.add('fas');
           },
           error: function(error) {
           	alert("관심기업 등록에 실패하였습니다.");
           }
         });
     } else {   	  
       // 관심기업 삭제
       $.ajax({
         type: 'POST',
         url: '${pageContext.request.contextPath}/person/deleteCompany',
         data: {companyName : companyName},
         success: function() {
           icon.classList.remove('fas');
           icon.classList.add('far');
         },
         error: function(error) {
      		alert("관심기업 삭제에 실패하였습니다.");
         }
       });

     }
   },
   error: function(error) {
     console.log(error);
   }
 });
}



</script>


</body>


</html>
