<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="sessionMVO" property="principal" />
<style>
 .image-container {
    width: 80px;
    height: 80px; 
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

<!-- 게시물 이미지 -->
<div class="container">
    <div class="row">
        <div class="col-12 col-md-8" style="float: none; margin:0 auto">
            <div class="receipe-slider owl-carousel">
            <c:forEach var="goodsImg" items="${goods.imgPath}">
                <img src="${pageContext.request.contextPath}/upload/${goodsImg}" alt="">
            </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- 게시물 내용물 -->
<div class="receipe-content-area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12">
                <div class="receipe-headline my-5">
                    <h2>${goods.title}</h2>
                    <span></span>
                    <span>카테고리 > ${goods.categoryVO.categoryName} / ${goods.uploadDate}</span>
                    <h4>${goods.price} 원</h4>
                    <div style="padding: 15px; border-bottom: 3px solid #dcdcdc; border-top: 3px solid #dcdcdc;">
                        <table>
                        	<tr>
                        		<td rowspan="2" style="padding-right: 10px">
                        			<img id="profileImg" src="${pageContext.request.contextPath}/profile/${goods.memberVO.imgPath}" style="width: 80px; border-radius: 70%; overflow: hidden;">
                        		</td>
                        		<td style="font-weight: bold; font-size: 1.1rem;">${goods.memberVO.nick}</td>
                        	</tr>
                        	<tr>
                        	<c:choose>
                        		<c:when test="${goods.memberVO.mapVO eq null}">
                        			<td>아직 위치를 등록하지 않은 회원님이에요!</td>
                        		</c:when>
                        		<c:when test="${goods.memberVO.mapVO ne null}">
                        			<td>${goods.memberVO.mapVO.sido} ${goods.memberVO.mapVO.sigungu} ${goods.memberVO.mapVO.dong}</td>
                        		</c:when>
                        	</c:choose>
                        	</tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-lg-8">
                <!-- Single Preparation Step -->
                <div class="receipe-duration">
                    <h6>${goods.info}</h6>
                </div>
            </div>

            <!-- 거래신청 버튼 -->
            <div class="col-12 col-lg-4">
                <div class="receipe-ratings text-right my-5">
                    <a href="#" class="btn delicious-btn">거래 신청하기</a>
                </div>
            </div>
        </div>
		
		<hr>
		
		<!-- 카카오맵 -->
		<div class="col-12">
               <div class="section-heading text-left">
                   <h4>희망 거래장소</h4>
                   <p>행정동 : ${goods.mapVO.sido} ${goods.mapVO.sigungu} ${goods.mapVO.dong}<p>
                   <p id="result"></p>
                   <div id="map" style="width:100%;height:500px;"></div>
                   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9381e06d5eaed54786e5c9e5472beb&libraries=services&autoload=false"></script>
				<script type="text/javascript">
				var tradeLat = <c:out value="${goods.mapVO.lat}"/>;
				var tradeLng = <c:out value="${goods.mapVO.lng}"/>;
				var tradeDetail;
				var tradeDetail2;
				if(${goods.mapVO.detail != null}) {
					tradeDetail = '<c:out value="${goods.mapVO.detail}"/>';
					tradeDetail2 = '<c:out value="${goods.mapVO.detail}"/>';
				} else {
					tradeDetail = '등록하신 장소';
				}
				
				$(document).ready(function(){
					kakao.maps.load(function(){
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(tradeLat, tradeLng), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
						
						// 지도 생성
						var map = new kakao.maps.Map(mapContainer, mapOption);
						
						// 주소-좌표 변환 객체를 생성
						var geocoder = new kakao.maps.services.Geocoder();
		
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(tradeLat, tradeLng); 
		
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
		
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
		
						var iwContent = '<div style="padding:5px;">';
							iwContent += tradeDetail;
							iwContent += '<br><a href="https://map.kakao.com/link/map/'
							iwContent += tradeDetail;
							iwContent += ',';
							iwContent += tradeLat;
							iwContent += ',';
							iwContent += tradeLng;
							iwContent += '" style="color:blue" target="_blank">큰지도보기</a> ';
							iwContent += '<a href="https://map.kakao.com/link/to/';
							iwContent += tradeDetail;
							iwContent += ',';
							iwContent += tradeLat;
							iwContent += ','; 
							iwContent += tradeLng;
							iwContent +='" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						    iwPosition = new kakao.maps.LatLng(tradeLat, tradeLng); //인포윈도우 표시 위치입니다
		
						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
						    position : iwPosition, 
						    content : iwContent 
						});
						  
						//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
						infowindow.open(map, marker);
						
						var coord = new kakao.maps.LatLng(tradeLat, tradeLng);
						var callback = function(result, status) {
						    if (status === kakao.maps.services.Status.OK) {
						        var message = '<p>상세주소 : ' + result[0].address.address_name + ' ' +tradeDetail2 + '</p>';
						        var resultDiv = document.getElementById('result');
						        resultDiv.innerHTML = message;
						    }
						};

						geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
					}) //load
				})// ready
				</script>
			</div>
		</div>
        
        <section class="write-review-area">
         <div class="container" style="padding-bottom: 30px">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                           <h4>댓글 쓰기</h4>
                           <form action="/goods/writeComment/${goods.goodsId}" method="post" id="commentWrite">
                           <sec:csrfInput/>
                                <input type="hidden" name="memberVO.memberId" value="${sessionMVO.memberId}" id="writerId"/>
                           <div class="clearfix"></div>
                              <textarea name="content" style="width:100%; border:0 none; resize: none;" placeholder="작성해주세요" rows="2" required="required"></textarea>
                              <button id="postComment" type="submit" class="float-right btn btn-outline-primary ml-2 reviewPostBtn"> <i class="fa far fa-edit"></i> 작성 </button>
                           </form>
                        </div>
                    </div>
                </div>
            </div>
         </div>
         </section>
         <hr>
         
         <!-- 댓글 리스트 -->
