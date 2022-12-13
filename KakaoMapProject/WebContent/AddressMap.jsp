<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f7a98d7eaf2adb2cebd216de87360d1&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 추가부분
let url = "https://api.odcloud.kr/api/15051494/v1/uddi:65a2cf4b-158c-4c5f-8475-c50f28b24ead?page=1&perPage=10&serviceKey=91Nud%2FXcDUE78L4iHA8Nej7Fk0FiFsUzM5ryT3VioeZdsRUr%2BTH9pXxbOb3JVvXrNr5awDw681GDHjjJe0TwrA%3D%3D";

// get방식 전용 
$.getJSON(url, function(data){
	
	for(let i=0; i<data.currentCount;i++){
		
		let txt = "<tr>" +
			"<td>" + data.data[i].연번 + "</td>" +
			"<td>" + data.data[i].약국명칭 + "</td>" +
			"<td>" + data.data[i].지번주소+ "</td>" +
			"<td>" + data.data[i].전화번호+ "</td>" +
			"</tr>";
			
			$("table").append(txt); //동적 추가 
			
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(data.data[i].지번주소, function(result, status) {
	
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+data.data[i].약국명칭+'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	}
});    
</script>


<!-- 목록 테이블로 출력 -->
<table border="1">
	<tr>
		<th>명칭</th>
		<th>약국명</th>
		<th>소재지</th>
		<th>전화번호</th>
	</tr>						
</table>
</body>
</html>