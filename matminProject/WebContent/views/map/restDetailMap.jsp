<%@page import="com.google.gson.Gson"%>
<%@page import="com.kh.search.model.vo.Search"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> restMapList = (ArrayList<String>)request.getAttribute("mapList");
	String json = new Gson().toJson(restMapList);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07b8e08ffb38a692cd2c2144e0dfa010&libraries=services,clusterer,drawing"></script>
	<style>
	    /* 인포윈도우 스타일 */
	    .custom-infowindow {
	      padding: 10px;
	      min-width: 300px;
	      background-color: #fff;
	      border: 1px solid gray;
	      border-radius: 5px;
	      box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
	      font-family: Arial, sans-serif;
	    }
	    .custom-infowindow h3 {
	      margin: 0 0 5px;
	      font-size: 16px;
	      color: #333;
	    }
	    .custom-infowindow p {
	      margin: 0;
	      font-size: 13px;
	      color: #666;
	    }
  	</style>
</head>
<body>

	<div id="map" style="width:800px; height:400px;"></div>
	
	<script>
		var listData = <%= json %>;

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(37.566535, 126.9779692), // 지도의 중심좌표 (서울시청)
			level: 5 // 지도의 확대 레벨
		};  
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커들을 담을 배열
        var markers = [];
		
        updateMapData(listData);
        
		function updateMapData(data) {
			listData = data;
			
			markers.forEach(item => item.setMap(null));
			
			markers = [];
			
			listData.forEach(item => searchAddressAndSetMarker(item.restAddress, item.restName));
		}

		function searchAddressAndSetMarker(address, restName) {
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address.split(',')[0], function(result, status) {
	
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
	
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				      
					// 인포윈도우 생성
				    var infowindow = new kakao.maps.InfoWindow({
				    	content: '<div class="custom-infowindow"><h3>' + restName + '</h3><p>' + address + '</p></div>'
			        });
	
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords,
					});
					
					// 마커를 지도에 표시
                    marker.setMap(map);
					
                 	// 마커에 hover했을 때 인포윈도우 표시
                    kakao.maps.event.addListener(marker, 'mouseover', function() {
                      infowindow.open(map, marker);
                    });
                 	
                 	// 마커에 hover했을 때 인포윈도우 표시
                    kakao.maps.event.addListener(marker, 'mouseout', function() {
                      infowindow.close(map, marker);
                    });
					
                 	// 마커를 markers 배열에 추가
                    markers.push(marker);

                    // 지도의 중심을 마커들에 맞게 조절
                    setMapCenterToMarkers();
				} 
			})
		}
		
		function setMapCenterToMarkers() {
			// 마커들을 담을 배열
	        var markerPositions = [];
	        for (var i = 0; i < markers.length; i++) {
                markerPositions.push(markers[i].getPosition());
            }
	        
	     	// 마커들의 위치를 포함하는 가장 작은 경계 상자를 구함
       	   	var bounds = new kakao.maps.LatLngBounds();
            for (var i = 0; i < markerPositions.length; i++) {
                bounds.extend(markerPositions[i]);
            }

            // 지도의 중심을 경계 상자의 중앙으로 이동
            map.setBounds(bounds);
		}
	</script>
	
</body>
</html>