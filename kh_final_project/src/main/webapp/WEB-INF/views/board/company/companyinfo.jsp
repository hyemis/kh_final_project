<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JOB-A 회사 소개</title>


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
		<div class="container-fluid bg-white p-5">
			<h3>회사소개 리스트</h3>
		</div>
<div class="row">
	<c:forEach items="${info.getPage() }" var="info">
	<div class="col p-3">
		<div class="card">
		  <div class="card-header" style="display: flex; align-items: center;">
		  	<div>
		  		<a>${info.userName }</a>
		  	</div>
		  	
   		 		<!-- 관심기업으로 스크랩 -->
				<sec:authorize access="hasRole('ROLE_P')">
				    <div class="icon-container ml-auto" style="margin-left: 5px;">
				        <i class="far fa-heart" onclick="toggleHeart(this)"></i>
				        <input type="hidden" name="companyId" value="${info.userId}" />
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


	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



<script>




//하트 클릭 - 관심기업 스크랩 ajax
function toggleHeart(icon) {
  const companyId = icon.parentElement.querySelector('[name=companyId]').value;
  $.ajax({
    type: 'POST',
    url: '${pageContext.request.contextPath}/person/checkComScrap',
    data: {companyId: companyId},
    success: function(data) {
      if (data == 0) {
        // 관심기업 추가
        $.ajax({
          type: 'POST',
          url: '${pageContext.request.contextPath}/person/scrapCompany',
          data: {companyId: companyId},
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
          data: {companyId: companyId},
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



// 페이지 로드 시 실행되는 함수
window.onload = function() {
    // 모든 companyId 값 가져오기
    const companyIds = $("input[name='companyId']");

    // AJAX를 이용해 스크랩 여부 확인
    for(let i=0; i<companyIds.length; i++) {
        const companyId = companyIds[i].value;

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/person/checkComScrap',
            data: {companyId: companyId},
            success: function(data) {
                // 스크랩 여부에 따라 별 상태 변경
                if(data == 1) {
                    $(".icon-container i").eq(i).removeClass("far").addClass("fas");
                } else {
                    $(".icon-container i").eq(i).removeClass("fas").addClass("far");
                }
            }
        });
    }
}




</script>


</body>


</html>
