<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <style>
    .map_wrap {position:relative;width:100%;height:750px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
<body>
<div class="breadcumb-area bg-img bg-overlay" style="background-image: url(/img/bg-img/breadcumb3.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcumb-text text-center">
                    <h2>회원님의 위치를 등록중입니다</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<form action="/user/map/input" method="post" id="inputLocation">
<sec:csrfInput />
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <div class="hAddr">
	        <span class="title">지도중심기준 행정동 주소정보</span>
	        <span id="centerAddr"></span>
	    </div>
	</div>

<!-- 좌표를 받아오는 기능을 사용할 경우 맨뒤에 autoload=false 넣어주어야함 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9381e06d5eaed54786e5c9e5472beb&libraries=services&autoload=false"></script>
<script type="text/javascript">

var mapContainer = document.getElementById('map'); // 지도를 표시할 div 

$(document).ready(function(){
	// 동적으로 스크립트 로드를 하기 때문에, 스크립트가 로드 되기전 geocoder 객체에
	// 접근하려고 하면 오류가 남. 스크립트 로드가 된 후에 geocoder를 사용해야함
	kakao.maps.load(function() {
		mapOption = {
			center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};  
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">법정동 주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';
					$("#lat").val(mouseEvent.latLng.getLat().toFixed(6));
					$("#lng").val(mouseEvent.latLng.getLng().toFixed(6));
		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);
	
		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
		    searchAddrFromCoords(mouseEvent.latLng, function(result, status) {
		    	if(status === kakao.maps.services.Status.OK) {
		    		for(var i = 0; i<result.length; i++){
		    			if(result[i].region_type === 'H') {
		    				$("#code").val(result[i].code);
		    				break;
		    			}
		    		}
		    	}
		    })
		});
	
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
	
		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
	
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
	
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
	
		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		}
	})
})
</script>


	<div class="col-12" id="submit-area">
		<input type="hidden" name="code" id="code" required="required">
		<input type="hidden" name="lat" id="lat" required="required">
		<input type="hidden" name="lng" id="lng" required="required">
		<input type="text" class="form-control" name="detail" id="detail" placeholder="상세주로를 입력해주세요. 필수는 아닙니다!" style="text-align: center">
		<button type="button" id="submitBtn" class="btn delicious-btn">등록하기</button>
	</div>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submitBtn").click(function(){
			let code = $("#code").val();
			let lat = $("#lat").val();
			let lng = $("#lng").val();
			let detail = $("#detail").val();
			
			
			if(code==null || code=="" || lat==null || lat=="" || lng==null || lng=="") {
				alert("장소를 지정해주세요!");
				return;
			} else if(detail =="" || detail==null) {
				let checkDetail = confirm("상세 주소를 명시 안하고 진행하시겠어요?");
				if(checkDetail==true) {
					let result = confirm("해당 장소로 지정하시겠습니까?");
					if(result) {
						alert("해당장소로 등록되었습니다!");
						$("#inputLocation").submit();
					}
				} else if(checkDetail==false) {
					return;
				} // if(checkDetail)
			} else {
				let result = confirm("해당 장소로 지정하시겠습니까?");
				if(result) {
					alert("해당장소로 등록되었습니다!");
					$("#inputLocation").submit();
				} 
			} // if문 종료
		}) //click
	}) // ready
</script>

</body>
</html>