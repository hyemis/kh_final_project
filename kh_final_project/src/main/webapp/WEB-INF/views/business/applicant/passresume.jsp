<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>지원자 결과 관리</title>
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
	
	<link href="${pageContext.request.contextPath}/resources/css/recruit.insert.css" rel="stylesheet">
	
<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	<!-- ckeditor5 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>


	
</head>
<body>
<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- page section -->	
<section>
	<div class="container-fluid bg-white p-5">
		<div>
		<h3>결과 발표</h3>
			<form action="passresume" method="post" onsubmit="return passcheck()">
				<input type="hidden" name="applicantResume" value="${resumeNo }" />
				<input type="hidden" name="applicantNo" value="${baNum }" />
				<input type="hidden" name="applicantId" value="${passUserId }" />
				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col" class="col-2"></th>
							<th scope="col" class="col-3"></th>
							<th scope="col" class="col-3"></th>
							<th scope="col" class="col-3"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label for="userName">지원자 이름</label></td>
							<td><input type="text" id="userName" class="userName form-control" name="userName" value="${pudto.userName }" readonly></td>
						</tr>
						<tr>
							<td><label for="userPhone">지원자 연락처</label></td>
							<td><input type="text" id="userPhone" class="userPhone form-control" name="userPhone" value="${pudto.userPhone }" readonly></td>
						</tr>
						<tr>
							<td><label for="userEmail">지원자 이메일</label></td>
							<td><input type="text" id="userEmail" class="userEmail form-control" name="userEmail" value="${pudto.userEmail }" readonly></td>
						</tr>
						<tr>
							<td><label for="passType">합격 단계</label></td>
							<td>
								<select class="form-select passType" id="passType" name="passType">
									<c:forEach items="${PTlist }" var="list">
										<option value="${list.categoryId }">${list.categoryName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="resultTitle">결과 발표 제목</label></td>
							<td colspan="2"><input type="text" id="resultTitle" class="resultTitle form-control" name="resultTitle"></td>
						</tr>
						<tr>
							<td><label for="resultContent">결과 상세 내용</label></td>
							<td colspan="3"><textarea id="resultContent" class="resultContent form-control" name="resultContent"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="d-flex justify-content-between">
					<a class="btn btn-success my-3 prevbtn" href="javascript:window.history.back();">이전</a>
					<button type="submit" class="btn btn-success my-3 insertbtn">작성</button>
				</div>
			</form>
		</div>
	</div>
</section>

	
<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>	

<!-- page script -->


	<script type="text/javascript">
	
	function passcheck(){
		let selectType = $(".passType").val();
		let title = $(".resultTitle").val();
		let content = $(".resultContent").val();
		
		if(selectType =="" || selectType == null){
			alert("합격단계를 선택해주세요.");
			return false;
		}else if(title =="" || title == null){
			alert("결과 발표 제목을 입력해주세요.");
			return false;
		}else if(content =="" || content == null){
			alert("결과 발표 내용을 입력해주세요.");
			return false;
		}
		return true;
	}
	
	</script>

	<!-- ckeditor5 이미지 업로드를 위한 업로드 어뎁터 추가  -->
	<script type="text/javascript">
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
    .create( document.querySelector( '#resultContent' ),{
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
    
    
    
    
	</script>
</body>
</html>