<script type="text/javascript">
$(document).ready(function(){
	$(".deleteCommentBtn").click(function(){
		var check = confirm("해당 댓글을 삭제하시겠습니까?");
		
		if(check == true) {
			$("#deleteComment").submit();
		} else {
			return false;
		}
	})
});
</script>         
		<div class="container" style="padding-bottom: 30px">
			<h4>댓글</h4>
			<!-- 댓글 (comment Level이 1일때) -->
			<c:forEach var="comment" items="${commentList}">
				<c:if test="${comment.commentLevel == 1}">
				
					
		            <div class="card">
						<div class="card-body">
							<div class="row">
								<div style="width: 8%">
									<img id="profileImg" src="${pageContext.request.contextPath}/profile/${comment.memberVO.imgPath}" style="width: 80px; border-radius: 70%; overflow: hidden;">
								</div>
								<div style="width: 92%">
									<ul>
										<li style="font-size: 1.1rem">
											<strong>${comment.memberVO.nick} 
											<c:if test="${comment.memberVO.memberId == goods.memberVO.memberId }"><font color="green">(작성자)</font></c:if>
											</strong>
										</li>
										<c:choose>
											<c:when test="${comment.memberVO.mapVO eq null}">
												<li  style="border-bottom: 2px solid #dcdcdc;">
													<font color=#a0a0a0>
														아직 위치를 등록하지 않은 회원님이에요! · ${comment.uploadTime}
													</font>
												</li>
											</c:when>
											<c:when test="${comment.memberVO.mapVO ne null}">
												<li style="border-bottom: 2px solid #dcdcdc;">
													<font color=#a0a0a0>
														${comment.memberVO.mapVO.sido} ${comment.memberVO.mapVO.sigungu} ${comment.memberVO.mapVO.dong}  · ${comment.uploadTime}
													</font>
												</li>
											</c:when>
										</c:choose>
										<li style="padding-top: 10px; font-size: 1.2rem">
											${comment.content}
										</li>
										<li>
											<div class="row">
												<c:choose>
													<c:when test="${sessionMVO.memberId == comment.memberVO.memberId}">
														<form action="#" method="post" name="updateReview" id="updateComment">
														   <sec:csrfInput />
														   <input type="hidden" name="" value="" id="recipeNo"/>
														   <input type="hidden" name="" value="" id="memberId"/>
														   <button type="button" class="float-right btn btn-outline-primary ml-2 reviewModifyBtn"><i class="fa far fa-edit"></i> 수정</button>
														</form>
														<form action="/goods/deleteComment" method="post" id="deleteComment">
														   <sec:csrfInput />
														   <input type="hidden" name="commentId" value="${comment.commentId}"/>
														   <input type="hidden" name="goodsId" value="${goods.goodsId}"/>
														   <button type="button" id="deleteCommentBtn" class="float-right btn btn-outline-primary ml-2 deleteCommentBtn"><i class="fa fa-trash"></i> 삭제</button>
														</form>
													</c:when>
												</c:choose>
											</div>
										</li>
									</ul>
							
									<!-- 대댓글 (comment Level이 1 이상일 때) -->
									<c:forEach items="${commentList}" var="re">
										<c:if test="${re.commentLevel > 1 && re.parentCommentId eq comment.commentId}">
											<div class="row" style="padding-top: 20px;">
												<div style="width: 8%">
													<img id="profileImg" src="${pageContext.request.contextPath}/profile/${re.memberVO.imgPath}" style="width: 80px; border-radius: 70%; overflow: hidden;">
												</div>
												<div style="width: 92%">
													<ul>
														<li style="font-size: 1.1rem">
															<strong>${re.memberVO.nick} 
															<c:if test="${re.memberVO.memberId == goods.memberVO.memberId }"><font color="green">(작성자)</font></c:if>
															</strong>
														</li>
														<c:choose>
															<c:when test="${re.memberVO.mapVO eq null}">
																<li  style="border-bottom: 2px solid #dcdcdc;">
																	<font color=#a0a0a0>
																		아직 위치를 등록하지 않은 회원님이에요! · ${re.uploadTime}
																	</font>
																</li>
															</c:when>
															<c:when test="${re.memberVO.mapVO ne null}">
																<li style="border-bottom: 2px solid #dcdcdc;">
																	<font color=#a0a0a0>
																		${re.memberVO.mapVO.sido} ${re.memberVO.mapVO.sigungu} ${re.memberVO.mapVO.dong}  · ${re.uploadTime}
																	</font>
																</li>
															</c:when>
														</c:choose>
														<li style="padding-top: 10px; font-size: 1.2rem">
															${re.content}
														</li>
														<li>
															<div class="row">
																<c:choose>
																	<c:when test="${sessionMVO.memberId == re.memberVO.memberId}">
																		<form action="#" method="post" name="updateReview" id="updateReview">
																		   <sec:csrfInput />
																		   <input type="hidden" name="" value="" id="recipeNo"/>
																		   <input type="hidden" name="" value="" id="memberId"/>
																		   <button type="button" class="float-right btn btn-outline-primary ml-2 reviewModifyBtn"><i class="fa far fa-edit"></i> 수정</button>
																		</form>
																		<form action="/goods/deleteComment" method="post" id="deleteComment">
																		   <sec:csrfInput />
																		   <input type="hidden" name="commentId" value="${comment.commentId}"/>
																		   <input type="hidden" name="goodsId" value="${goods.goodsId}"/>
																		   <button type="button" id="deleteReviewBtn" class="float-right btn btn-outline-primary ml-2"><i class="fa fa-trash"></i> 삭제</button>
																		</form>
																	</c:when>
																</c:choose>
															</div>
														</li>
													</ul>
												</div>
											</div>
										</c:if>
									</c:forEach>	
									<sec:authorize access="isAuthenticated()">
									<!-- 대댓글 달기 -->
									<form action="/goods/writeRecomment" method="post" id="commentWrite">
										<div class="row" style="padding-top: 10px">
											<div>
												<img id="profileImg" src="${pageContext.request.contextPath}/profile/${sessionMVO.imgPath}" style="width: 50px; border-radius: 70%; overflow: hidden;">
											</div>
												<sec:csrfInput />
												<div class="col-md-9">
													<input type="hidden" name="goodsId" value="${goods.goodsId}"/>
													<input type="hidden" name="parentCommentId" value="${comment.commentId}"/>
													<input type="hidden" name="memberVO.memberId" value="${sessionMVO.memberId}" id="writerId"/>
													<textarea name="content" rows="1"style="width: 100%; height: 30px;"></textarea>
												</div>
												<div>
													<button type="submit" class="float-right btn btn-outline-primary ml-2 reviewModifyBtn"><i class="fa far fa-edit"></i> 답글</button>
												</div>
										</div>
									</form>
									</sec:authorize>
									
								</div>
								
								
							</div>
		                </div>
		            </div>
           		</c:if>
			</c:forEach>
         </div>
    </div>
</div>