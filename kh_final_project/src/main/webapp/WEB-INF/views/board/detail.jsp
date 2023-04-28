<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 상세조회</title>
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
<link
	href="${pageContext.request.contextPath}/resources/css/recruit.insert.css"
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



<style>
.s {
	border: 1px solid gray;
	border-radius: 5px;
	padding: 30px;
}

img {
	width: 500px;
	height: 300px;
}
</style>

</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
		<div class="container-xxl py-5">
			<div class="container bg-white p-5">
				<div class="pb-4">
					<a href="${pageContext.request.contextPath}/board/postall"
						class="btn btn-outline-dark mx-1">전체글</a>
				</div>

				<div class="s">
					<h2>${detailBoard.boardTitle}</h2>
					<div class="d-flex justify-content-between">
						<div class="pe-3">${detailBoard.userId}</div>
						<div>${detailBoard.updateDate}</div>
						<div class="d-flex align-items-end ms-auto">
							<div class="fas fa-eye pe-3">조회 ${detailBoard.boardRead}</div>
							<div class="fas fa-heart" onclick="handleLike()">좋아요
								${detailBoard.boardLike}</div>
						</div>
					</div>
					<div class="pt-5">${detailBoard.boardContent}</div>

				</div>
				<hr>

				<div class="s viewReply">
					<c:forEach items="${replyList}" var="reply">
						<table class="reply-table" style="width: 100%;">
							<tr>
								<td class="pb-3" style="white-space: nowrap; overflow: hidden;">${reply.replyContent}</td>
								<td>
									<div class="d-flex justify-content-end align-items-center">
										 <sec:authorize access="hasRole('ROLE_P') and #reply.userId == authentication.name">
											<a class="" onclick="handleUpdateReply()">수정</a>
											<a class="me-2" onclick="handleDeleteReply(this)" data-reply-id="${reply.replyId}">삭제</a>
										</sec:authorize>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="d-flex justify-content-end ">
										<div class="ms-auto fw-light">
											<span>${reply.userId}</span> 님이 <span>${reply.replyCreateDate}</span>에
											작성
										</div>
									</div>
								</td>
							</tr>
						</table>

						<hr>
					</c:forEach>
				</div>
				<sec:authorize access="isAuthenticated()">
					<div class="d-flex">
						<input type="text" style="width: 100%;" 
							placeholder="위 고민과 같은 경험이 있거나, 알고 계신 정보가 있다면 조언 부탁드려요!">
						<div class="px-3">
							<button class="btn btn-outline-dark" type="button" onclick="handleReply()">댓글
								등록</button>
						</div>
					</div>
				</sec:authorize>
				<div class="pt-5 d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/board/postall"
						class="btn btn-outline-dark mx-1">목록</a>
				</div>

			</div>
		</div>
	</section>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
	<script>
		// 좋아요 증가 
		function handleLike() {
			const boardNo = ${detailBoard.boardNo};

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/board/updatelike",
				data : {
					boardNo : boardNo
				},
				success : function(response) {
					if (response.result === 'success') {
						location.reload();
					} else {
						alert('좋아요를 누르는데 실패했습니다.');
					}
				},
				error : function(xhr, status, error) {
					alert("에러 발생 : " + error);
				}
			});

		}
		
		
		// 댓글 작성
		function handleReply() {
		  const replyContent = $("input[type='text']").val();
		  const boardNo = ${detailBoard.boardNo};
		  
		  var params = {
		    replyContent: replyContent,
		    boardNo: boardNo
		  };
		  
		  $.ajax({
		    type: "POST",
		    url: "${pageContext.request.contextPath}/board/writereply",
		    data: params,
		    success : function(response) {
				if (response.result === 'success') {
					location.reload();
				} else {
					alert('댓글 등록에 실패했습니다.');
				}
			},
			error : function(xhr, status, error) {
				alert("에러 발생 : " + error);
			}
		  });
		}
		
		// 댓글 삭제 
		function handleDeleteReply(element) {
			  const replyId = element.dataset.replyId;

		  
		  
		  $.ajax({
		    type: "POST",
		    url: "${pageContext.request.contextPath}/board/deletereply",
		    data: {replyId:replyId},
		    success : function(response) {
		      if (response.result === 'success') {
		        location.reload();
		      } else {
		        alert('댓글 삭제에 실패했습니다.');
		      }
		    },
		    error : function(xhr, status, error) {
		      alert("에러 발생 : " + error);
		    }
		  });
		}
		
		// 댓글 수정 
		function handleUpdateReply() {
			
		}
	</script>

</body>
</html>
