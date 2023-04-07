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
    <!-- css file link part end -->

<title>채용공고등록</title>

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
	
		<form action="insert" method="post" id="formdata1" enctype="multipart/form-data">
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
									<td><input type="text" id="companyName" class="companyName form-control" name="companyName"></td>
								</tr>
								<tr class="mb-3">
									<td><label for="category2dept">모집 분야</label></td>
									<td>
										<select id="category2dept" class="category2dept form-control">
											<option value="0">선택안함</option>
										<c:forEach items="${JNlist}" var="categoryJN">
											<option value="${categoryJN.categoryId }">${categoryJN.categoryName}</option>
										</c:forEach>			
										</select>			
									</td>
									<td>
										<select id="recruitType" class="recruitType form-control" name="recruitType" style="text-overflow: ellipsis;">
											<option value="0">선택안함</option>
										</select>
									</td>
								</tr>
								<tr class="mb-3">
									<td><label for="career">경력선택</label></td>
									<td>
									<select id="careerType" class="careerType form-control">
											<option value="0">선택안함</option>
										<c:forEach items="${CAlist}" var="categoryCA">
											<option value="${categoryCA.categoryId }">${categoryCA.categoryName}</option>
										</c:forEach>
									</select>
									</td>
								</tr>
								<tr class="mb-3">
									<td><label for="userEducation">학력선택</label></td>
									<td>
									<select id="userEducation" class="userEducation form-control">
										<option value="0">선택안함</option>
										<c:forEach items="${EDlist}" var="categoryED">
											<option value="${categoryED.categoryId }">${categoryED.categoryName}</option>
										</c:forEach>
									</select>
									</td>
								</tr>
								<tr class="mb-3">
									<td><label for=minSalary>급여</label></td>
									<td><input type="text" id="minSalary" class="minSalary form-control" name="minSalary" placeholder="최소 연봉"></td>
									<td class="text-center">~</td>
									<td><input type="text" id="maxSalary" class="maxSalary form-control" name="maxSalary" placeholder="최대 연봉"></td>
								</tr>
								<!-- 체크박스로 처리한거 값들 배열로 받아서 xxx, xxx 순으로 넣기 -->
								<tr class="mb-3">
									<td>우대조건</td>
									<td colspan="2">
										<c:forEach items="${SClist}" var="categorySC">
											<label><input type="checkbox" class="conditionTypeList" name="conditionTypeList" value="${categorySC.categoryId }">
											${categorySC.categoryName }</label>
										</c:forEach>
									</td>
								</tr>
								<!-- 이거는 변수명 바꿔서 리퀘스트 파람으로 컨트롤러에서
								받은 다음에 string 값으로 변환 -->
								<tr class="mb-3">
									<td><label for=registDate>지원등록 시작일</label></td>
									<td><input type="date" id="registDate" class="registDate form-control" name="registDate"></td>
									<td><label for=closeDate>지원등록 마감일</label></td>
									<td><input type="date" id="closeDate" class="closeDate form-control" name="closeDate"></td>
								</tr>
								<!-- 10 11 20 21 카테고리 추가 필요 -->
								<tr class="mb-3">
									<td><label for="empTypeCode">고용형태</label></td>
									<td>
									<select id="empTypeCode" class="empTypeCode form-control">
											<option value="0">선택안함</option>
										<c:forEach items="${ETlist}" var="categoryET">
											<option value="${categoryET.categoryId }">${categoryET.categoryName}</option>
										</c:forEach>
									</select>
									</td>
								</tr>
								<!-- 주 5일 주 6일 등등 카테고리 추가 해야됨-->
								<tr class="mb-3">
									<td><label for="holidayType">상세 근무 형태</label></td>
									<td>
									<select id="holidayType" class="holidayType form-control">
											<option value="0">선택안함</option>
										<c:forEach items="${HTlist}" var="categoryHT">
											<option value="${categoryHT.categoryId }">${categoryHT.categoryName}</option>
										</c:forEach>
									</select>
									</td>
								</tr>
							</tbody>
						</table>					
		
					<button type="button" class="btn nextbtn">다음</button>
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
								<td colspan="2"><input type="text" id="raTitle" class="raTitle form-control" name="raTitle"></td>
							</tr>
							<tr>
								<td><textarea class="raContent form-control"></textarea></td>
							</tr>
							<tr>
								<td><label for="report">이력서 샘플</label></td>
								<td><input type="file" id="report" class="report form-control" name="report"></td>
							</tr>
						</tbody>
					</table>
					<div>
						<button type="button" class="btn prevbtn">이전</button>
						<button type="submit" class="btn insertbtn">작성</button>
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

	</script>
	
	<script>
		    //도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function sample4_execDaumPostcode() {
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
		                document.getElementById('sample4_postcode').value = data.zonecode;
		                document.getElementById("sample4_roadAddress").value = roadAddr;
		                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		                
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //첫번째 결과의 값을 활용
		
		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords)
		                     	// 인포윈도우로 장소에 대한 설명을 표시합니다
// 		                        var infowindow = new kakao.maps.InfoWindow({
// 		                            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
// 		                        });
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

</body>

</html>