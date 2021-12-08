<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    <!-- Search Wrapper -->
    <div class="search-wrapper">
        <!-- Close Btn -->
        <div class="close-btn"><i class="fa fa-times" aria-hidden="true"></i></div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#" method="post">
                        <input type="search" name="search" placeholder="찾고싶으신 물건의 키워드를 입력하세요">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Top Header Area -->
        <div class="top-header-area">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-between">
                    <!-- Breaking News -->
                    <div class="col-12 col-sm-6">
                        <div class="breaking-news">
                            <div id="breakingNewsTicker" class="ticker">
                                <ul>
                                    <li>안녕하세요~</li>
                                    <li>현재 OO개의 물건이 올라와 있어요~</li>
                                    <li>현재 OO개의 물건이 예약중입니다~</li>
                                    <li>많이 사랑해주세요옹~♡</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navbar Area -->
        <div class="delicious-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="deliciousNav">

                        <!-- Logo -->
                        <a class="nav-brand" href="#"><img src="img/core-img/aeyong logo50.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="#">카테고리 애용</a>
                                        <ul class="dropdown">
                                            <li><a href="#">전자제품</a></li>
                                            <li><a href="#">가전제품</a></li>
                                            <li><a href="#">남성의류</a></li>
                                            <li><a href="#">여성의류</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">내 동네 애용</a>
                                        <ul class="dropdown">
                                            <li><a href="#">올라온 물건</a></li>
                                            <li><a href="#">동네 이야기</a></li>
                                        </ul>
                                    </li>
                                    <sec:authorize access="isAuthenticated()==false">
                                    <li class="active"><a href="/loginForm">로그인</a></li>
                                    </sec:authorize>
                                    <sec:authorize access="isAuthenticated()">
                                    <li><a href="#">애용이 정보</a>
                                        <ul class="dropdown">
                                            <li><a href="#">회원정보</a></li>
                                            <li><a href="#">내가 올린 물건</a></li>
                                            <li><a href="#">찜목록</a></li>
                                            <li><a href="#">거래중인 물건</a></li>
                                        </ul>
                                    </li>
                                    
                                    <sec:authentication property="principal.nick" />님 안녕하세요!
                                    </sec:authorize>
                                </ul>
								<sec:authorize access="isAuthenticated()">
								<div class="logout-btn">
									<a href="#" id="logoutAction">&nbsp;&nbsp;로그아웃
									<i	class="fa fa-user" aria-hidden="true"></i></a>
								</div>
								<script type="text/javascript">
									$(document).ready(function() {
										$(".logout-btn").click(function() {
											$("#logoutForm").submit();
										});
									})
								</script>
								<form id="logoutForm"
									action="${pageContext.request.contextPath}/logout"
									method="post" style="display: none">
									<sec:csrfInput />
								</form>
								</sec:authorize>

                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->
