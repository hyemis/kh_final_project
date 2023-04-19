<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css file link part start -->
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/resources/css/recruit.insert.css" rel="stylesheet">
    <!-- css file link part end -->

<title>채용공고수정</title>

    <!-- js part start -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
    
    <!-- kakao map -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef072fe97e426b6ce05b6cb96feab5e&libraries=services"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/kakaomap.script.js"></script> --%>
	
    <!-- ckeditor5 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
	
	<!-- js part end -->
 
 </head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

<section>

	<div class="container-sm">
		<!-- 탭 -->
		<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link me-4 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">회사 정보</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link me-4" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">상세 내용 정보</button>
			</li>
		</ul>
	
		<form action="update" method="post" id="recruitContent" class="recruitContent" name="recruitContent" enctype="multipart/form-data" onsubmit="return checkVailed()">
		<input type="hidden" class="raNum" id="raNum" name="raNum" value="${redto.raNum }">
		<!-- 탭 내용 -->
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="nav-tab-1">
				<div class="justify-content-center">
				<!-- 1번에서 8번 -->
					<h3>회사 정보</h3>
						<!-- princple get.name으로 가져올 거 -->
						<table class="table table-borderless">
							<thead>
								<tr>
									<th scope="col" class="col-2"></th>
									<th scope="col" class="col-3"></th>
									<th scope="col" class="col-2"></th>
									<th scope="col" class="col-3"></th>
								</tr>
							</thead>
							<tbody>
								<tr class="mb-3 ">
									<td><label for="companyName">회사 이름</label></td>
									<td><input type="text" id="companyName" class="companyName form-control" name="companyName" value="${redto.companyName }"></td>
								</tr>
								<tr class="mb-3">
									<td><label for="category2dept">모집 분야</label></td>
									<td>
										<select id="category2dept" class="category2dept form-control" name="category2dept">
											<option value="0">선택안함</option>
										<c:forEach items="${JNlist}" var="categoryJN">
											<option value="${categoryJN.categoryId }" ${categoryJN.categoryId == cate2dept?'selected' : ''}>${categoryJN.categoryName}</option>
										</c:forEach>			
										</select>			
									</td>
									<td>
										<select id="recruitType" class="recruitType form-control" name="recruitType" style="text-overflow: ellipsis;">
											<option value="0">선택안함</option>
										<c:forEach items="${mlist }" var="list">
											<option value="${list.categoryId }" ${list.categoryId == redto.recruitType?'selected' : ''}>${list.categoryName}</option>
										</c:forEach>
										</select>
									</td>
								</tr>
								<tr class="mb-3">
									<td><label for="career">경력선택</label></td>
									<td>
									<select id="career" class="career form-control" name="career">
											<option value="0">선택안함</option>
										<c:forEach items="${CAlist}" var="categoryCA">
											<option value="${categoryCA.categoryId }" ${categoryCA.categoryName == redto.career? 'selected': ''}>${categoryCA.categoryName}</option>
										</c:forEach>
									</select>
									</td>
								</tr>
								<tr class="mb-3">
									<td><label for="userEducation">학력선택</label></td>
									<td>
									<select id="userEducation" class="userEducation form-control" name="userEducation">
										<option value="0">선택안함</option>
										<c:forEach items="${EDlist}" var="categoryED">
											<option value="${categoryED.categoryId }" ${categoryED.categoryName == redto.userEducation? 'selected': ''}>${categoryED.categoryName}</option>
										</c:forEach>
									</select>
									</td>
								</tr>
								<tr class="mb-3">
									<td><label for=minSalary>최소 연봉</label></td>
									<td><input type="text" id="minSalary" class="minSalary form-control" name="minSalary" placeholder="만원" value="${redto.minSalary}"></td>
									<td><label for=maxSalary>최대 연봉</label></td>
									<td><input type="text" id="maxSalary" class="maxSalary form-control" name="maxSalary" placeholder="만원" value="${redto.maxSalary}"></td>
								</tr>
								<!-- 체크박스로 처리한거 값들 배열로 받아서 xxx, xxx 순으로 넣기 -->
								<tr class="mb-3">
									<td>우대조건</td>
									<td colspan="2">
									<c:forEach items="${SClist}" var="categorySC" varStatus="status">
										<c:set var="check_flag" value=""/>
										<c:forEach items="${ctList}" var="ctList">
											<c:if test="${categorySC.categoryId == ctList }">
												<c:set var="check_flag" value="checked"/>
											</c:if>
										</c:forEach>
										<label><input type="checkbox" class="conditionTypeList" name="conditionTypeList" value="${categorySC.categoryId }" ${check_flag}>
										${categorySC.categoryName }</label>
									</c:forEach>
									</td>
								</tr>
								<!-- 이거는 변수명 바꿔서 리퀘스트 파람으로 컨트롤러에서
								받은 다음에 string 값으로 변환 -->
								<tr class="mb-3">
									<td><label for=registDate>지원등록 시작일</label></td>
									<td><input type="date" id="registDate" class="registDate form-control" name="registDate" value="${redto.registDate }"></td>
									<td><label for=closeDate>지원등록 마감일</label></td>
									<td><input type="date" id="closeDate" class="closeDate form-control" name="closeDate" value="${redto.closeDate }"></td>
								</tr>
								<!-- 10 11 20 21 카테고리 추가 필요 -->
								<tr class="mb-3">
									<td><label for="empTypeCode">고용형태</label></td>
									<td>
									<select id="empTypeCode" class="empTypeCode form-control" name="empTypeCode">
											<option value="0">선택안함</option>
										<c:forEach items="${ETlist}" var="categoryET">
											<option value="${categoryET.categoryId }" ${categoryET.categoryName == redto.empTypeCode? 'selected' : ''}>${categoryET.categoryName}</option>
										</c:forEach>
									</select>
									</td>
								</tr>
								<!-- 주 5일 주 6일 등등 카테고리 추가 해야됨-->
								<tr class="mb-3">
									<td><label for="holidayType">상세 근무 형태</label></td>
									<td>
									<select id="holidayType" class="holidayType form-control" name="holidayType">
											<option value="0">선택안함</option>
										<c:forEach items="${HTlist}" var="categoryHT">
											<option value="${categoryHT.categoryId }" ${categoryHT.categoryName ==redto.holidayType? 'selected' : ''}>${categoryHT.categoryName}</option>
										</c:forEach>
									</select>
									</td>
								</tr>
							</tbody>
						</table>					
					<div class="d-flex justify-content-end">
						<button type="button" class="btn btn-success my-3 nextbtn">다음</button>
					</div>
				</div>
				
			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="nav-tab-2">
				<div>
					<!-- 9번에서 16번 -->
					<h3>채용 정보</h3>
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
								<td><label for="raTitle">채용 공고 제목</label></td>
								<td colspan="2"><input type="text" id="raTitle" class="raTitle form-control" name="raTitle" value="${redto.raTitle }"></td>
							</tr>
							<tr>
								<td><label for="raContent">상세 내용</label></td>
								<td colspan="3"><textarea id="raContent" class="raContent form-control" name="raContent"></textarea></td>
							</tr>
							<tr>
								<td><label for="report">이력서 샘플</label></td>
								<td><input type="file" id="report" class="report form-control" name="report"></td>
								<c:if test="${redto.raExtraDocument != null}">
									<td><a class="btn btn-dark" href="${redto.raExtraDocument}" download>이력서 양식 다운로드</a></td>
								</c:if>
							</tr>
						</tbody>
					</table>
					<div class="d-flex justify-content-between">
						<button type="button" class="btn btn-success my-3 prevbtn">이전</button>
						<button type="submit" class="btn btn-success my-3 updatebtn">작성</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	</div>
	
