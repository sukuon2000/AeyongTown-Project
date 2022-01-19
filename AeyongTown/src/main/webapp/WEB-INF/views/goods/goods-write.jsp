<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<meta charset="utf-8">
<style>
    .map_wrap {position:relative;width:100%;height:750px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    
    #att_zone {
  width: 100%;
  min-height: 150px;
  padding: 10px;
  border: 1px dotted #00f;
}

#att_zone:empty:before {
  content: attr(data-placeholder);
  color: #999;
  font-size: .9em;
  }
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#goodWrite").submit(function() {
			let categoryCheck=$("#category").val();
			if(categoryCheck=="" || categoryCheck==null) {
				alert("카테고리를 선택해주세요");
				return false;
			}
		})
	})
</script>
<!-- <script type="text/javascript">
var maxAppend = 1;
$(document).ready(function(){
	$("#addImg").click(function(){
		if(maxAppend >= 6) {
        	alert("파일 업로드 최대 개수는 6개 입니다.");
        	return;
      	} else {
        	maxAppend++;
        	image.push({ input: 'input-image2', preview: 'preview-image2' });
        	console.log("<이미지 칸 추가>");
        	console.log(image);
        	var plusPreview = '<div class="col-4" style="padding-top: 10px;">';
        	plusPreview += '<h6>' + maxAppend + '번 이미지</h6>';
        	plusPreview += '<img style="width: 500px;" id="preview-image' + maxAppend + '" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">';
        	plusPreview += '<input style="display: block;" type="file" id="input-image' + maxAppend + '"></div>';
        	$("#preview-image-container").append(plusPreview);
		}
	})
})
</script>  -->
<div class="contact-area section-padding-0-80">
	<form action="/goods/write" method="post" id="goodsWrite" enctype="multipart/form-data">
	<sec:csrfInput />
        <div class="container">
			<div class="col-12">
				<div class="section-heading">
					<h3>판매하실 물건을 등록하고 있어요~</h3>
				</div>
			</div>
           <div class="contact-form-area">
				<div class="row">
					<div class="col-12">
						<div class="single-contact-information">
							<h6>제목</h6>
						</div>
						<input type="text" class="form-control" name="title" id="title" placeholder="판매하실 물건의 이름을 적어주세요~" required="required">
					</div>
					<div class="col-6">
						<div class="single-contact-information">
							<h6>가격</h6>
							<p>가격을 0원으로 등록하시거나 작성하지 않으면 나눔으로 등록됩니다~</p>
						</div>
						<input type="number" class="form-control" name="price" id="price" placeholder="판매하실 물건의 가격을 적어주세요~">
					</div>
					<div class="col-6">
						<div class="single-contact-information">
							<h6>카테고리</h6>
							<p>카테고리는 반드시 선택해주셔야 해요~</p>
						</div>
						<select name="CategoryVO.categoryId" id="category" required="required">
							<option value="1">전자제품</option>
							<option value="2">가전제품</option>
							<option value="3">남성의류</option>
							<option value="4">여성의류</option>
							<option value="5">가방</option>
							<option value="6">기타 등등</option>
						</select>
					</div>
					<div class="col-12">
						<div class="single-contact-information">
							<h6>내용</h6>
							<p>가품 및 판매금지품목은 게시가 제한될 수 있어요~</p>
						</div>
						<textarea class="form-control" name="info" id="info" cols="30" rows="10" placeholder="회원님이 올릴 게시글 내용을 작성해주세요~" required="required"></textarea>
					</div>
					<div class="col-12">
						<div class="single-contact-information">
							<h6>사진</h6>
							<p>사진은 반드시 올려주셔야 합니다 (6개까지) <br>사진을 예쁘게 찍어서 업로드하면 거래 성사율이 올라가요~</p>
						</div>
						<!-- 이미지 업로드 (이미지를 하나 등록하면 바로 이미지를 보여준다 / 노션 참고) -->
					</div>
					<div class="col-12 form-control" style="overflow: hidden; height: auto;">
						<div class="single-contact-information">
							<h6>업로드한 이미지</h6>
						</div>
						<div class="row" id="preview-image-container">
							<div class="col-4" style="padding-top: 10px;">
								<h6>1번 이미지 (썸네일)</h6>
								<img style="width: 500px;" id="preview-image1" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
								<input style="display: block;" type="file" id="input-image1" required="required" name="uploadFile">
							</div>
							<div class="col-4" style="padding-top: 10px;">
								<h6>2번 이미지</h6>
								<img style="width: 500px;" id="preview-image2" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
								<input style="display: block;" type="file" id="input-image2" name="uploadFile">
							</div>
							<div class="col-4" style="padding-top: 10px;">
								<h6>3번 이미지</h6>
								<img style="width: 500px;" id="preview-image3" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
								<input style="display: block;" type="file" id="input-image3" name="uploadFile">
							</div>
							<div class="col-4" style="padding-top: 10px;">
								<h6>4번 이미지</h6>
								<img style="width: 500px;" id="preview-image4" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
								<input style="display: block;" type="file" id="input-image4" name="uploadFile">
							</div>
							<div class="col-4" style="padding-top: 10px;">
								<h6>5번 이미지</h6>
								<img style="width: 500px;" id="preview-image5" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
								<input style="display: block;" type="file" id="input-image5" name="uploadFile">
							</div>
							<div class="col-4" style="padding-top: 10px;">
								<h6>6번 이미지</h6>
								<img style="width: 500px;" id="preview-image6" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
								<input style="display: block;" type="file" id="input-image6" name="uploadFile">
							</div>
						</div>
					</div>
