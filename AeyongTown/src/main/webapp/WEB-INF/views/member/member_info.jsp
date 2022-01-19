<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
 <style type="text/css">
 .image-container {
    width: 200px;
    height: 200px; 
    border-radius: 70%;
    overflow: hidden;
}
.profileImg {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
 
<!DOCTYPE html>
<div class="breadcumb-area bg-img bg-overlay" style="background-image: url(/img/bg-img/breadcumb3.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcumb-text text-center">
                    <h2>회원 정보</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="receipe-content-area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-8">
                <div class="receipe-headline my-5">
                    <h2>${mvo.memberId } 님의 회원정보</h2>
                    <div class="receipe-duration">
                        <h6>등록한 물건 갯수 : 3개</h6>
                        <h6>구매한 물건 갯수 : 5개</h6>
                        <h6>판매 완료한 갯수 : 1개</h6>
                    </div>
                </div>
            </div>
            <!-- 밑의 버튼은 사용자 이후 판매자 정보 볼 때 안보이도록 구현 예정 -->
            <div class="col-12 col-md-4">
                <div class="receipe-ratings text-right my-5">
                    <button class="float-right btn text-white btn-danger reportBtn" id="modifyProfileForm" onclick="location.href='${pageContext.request.contextPath}/user/modifyForm'">프로필 변경하기</button>&nbsp;
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-lg-8">
                <div class="single-preparation-step d-flex">
                    <h6>닉네임</h6>
                    <p>${mvo.nick}</p>
                </div>
                <div class="single-preparation-step d-flex">
                    <h6>이메일</h6>
                    <p>${mvo.email}</p>
                </div>
                <div class="single-preparation-step d-flex">
                    <h6>연락처</h6>
                    <p>${mvo.tel }</p>
                </div>
                <div class="single-preparation-step d-flex">
                    <h6>소개</h6>
                    <p>이거는 나중에 구현해보도록 합시다~ alter로 컬럼 생성만 하면 되니깐 뭐 ~</p>
                </div>
            </div>

            <div class="col-12 col-lg-4">
                <div class="ingredients">
                    <!-- 사진변경 버튼 추가 후 버튼은 이후 판매자 정보 볼 때 안보이도록 구현 예정 -->
	                <h4>프로필 사진</h4>
					<div class=image-container>
					<c:choose>
						<c:when test="${mvo.imgPath eq null}">
							<img id="profileImg" src="${pageContext.request.contextPath}/profile/aeyong kim.png">
						</c:when>
						<c:when test="${mvo.imgPath ne null}">
							<img id="profileImg" src="${pageContext.request.contextPath}/profile/${mvo.imgPath}">
						</c:when>
					</c:choose>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="section-heading text-left">
                    <h3>자주 거래하는 장소</h3>
                </div>
                <c:choose>
                	<c:when test="${mvo.mapVO.lat eq null}">
                		<h6>등록하신 주소가 존재하지 않습니다. 위치를 등록해주세요~</h6>
                	</c:when>
                	<c:when test="${mvo.mapVO.lat ne null}">
	                	<div class="section-heading text-left">
	                    	<h6>행정동 주소 : ${mvo.mapVO.sido} ${mvo.mapVO.sigungu} ${mvo.mapVO.dong} ${mvo.mapVO.detail}</h6>
	                    	<h6>※ 주소는 행정동 기준으로 나옵니다~</h6>
	              		</div>
                		<div id="map" style="width:1000px;height:400px;"></div>
                	</c:when>
                </c:choose>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9381e06d5eaed54786e5c9e5472beb"></script>
					<script type="text/javascript">
						var userLat = <c:out value="${mvo.mapVO.lat}"/>;
						var userLng = <c:out value="${mvo.mapVO.lng}"/>;
						var userDetail;
						if(${mvo.mapVO.detail != null}) {
							userDetail = '<c:out value="${mvo.mapVO.detail}"/>';
						} else {
							userDetail = '등록하신 장소';
						}
						
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(userLat, userLng), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
						
						// 지도 생성
						var map = new kakao.maps.Map(mapContainer, mapOption);
		
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(userLat, userLng); 
		
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
		
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
		
						var iwContent = '<div style="padding:5px;">';
							iwContent += userDetail;
							iwContent += '<br><a href="https://map.kakao.com/link/map/'
							iwContent += userDetail;
							iwContent += ',';
							iwContent += userLat;
							iwContent += ',';
							iwContent += userLng;
							iwContent += '" style="color:blue" target="_blank">큰지도보기</a> ';
							iwContent += '<a href="https://map.kakao.com/link/to/';
							iwContent += userDetail;
							iwContent += ',';
							iwContent += userLat;
							iwContent += ','; 
							iwContent += userLng;
							iwContent +='" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						    iwPosition = new kakao.maps.LatLng(userLat, userLng); //인포윈도우 표시 위치입니다
		
						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
						    position : iwPosition, 
						    content : iwContent 
						});
						  
						// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
						infowindow.open(map, marker); 
					</script>
            </div>
        </div>
        <!-- 카카오맵 영역 (등록이 안되어 있다면 등록이 안되어 있다고 울먹이는 이미지 추가 예정) -->
        <!-- 밑의 버튼들은 이후 판매자 정보 볼 때 안보이도록 구현 예정 -->
        <script type="text/javascript">
        	$(document).ready(function(){
        		$("#deleteLocationBtn").click(function() {
        			let confirmDelete = confirm("해당 위치를 삭제하시겠습니까?");
        			if(confirmDelete) {
        				alert("삭제되었습니다!");
        				$("#deleteLocation").submit();
        			} 
        		})
        	});
        </script>
        <div class="row">
            <div class="col-12">
            	<div style="text-align: center; padding-top: 10px;">
            		<a href="https://map.kakao.com/link/map/${mvo.mapVO.detail },${mvo.mapVO.lat},${mvo.mapVO.lng}" style="color:blue; font-size: 1.5em" target='_blank'>큰지도보기</a>&nbsp;&nbsp;
            		<c:choose>
            			<c:when test="${mvo.mapVO.detail eq null }">
            				<a href="https://map.kakao.com/link/to/${mvo.memberId }님의 장소,${mvo.mapVO.lat},${mvo.mapVO.lng}"  style="color:blue; font-size: 1.5em" target="_blank">길찾기</a>
            			</c:when>
            			<c:when test="${mvo.mapVO.detail ne null }">
            				<a href="https://map.kakao.com/link/to/${mvo.mapVO.detail },${mvo.mapVO.lat},${mvo.mapVO.lng}"  style="color:blue; font-size: 1.5em" target="_blank">길찾기</a>
            			</c:when>
            		</c:choose>
            	</div>
                <div class="receipe-ratings text-right my-5">
                <c:choose>
                	<c:when test="${mvo.mapVO.lat eq null}">
                    <a href="${pageContext.request.contextPath}/user/map/inputForm" class="btn delicious-btn" id="inputLocation">등록하기</a>
                    </c:when>
                    <c:when test="${mvo.mapVO.lat ne null}">
					<a href="${pageContext.request.contextPath}/user/map/modifyForm" class="btn delicious-btn" id="modifyLocation">수정하기</a>
					<form action="${pageContext.request.contextPath}/user/map/delete" id="deleteLocation" method="post" style="display: inline;">
						<sec:csrfInput />
                    	<button type="button" class="btn delicious-btn" id="deleteLocationBtn">삭제하기</button>
                    </form>
                    </c:when>
                </c:choose>    
                </div>
            </div>
        </div>
    </div>
</div>