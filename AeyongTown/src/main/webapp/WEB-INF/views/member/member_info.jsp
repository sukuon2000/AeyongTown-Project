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
            </div>
        </div>
        <!-- 카카오맵 영역 (등록이 안되어 있다면 등록이 안되어 있다고 울먹이는 이미지 추가 예정) -->
        <!-- 밑의 버튼들은 이후 판매자 정보 볼 때 안보이도록 구현 예정 -->
        <div class="row">
            <div class="col-12">
                <div class="receipe-ratings text-right my-5">
                    <a href="#" class="btn delicious-btn">등록하기(팝업)</a>
                </div>
                <div class="receipe-ratings text-right my-5">
                    <a href="#" class="btn delicious-btn">수정하기(팝업)</a>
                </div>
                <div class="receipe-ratings text-right my-5">
                    <a href="#" class="btn delicious-btn">삭제하기</a>
                </div>
            </div>
        </div>
    </div>
</div>