<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회사소개페이지</title>
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
	
<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>

<!-- ckeditor5 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<!-- map -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef072fe97e426b6ce05b6cb96feab5e&libraries=services"></script>	
 
 </head>

<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>


<div class="container-xxl py-5">
        
        <!-- 회사로고, 회사명, 태그 -->
            <div class="container">
                <div class="row">
                	<div class="col-1">
               			<div class="icon p-2 me-2">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/template/makaan/img/icon-deal.png" alt="Icon" style="width: 30px; height: 30px;">
                    	</div>
                    </div>
                    <div class="col-11 ">
                     <h1 class="mb-3 text-primary">${info.userName}</h1>
                    </div>
                </div>
                
               

                
                <br> 
                
                <!-- 회사소개  -->
	         	<div class="text-start mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
                	<h1 class="mb-3">회사 소개</h1>
                	<div><a class="btn btn-primary">${info.tag}</a></div>
                	<div>대표번호  ${info.bsMainPhone}</div>
                	<div class="m-5"> ${info.boardTitle} </div>
                	<div class="m-5"> ${info.boardContent} </div>
                </div>
            </div>
        <br>        
         <!-- 채용중인 포지션 -->   
            <div class="container">
                <div class="row g-0 gx-5 align-items-end">
                    <div class="col-lg-6">
                        <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                            <h1 class="mb-3">채용중인포지션</h1>
                        </div>
                    </div>
                    <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                        <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#">더보기</a>
                            </li>
                            <li class="nav-item me-0">
                                <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#">QnA</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-4">
                        	<!-- 채용공고 -->
                        	<c:forEach items="${recruitList}" var="recruit">
                            <div class="col-lg-4 col-md-6 wow fadeInUp " data-wow-delay="0.1s">
                                <div class="property-item rounded overflow-hidden bg-white">
                                    <div class="p-4 pb-0">
                                         <h5 class="text-primary mb-3">${recruit.companyName }</h5>
                                        <a class="d-block h5 mb-2" href="">${recruit.raTitle }</a>
                                        <p>지원날짜 ${recruit.registDate } ~ ${recruit.closeDate }</p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i> 
                                       	<a href="/job/business/recruit/view?id=${recruit.raNum }">공고보기</a></small> 
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-bed text-primary me-2"></i>
                                        <a href="/job/business/recruit/view?id=${recruit.raNum }">지원하기</a></small>
                                    </div>
                                </div>
                            </div>
                 			</c:forEach>
                        </div>
                    </div>
                   </div>
                </div>

              <br>
           
           <!-- 오시는길 -->
               <div class="container">
                    <div class="col-12 row g-0 gx-5 align-items-end">
                     	<div class="text-start mx-auto mb-5 wow fadeInleft" data-wow-delay="0.1s">
                            <h1 class="mb-3">오시는길</h1>
                            <p><i class="fa fa-map-marker-alt text-primary me-2"></i>${info.addressRoad}${bsinfo.addressJibun}  ${bsinfo.addressDetail}</p>
                        	<div class="col-12 wow fadeInleft" data-wow-delay="0.2s">
							<div id="map" class="text-center" style="width:800px;height:350px;margin-top:10px; "></div>
		                    </div>
                        </div>
                    </div>
                   
                 </div>
               
 <!-- newsletter Start -->
            <div class="container">
                <div class="pt-3 text-start mb-5 wow fadeInUp" data-wow-delay="0.1s" >
                    <h1 class="mb-3">이 회사의 뉴스레터 </h1>
                </div>
                <div class="row g-4">
                	<c:forEach items="${news }" var="news">
                    <div class="card col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					      <a href="/job/business/aboutus/newsletter/view?no=${news.boardNo }">${news.boardTitle }</a>
					</div>
                  
                    </c:forEach>
                </div>
            </div>
        <!-- newsletter End -->
</div>       
<%@include file="/WEB-INF/views/common/footer.jsp"%>

<!-- ck에디터  -->
<script type="text/javascript">
	
    ClassicEditor
    .create( document.querySelector( '#infoContent' ),{
    	language: "ko"    
    	, config : {
    		height:'400px'
	   		, width:'100%'
    	}, toolbar: []
    })
    .catch( error => {
        console.error( error );
    });
</script>

<!-- map start -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef072fe97e426b6ce05b6cb96feab5e&libraries=services"></script>

<script>
	//회원정보의 주소로 페이지 로딩하기
	var roadAddress = "${info.addressRoad}";
	var jibunAddress = "${info.addressJibun}";
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
<!-- map end -->
        
</body>
</html>