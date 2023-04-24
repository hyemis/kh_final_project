<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
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
    <!-- css file link part end -->
    <title>JOB-A 입사지원</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
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
    
    <!-- 카카오 맵 -->
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef072fe97e426b6ce05b6cb96feab5e&libraries=services"></script>
    
    <!-- ckeditor5 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
    <!-- js part end -->

</head>

<style>

#applyBtn {
  position: fixed;
  top: 50%;
  right: 100px;
  transform: translateY(-50%);
  font-size: 20px;
  padding: 15px 30px;
}

#buttonContainer{
	text-align: center;
}


</style>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	
    <div class="container-xxl bg-white p-0">
		
		 <div class="container-xl px-5">
		 	<h3 class="my-5">채용공고 상세 내역</h3>
		 	<div>
		 		<h5 class="mb-5 ms-3">모집 분야 : ${redto.recruitName}</h5>
		 		<button class="btn btn-primary" onclick="scrapRecruit()">공고 스크랩하기</button>
		 	</div>
		 	<div class="container mb-5">
                <div class="bg-light rounded">
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                        <div class="row g-5 align-items-center">
                        	<!-- 지도 화면 -->
                            <div class="col-lg-6" >
                                <img class="object-fit-sm-contain border" src="${redto.userPic eq null? 'https://dummyimage.com/300x200/d6d6d6/000000&text=300x200' : redto.userPic }" alt="">
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-4">
                                    <table class="col-12">
										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td >회사 이름</td>
												<td><b> : </b></td>
												<td>${redto.companyName }</td>
											</tr>
											<tr>
												<td>회사 대표 번호</td>
												<td><b> : </b></td>
												<td>${redto.bsMainPhone}</td>
											</tr>
											<tr>
												<td>담당자 E-mail</td>
												<td><b> : </b></td>
												<td>${redto.userEmail}</td>
											</tr>
										</tbody>
									</table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		 	<div class="container mb-5">
                <div class="bg-light rounded">
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                        <div class="row g-5 align-items-center">
                        	<!-- 지도 화면 -->
                            <div class="col-lg-6" >
                            	<h5>주소</h5>
                            		<c:choose>
                            			<c:when test="${redto.addressRoad != null}">
                            				<p> ${redto.addressRoad} </p>
                            				<p> - ${redto.addressDetail}</p>
                            			</c:when>
                            			<c:when test="${redto.addressJibun != null}">
                            				<p> ${redto.addressJibun} </p>
                            				<p> - ${redto.addressDetail}</p>
                            			</c:when>
                            			<c:otherwise>
                            				<img class="img-fluid rounded w-100" src="https://dummyimage.com/500x500/d6d6d6/000000&text=500x500" alt="">
                            			</c:otherwise>
                            		</c:choose>
                            	<div class="row">
								  <div class="col">
								    <!-- 카카오 맵 API 코드 -->
								    <div id="map" style="width:100%;height:300px;"></div>
								  </div>
								</div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-4">
                                	<ul>
                                		<li>
                                			<h5> 채용 기간 </h5>
		 									<p>${redto.registDate } ~ ${redto.closeDate }</p>
                                		</li>
                                		<li>
                                			<h5> 급여 정보 </h5>
		 									<p>${redto.salary}</p>
                                		</li>
                                		<li>
                                			<h5> 우대 사항 </h5>
												<c:forEach items="${SClist}" var="categorySC">
													<c:forEach items="${ctList}" var="ctList">
														<c:if test="${categorySC.categoryId == ctList}">
															<label><input type="checkbox" class="conditionTypeList" name="conditionTypeList" value="${categorySC.categoryId }" ${categorySC.categoryId == ctList? 'checked': ''} disabled>
															${categorySC.categoryName }</label>
														</c:if>
													</c:forEach>
												</c:forEach>
                                		</li>
                                		<li>
                                			<h5> 학력 사항 </h5>
		 									<p>${redto.userEducation}</p>
                                		</li>
                                		<li>
                                			<h5> 경력 </h5>
		 									<p>${redto.career}</p>
                                		</li>
                                		<li>
                                			<h5> 근무 요일 </h5>
		 									<p>${redto.holidayType}</p>
                                		</li>
                                		<li>
                                			<h5> 계약 조건 </h5>
		 									<p>${redto.empTypeCode}</p>
                                		</li>
                                	</ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container mb-5">
                <div class="bg-light rounded p-3">
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                        <div class="row g-5 align-items-center">
                            <h3 class="mb-3">제목 : ${redto.raTitle }</h3>
                            <div class="col-lg">
                                <div class="mb-4 raContent" id="raContent">
                                    ${redto.raContent}
                                </div>
                            </div>
                        </div>
                       	<c:if test="${redto.raExtraDocument != null}">
							<a class="btn btn-primary" href="${redto.raExtraDocument}" download>이력서 양식 다운로드</a>
						</c:if>
                    </div>
                </div>
            </div>
		 </div>
		 <div class="container mb-5">
			 <button type="button" class="btn btn-primary" id="applyBtn" data-bs-toggle="modal" data-bs-target="#apply">지원하기</button>
		</div>

		<!-- 지원하기 모달 창 -->
		<div class="modal fade" id="apply" tabindex="-1"
			role="dialog" aria-labelledby="uploadModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="uploadModalLabel">${redto.raTitle} 입사지원</h5>

						<button type="button" class="btn-close"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p><strong>해당 공고에 지원할 이력서를 선택하세요.</strong></p>
						<div class="selectbox-wrapper">
						<select name="selectbox">
							<c:forEach items="${resumelist}" var="resume">
								<option value="${resume.resumeNo}">${resume.resumeTitle}</option>
							</c:forEach>
						</select>
						</div><br><hr>
						<p><strong>추가 첨부할 파일을 업로드해주세요.</strong></p>
						<form action="fileupload" method="post"
							enctype="multipart/form-data">
							<!-- file upload : multiple 하지 않음-->
							<input type="file" name="report" placeholder="첨부파일"><br><br><br>

							<button type="button" data-bs-dismiss="modal"
								class="btn btn-primary mx-auto d-block" type="submit"
								data-carNo="${resume.resumeNo}">입사지원하기</button>
						</form>
					</div>
					</div>
				</div>
			</div>
			 
			 <div id="buttonContainer">
			 <!-- TODO : 주소수정예정 -->
			<a href="${pageContext.request.contextPath}/person/resume/list" class="btn btn-dark py-3 px-4">목록으로</a>
		 </div>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
    
    <%@include file="/WEB-INF/views/common/footer.jsp"%>

	

	<script>
		//회원정보의 주소로 페이지 로딩하기
		var roadAddress = "${recruit.addressRoad}";
		var jibunAddress = "${recruit.addressJibun}";
		var bsAddress = (roadAddress) ? roadAddress : jibunAddress;
		   
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new kakao.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };
	    //지도를 미리 생성
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	    
	 	// 주소-좌표 변환 객체를 생성합니다
	    var geocoder = new kakao.maps.services.Geocoder();
	    // 주소로 좌표를 검색합니다
	    geocoder.addressSearch(bsAddress, function(result, status) {
	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	            // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords
	            });
	            // 인포윈도우로 장소에 대한 설명을 표시합니다
	            var infowindow = new kakao.maps.InfoWindow({
	                content: '<div style="width:150px;text-align:center;padding:6px 0;">내 기업</div>'
	            });
	            infowindow.open(map, marker);
	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	        } 
	    });    
	 	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	    function setMapType(maptype) { 
	        var roadmapControl = document.getElementById('btnRoadmap');
	        var skyviewControl = document.getElementById('btnSkyview'); 
	        if (maptype === 'roadmap') {
	            map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
	            roadmapControl.className = 'selected_btn';
	            skyviewControl.className = 'btn';
	        } else {
	            map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
	            skyviewControl.className = 'selected_btn';
	            roadmapControl.className = 'btn';
	        }
	    }
	    // 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	    function zoomIn() {
	        map.setLevel(map.getLevel() - 1);
	    }
	    // 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	    function zoomOut() {
	        map.setLevel(map.getLevel() + 1);
	    }
	    
	    //마커를 미리 생성
	    var marker = new kakao.maps.Marker({
	        position: new kakao.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	    
	   


	</script>
	
	<script type="text/javascript">
	
    ClassicEditor
    .create( document.querySelector( '#raContent' ),{
    	language: "ko"    
    	, config : {
    		height:'400px'
	   		, width:'100%'
    	}, toolbar: []
    }).then( newEditor => {
		 editor = newEditor;
    	editor.enableReadOnlyMode( '#raContent' );
    })
    .catch( error => {
        console.error( error );
    });
	</script> 
	
	
	

</body>

</html>