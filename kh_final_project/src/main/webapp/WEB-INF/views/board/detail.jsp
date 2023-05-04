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
	href="${pageContext.request.contextPath}/resources/css/board.css"
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

<!-- ckeditor5 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>

</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
		<div class="container-xxl py-5">
			<div class="container bg-white p-5">
				

				<div class="s originPost">
					<div class="d-flex justify-content-end align-items-center">
						<sec:authorize access="hasRole('ROLE_P') and #detailBoard.userId == authentication.name">
								<a class="pe-2" onclick="handleUpdatePost()">수정</a>
								<a class="" onclick="handleDeletePost()">삭제</a>
						</sec:authorize>
					</div> 
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

				<div class="viewReply">
			    <c:forEach items="${replyList}" var="reply">
			        <table class="reply-table ${reply.replyLevel eq 2 ? 'subReply-parent' : ''}">
			            <c:choose>
			                <c:when test="${reply.replyLevel ne 2}">
			                    <td class="pb-3 originReply reply-cell">${reply.replyContent}</td>
			                </c:when>
			                <c:otherwise>
			                    <td class="pb-3 subReply reply-cell">${reply.replyContent}</td>
			                </c:otherwise>
			            </c:choose>
			            <td class="text-end">
			                <div class="d-flex justify-content-end align-items-center">
			                    <sec:authorize access="hasRole('ROLE_P') and #reply.userId == authentication.name">
			                        <a class="" onclick="handleUpdateReply(this)" data-reply-id="${reply.replyId}">수정</a>
			                        <a class="ms-2" onclick="handleDeleteReply(this)" data-reply-id="${reply.replyId}">삭제</a>
			                    </sec:authorize>
			                    <sec:authorize access="isAuthenticated()">
			                        <a class="ms-2" onclick="handleInsertReReply(this)" data-reply-id="${reply.replyId}">답글</a>
			                        <input type="hidden" name="replyLevel" value="${reply.replyLevel}">
			                        <input type="hidden" name="replySeq" value="${reply.replySeq}">
			                    </sec:authorize>
			                </div>
			                <div class="text-muted small">
			                    <span>${reply.userId}</span> 님이 <span>${reply.replyCreateDate}</span>에 작성
			                </div>
			            </td>
			        </table>
			        <hr>
			    </c:forEach>
			</div>
				<sec:authorize access="isAuthenticated()">
					<div class="d-flex pt-3">
						<input type="text" style="width: 100%;"
							placeholder="위 고민과 같은 경험이 있거나, 알고 계신 정보가 있다면 조언 부탁드려요!">
						<div class="ps-3">
							<button class="btn btn-outline-dark" type="button"
								onclick="handleReply()">댓글 등록</button>
						</div>
					</div>
				</sec:authorize>
					
				<div>

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
		
		// 글 삭제 
		function handleDeletePost() {
			const boardNo = ${detailBoard.boardNo};

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/board/deletepost",
				data : {boardNo : boardNo},
				success : function(response) {
					if (response.result === 'success') {
						alert('게시글이 삭제되었습니다.');
						window.close();
					} else {
						alert('게시글 삭제에 실패했습니다.');
					}
				},
				error : function(xhr, status, error) {
					alert("에러 발생 : " + error);
				}
			});

		}
		
		// 게시글 수정 
		function handleUpdatePost() {
        const boardNo = ${detailBoard.boardNo};

        // 게시글 수정 영역 생성
        const updateDiv = document.createElement("div");
        updateDiv.innerHTML = `
        	<hr>
        	<div class="p-3">
            <div class="mb-3">
                <label for="boardTitle" class="form-label">제목</label>
                <input type="text" class="form-control" id="boardTitle" value="${detailBoard.boardTitle}">
            </div>
            <div class="mb-3">
                <label for="boardContent" class="form-label">내용</label>
                <div id="editor">${detailBoard.boardContent}</div>
            </div>
            <button type="submit" class="btn btn-primary" onclick="updatePost(${boardNo})">수정</button>
            </div>
        `;
        document.querySelector(".originPost").appendChild(updateDiv);

	        // CKEditor 초기화
	        ClassicEditor.create(document.querySelector("#editor"))
	        .then(editor => {
	            window.editor = editor;
	        })
	        .catch(error => {
	            console.error(error);
	        });
	    }
	
	    function updatePost(boardNo) {
	        const boardTitle = document.querySelector("#boardTitle").value;
	        const boardContent = window.editor.getData();
	
	        const params = {
	            boardNo: boardNo,
	            boardTitle: boardTitle,
	            boardContent: boardContent
	        };
	
	        $.ajax({
	            type : "POST",
	            url : "${pageContext.request.contextPath}/board/updatepost",
	            data : params,
	            success : function(response) {
	                if (response.result === 'success') {
	                    location.reload();
	                } else {
	                    alert('게시글 수정에 실패했습니다.');
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
				replyContent : replyContent,
				boardNo : boardNo
			};

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/board/writereply",
				data : params,
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
				type : "POST",
				url : "${pageContext.request.contextPath}/board/deletereply",
				data : {
					replyId : replyId
				},
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
		function handleUpdateReply(element) {
			const replyId = element.dataset.replyId;
			const oldContent = element.closest(".reply-table").querySelector(
					".originReply").innerText; // 기존 댓글 내용 가져오기

			const htmlVal = '<div class="m-3 mdeptList" style="min-height: 200px;">'
					+ '<input type="hidden" id="replyId" name="replyId" value="' + replyId + '">'
					+ '<div class="d-flex justify-content-between">'
					+ '<input type="text" style="width: 100%;  height: 62px;" id="newContent" name="newContent" value="'
					+ oldContent
					+ '">'
					+ '<button class="btn btn-outline-dark ms-2" type="button" onclick="submitUpdate()">수정</button>'
					+ '</div>' + '</div>';

			// 새로운 input 태그를 추가한 후 기존 댓글 대신에 보여주기
			element.closest(".reply-table").innerHTML = htmlVal;
		}

		function submitUpdate() {
			const replyId = document.getElementById("replyId").value;
			const newContent = document.getElementById("newContent").value;

			const params = {
				replyId : replyId,
				replyContent : newContent
			};

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/board/updatereply",
				data : params,
				success : function(response) {
					if (response.result === 'success') {
						location.reload();
					} else {
						alert('댓글 수정에 실패했습니다.');
					}
				},
				error : function(xhr, status, error) {
					alert("에러 발생 : " + error);
				}
			});
		}
		
		
		// 답글 작성
		function handleInsertReReply(element) {
		  const replyId = element.dataset.replyId;
		  const htmlVal = '<div class="m-3 mdeptList">'
		      + '<input type="hidden" id="replyId" name="replyId" value="' + replyId + '">'
		      + '<input type="hidden" name="replyLevel" value="${reply.replyLevel}">'
		      + '<input type="hidden" name="replySeq" value="${reply.replySeq}">'
		      + '<div class="d-flex justify-content-between">'
		      + '<input type="text" style="width: 100%;  height: 62px;" id="newContent" name="newContent" value="'
		      + '">'
		      + '<button class="btn btn-outline-dark ms-2" type="button" onclick="submitReReply()">등록</button>'
		      + '</div>' + '</div>';

		  const parent = element.parentNode.parentNode;
		  const newDiv = document.createElement('div');
		  newDiv.innerHTML = htmlVal;
		  parent.insertBefore(newDiv, element.parentNode.nextSibling);
		}
		
		// 대댓글 등록 함수
		function submitReReply() {
		  const boardNo = ${detailBoard.boardNo};
		  const replyId = document.querySelector("#replyId").value;
		  const replyLevel = document.querySelector("input[name=replyLevel]").value;
		  
		  const replyContent = document.querySelector("#newContent").value;

		  const params = {
			boardNo: boardNo, 
		    replyId: replyId,
		    replyLevel: replyLevel,
		    replyContent: replyContent
		  };

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/board/insertrereply",
				data : params,
				success : function(response) {
					if (response.result === 'success') {
						location.reload();
					} else {
						alert('답글 등록에 실패했습니다.');
					}
				},
				error : function(xhr, status, error) {
					alert("에러 발생 : " + error);
				}
			});
		}
		
		
	
	</script>

</body>
</html>
