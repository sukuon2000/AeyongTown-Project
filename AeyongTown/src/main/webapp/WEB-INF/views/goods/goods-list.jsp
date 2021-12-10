<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<style>
    .single-goods-area {
        position: relative;
        z-index: 1; }
    .single-goods-area .goods-content {
        padding-top: 10px;
        border: 3px #FFD700 solid; 
        border-radius: 2em;}
    .single-goods-area img {
        border-radius: 2em;}
    .single-goods-area .goods-content table {
        width: 100%;
        font-size: 14px;
        margin-bottom: 10px;
        font-weight: bold;
        -webkit-transition-duration: 500ms;
        transition-duration: 500ms;
    }
    .single-goods-area .goods-content table:hover, .single-goods-area .goods-content table:focus {
        color: #caac00; }
    .single-goods-area .goods-content table td{
        padding-left: 10px;
        padding-right: 10px;
    }
</style>
<body>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading">
                        <h3>test</h3>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="single-goods-area mb-30">
                        <div class="goods-content">
                            <a href="receipe-post.html">
                                <table>
                                    <tr>
                                        <td rowspan="4" width="250"><img src="/img/bg-img/r5.jpg" width="250" alt=""></td>
                                        <td><h5>에버랜드 티켓 팜</h5></td>
                                    </tr>
                                    <tr>
                                        <td>50,000 원</td>
                                    </tr>
                                    <tr>
                                        <td>용인시 처인구 김량장동</td>
                                    </tr>
                                    <tr>
                                        <td>5분전</td>
                                    </tr>
                                </table>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <sec:authorize access="isAuthenticated()">
				<div class="row mt-50" style="padding: 10px">
					<button type="button" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/goods/write'">물건 올리기</button>
				</div>
			</sec:authorize>
        </div>
    </section>