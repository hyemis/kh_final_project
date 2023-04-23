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
<link
	href="${pageContext.request.contextPath}/resources/css/business.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/recruit.insert.css" rel="stylesheet">

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
	<!-- haeder  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
		<div class="container-fluid  p-5">
			<h1>회사소개</h1>

			<div class="row">
				<div class="col-md-3 col-sm-4  border border-secondary">
					<div class="team-item rounded overflow-hidden">
						<div class="position-relative">
							<img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/template/makaan/img/team-1.jpg"
								alt="">
							<div
								class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
								<a class="btn btn-square mx-1" href=""><i
									class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
									href=""><i class="fab fa-twitter"></i></a> <a
									class="btn btn-square mx-1" href=""><i
									class="fab fa-instagram"></i></a>
							</div>
						</div>
						<div class="text-center p-4 mt-3">
							<h5 class="fw-bold mb-0">${userinfo.userName }</h5>
							<small>${userinfo.userEmail }</small>
						</div>
						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action">바로가기</a>
							<a href="#" class="list-group-item list-group-item-action">바로가기</a>
							<a href="#" class="list-group-item list-group-item-action">바로가기</a>
						</div>
					</div>

				</div>
				<div class="col-md-8 col-sm-8 border border-secondary">
					<!-- 회사소개 -->
					<div class="border border-secondary">
						<h1>회사소개</h1>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#companyinfo">등록 및 수정</button>
						<a class="btn btn-light" href="<%=request.getContextPath()%>/business/aboutus/companyinfo" role="button">회사소개 페이지로 이동</a>
					</div>
					<!-- 뉴스레터 -->
					<div class="border border-secondary">
						<h1>뉴스레터</h1>
						<div>
						<a class="btn btn-light" href="<%=request.getContextPath()%>/business/aboutus/newsletter" role="button">더보기</a>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#newsletter">등록</button>
						</div>


						<!-- 뉴스레터 보기 -->
						<div class="container">
							<c:forEach items="${news}" var="news">
								<div class="row">
									<div class="col">
										<div class="card">
											<h5 class="card-header">${news.boardTitle }</h5>
											<div class="card-body">
												<div class="card-text">${news.boardContent }</div>
												<a href="" class="btn btn-primary">게시글보기</a>
											</div>
										</div>
									</div>
									<div class="col">
										<div class="card">
											<h5 class="card-header">${news.boardTitle }</h5>
											<div class="card-body">
												<div class="card-text">${news.boardContent }</div>
												<a href="" class="btn btn-primary">게시글보기</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- Q&A -->
					<div class="border border-secondary">
						<h1>Q&A</h1>
						<button type="button" class="btn btn-light"
							href="<%=request.getContextPath()%>/business/aboutus/qna">더보기</button>
						<!-- 숫자 인덱스	 -->
						<div class="num-container row" id="num-container">
							<div class="col num-item">
								<h4 class="in-title">게시글 수</h4>
								<span class="nums" data-count="180">0</span><span id="num-unit">개</span><br>
							</div>
							<div class="col num-item">
								<h4 class="in-title">미답변 게시글</h4>
								<span class="nums" data-count="1143">0</span><span id="num-unit">개</span><br>
							</div>
							<div class="col num-item">
								<h4 class="in-title">답변완료 게시글</h4>
								<span class="nums" data-count="34">0</span><span id="num-unit">개</span><br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Modal -->
	<!-- 회사소개 -->
	<div class="modal fade" id="companyinfo" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-fullscreen modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">


				<div class="modal-header">
					<h3 class="modal-title text-center" id="staticBackdropLabel">회사소개
						작성</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath }/business/aboutus/infoform" method="post"
						enctype="multipart/form-data">
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>기업이름</h4>
							</div>
							<div class="col-10 ">
								<input type="text" name="boardTitle"
									style="width: 30%;" placeholder="기업이름을 적어주세요" > 
								<hr>
							</div>
						</div>
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>직 원 수</h4>
							</div>
							<div class="col-10 ">
								<p>직원수를 숫자로 입력해주세요</p>
								<input type="text" name="employee"
									style="width: 30%;" placeholder=" 예시)300"> 명
								<hr>
							</div>
						</div>
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>평균연봉</h4>
							</div>
							<div class="col-10 ">
								<p>회사의 평균 연봉을 입력해주세요</p>
								<input type="text"
									name="salaryAvg" style="width: 30%;" placeholder=" 예시)3500"> 만원
								<hr>
							</div>
						</div>

						<div class="row ">
							<div class="col-2 text-center">
								<h4>태그</h4>
							</div>
							<div class="col-10 text-start">
								<p>
									<a class="fw-bold">근무/휴가</a> <input type="checkbox" name="tag"
										value="유연근무">유연근무 <input type="checkbox" name="tag"
										value="재택근무">재택근무 <input type="checkbox" name="tag"
										value="주35시간">주35시간 <input type="checkbox" name="tag"
										value="주4일근무">주4일근무 <input type="checkbox" name="tag"
										value="육아휴직">육아휴직 <input type="checkbox" name="tag"
										value="출산휴가">출산휴가 <input type="checkbox" name="tag"
										value="리프레시휴가">리프레시휴가
								</p>
								<p>
									<a class="fw-bold">보상</a> <input type="checkbox" name="tag"
										value="성과금">성과금 <input type="checkbox" name="tag"
										value="상여금">상여금 <input type="checkbox" name="tag"
										value="연말보너스">연말보너스 <input type="checkbox" name="tag"
										value="스톡옵션">스톡옵션
								</p>
								<p>
									<a class="fw-bold">기업문화</a> <input type="checkbox" name="tag"
										value="수평적조직">수평적조직 <input type="checkbox" name="tag"
										value="스타트업">스타트업 <input type="checkbox" name="tag"
										value="자율복장">자율복장 <input type="checkbox" name="tag"
										value="워크샵">워크샵 <input type="checkbox" name="tag"
										value="반려동물">반려동물
								</p>
								<p>
									<a class="fw-bold">편의</a> <input type="checkbox" name="tag"
										value="식비지원">식비지원 <input type="checkbox" name="tag"
										value="간식제공">간식제공 <input type="checkbox" name="tag"
										value="사내카페">사내카페 <input type="checkbox" name="tag"
										value="사내식당">사내식당 <input type="checkbox" name="tag"
										value="주차">주차 <input type="checkbox" name="tag"
										value="수면실">수면실 <input type="checkbox" name="tag"
										value="휴게실">휴게실 <input type="checkbox" name="tag"
										value="헬스장">헬스장 <input type="checkbox" name="tag"
										value="안마의자">안마의자
								</p>

								<p>
									<a class="fw-bold">지원</a> <input type="checkbox" name="tag"
										value="택시비">택시비 <input type="checkbox" name="tag"
										value="셔틀버스">셔틀버스 <input type="checkbox" name="tag"
										value="차량지원">차량지원 <input type="checkbox" name="tag"
										value="기숙사">기숙사 <input type="checkbox" name="tag"
										value="건강검진">건강검진 <input type="checkbox" name="tag"
										value="동호회">동호회 <input type="checkbox" name="tag"
										value="복지포인트">복지포인트 <input type="checkbox" name="tag"
										value="문화비">문화비 <input type="checkbox" name="tag"
										value="운동비">운동비 <input type="checkbox" name="tag"
										value="자기계발비">자기계발비
								</p>

								<p>
									<a class="fw-bold">교육</a> <input type="checkbox" name="tag"
										value="교육비">교육비 <input type="checkbox" name="tag"
										value="도서구매비">도서구매비 <input type="checkbox" name="tag"
										value="직무교육">직무교육 <input type="checkbox" name="tag"
										value="세미나비">세미나비 <input type="checkbox" name="tag"
										value="어학교육">어학교육 <input type="checkbox" name="tag"
										value="해외연수">해외연수
								</p>
								<hr>
							</div>
						</div>
					
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>기업사진</h4>
							</div>
							<div class="col-10 ">
								<div class="mb-3">
									<input class="form-control" type="file" id="infoPhoto" multiple>
									<label for="infoPhoto" class="form-label">기업 대표 사진을
										등록해주세요</label>
								</div>
							</div>
						</div>
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>소 개 글</h4>
							</div>
							<div class="col-10 was-validated ">
								<div class="mb-3">
									<textarea id="infoContent" name="boardContent"></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light"
								data-bs-dismiss="modal">취소</button>
							<button type="reset" class="btn btn-light">초기화</button>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- 뉴스레터 -->
	<div class="modal fade" id="newsletter" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center" id="staticBackdropLabel">뉴스레터
						작성</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath }/business/aboutus/newsletterform"
						method="post">

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
								<h4>관련링크</h4>
							</div>
							<div class="col-10 ">
								<input type="text" class="form-control" name="link"
									placeholder="링크를 입력해주세요">
								<hr>
							</div>
						</div>

						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>내용작성</h4>
							</div>
							<div class="col-10 ">
								<div class="mb-3">
									<textarea id="newsLetterContent" name="boardContent"
										style="height: 300px;"></textarea>
								</div>
								<div class="text-end ">작성일자</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
	var msg = "${msg}";
	if(msg) {
		alert(msg);
	}
	
	</script>

	<!-- 숫자 카운트 애니메이션 -->
	<script>
        $('.nums').each(function () {
            const $this = $(this),
                countTo = $this.attr('data-count');
            $({
                countNum: $this.text()
            }).animate({
                countNum: countTo
            }, {
                duration: 3000,
                easing: 'linear',
                step: function () {
                    $this.text(Math.floor(this.countNum));
                },
                complete: function () {
                    $this.text(this.countNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
                    //3자리 마다 콤마 표시 적용
                }
            });
        });
    </script>

	<!-- ckeditor5 -->
	<script>
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
    .create( document.querySelector ('#infoContent'),{
    	language: "ko"
    	, extraPlugins: [MyCustomUploadAdapterPlugin]
		, simpleUpload :{
			uploadUrl : 'imageUpload',
		}
    	
    	, config : {
    		height:'400px;'
	   		, width:'100%'
    	}
    })
    .catch( error => {
        console.error( error );
    });
    
    ClassicEditor
    .create( document.querySelector ('#newsLetterContent'),{
    	language: "ko"
    	, extraPlugins: [MyCustomUploadAdapterPlugin]
		, simpleUpload :{
			uploadUrl : 'imageUpload',
		}
    	
    	, config : {
    		height:'400px;'
	   		, width:'100%'
    	}
    })
    .catch( error => {
        console.error( error );
    });
	</script>



</body>
</html>