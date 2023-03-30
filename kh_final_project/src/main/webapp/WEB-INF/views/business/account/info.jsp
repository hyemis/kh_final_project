<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>home</title>
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
	<link href="${pageContext.request.contextPath}/resources/css/person.userId.css" rel="stylesheet">
	
<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>

<!-- style -->	

	
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="container-xxl py-5">

		<h1 class="text-center m-3">회사명</h1>
		<div class="container-xxl py-5">
			<div class="row">
				<!-- profile area start -->
				<div class="col-md-3 col-sm-4  border border-secondary">
					<div class="team-item rounded overflow-hidden">
					<div class="position-relative">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/template/makaan/img/team-1.jpg" alt="">
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
						<h5 class="fw-bold mb-0">${bsinfo.userName}</h5>
						<small>${bsinfo.userEmail}</small>
					</div>
					
				</div>
				</div><!-- profile area end -->
				<!-- info area start -->
				<div class="col-md-8 col-sm-8 border border-secondary">
					<!-- update -->
					<div class="container border border-secondary" style="height: 800px;">
						<h5 class="text-center m-2">내정보</h5>
						<div>
							<form action="<%=request.getContextPath() %>/business/account/info" method="post">
								<p>이메일 
								<input type="text" id="" name="userEmail" value="${bsinfo.userEmail}">
								</p>
								<p>사업자 번호
								<input type="text" id="" name="bsLicense" value="${bsinfo.bsLicense}">
								</p>
								<p>대표전화
								<input type="text" id="" name="bsMainPhone" value="${bsinfo.bsMainPhone}">
								</p>
								<p>주소
								</p>
								<p>
								<input type="text" id="postcode" name="addressPostcode" value="${bsinfo.addressPostcode}">
								<input type="button" onclick="execDaumPostcode()" value="주소찾기"><br>
								<input type="text" id="roadAddress" name="addressRoad" value="${bsinfo.addressRoad}">
								<input type="text" id="jibunAddress" name="addressJibun" value="${bsinfo.addressJibun}">
								<input type="text" id="detailAddress" name="addressDetail" value="${bsinfo.addressDetail}">
								<span id="guide" style="color:#999;display:none"></span>
								</p>	
								<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
								<p class="text-center">
								<button type="submit" value="수정하기">수정하기</button>
								<button type="reset">취소</button>
								</p>
							</form>
						</div>
					</div><!-- update end -->
					
					<!-- check password -->
					<div class="container border border-secondary" style="height: 300px;">
						<div>비밀번호 변경</div>
						<div>
							 <form action="/" method="post" >
						        <label for="password">비밀번호</label>
						        <input type="password" id="password" name="password" required>
						        <br>
						        <button type="submit">확인</button>
    						</form>
						</div>
					</div><!-- check password end -->
				</div><!-- info area end -->
			</div>
		</div>

	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<!-- map start -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef072fe97e426b6ce05b6cb96feab5e&libraries=services"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new kakao.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                     	// 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                        });
                        infowindow.open(map, marker);
                    }
                });

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);
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
    
    
    //주소-좌표 변환 객체를 생성
    var geocoder = new kakao.maps.services.Geocoder();
    
    //마커를 미리 생성
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    
 </script>

<!-- map end -->

	
</body>
</html>