</section>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>

	<script type="text/javascript">
	
		$(document).ready(function() {
			// 다음 버튼 클릭 시 다음 탭으로 이동
			$('.nextbtn').click(function() {
				var activeTab = $('.tab-pane.active');
				var nextTab = activeTab.next('.tab-pane');
				var activeNav = $('.nav-link.active');
				var nextNav = activeNav.parent().next().children('.nav-link');
				if (nextTab.length) {
					activeTab.removeClass('active show');
					nextTab.addClass('active show');
					activeNav.removeClass('active');
					nextNav.addClass('active');
				}
			});
			// 이전 버튼 클릭 시 이전 탭으로 이동
			$('.prevbtn').click(function() {
				var activeTab = $('.tab-pane.active');
				var prevTab = activeTab.prev('.tab-pane');
				var activeNav = $('.nav-link.active');
				var prevNav = activeNav.parent().prev().children('.nav-link');
				if (prevTab.length) {
					activeTab.removeClass('active show');
					prevTab.addClass('active show');
					activeNav.removeClass('active');
					prevNav.addClass('active');
				}
			});
			
			//category2dept 셀렉트 박스 클릭시 값 확인
			$('.category2dept').on('change', function(){
				let reqcategory = $(this).val();
	    		$.ajax({ 
	    			url: "${pageContext.request.contextPath}/business/recruit/catelist"
	    			, type: "post"
	    			, data:  {categoryId : reqcategory}
	    			, dataType:"json"
	    			, success: function(result){

		    				let htmlVal = '<option value="0">선택안함</option>';
		    				for(i = 0; i< result.length; i++){
		    					let list = result[i];
		    					'+list.categoryId+'
		    					htmlVal += '<option value="'+list.categoryId+'">'+list.categoryName+'</option>';
		    				}
		    				$(".recruitType").html(htmlVal);
	    			}
	    			, error: function(e){
	    				alert(e +" : 오류")
	    			}
	    		});
				
			});
		});
		
		//게시글 입력칸 체크
		function checkVailed() {
			let intCheck =  /^\d*$/;
			if(recruitContent.companyName.value == "" || /^\s+/.test(recruitContent.companyName.value)){
				alert("회사 이름을 입력해 주세요.");
				return false;
			}else if(recruitContent.category2dept.value == 0){
					alert("모집 분야를 선택해 주세요");
					return false;					
			}else if(recruitContent.career.value == 0){
				alert("경력 조건을 선택해 주세요.");
				return false;
			}else if(recruitContent.userEducation.value == 0){
				alert("학력 조건을 선택해 주세요.");
				return false;
			}
			else if(!intCheck.test(recruitContent.minSalary.value)){
				alert("연봉 정보에는 숫자만 입력해 주세요.");
				return false;
			}else if(!intCheck.test(recruitContent.maxSalary.value)){
				alert("연봉 정보에는 숫자만 입력해 주세요.");
				return false;
			}
			else if(recruitContent.registDate.value === ""){
				alert("공고 등록 일자를 선택해 주세요.");
				return false;
			}else if(recruitContent.closeDate.value === ""){
				alert("공고 마감 일자를 선택해 주세요.");
				return false;
			}else if(recruitContent.empTypeCode.value == 0){
				alert("고용 형태를 선택해 주세요.");
				return false;
			}else if(recruitContent.holidayType.value == 0){
				alert("근무 형태를 선택해 주세요.");
				return false;
			}else if(recruitContent.raTitle.value == ""){
				alert("채용 공고 제목을 입력해 주세요.");
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
    .create( document.querySelector( '#raContent' ),{
    	language: "ko"
    	, extraPlugins: [MyCustomUploadAdapterPlugin]
		, simpleUpload :{
			uploadUrl : 'imageUpload',
		}
    	
    	, config : {
    		height:'400px'
	   		, width:'100%'
    	}
    	/* then 부분이 내용 불러오는 부분 */
    }).then( newEditor => {
			 editor = newEditor;
				 editor.setData('${redto.raContent}');
 	})
    .catch( error => {
        console.error( error );
    });
	</script>

</body>

</html>