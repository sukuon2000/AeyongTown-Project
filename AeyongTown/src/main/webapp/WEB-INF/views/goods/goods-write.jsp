<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="contact-area section-padding-0-80">
	<form action="#" method="post">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading">
                        <h3>판매하실 물건을 등록하고 있어요~</h3>
                    </div>
                </div>
			</div>
			<div class="row">
				<div class="col-12">
                    <div class="contact-form-area">
						<div class="row">
							<div class="col-12">
								<div class="single-contact-information">
									<h6>제목</h6>
								</div>
								<input type="text" class="form-control" name="title" id="title" placeholder="판매하실 물건의 이름을 적어주세요~">
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
								<select name="category" id="category">
									<option>-</option>
									<option value="전자제품">전자제품</option>
									<option value="가전제품">가전제품</option>
									<option value="남성의류">남성의류</option>
									<option value="여성의류">여성의류</option>
									<option value="가방">가방</option>
									<option value="기타">기타 등등</option>
								</select>
							</div>
							<div class="col-12">
								<div class="single-contact-information">
									<h6>내용</h6>
									<p>가품 및 판매금지품목은 게시가 제한될 수 있어요~</p>
								</div>
								<textarea name="message" class="form-control" name="info" id="info" cols="30" rows="10" placeholder="회원님이 올릴 게시글 내용을 작성해주세요~"></textarea>
							</div>
							<div class="col-12">
								<div class="single-contact-information">
									<h6>사진</h6>
									<p>사진은 반드시 올려주셔야 합니다 (6개까지) <br>사진을 예쁘게 찍어서 업로드하면 거래 성사율이 올라가요~</p>
								</div>
								<!-- 이미지 업로드 (이미지를 하나 등록하면 바로 이미지를 보여준다 / 노션 참고) -->
								<input type="file" class="form-control" name="uploadGoodsImg" placeholder="레시피 대표 이미지파일을 업로드해주세요!" required="required">
							</div>
							<div class="col-12">
								<div class="single-contact-information">
									<h6>거래장소</h6>
									<p>회원님이 희망하시는 거래장소를 등록해주세요~</p>
								</div>
								<!-- 회원이 등록해놓은 장소 받아오기 버튼 -->
								<!-- 거래 위치 새로 지정하기 버튼 (누르면 팝업을 띄워주면서 카카오맵이 나온다) -->
							</div>
							<!-- 지도 데이터를 받아오면 이곳에 띄워준다 (수정하기 버튼도 같이 띄워준다) -->
					        <div class="map-area">
					            <div id="googleMap"></div>
					            <h6>지도영역</h6>
					        </div>
					        <div class="col-12 text-center">
								<button class="btn delicious-btn mt-30" type="submit">완료</button>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
	</form>
</div>