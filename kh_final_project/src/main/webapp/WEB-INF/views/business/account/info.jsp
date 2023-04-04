<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>account</title>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
<!-- style -->	

	
</head>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="container-xxl py-5">

		<h1 class="text-center m-3">${bsinfo.userName}님 회원정보</h1>
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
					<div class="container border border-secondary" style="height: 900px;">
						<h4 class="text-center m-2 p-3">내정보</h4>
						<div>
							<form action="<%=request.getContextPath() %>/business/account/info" method="post">
							<div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-2 col-form-label text-center">이메일</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="userEmail" name ="userEmail" value="${bsinfo.userEmail}">
							    </div>
							 </div>
							<div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-2 col-form-label text-center">사업자번호</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="bsLicense" name ="bsLicense" value="${bsinfo.bsLicense}">
							    </div>
							 </div>
							<div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-2 col-form-label text-center">대표전화</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="bsMainPhone" name ="bsMainPhone" value="${bsinfo.bsMainPhone}">
							    </div>
							 </div>
							<div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-2 col-form-label text-center">주소</label>
							    <div class="col-sm-6">
									<input type="text" class="form-control" id="postcode" name="addressPostcode" value="${bsinfo.addressPostcode}">
								</div>
								<div class="col-sm-2">
									<input type="button" class="form-control" onclick="execDaumPostcode()" value="주소찾기"><br>
								</div>	
							</div>		
							<div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-2 col-form-label text-center">도로명주소</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="roadAddress" name ="addressRoad" value="${bsinfo.addressRoad}">
							    </div>
							 </div>
							 <div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-2 col-form-label text-center">지번주소</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="jibunAddress" name ="addressJibun" value="${bsinfo.addressJibun}">
							    </div>
							 </div>
							 <div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-2 col-form-label text-center">상세주소</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="detailAddress" name ="addressDetail" value="${bsinfo.addressDetail}">
							    </div>
							 </div>
							<span id="guide" style="color:#999;display:none"></span>
									<div id="map" class="text-center" style="width:600px;height:300px;margin-top:10px; "></div>
							<p class="text-center">
								<br>
								<button class="btn btn-primary" type="submit" value="수정하기">수정하기</button>
								<button class="btn btn-primary" type="reset">취소</button>
							</p>
							</form>
						</div>
					</div><!-- update end -->
					
					<!-- password / secede -->
					<div class="container border border-secondary " style="height: 500px;">
					<h4 class="text-center m-2 ">비밀번호 변경</h4>
						<!-- password -->
						<form class="m-5" action="pwChk" name="pwChk" method="post" >
							 <div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label">현재 비밀번호</label>
							    <div class="col-sm-6">
							      <input type="password" class="form-control" id="userPw" name="userPw">
							    </div>
							    <button class=" col-sm-2 btn btn-primary" type="submit" id="btnPwChk">확인</button>
							 </div>
						</form>	 
						<form class="m-5" action="/newPw" method="post">
							 <div class="mb-3 row">
							    <label for="newPw" class="col-sm-3 col-form-label">새 비밀번호</label>
							    <div class="col-sm-8">
							      <input type="password" class="form-control" id="newPw" name="newPw">
							    </div>
							 </div>
							 <div class="mb-3 row">
							    <label for="newPw2" class="col-sm-3 col-form-label">새 비밀번호 확인</label>
							    <div class="col-sm-8">
							      <input type="password" class="form-control" id="newPw2" name="newPw2">
							    </div>
							 </div>	<br>	
							 <p class="text-center">
							 <button class="btn btn-primary" type="submit">비밀번호 변경</button>
							 <button class="btn btn-primary" type="reset">취소</button>
							 </p>
							 <p href="#" class="link-primary text-center">비밀번호를 잊으셨나요?</p>
						</form>
						
						
						<!-- secede --><br>
						<p class="text-end">
						<button class="btn btn-primary" type="button" id="secede"
						href="<%=request.getContextPath() %>/person/delete">기업회원 탈퇴</button> 
						</p>

						
						
					</div><!-- password / secede end -->
					
				</div><!-- info area end -->
			</div>
		</div>

	</div><!-- 전체컨테이너 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<!-- map start -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef072fe97e426b6ce05b6cb96feab5e&libraries=services"></script>
<script>
function changePassword() {
	console.log("Tq")
	const obj = {
			userPw : document.getElementById("userPw").value,
			newPw : document.getElementById("newPw").value,
			newPw2 : document.getElementById("newPw2").value
		}
	
	console.log(obj)

		$.ajax({
			type : "POST",
			dataType: json,
			contentType : "application/json",
			url : "/business/account/password", //요청 할 URL
			data : JSON.stringify(data), //넘길 파라미터
			success : function(data) {
				//통신이 정상적으로 되었을때 실행 할 내용
				console.log(data)
			},
			error : function(data) {
				console.log("접속 도중 오류가 발생했습니다."); //에러시 실행 할 내용
			}
		});

}
</script>
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
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">내 기업</div>'
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

	//회원정보의 주소로 페이지 로딩하기
	var roadAddress = "${bsinfo.addressRoad}";
	var jibunAddress = "${bsinfo.addressJibun}";
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

<!-- updatePassword -->





<!-- alter -->
<script>
var msg = "${msg}";
if(msg) {
	alert(msg);
}
</script>

	
</body>
</html>