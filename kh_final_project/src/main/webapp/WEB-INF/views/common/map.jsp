<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>map test</title>
</head>
<body>
map관련 API test page

<!-- 지도를 담을 영역 만들기 -->
<div id="map" style="width:800px;height:400px;"></div>

<!-- 실제 지도를 그리는 Javascript API를 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef072fe97e426b6ce05b6cb96feab5e"></script>

<!-- 지도를 띄우는 코드 작성 -->
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>