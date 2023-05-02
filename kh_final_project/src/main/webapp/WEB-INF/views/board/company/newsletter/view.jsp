<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>기업뉴스레터</title>
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
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	

	
	<div class="container-xxl py-5">
		<div class="row g-0 gx-5 align-items-end">
			<div class="col-lg-6">
				<div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
					<h3 class="mb-3" >${news.userName }</h3>
				</div>
			</div>
			<div class="col-lg-6 text-start text-lg-end wow slideInRight"
				data-wow-delay="0.1s">
				<ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
					<li class="nav-item me-2"><a class="btn btn-outline-primary" data-bs-toggle="pill" onclick=" history.go(-1)">목록으로</a></li>
					<li class="nav-item me-2"><a class="btn btn-outline-primary" data-bs-toggle="pill" href="#">QnA</a></li>
				</ul>
			</div>
		</div>
		<div class="row g-0 gx-5 align-items-end">
			<div class="text-start mx-auto mb-5 wow slideInRight" data-wow-delay="0.1s">
				<h1 class="text-center">${news.boardTitle}</h1>
				<p class="text-end">작성일  : ${news.updateDate}</p>
				<div class="text-center m-5" id="boardContent">${news.boardContent }</div>
			</div>
		</div>	
		<div class="row ">
				<div class="col-2 text-center font-monospace">
					<h5>관련링크</h5>
				</div>
				<div class="col-10 ">
					<a type="text" id="link" name="link" href="https://news.kbs.co.kr/news/view.do?ncd=7663964">
					test 링크</a>
				</div>
		</div>		
		<div class="m-5 text-center">
			<c:if test="${not empty currentUserId and news.userId eq currentUserId}">
			  <button type="button" class="btn btn-outline-primary" onclick="location.href='update?no=${news.boardNo}'">수정</button>
			  <button type="button" class="btn btn-outline-primary delete">삭제</button>
			</c:if>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

	<script>
	
	$(document).ready(function() {
	  $(".delete").on("click", function() {
	    if (confirm("정말 삭제하시겠습니까?")) {
	      let userId = "${news.userId}";
	      let boardNo = "${news.boardNo}";      	
	      $.ajax({ 
	        url: "${pageContext.request.contextPath}/board/company/delete"
	        , type: "post"
	        , data:  {boardNo : boardNo, userId : userId}
	        , success: function(result){
	          if(result > 0){
	            location.href="${pageContext.request.contextPath}/business/aboutus/newsletter";
	            alert("삭제되었습니다")
	          }else if(result == -2){
	            alert("아이디 정보가 맞지 않습니다.");
	          }else{
	            alert("삭제에 실패 했습니다.");
	          }
	        }
	        , error: function(e){
	          alert(e +" : 오류")
	        }
	      });
	    }
	  });
	});
	</script>

	
	

	<script>
	function getArticleTitle(url) {
		  fetch(url)
		    .then(response => response.text())
		    .then(data => {
		      const parser = new DOMParser();
		      const htmlDoc = parser.parseFromString(data, 'text/html');
		      const title = htmlDoc.querySelector('title');
		      console.log(title.textContent);
		    })
		    .catch(error => console.error(error));
		}

		getArticleTitle('https://news.kbs.co.kr/news/view.do?ncd=7663964');
		
	</script>

	<!-- ckeditor5 -->
	<script	src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
	
	ClassicEditor
    .create( document.querySelector( '#boardContent' ),{
    	language: "ko"    
    	, config : {
    		height:'400px'
	   		, width:'100%'
    	}, toolbar: []
    }).then( newEditor => {
		 editor = newEditor;
    	editor.enableReadOnlyMode( '#boardContent' );
    })
    .catch( error => {
        console.error( error );
    });

</body>
</html>