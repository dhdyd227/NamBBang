<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>
<body>
<div class="mapWrap">
<div id="map" style="width:100%;height:400px;"></div> 
</div> 
<div id="coordXY"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=005ea4d937e6376ccc6a5662ec842815&libraries=services"></script>
<script>
var coordXY = document.getElementById("coordXY"); //검색 지도 경도위도 알아내기 
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스 
var options = { center: new kakao.maps.LatLng(35.870634, 128.589452), // 위도경도 
		level: 3 //지도의 레벨(확대, 축소 정도) 
		};
		
var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

//지도타입 컨트롤, 줌 컨트롤 생성 
var mapTypeControl = new kakao.maps.MapTypeControl(); 
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); 
var zoomControl = new kakao.maps.ZoomControl(); 
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

//★ 주소-좌표 변환 객체를 생성 
var geocoder = new kakao.maps.services.Geocoder(); 

// ★ 주소로 좌표를 검색 
geocoder.addressSearch('신 주소 입력', function(result, status) {
	// 정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) { 
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x); 
		yy = result[0].x; 
		xx = result[0].y; 
		// 결과값으로 받은 위치를 마커로 표시 
		var marker = new kakao.maps.Marker({ 
			map: map, 
			position: coords });
		
		// 인포윈도우로 장소에 대한 설명을 표시 
		var iwContent = '<div style="padding:5px;">이피엔스<br>'
		+ '<a href="https://map.kakao.com/link/map/이피엔스,37.51128, 127.04232" style="color:blue" target="_blank">큰지도보기</a>' 
		+ '<a href="https://map.kakao.com/link/to/이피엔스,37.51128, 127.04232" style="color:blue" target="_blank">길찾기</a>' 
		+'</div>' 
		
		var infowindow = new kakao.maps.InfoWindow({ 
			content : iwContent 
			}); 
		infowindow.open(map, marker);

		// 지도의 중심을 결과값으로 받은 위치로 이동 
		map.setCenter(coords); 
		
		// ★ resize 마커 중심 
		var markerPosition = marker.getPosition(); 
		$(window).on('resize', function(){ 
			map.relayout(); 
			map.setCenter(markerPosition); }); 
		
		// ★ 검색 경도위도 표시 
		coordXY.innerHTML = "<br>X좌표 : " + xx + "<br><br>Y좌표 : " + yy; 
		} else { 
			console.log('에러'); 
			} 
	}); 
	//////////////////// 
	// 카카오 지도 API E 
	/////////////////// 
	</script>

	
	<!-- <div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=005ea4d937e6376ccc6a5662ec842815"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	
		var places = new kakao.maps.services.Places();

		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        console.log(result);
		    }
		};

		places.keywordSearch('판교 치킨', callback);
		
		places.categorySearch('PO3', callback, {
		    // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
		    location: new kakao.maps.LatLng(37.564968, 126.939909)
		});
		
		</script> -->
</body>
</html>