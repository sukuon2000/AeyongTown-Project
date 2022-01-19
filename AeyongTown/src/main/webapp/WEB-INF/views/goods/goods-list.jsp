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
    
#totalCount {
	font-size:21px;
	padding:20px 20px 50px 20px;
}
#totalCount span {
	font-weight:bold;
	color:#40ba37;
	font-size:32px;
}
</style>
<body>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading">
                        <h3>애용타운에 올라온 물건들이에요~</h3>
                    </div>
                </div>
            </div>
			<div class="row recipeWrap">
				<div id="totalCount">
					총 <span>${totalGoodsCount}</span>개의 애용품이 있습니다 !
				</div>
			</div>
            <div class="row">
				<c:forEach var="goodsVO" items="${goodsList}">
                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="single-goods-area mb-30">
                        <div class="goods-content" onclick="location.href='${pageContext.request.contextPath}/goods/${goodsVO.goodsId}'">
							<table>
							    <tr>
							        <td rowspan="4" width="250"><img src="${pageContext.request.contextPath}/upload/THUMB_${goodsVO.goodsThumbnail}" width="250" alt=""></td>
							        <td><h5>${goodsVO.title}</h5></td>
							    </tr>
							    <tr>
							        <td>${goodsVO.price} 원</td>
							    </tr>
							    <tr>
							        <td>${goodsVO.mapVO.sido} ${goodsVO.mapVO.sigungu} ${goodsVO.mapVO.dong}</td>
							    </tr>
							    <tr>
							        <td>${goodsVO.uploadDate}</td>
							    </tr>
							</table>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <!-- Pagination -->
			<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
			<ul class="pagination justify-content-center">
				<%--  이전 pageGroup 이 있으면 (<< 표시될 것이 있으면 ) --%>
				<c:if test="${pb.previousPageGroup}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/list/all/${pb.startPageOfPageGroup-1}">&laquo;</a></li>
				</c:if>
				<c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
						<%-- 현재 페이지 표시 --%>
						<c:when test="${pb.nowPage==page }">
							<li class="page-item active"><a class="page-link"
								href="${pageContext.request.contextPath}/list/all/${page}">${page}</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="page-link"
								href="${pageContext.request.contextPath}/list/all/${page}">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pb.nextPageGroup}">
					<li><a class="page-link"
						href="${pageContext.request.contextPath}/list/all/${pb.endPageOfPageGroup+1}">&raquo;</a></li>
				</c:if>
			</ul>
            <sec:authorize access="isAuthenticated()">
				<div class="row mt-50" style="padding: 10px">
					<button type="button" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/goods/writeForm'">물건 올리기</button>
				</div>
			</sec:authorize>
        </div>
    </section>