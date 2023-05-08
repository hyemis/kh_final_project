<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>write</title>
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

<!-- ckeditor5 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>

<style>
.s {
	margin-bottom: 10px;
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
				<div class="d-flex justify-content-between align-items-center pb-4">
					<h2 class="mb-0">카테고리</h2>
				</div>
				<form action="${pageContext.request.contextPath}/board/writepost"
					method="post" id="writePost" class="writePost" name="writePost"
					enctype="multipart/form-data">
					<div class="s row">
						<div class="col-2">
							<select class="form-select" id="categoryId"
								aria-label="Default select example" name="categoryId">
								<option value="0">선택안함</option>
								<c:forEach items="${UBDlist}" var="categoryUBD">
									<option value="${categoryUBD.categoryId }">${categoryUBD.categoryName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-10">
							<input type="text" class="form-control" id="boardTitle"
								placeholder="제목을 입력해주세요." name="boardTitle">
						</div>
					</div>

					<div class="s">
						<div class="justify-content-center align-items-center mb-3">
							<textarea name="boardContent" class="boardContent form-control"
								id="boardContent"></textarea>
						</div>
					</div>

					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="submit" class="btn btn-outline-dark btn-submit" onclick="return checkAll()">게시글
							등록</button>
					</div>
				</form>
			</div>
		</div>
	</section>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
	<script>
		// 
		   function checkExistData(value, dataName) {
        if (value.trim() === "") {
            alert(dataName + "을(를) 입력해주세요!");
            return false;
        }
        return true;
    }

    function checkAll() {
        if (!checkExistData(document.getElementById("boardTitle").value, "제목")) {
            return false;
        } else if (!checkExistData(document.getElementById("boardContent").value, "내용")) {
            return false;
        }
        return true;
    }
	
	
		//CKEditor
		class UploadAdapter {
		    constructor(loader) {
		        this.loader = loader;
		    }

		    upload() {
		        return this.loader.file.then( file => new Promise(((resolve, reject) => {
		            this._initRequest();
		            this._initListeners( resolve, reject, file );
		            this._sendRequest( file );
		        })))
		    }

		    _initRequest() {
		        const xhr = this.xhr = new XMLHttpRequest();
		        xhr.open('POST', 'imageUpload', true);
		        xhr.responseType = 'json';
		        console.log(xhr);
		        console.log(xhr.response);
		    }

		    _initListeners(resolve, reject, file) {
		        const xhr = this.xhr;
		        const loader = this.loader;
		        const genericErrorText = '파일을 업로드 할 수 없습니다.'

		        xhr.addEventListener('error', () => {reject(genericErrorText)})
		        xhr.addEventListener('abort', () => reject())
		        xhr.addEventListener('load', () => {
		            const response = xhr.response
		            console.log(response);
		            if(!response || response.error) {
		                return reject( response && response.error ? response.error.message : genericErrorText );
		            }

		            resolve({
		                default: response.url //업로드된 파일 주소
		            })
		        })
		    }

		    _sendRequest(file) {
		        const data = new FormData();
		        data.append('upload',file);
		        this.xhr.send(data);
		    }
		}
		
		function MyCustomUploadAdapterPlugin(editor) {
		    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
		        return new UploadAdapter(loader)
		    }
		}
		
		
	    ClassicEditor
	    .create( document.querySelector( '#boardContent' ),{
	    	language: "ko"
	    	, extraPlugins: [MyCustomUploadAdapterPlugin]
			, simpleUpload :{
				uploadUrl : 'imageUpload',
			}
	    	
	    	, config : {
	    		height:'400px'
		   		, width:'100%'
	    	}
	    })
	    .catch( error => {
	        console.error( error );
	    });
	    
	    // 제목 글자 수 
	    $(document).ready(function() {
	    	 $('#boardTitle').keyup(function() {
	    	        var byteLength = (function(s,b,i,c){
	    	            for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	    	            return b
	    	        })(this.value);
	    	        if (byteLength > 100) {
	    	            alert('제목은 50자 이내로 입력해주세요.');
	    	            $(this).val('');
	    	        }
	    	    });
	    });
	    </script>

</body>
</html>
