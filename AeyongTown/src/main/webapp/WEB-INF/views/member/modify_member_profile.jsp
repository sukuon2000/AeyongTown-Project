<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<style type="text/css">
.image-container {
    width: 200px;
    height: 200px; 
    border-radius: 70%;
    overflow: hidden;
}
.preview-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
<!-- <script type="text/javascript">
$(document).ready(function() {
	$('#cancel').on('click', function() {
		$("#폼아이디").attr({"action": "${pageContext.request.contextPath}/user/my-info"}).submit();
	})
})
</script> -->

<div class="breadcumb-area bg-img bg-overlay" style="background-image: url(/img/bg-img/breadcumb3.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcumb-text text-center">
                    <h2>프로필 변경</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="contact-form-area">
				<form action="/user/modify" method="post" enctype="multipart/form-data">
				<sec:csrfInput />
				<div class="row">
					<div class="col-12">
						<div class="single-contact-information"><br><br>
							<h6>프로필 사진</h6>
							<div class="image-container">
								<!-- member table에서 img_path가 null일 경우 방지 (default값은 있음) -->
							    <c:choose>
									<c:when test="${mvo.imgPath eq null}">
										<img id="preview-image" src="${pageContext.request.contextPath}/profile/aeyong kim.png">
									</c:when>
									<c:when test="${mvo.imgPath ne null}">
										<img id="preview-image" src="${pageContext.request.contextPath}/profile/${mvo.imgPath}">
									</c:when>
								</c:choose>
							</div>
							<input type="file" style="display: block;" name="profileImg"  id="profileImg">
							<script type="text/javascript">
							// 해당 함수는 input 태그 밑에 있어야 적용 가능
								function readImage(input) {
								    // 인풋 태그에 파일이 있는 경우
								    if(input.files && input.files[0]) {
								        // 이미지 파일인지 검사 (생략)
								        // FileReader 인스턴스 생성
								        const reader = new FileReader()
								        // 이미지가 로드가 된 경우
								        reader.onload = e => {
								            const previewImage = document.getElementById("preview-image")
								            previewImage.src = e.target.result
								        }
								        // reader가 이미지 읽도록 하기
								        reader.readAsDataURL(input.files[0])
								    }
								}
								// input file에 change 이벤트 부여
								const inputImage = document.getElementById("profileImg")
								inputImage.addEventListener("change", e => {
								    readImage(e.target)
								})
							</script>
						</div>
					</div>
					<div class="col-6">
						<div class="single-contact-information">
							<br>
							<h6>닉네임</h6>
						</div>
						<input type="text" class="form-control" name="nick" value="${mvo.nick}" required="required">
					</div>
				</div>
				<div class="col-12 text-center">
                	<button class="btn delicious-btn mt-30" type="submit">적용</button>
                </div>
				</form>
			</div>
		</div>
	</div>
</div>