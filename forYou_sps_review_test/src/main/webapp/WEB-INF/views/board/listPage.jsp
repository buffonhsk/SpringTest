<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.0.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/normalize.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- 추천순 / 최신순 / 판매순 / 평점순 정렬 탭 -->
	<form method="GET" action="http://www.otwojob.com/list/11"
		accept-charset="UTF-8">

		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#"
				role="submitBtn" data-sort="recommend">추천순</a></li>
			<li role="presentation" class=""><a href="#" role="submitBtn"
				data-sort="latest">최신순 <span class="new-icon">NEW</span></a></li>
			<li role="presentation" class=""><a href="#" role="submitBtn"
				data-sort="score">평점순</a></li>
		</ul>
	</form>
	<c:forEach items="${list}" var="tBoardVO">
		<div class="item">
			<ul class="list-unstyled product-info">
				<a
					href="/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&id=${tBoardVO.id}">
					<li class="image">
						<div class="badge-plus"></div> <!-- 우수 재능 뱃지 넣기?  --> <img
						src="${tBoardVO.image}">
				</li>
					<li class="title">${tBoardVO.title}</li>
					<li class="price"><span class="number">${tBoardVO.price}</span>
						<span class="unit">원</span></li>
				</a>
				<li class="info"><span class="pull-left user-id"></span> <span
					class="pull-right score"> <img
						src="http://www.otwojob.com/images/icons/star01.jpg"><img
						src="http://www.otwojob.com/images/icons/star01.jpg"><img
						src="http://www.otwojob.com/images/icons/star01.jpg"><img
						src="http://www.otwojob.com/images/icons/star01.jpg"><img
						src="http://www.otwojob.com/images/icons/star01.jpg"><span
						class="txt"></span>
				</span></li>
			</ul>
			<div class="item-wrap"></div>
		</div>
	</c:forEach>


	<div>
		<ul class="pagiantion">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">%laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1) }">&raquo;</a></li>
			</c:if>

		</ul>

	</div>
</body>
</html>