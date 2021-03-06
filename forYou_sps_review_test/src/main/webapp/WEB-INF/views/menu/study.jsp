<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../main/header.jsp"%>

<!-- 추천순 / 최신순 / 판매순 / 평점순 정렬 탭 -->
<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">스터디</h1>
		</div>
	</div>

<div class="container">
	<div class="row">
		<div class="span12">
			<ul class="nav nav-tabs" id="myTabs">
				<li class="active"><a id="tab-1" href="#one" data-toggle="tab">최신순</a></li>
				<li><a href="#two" id="tab-2" data-toggle="tab">평점순</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="one">
					<c:forEach items="${list}" var="tBoardVO">
						<div class="item">
							<a
								href="
				/sboard/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&id=${tBoardVO.id}&userid=${tBoardVO.memberVO.userid}">
								<div class="col-md-3 portfolio-item">
									<div class="portfolio-section">
									<img class="img-responsive" src="${tBoardVO.image}" alt="">
									<div class="main-margin">
										<h3>${tBoardVO.title}</h3>
										<p class="mainPrice">${tBoardVO.price}원</p>
										<span class="mainUserid">${tBoardVO.memberVO.userid}</span>
										<span class="mainStartCount">${reviewVO.starCount}별점</span>
									</div>
									</div>
								</div>
							</a>
							<div class="item-wrap"></div>
						</div>
					</c:forEach>
				</div>
				<div class="tab-pane" id="two">
					<!-- 평점 추가되면 mapper 쿼리 바꿔야함 -->
					<c:forEach items="${starList}" var="tBoardVO">
						<div class="item">
							<a
								href="
				/sboard/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&id=${tBoardVO.id}&userid=${tBoardVO.memberVO.userid}">
								<div class="col-md-3 portfolio-item">
									<div class="portfolio-section">
									<img class="img-responsive" src="${tBoardVO.image}" alt="">
									<div class="main-margin">
										<h3>${tBoardVO.title}</h3>
										<p class="mainPrice">${tBoardVO.price}원</p>
										<span class="mainUserid">${tBoardVO.memberVO.userid}</span>
										<span class="mainStartCount">${reviewVO.starCount}별점</span>
									</div>
									</div>
								</div>
							</a>
							<div class="item-wrap"></div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>


<%-- <c:forEach items="${list}" var="tBoardVO">
		<div class="item">
			<ul class="list-unstyled product-info">
				<a
					href="/sboard/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&id=${tBoardVO.id}&userid=${tBoardVO.memberVO.userid}">
					<li class="image">
						<div class="badge-plus"></div> <!-- 우수 재능 뱃지 넣기?  --> <img
						src="${tBoardVO.image}">
				</li>
					<li class="title">${tBoardVO.title}</li>
					<li class="price"><span class="number">${tBoardVO.price}${tBoardVO.memberVO.userid}</span>
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
	</c:forEach> --%>


<div class="row text-center">
	<div class="col-lg-12 wrap_paging">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="study${pageMaker.makeQuery(pageMaker.startPage - 1)}">%laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="study${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="study${pageMaker.makeQuery(pageMaker.endPage + 1) }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</div>

<script>
	$(document).ready(function() {
		$(".study").addClass("focus");
	});
</script>
</body>
</html>