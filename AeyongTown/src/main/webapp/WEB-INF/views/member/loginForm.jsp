<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

 <sec:authorize access="isAuthenticated()">
 <script  type="text/javascript">
 alert("이미 로그인 되어 있는 상태입니다");
 location.href="${pageContext.request.contextPath}/home";
 </script>
 </sec:authorize>
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>로그인</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="contact-area section-padding-0-80">
	<div class="container">
		<div class="row mt-100">
			<div class="col-12">
				<div class="contact-form-area">
					<form action="${pageContext.request.contextPath}/login" method="post" id="login">
						<div class="row mt-70">
							<sec:csrfInput />
							<div class="col-12 col-lg-7  ml-auto mr-auto">
								<input type="text" class="form-control" name="memberId"	placeholder="아이디">
							</div>
							<div class="col-12 col-lg-7  ml-auto mr-auto mb-30">
								<input type="password" class="form-control" name="password" placeholder="패스워드">
							</div>
							<div class="col-12 text-center">
								<button class="btn delicious-btn mt-30" type="submit">로그인</button>
							</div>
							<div class="col-12 col-lg-12 mt-30" align="center">
								<a href="/user/registerForm">회원가입</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
								<a href="findMemberIdForm">아이디 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
								<a href="#" id="findMemberPassword">비밀번호 찾기</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>