<script type="text/javascript">
const image = [
    { input: 'input-image1', preview: 'preview-image1' },
    { input: 'input-image2', preview: 'preview-image2' },
    { input: 'input-image3', preview: 'preview-image3' },
    { input: 'input-image4', preview: 'preview-image4' },
    { input: 'input-image5', preview: 'preview-image5' },
    { input: 'input-image6', preview: 'preview-image6' }
]

for(i=0; i<image.length; i++){
    function readImage(input) {
        // 인풋 태그에 파일이 있는 경우
        if(input.files && input.files[0]) {
            // 이미지 파일인지 검사 (생략)
            // FileReader 인스턴스 생성
            const reader = new FileReader()
            // 이미지가 로드가 된 경우
            
            console.log(previewImage);
            reader.onload = e => {
                previewImage.src = e.target.result;
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }
    // input file에 change 이벤트 부여'
    const inputImage = document.getElementById(image[i].input);
    const previewImage = document.getElementById(image[i].preview);
    inputImage.addEventListener("change", e => {
    	console.log(image);
        readImage(e.target);    
    })
}
</script>

                       <!--  <button type="button" id="addImg">이미지 추가하기</button> --> 
					<div class="col-12">
						<div class="single-contact-information">
							<h6>거래장소</h6>
							<p>회원님이 희망하시는 거래장소를 등록해주세요~</p>
						</div>
						<!-- 회원이 등록해놓은 장소 받아오기 버튼 -->
						<!-- 거래 위치 새로 지정하기 버튼 (누르면 팝업을 띄워주면서 카카오맵이 나온다) -->
					</div>
					<!-- 지도 데이터를 받아오면 이곳에 띄워준다 (수정하기 버튼도 같이 띄워준다) -->
					<div class="map_wrap">
					    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
					    <div class="hAddr">
					        <span class="title">지도중심기준 행정동 주소정보</span>
					        <span id="centerAddr"></span>
					    </div>
					</div>
					<div class="col-12" id="submit-area">
						<input type="text" name="MapVO.code" id="code" value="${mvo.mapVO.code }" required="required">
						<input type="text" name="MapVO.lat" id="lat" value="${mvo.mapVO.lat }" required="required">
						<input type="text" name="MapVO.lng" id="lng" value="${mvo.mapVO.lng }" required="required">
						<input type="text" class="form-control" name="MapVO.detail" id="detail" placeholder="상세주로를 입력해주세요. 필수는 아닙니다!" style="text-align: center">
					</div>
			        <div class="col-12 text-center">
						<button class="btn delicious-btn mt-30" type="submit">완료</button>
					</div>
				</div>
			</div>
        </div>
	</form>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9381e06d5eaed54786e5c9e5472beb&libraries=services&autoload=false"></script>
<script type="text/javascript">
// DB에서 회원의 좌표를 가져온다
var defaultLat = 37.566887;
var defaultLng = 126.978630;
var userLat;

<c:choose>
	<c:when test="${mvo.mapVO.lat ne null}">
		userLat = <c:out value="${mvo.mapVO.lat}"/>;
	</c:when>
		<c:when test="${mvo.mapVO.lat eq null}">
	userLat = defaultLat;
	</c:when>
</c:choose>

var userLng;
<c:choose>
	<c:when test="${mvo.mapVO.lng ne null}">
		userLng = <c:out value="${mvo.mapVO.lng}"/>;
	</c:when>
	<c:when test="${mvo.mapVO.lng eq null}">
		userLng = defaultLng;
	</c:when>
</c:choose>

var mapContainer = document.getElementById('map'); // 지도를 표시할 div 

$(document).ready(function(){
	// 동적으로 스크립트 로드를 하기 때문에, 스크립트가 로드 되기전 geocoder 객체에
	// 접근하려고 하면 오류가 남. 스크립트 로드가 된 후에 geocoder를 사용해야함
	kakao.maps.load(function() {
		$("#")
		mapOption = {
			center: new kakao.maps.LatLng(userLat, userLng), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};  
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 기존 위치 설정
		// 사용자가 기존에 정해놓은 위치 설정
		var designatedPosition = new kakao.maps.LatLng(userLat, userLng);
		// 마커 이미지 설정
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		var imageSize = new kakao.maps.Size(24, 35);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		// 사용자가 기존에 정해놓은 위치에 마커 생성
		var designatedMarker = new kakao.maps.Marker({position: designatedPosition, image : markerImage}),
		designatedInfoWindow = new kakao.maps.InfoWindow({
			<c:choose>
				<c:when test="${mvo.mapVO.lng ne null}">
					content: '<div style="width:150px;text-align:center;">설정하신 위치</div>'
				</c:when>
				<c:when test="${mvo.mapVO.lng eq null}">
					content: '<div style="width:150px;text-align:center;">사이트 기본 위치</div>'
				</c:when>
			</c:choose>
		});
		
		// 마커를 지도위에 생성
		designatedMarker.setMap(map);
		designatedInfoWindow.open(map, designatedMarker);
		
		
		// 이곳부터 새로운 위치 지정
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